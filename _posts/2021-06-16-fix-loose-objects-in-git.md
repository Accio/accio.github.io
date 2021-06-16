---
layout: post
title: Solution to the Git problem of loose object is corrupt
category: programming
---

This post documents how we can fix the problem of `loose object is corrupt` in git.

I run a Ubuntu guest system as a virtual machine in a Windows host with
VirtualBox. Sometimes, especially when the machine is shutdown abruptly, a git
directory will be damaged, showing the following error messages:

```
error: object file .git/objects/e1/ref is empty
error: object file .git/objects/e1/ref is empty
fatal: loose object e1ref (stored in .git/objects/e1/ref) is corrupt
```

The solution is:

```
find .git/objects/ -size 0 -exec rm -f {} \;
git fetch origin
```

Then run `git status`, the repo should be functional again.

This solution was found [from
StackOverflow](https://stackoverflow.com/questions/4254389/git-corrupt-loose-object)
along with a few other solutions. I chose it because it involves the least effort.

