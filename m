From: Thorsten Glaser <tg@mirbsd.de>
Subject: [m68k] partial success but does not boot: 3.2~rc7
Date: Sun, 1 Jan 2012 21:16:29 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1201012102110.20109@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="0-1679601169-1325451936=:20109"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:5108 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752986Ab2AAVQ4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Jan 2012 16:16:56 -0500
Content-ID: <Pine.BSM.4.64L.1201012105230.20109@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Debian kernel team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org
Cc: debian-68k@lists.debian.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1679601169-1325451936=:20109
Content-Type: TEXT/PLAIN; CHARSET=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <Pine.BSM.4.64L.1201012105231.20109@herc.mirbsd.org>

Hi,

I have good and bad news: I got 3.2~rc7 compiled with some
patches, but it=E2=80=99s panicking.

I=E2=80=99ve attached a .tgz with the following content:

a) patches against (a git copy of) the linux-2.6 trunk SVN:

=E2=80=A2 patches/0001-distinguish-level-of-xz-compression-to-use-for-packa=
=2Epatch

This is for waldi:

Use varying levels of xz compression for the packages, not always
dpkg-deb=E2=80=99s default of -6, and add a comment for what levels to use
once we can depend on dpkg-deb 1.16.2 after Guillem told me that
it will support -e (extreme). See #652636 for discussion. This was
primarily added here so I had a bit of speedup for building=E2=80=A6 change
to suit taste, then please commit.

=E2=80=A2 patches/0002-switch-m68k-to-gcc-4.6.patch

This is for debian-68k:

This is a tendency, our userspace was switched already. It builds,
but I have no idea whether this is a/the cause of it panicking.

Might be useful to commit, though, unless it _is_ the culprit.

=E2=80=A2 patches/0003-fix-the-aufs-pr_fmt-FTBFS-issue.patch

This is for bwh:

This is the same patch as I sent out in the mail to the AUFS thread
with mid <Pine.BSM.4.64L.1201010113350.14351@herc.mirbsd.org> (the
second version, with #undef pr_fmt =E2=80=93 the kernel was built with the
first version though, which only differs by generating cpp redefine
warnings, which don=E2=80=99t change the code).

The AUFS module builds, links, but I cannot test whether it loads,
since the kernel doesn=E2=80=99t come up.

Since Geert does not want my other patch, I suppose we=E2=80=99ll need it.

=E2=80=A2 patches/0004-fix-passing-CFLAGS_KERNEL-to-kbuild.patch

This is for debian-kernel (waldi, probably):

