From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Linux 3.1-2-m68k config
Date: Sun, 20 Oct 2013 15:01:19 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1310201454250.19879@herc.mirbsd.org>
References: <CAMuHMdXDDyzdy80gDvS-i96pMSgiCw9AJTD3ts=HaCwC26KWUw@mail.gmail.com>
 <5263A185.1040303@Vivier.EU>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <5263A185.1040303@Vivier.EU>
Resent-Message-ID: <Z3uNv_9WsOK.A.L2H.yG_YSB@bendel>
List-URL: <http://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: debian-68k@lists.debian.org
Cc: Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Geert Uytterhoeven dixit:

>Big differences are due to many drivers being modular in the initrd for th=
e
>Debian kernel, which I want to avoid for my defconfigs, for hassle-free
>testing.

ACK, but we need that.

>What sticks out:
>  - Lack of FPU emulation support in the Debian kernel,

Hm okay.

>  - CONFIG_COMPAT_BRK is not enabled in the Debian kernel, which
>    is needed if you want to boot the good old filesys-ELF-2.0.x-1400K-2.g=
z

I wonder=E2=80=A6

>    ramdisk (probably not with the Debian kernel, as all your drivers are =
in
>    modules?)

=E2=80=A6 yes, we have everything that can be shoved into modules there,
since we bit the bullet and require an initrd now. But I guess
CONFIG_COMPAT_BRK is =E2=80=9Cnot much=E2=80=9D code, so I=E2=80=99ll proba=
bly add them
both.

Any further suggestions (please in form of "toggle this setting"
because the Debian configs are =E2=80=9Cminified deltas=E2=80=9D) into my g=
eneral
direction ;-)

>Apart from that, (probably both) configs need more stripping in the common
>part. I want to have bootable (i.e. < 4 MiB) defconfig kernels.

Ours is bootable and decently small. Still could use shaving off
more, but it=E2=80=99s a good start considering I only really worked with
Linux 2.0.3x and later 2.4.3 and otherwise only BSD=E2=80=A6

One pet peeve of mine is that I don=E2=80=99t know which of the tristate
options add =E2=80=9Ccommon code=E2=80=9D (such as hooks) and which, when s=
et to
=E2=80=98m=E2=80=99, do _not_ add something to vmlinux.

But since Debian is a generic, universal distro, I=E2=80=99ve kept most
of the things Debian uses enabled as modules, in case someone
actually does want to run it.

There are some exceptions, most notably Ceph and the likes.
And LSM and cgroups were removed from the core for obvious
size reasons.


Laurent Vivier dixit:

> Moreover, a compressed kernel fitting on a floppy would be better : there=
 is no

Just use a custom kernel then: you=E2=80=99d want that to be as optimised
to the target machine as possible; multi-platform configs are not
just bigger but also require more (e.g. HDD) drivers.

> USB port on this kind of machine, and the floppy is the easiest way to bo=
ot a

This is wrong, I=E2=80=99ve seen Ataris with USB and even a PCI Radeon
graphics card running FreeMiNT IRL.

> (With 2.2 kernel we were able to put kernel AND ramdisk on the SAME flopp=
y !)

Yes, but Linux 3.0 is bigger. SOL.

(Even in MirBSD, I have to squeeze more and more for the boot floppy,
both the one i386 one and the one sparc one, over time.)

bye,
//mirabilos
--=20
Gast: =E2=80=9EEin Bier, bitte!=E2=80=9C
Wirt: =E2=80=9EGeht auch alkoholfrei?=E2=80=9C
Gast: =E2=80=9EGeht auch Spielgeld?=E2=80=9C
