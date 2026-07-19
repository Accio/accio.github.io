---
layout: post
title: Setting up a new Linux server
category: IT
tags: web linux server
---

This post documents how I set up a new Linux server. It assumes that we can log into a Debian/Ubuntu server with a username that has sudo permissions.

## Performance benchmark

We can run *Yet another bench script* (YABS) to test the performance of the server, checking whether the performance of infrastructure (CPU, memory, hard disk, network bandwidth, etc.) matches the description of the provider.

```
curl -sL yabs.sh | bash -s -- -5
```

## Reinstall OS

Reinstalling the operating system has some advantages, for instance removing potential surveillance services installed by the provider. At the same time, it may introduce security risks. If you think it is necessary, [bohanwood/debi](https://github.com/bohanwood/debi) can be used to install a Debian environment.

## Add a user with sudo permission

Replace `myadmin` with the admin username you want to use.

```
sudo adduser myadmin
echo "myadmin ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/myadmin
sudo chmod 440 /etc/sudoers.d/myadmin
```

## Install software packages

```
sudo apt update \
  && sudo apt full-upgrade -y \
  && sudo apt install -y \
    apt-transport-https \
    build-essential \
    git \
    curl \
    wget \
    unzip \
    tmux \
    btop \
    bind9-dnsutils \
    tree \
    vim
```

## Configure SSH

```
sudo su myadmin
## paste SSH public key
mkdir -p ~/.ssh \
  && echo 'ssh-ed25519 AAAACxxxxxxxxxxxx' >> ~/.ssh/authorized_keys \
  && chmod 700 ~/.ssh \
  && chmod 600 ~/.ssh/authorized_keys
```

```
cat << 'EOF' | sudo tee /etc/ssh/sshd_config.d/custom.conf > /dev/null
## SSH port can be changed to improve security, note that it must be allowed by the provider and Firewall
Port 3435
## Disconnect if no password/key is provided within 1 minute
LoginGraceTime 1m
## Disable root login
PermitRootLogin no
## Strict mode: permission needs to be checked
StrictModes yes
## Allow only public-key authentication, no password
PubkeyAuthentication yes
PasswordAuthentication no
PermitEmptyPasswords no
KbdInteractiveAuthentication no
## PAM should be enabled for Debian systems
UsePAM yes
## No X11 forwarding
X11Forwarding no
## Heartbeat every 60 seconds
ClientAliveInterval 60
## If clients fail to respond six times, disconnect
ClientAliveCountMax 6
## No DNS reverse lookup of clients
UseDNS no
EOF
```

To make the changes take effect, run as sudo user (for instance with `sudo -i`):

```
systemctl daemon-reload
systemctl restart ssh.socket
```

Keep the connection alive, and open a new SSH connection with `ssh myadmin@XXX.XXX.XXX.XXX -p 3435` (change the port to the number specified above) to make sure that the connection works.

Once the new SSH configuration works for the new user, consider deleting unused sudoers that were created by the init process, for instance with `rm /etc/sudoers.d/90-cloud-init-users`.

## Change hostname

```
## permanent change, valid after restart
sudo hostnamectl set-hostname wiz
## modify hosts
sudo vim /etc/hosts
## add
127.0.1.1 wiz
```

## Install docker

See the instructions provided by [Docker](https://docs.docker.com/engine/install/ubuntu/). The command below may not be up-to-date.

```
## uninstall conflicting packages
sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc | cut -f1)

# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update

sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
## verify that docker runs
sudo systemctl status docker
```

## Install nginx

nginx is a nimble static web server and a reverse proxy, see [this article (Chinese)](https://zhuanlan.zhihu.com/p/464965616) for a good explanation of the concept and application of reverse proxy. See [nginx's installation instructions](https://nginx.org/en/linux_packages.html#Ubuntu)

```
sudo apt install curl gnupg2 ca-certificates lsb-release ubuntu-keyring
curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
    | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg
## full fingerprint should contain 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62

## install stable packages
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
https://nginx.org/packages/ubuntu `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list

## prefer nginx's packages over distribution-provided ones
echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" \
    | sudo tee /etc/apt/preferences.d/99nginx

## install
sudo apt update
sudo apt install nginx

## Start the service
sudo systemctl enable --now nginx
```

Set default fallback

```
cat << 'EOF' | sudo tee /etc/nginx/conf.d/00-default.conf > /dev/null
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    server_name _;
    return 444;
}

server {
    listen 443 ssl default_server;
    listen [::]:443 ssl default_server;
    server_name _;

    ssl_reject_handshake on;
}
EOF
```

Reload nginx configurations

```
sudo nginx -t
sudo nginx -s reload
```

## Configure ZRAM

ZRAM uses part of the RAM as swap, which is much faster than disk-based swaps.

```
sudo apt update && sudo apt install -y zram-tools

## edit the configurations
sudo vim /etc/default/zramswap

## configurations
## Algorithm: zstd is probably the better choice, balancing speed and compression
ALGO=zstd
## ZRAM: 2-4GB RAM 50%-60%, >=8GB 25%, >=16GB 100%
PERCENT=50
## Priority: set to the highest
PRIORITY=100

## Restart
sudo systemctl restart zramswap
```

Swapfile is a file-based swap

```
sudo dd if=/dev/zero of=/swapfile bs=1M count=2048 status=progress
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon --priority=-2 /swapfile
echo '/swapfile none swap sw,pri=-2 0 0' | sudo tee -a /etc/fstab
sudo mount -a
```

Set how the system should use the swap

```
# 1GB RAM: aggressive
# echo "vm.swappiness=100" | sudo tee -a /etc/sysctl.conf
# 2GB/4GB RAM: active
echo "vm.swappiness=60" | sudo tee -a /etc/sysctl.conf
# 8GB RAM or larger: conservative
# echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf

## apply the configuration
sudo sysctl -p

## confirm the status
sudo swapon --show
sudo zramctl
```

## BBR network congestion

BBR is an algorithm developed at Google to improve throughput and reduce latency.

```
cat << 'EOF' | sudo tee /etc/sysctl.d/99-vps-optimize.conf > /dev/null
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr
EOF
sudo sysctl --system
```

## Setting up the firewall

Use `nftables` instead of `ufw`.

```
## disable and uninstall ufw
sudo ufw disable && sudo apt purge ufw -y

## install nftables
sudo apt update && sudo apt install nftables -y
## activate nftables
sudo systemctl status nftables
```

Below are some basic settings that allow only SSH, HTTP, and HTTPS

```
sudo vim /etc/nftables.conf

#!/usr/sbin/nft -f

flush ruleset

table inet filter {
  chain input {
    type filter hook input priority filter;

    ct state { established, related } accept
    ct state invalid drop

    iif "lo" accept
    ip6 nexthdr icmpv6 icmpv6 type { nd-neighbor-solicit, nd-neighbor-advert, nd-router-advert } accept

    ip protocol icmp limit rate 4/second accept
    ip6 nexthdr icmpv6 icmpv6 type echo-request limit rate 4/second accept

    tcp dport 3435 accept ## replace the port with the SSH port

    tcp dport { 80, 443 } accept
  }
  chain forward {
    type filter hook forward priority filter; policy drop;

    ct state { established, related } accept
    ct state invalid drop

    iifname "docker0" accept
    iifname "br-*" accept

    iifname "docker0" oifname "docker0" accept
    iifname "br-*" oifname "br-*" accept
  }
  chain output {
    type filter hook output priority filter; policy accept;
  }
}
```

Apply the rules

```
## check the syntax
sudo nft -c -f /etc/nftables.conf
## start the service
sudo systemctl enable --now nftables
## inject the rules once Docker reinstalls
sudo systemctl restart nftables && sudo systemctl restart docker
## test Docker outgoing
sudo docker run --rm busybox ping -c 4 subdomain.domain.name
```

## Install and configure fail2ban

```
sudo apt update && sudo apt install fail2ban -y

cat << 'EOF' | sudo tee /etc/fail2ban/jail.d/sshd.local > /dev/null
[sshd]
enabled = true
port    = 3435
backend = systemd
mode    = aggressive
banaction = nftables-multiport
bantime  = 1d
findtime = 10m
maxretry = 3
ignoreip = 127.0.0.1/8 ::1
EOF
```

Start the fail2ban service

```
sudo systemctl enable --now fail2ban
sudo fail2ban-client status sshd
```

## Install further applications

Now we are ready to install further applications.

* [postgres](https://hub.docker.com/_/postgres/): Docker image for PostgreSQL
* [mongo](https://hub.docker.com/_/mongo/): Docker image for MongoDB
* [wallabag](https://wallabag.org/): save web articles, and read them later.
* [Forgejo](https://forgejo.org/): a self-hosted lightweight software forge

## References

1. [New linux server setup guide, by blog.dejavu.moe](https://blog.dejavu.moe/posts/new-linux-server-setup-guide/)