Fix the way a debian/*/defines 'cflags' is passed to kbuild.
Please do commit.

=E2=80=A2 patches/0005-use-cflags-ffreestanding-at-least-on-m68k-maybe-Clos=
=2Epatch

This is for waldi and linux-m68k:

Your suggestion to use -ffreestanding indeed Closes: #648996
Please do commit. Depends on 0004.

=E2=80=A2 patches/0006-Bastian-Blank-do-not-error-out-when-kernel-wedge-ret=
=2Epatch

This is _from_ waldi via IRC:

18:10=E2=8E=9C<mirabilos> kernel-wedge install-files 3.2.0-rc7
18:10=E2=8E=9C<mirabilos> could not find kernel image at /usr/share/kernel-=
wedge/commands/install-files line 103,
     =E2=8E=9C    <KVERS> line 2.
18:11=E2=8E=9C<mirabilos> make[2]: *** [install-udeb_m68k] Error 2
18:11=E2=8E=9C=C2=ABwaldi=C2=BB ich dachte die fehler werden ignoriert =E2=
=80=A6#

19:03=E2=8E=9C<mirabilos> find: =04ebian/kernel-image-3.2.0-rc7-atari-di': =
No such file or directory
19:03=E2=8E=9C<mirabilos> kernel-image-3.2.0-rc7-atari-di will be empty
19:03=E2=8E=9C<mirabilos> find: =04ebian/nic-shared-modules-3.2.0-rc7-atari=
-di': No such file or directory
19:03=E2=8E=9C<mirabilos> nic-shared-modules-3.2.0-rc7-atari-di will be emp=
ty
19:03=E2=8E=9C<mirabilos> hrm.
19:03=E2=8E=9C<mirabilos> waldi, was ist da kaputt?
19:03=E2=8E=9C<mirabilos> ich wars nicht

I just wonder why this seems to have been needed in the first place.

18:50=E2=8E=9C<mirabilos> -rw-r--r-- 1 root root 1845989 Jan  1 18:32
     =E2=8E=9C    /var/cache/pbuilder/build/cow.937/tmp/buildd/linux-2.6-3.=
2~rc7/debian/linux-image-3.2.0-rc7-atari/boo
     =E2=8E=9C    t/vmlinuz-3.2.0-rc7-atari

$sourcedir wrong? $installedname wrong?

No idea whether this should be committed.

=E2=80=A2 patches/0007-defines-and-changelog-for-my-personal-testing-image.=
patch

This is for me, just included for the sake of completeness: when I
test-build (not for uploading), I run source and arch:all builds on
an amd64 domU sponsored by zigo, and only arch:any stuff on m68k,
for speed. I disable the amd64 debugging package and other stuff,
and m68k flavours except the one I need (atari) for my tests. It
also shows the changelog entry. It doesn=E2=80=99t show the regeneration
of generated files by d/rules clean.


=E2=80=A2 work and fail

This is for debian-68k, linux-68k and debian-kernel:

ARAnyM =E2=80=9Cconsole=E2=80=9D output of a working (3.0) and failing (3.2=
) boot,
for your debugging pleasure. I can run arbitrary tests against the
failing kernel, as long as they=E2=80=99re limited to [LILO].Args or make
it boot ;-)


I can also provide the files on request:

-rw-r--r-- 1 pbuilder 1234 7951926 Jan  1 18:42 linux-image-3.2.0-rc7-atari=
_3.2~rc7-1~experimental.1tg1_m68k.deb
and linux-headers* and linux-libc-dev* which are less useful.

bye,
//mirabilos
--=20
<ch> you introduced a merge commit        =E2=94=82<mika> % g rebase -i HEA=
D^^
<mika> sorry, no idea and rebasing just fscked =E2=94=82<mika> Segmentation
<ch> should have cloned into a clean repo      =E2=94=82  fault (core dumpe=
d)
<ch> if I rebase that now, it's really ugh     =E2=94=82<mika:#grml> wuahhh=
hhh
--0-1679601169-1325451936=:20109
Content-Type: APPLICATION/OCTET-STREAM; NAME=blakernl.tgz
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.BSM.4.64L.1201012105120.20109@herc.mirbsd.org>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=blakernl.tgz

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
Y/CY3QYwJ1R7zhD1Clx8LDHMGQykhpqfRaKoXlFcm55S5DjsL32S3xziDNIa
V6pUd6f7RJahXBu2QntH/CWsVVD8XIVJNnGGHJREqQSxKm6YeGkh32eg18+g
pgvI7wB3EgTi3ci5Y6ZPOco1duDi2l0CvYGRDxG0lXd0sIR73xWvoSBxFEfS
VUyHCekNBxyklCtV1qvg5+IVIMjpBYYFw/Kls0fnBwcwjtF6cybKF9SQoS1G
grQHvVFaOIzaQm+O4zEuuzzvt/D0ULwXlyKRS34yv3QPjCJi2MEw6SV+DQzd
M159AM5NhNMtPIA+91caOB0628SfNqtS6J1iSKErBkDvhDjxW36geACOJq7c
llvyZei5i6NMeaYnvlpeO/xaqzzXF/tY0jIqsOb8tTNty+bXvC3daLlOKV9G
LoInYp8AxcsZj3FS1tGz5vaLDqpvFb0pV6ORiyV3oUkzjZxsqwksCPi8bRWT
Bmn6cUsxFRNt2uz9Kp2PLqi0nLNNAtukcEXwPu3QwijYJar2QFRTKVH121C1
1ajjSXoBU4Tl7S1i5yaglzmoqXkuSohN02hXYYrPPcjPfkFZDpgFgn2c9wUW
jHnyuuLpLXSZ52gYzSDgqIFh6PZUiGZhLK1leXmDQbk2TGsp9/YsxgzTmsLs
Bw2gfffg6J7tasriCNAjJ1BVa3aU8A5a6nuR11x/cTgtrQxnh3CWOB4TWkU0
gFoli8cYOA9u+hgnBCm3S6hTFNIo5aBZxZxwfcS5fkX1iP04YhyDNv8LrJa9
HI1PFaKJdio6jGswaymimL+VnKr2PKtWhVW2nFVW5dV+XBdbs5zy2UM0YUUK
Dm3CCZwCpalUOnfvaZjH5IKx0NgtbQkJmWJkF5R2RhzdQSRj2owQmcolWnjK
awaBQdv+hgWabZG4qTZoPt4LgsADGnz8pjB4aTiO/Uo8pzmBgKE8G3aTcAyV
vrXwmxagxTGc8hJ1te2aYDCXX7bADAyGl0bpejYL94W73OQWcK9y+kcf/Ak3
6Lklp7/GkVVx82zg2InQ+ZT4fkx6E3m8uLWTYbQ8zkRe/pJejkMj+w8lCXv5
etJaJlMcHFxOFAfVNOYlpTkrYAiN/XqVJwsui5leDqzoOjIupJFd81m2dA/h
m2q5zG3lAdTteakwPb4uXcfv89d99bPEGRdIU0tsa3NYVuBSEymL/D73hPtp
OEAsh4SJlRJoP051VNAsdDOJRXopYtKn4dUMWveWryzFeNCysq3HsVhBMz2r
ZJH0Eqm0qZ9s249m73GaaR7tAcq3pT5a+ba0xynfBbz7dXEO7X7Kt/VoKZnH
vI/ybZmPUL4tIVVPR4P+jPoPyq3/59R/mLpulfUfpiLqPwy9+VT/8VT/8Rer
/8AnkrZQ/UF3rTqsuyx67TPP8elVdHEykCeXCwUfVPc7LfjAK0lV84qPPSR6
FF+BAYrFX6iiFBUf6l+g4sPWnP8yFR+miXHtYn2D3fpvW/Fhmr61ZEQc/6ni
46ni4y9W8aHpGq/4oN/zFR/KkooPQ7m74uM/oa7D1ORWta6jaRktbaauQ3tE
XYfxoLqOArrLDWkb8kwHvb424+UcchX0IQUcxoMLOIyHFnAYDy7gMB5cwGE8
sIDDuE8Bh3XfAg7roQUcBca9CjiK+pB7FHBoDy3g0D53AYf2BQo4rM9WwDFD
6lMLOGa5WlHAUYA8voBjhsKnFHBo9gMLOAqETyngKGisLuCYtrJYwFE8+4wF
HAXJxxVwKLcWcKiaRiArCziUBxRwKJ+tgEO9fwGH+qACDvULFHCoDyjgUB9Y
wKE+poBDvauAQ31wAYd6WwEH35xZWsAhnqws4NDvX8Ch313AYXyGAg7r0ws4
mg8r4GjOBuvBMB6PC7g2oGMmw9vdDYy2aRtbsEIH6yrIJwlGF8jWLPp6Wm8v
1KVMdxmM3N65id/O/1xKLuNViPMopLIDOEQZC6UT7BG/7EoUyAtOS5Si3ojC
yFyICCp/3cVwEbLgnKB4WUjg4JwgvoKObLmJlHfzwnfacMj/NPkGdM469Pfn
3wkWBKgq22bJgcg9XAdBIHaW6YR28iu9AWA95Yku0nP1JYjSwC9mSpWLzSa1
3CbhXODMoMD/OiFtkyIh1Gqa/S7cXgpc2pyUeVmcoNFB26w34XC7Dh83NdNC
RHTncYFvwM7bHmppWzE3VWvT0gt65V4GJ8gtEn5T6YdWwmjTLnhlF0y5SFtM
IVIvDVHAxZ/hSGGnc9T/x/PueXfLhp3D3f5J97R/cH6E0WJvp3MmvemcbSlw
1nnzprsrEdz+0ZstXE30Qs393a1mqTwLep3zs+Ne96jXBfpT2TxcJyUraTkR
yImUiPmZ6K1myagxwyi089UR4WK6YpxWCZiPM4a3KcM12oaT3qYmLosVTpEz
Tj4ZBdrrHOE9ga7JWq5Wwmg8yYpm3rEbN3YSn07L5y+NTzdzrbPJIcVPpaRi
LKEiWLiDhFolgc5+H6Vqwigo66dsQMfJ0Gbmli+PyqDEM1qPw2vm7SWZJ5Wz
MP3epgscODoOPWNqZqGxZ3hZjkGxI01epTdx+aTOWzOEuW+40Xwwhlli5AMy
wzUVVlHtUVoa9HIYig1kkrM2fHRCHk2TpLgT/ndSXHSx6Z0Q8Wg8RCsFpVaa
4j5s6HVZsR+HpxuPwzNbj8OzH9WeIavmHaKFiHyY83DQ474YUqLTjZKi4j/8
2jbpveI8B06uqmmYqqkVQYxRhpbdfzrTJQqDXSehl3Kl4s1isxkTBM5H4PKX
eEJ1h75wh+iPRwC6C6MRvUuEjM8VuhUmaek48tMCuziGkDcF63nGrU52cxJR
gQV/y4voDQ8yuG+L9yk1xP88VZUWd6cPc2zK5WHwdp3pM4TqPLEeRyjccbkB
g8PQVrWWXJJbyAbkHAmAlmzmZmOCEP57W/nQLrs+XQxNsXhUoxSVjs93YNSW
3bI05ZLXKhIbMwlHDYfuJAljygO1JZVe0sDFQgXHS+IUv+TIgrZZ1iUtGUbh
UxVVoZDP0tPG8dPn6fP0efqs/Px/Msn8gwCSAAA=

--0-1679601169-1325451936=:20109--
