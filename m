From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] fix m68k support
Date: Thu, 16 Feb 2012 21:42:57 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1202162137520.7225@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1201290042440.31292@herc.mirbsd.org>
 <201201290049.q0T0nKsw030673@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:37603 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751610Ab2BPVru convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 16 Feb 2012 16:47:50 -0500
In-Reply-To: <201201290049.q0T0nKsw030673@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: klibc@zytor.com
Cc: linux-m68k@vger.kernel.org

Dixi quod=E2=80=A6

>- fix syscall API and vfork
>- support 6-argument syscalls
>- add open/openat special handling for non-regparm arches

=46or the archives, and to keep everyone in the loop (said
this on IRC already, in #klibc):

This patch is part of klibc (2.0~rc2-0.1) uploaded to Debian
unstable (which otherwise is git HEAD as of 11 Feb 2012).

I=E2=80=99ve built mksh against it (using an older mkstemp.c externally=
,
since the latest patch requires the libc_init.c change, which I
didn=E2=80=99t add to the Debian package) dynamically, and it worked.

=46urthermore, I=E2=80=99ve built a minimal-ish sv4cpio archive (to be
passed as initrd) on m68k consisting of:
=E2=80=A2 klibc-utils
=E2=80=A2 that mksh binary
=E2=80=A2 a /init shell script to mount stuff and give a shell

ragnar76 successfully booted that (with the kernel image from
linux-image-3.2.0-1-atari_3.2.4-1_m68k.deb of proper Debian
unstable) on real hardware.

Andreas, if you would like a different jump instruction, feel
free to update my patch, as I bow to your superiour knowledge.
Otherwise I submit this as-is, tested.

bye,
//mirabilos
--=20
Support mksh as /bin/sh and RoQA dash NOW!
=E2=80=A3 src:bash (246 (265) bugs: 1 RC, 172 (186) I&N, 73 (78) M&W, 0=
 F&P)
=E2=80=A3 src:dash (74 (85) bugs: 3 RC, 27 (30) I&N, 44 (52) M&W, 0 F&P=
)
=E2=80=A3 src:mksh (1 bug: 0 RC, 0 I&N, 1 M&W, 0 F&P)
http://qa.debian.org/data/bts/graphs/d/dash.png is pretty red, innit?
