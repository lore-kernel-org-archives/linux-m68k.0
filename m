From: Thorsten Glaser <tg@debian.org>
Subject: aufs vs. m68k conflict, please advice
Date: Fri, 16 Dec 2011 14:42:03 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1112161437090.856@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:35428 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754119Ab1LPOmd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Dec 2011 09:42:33 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, Debian Kernel Team <debian-kernel@lists.debian.org>

Hi,

a build of linux-2.6 (3.2~rc4-1~experimental.1) with gcc-4.6 (to
check whether we can switch to it for the kernel, too) fails:

[=E2=80=A6]
  LD [M]  fs/affs/affs.o
  LD      fs/aufs/built-in.o
  CC [M]  fs/aufs/module.o
In file included from /tmp/buildd/linux-2.6-3.2~rc4/debian/build/source=
_m68k_none/include/linux/hardirq.h:7:0,
                 from /tmp/buildd/linux-2.6-3.2~rc4/debian/build/source=
_m68k_none/arch/m68k/include/asm/irqflags.h:6,
                 from /tmp/buildd/linux-2.6-3.2~rc4/debian/build/source=
_m68k_none/include/linux/irqflags.h:15,
                 from /tmp/buildd/linux-2.6-3.2~rc4/debian/build/source=
_m68k_none/include/linux/spinlock.h:53,
                 from /tmp/buildd/linux-2.6-3.2~rc4/debian/build/source=
_m68k_none/include/linux/seqlock.h:29,
                 from /tmp/buildd/linux-2.6-3.2~rc4/debian/build/source=
_m68k_none/include/linux/time.h:8,
                 from /tmp/buildd/linux-2.6-3.2~rc4/debian/build/source=
_m68k_none/include/linux/stat.h:60,
                 from /tmp/buildd/linux-2.6-3.2~rc4/debian/build/source=
_m68k_none/include/linux/module.h:10,
                 from /tmp/buildd/linux-2.6-3.2~rc4/debian/build/source=
_m68k_none/fs/aufs/module.c:23:
/tmp/buildd/linux-2.6-3.2~rc4/debian/build/source_m68k_none/arch/m68k/i=
nclude/asm/hardirq.h: In function 'ack_bad_irq':
/tmp/buildd/linux-2.6-3.2~rc4/debian/build/source_m68k_none/arch/m68k/i=
nclude/asm/hardirq.h:23:2: error: expected ')' before 'AUFS_NAME'
make[7]: *** [fs/aufs/module.o] Error 1
[=E2=80=A6]

The cause isn=E2=80=99t hard to figure out:

    I /tmp/buildd/linux-2.6-3.2~rc4/debian/build/source_m68k_none/arch/=
m68k R21  <40   C1  384 |180 115|73 14:39
   21 static inline void ack_bad_irq(unsigned int irq)
   22 {
   23         pr_crit("unexpected IRQ trap at vector %02x\n", irq);
   24 }

(pbuild26252)root@ara5:/ # fgrep AUFS_NAME /tmp/buildd/linux-2.6-3.2~rc=
4/debian/build/source_m68k_none/fs/aufs/*
/tmp/buildd/linux-2.6-3.2~rc4/debian/build/source_m68k_none/fs/aufs/Mak=
efile:ccflags-y +=3D -D'pr_fmt(fmt)=3DAUFS_NAME"\040%s:%d:%s[%d]:\040"f=
mt,__func__,__LINE__,current->comm,current->pid'

This, to me, looks like cpp abuse in aufs, but I=E2=80=99m not a kernel
programmer (Linux or otherwise).

bye,
//mirabilos
--=20
Support mksh as /bin/sh and RoQA dash NOW!
=E2=80=A3 src:bash (240 (258) bugs: 0 RC, 167 (181) I&N, 73 (77) M&W, 0=
 F&P)
=E2=80=A3 src:dash (72 (82) bugs: 3 RC, 27 (30) I&N, 42 (49) M&W, 0 F&P=
)
=E2=80=A3 src:mksh (1 bug: 0 RC, 0 I&N, 1 M&W, 0 F&P)
http://qa.debian.org/data/bts/graphs/d/dash.png is pretty red, innit?
