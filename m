From: Thorsten Glaser <tg@debian.org>
Subject: natfeat ether tries to enable interrupts in IRQ handler, I think
Date: Fri, 27 Jan 2012 17:53:31 +0000 (UTC)
Message-ID: <loom.20120127T184813-769@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:41735 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752439Ab2A0Rxn (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Fri, 27 Jan 2012 12:53:43 -0500
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1Rqpza-00043K-In
	for linux-m68k@vger.kernel.org; Fri, 27 Jan 2012 18:53:42 +0100
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Fri, 27 Jan 2012 18:53:42 +0100
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Fri, 27 Jan 2012 18:53:42 +0100
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

I don=E2=80=99t know if it=E2=80=99s important, but for the record:

[    0.000000] Linux version 3.2.0-1+m68k.1-atari (Debian 3.2.1-
1+m68k.1) (tg@mirbsd.de) (gcc version 4.6.2 (Debian 4.6.2-11) ) #1 Mon =
Jan 23=20
06:44:50 UTC 2012
[    0.000000] console [debug0] enabled
[    0.000000] Atari hardware found: VIDEL STDMA-SCSI ST_MFP YM2149 PCM=
 CODEC=20
DSP56K SCC ANALOG_JOY BLITTER IDE TT_CLK FDC_SPEED
[    0.000000] NatFeats found (ARAnyM, 1.0)

=E2=80=A6

[    0.190000] NET: Registered protocol family 1
[    0.190000] nfhd8: found device with 20971440 blocks (512 bytes)
[    0.190000]  nfhd8: AHDI p1 p2
[    0.190000] nfeth: API 5
[    0.200000] eth0: nfeth addr:192.168.0.1 (192.168.0.2)=20
HWaddr:52:54:00:22:81:00
[    0.200000] audit: initializing netlink socket (disabled)

=E2=80=A6

[    4.230000] NET: Registered protocol family 17
[    4.250000] NET: Registered protocol family 15

=E2=80=A6

[  179.070000] EXT3-fs (nfhd8p1): using internal journal
[  190.130000] ------------[ cut here ]------------
[  190.140000] WARNING: at /tmp/buildd/linux-2.6-3.2.1/debian/build/
source_m68k_none/kernel/irq/handle.c:130 handle_irq_event_percpu+0x130/=
0x13e()
[  190.180000] irq 3 handler nfeth_interrupt+0x0/0x190 enabled interrup=
ts
[  190.190000] Modules linked in:
[  190.210000] Call Trace: [<00030460>] warn_slowpath_common+0x48/0x6a
[  190.230000]  [<0003046e>] warn_slowpath_common+0x56/0x6a
[  190.250000]  [<000304fa>] warn_slowpath_fmt+0x2a/0x32
[  190.260000]  [<00066666>] handle_irq_event_percpu+0x130/0x13e
[  190.280000]  [<002975c2>] printk+0x0/0x18
[  190.300000]  [<00066666>] handle_irq_event_percpu+0x130/0x13e
[  190.310000]  [<0000a32c>] nfeth_interrupt+0x0/0x190
[  190.330000]  [<00066694>] handle_irq_event+0x20/0x2c
[  190.350000]  [<00065e9c>] generic_handle_irq+0x2c/0x3a
[  190.360000]  [<00002940>] do_IRQ+0x20/0x32
[  190.370000]  [<00002766>] auto_irqhandler_fixup+0x4/0x6
[  190.390000]
[  190.400000] ---[ end trace 8319716d1dde4662 ]---
[  190.780000] NET: Registered protocol family 10
[  200.940000] eth0: no IPv6 routers present

This happens exactly when, on the framebuffer, Debian initialises the
network interfaces.


-

In unrelated news, my console colours are partially inverted: the text
I=E2=80=99d normally have in lightgrey is yellow-ish, and mc=E2=80=99s =
blue is red.

No special boot options:

[    0.000000] Kernel command line: root=3D/dev/nfhd8p1 console=3Dtty d=
ebug=3Dpar=20
devtmpfs.mount=3D1 BOOT_IMAGE=3Dvmlinux

[    0.000000] Console: colour dummy device 80x25
[    0.000000] console [tty0] enabled

[    0.230000] atafb_init: start
[    0.230000] atafb_init: initializing Falcon hw
[    0.230000] atafb: screen_base 00b87000 real_screen_base 00b87000 sc=
reen_len=20
311296
[    0.230000] Determined 640x480, depth 4
[    0.230000]    virtual 640x972
[    0.250000] Console: switching to colour frame buffer device 80x30
[    0.260000] fb0: frame buffer device, using 304K of video memory

and in aranym:

[VIDEO]
=46ullScreen =3D No
BootColorDepth =3D 8
VidelRefresh =3D 1

No idea what to set there. I=E2=80=99m normally using ssh exclusively, =
anyway,
but it might be a nice bonus for others using my image to get =E2=80=9C=
proper=E2=80=9D
colours. (I had them on one of the three currently running VMs once,
but can=E2=80=99t seem to reproduce it=E2=80=A6) but that=E2=80=99s not=
 really important, just
a curiosum.

bye,
//mirabilos
