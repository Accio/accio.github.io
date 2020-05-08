---
layout: post
title: Configuring the home wireless network
Catergory: Notes
---

One side effect of the coronavirus pandemic is that we spend disproportionately
more time at home. A safe, fast, and robust home wireless network is a
nice-to-have during this time.

In the last weeks, I updated the configurations of our home network. For that I
use a mix of Ethernet, powerline (in which network traffic is sent over electric
cables instead of over Ethernet cables), dedicated wireless access points (APs) as
well as RaspberryPi devices. Below are my learnings.

## The Pi-hole server

I discovered the [pi-hole](https://github.com/pi-hole/pi-hole) server. It
filters web traffic to ad and tracing websites. It does so at the home network
level instead of on individual devices, which means that we do not have to
configure each and every machine to stop ad and tracing.

Pi-hole runs on the RaspberryPi mini computer system. I served it with an old
machine from 2015. The server has worked wonderfully since a week without any
performance issues. The CPU temperature is only around 50 degree Celsius, and
the system load is far below 1. On average, about 15% web requests are filtered.

![Pi-hole screenshot](
{{ site.baseurl }}{% link assets/images/202005-pihole-screenshot.png %}
)

I looked at the statistics of filtered requests. As expected, many requests are
sent in background to websites such as Netflix or Amazon, the service of which
we do not actively use. It is likely because of either web ads or hardware
devices that come with services as part of the software bundle, such as the
television. I have not done a systematic analysis though.

## Wi-Fi roaming

By Wi-Fi Roaming we mean that multiple wireless access points (APs) use the same
SSID (network name) and the same password. A Wi-Fi client such as a laptop or a
mobile phone will automatically find the best SSID using its own rule, for
instance depending on the strength of the Wi-Fi signal.

I thought previously that Wi-Fi roaming can only happen between two identical
devices. It turns out that I was wrong. I used a router, which is connected to
the internet, and an AP of a different type to set it up.

All I needed to do is to set the same SSID on the router and on the AP. I
connect the AP via the Ethernet cable to the router. The AP is configured
according to its manual, with the only exception that the DHCP service is
disabled. The system worked out of the box.

If you encounter poor signals in the area covered by the AP, a trick may help:
try to use a moderate power instead of the maximum power of the AP. Because a
very strong Transmitter Power (sometimes abbreviated as the option `TX Power`)
of AP may interfere with the signal from the router or from other APs. If you
suspect such an interference, it may also help to let the devices use different
WLAN signal channels. Both measures may help improve the roaming experience.

A side story: I was surprised at the beginning that the internet speed is much
slower when connecting with AP than that when connecting with the router. Later
I found out that in my case, the Ethernet cable connection is a speed-limiting
factor.  This can happen, for instance, when the internet connection of the home
(200 Mbps in our case) is better than the highest speed supported by either the
router or the AP (100 Mbps in our case, because the AP is an old one). Check the
specification of AP in case of doubt.

The story made me think of the time when I used 56K modem to dial in the
internet. If someone had told me that one day I will be frustrated with an
internet connection of 100 Mbps, I would probably think she must be joking. Not
to mention that the 100 Mbps comes with wireless transmission. It is ironic now
that the wireless of the router is faster than the maximum speed of the Ethernet
cable of the AP!

## Setting up a Raspberry Pi computer as an AP

I followed [the documentation of Raspberry Pi On
GitHub](
https://github.com/raspberrypi/documentation/blob/master/configuration/wireless/access-point-bridged.md)
to setup my Raspberry Pi as a bridge between Ethernet and Wi-Fi. Now it is
possible for clients including mobile phones and laptops to connect to a WLAN
broadcast by the Raspberry Pi machine.

Until now, I thought the bridge mode only works between two WLAN interfaces. It
is wrong: a bridge can connect any two network interfaces.

## The final thing: two learnings

* **Premature optimization is the root of all evil**. Build a prototype fast and
    cheap, use it, and then decide whether to build a real tool. Equivalently,
    use the cheapest (free) tool that you can buy or find. With time, invest
    money and resource on the tools that you use most of the time. The opposite
    costs both money and time and causes both frustration and regret.
* **Do not remove a SD card from Raspberry Pi before it is properly shutdown**.
    I lost a SD card due to my own mistake.


