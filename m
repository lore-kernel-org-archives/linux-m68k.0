From: Thorsten Glaser <tg@debian.org>
Subject: Re: Coldfire v4 low performance of read/write to shared memory
Date: Sat, 16 Feb 2013 18:54:34 +0000 (UTC)
Message-ID: <loom.20130216T195126-34@post.gmane.org>
References: <1360754406.53672.YahooMailClassic@web125605.mail.ne1.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:43341 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753968Ab3BPSyv (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 16 Feb 2013 13:54:51 -0500
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1U6mug-0000nL-Np
	for linux-m68k@vger.kernel.org; Sat, 16 Feb 2013 19:55:06 +0100
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sat, 16 Feb 2013 19:55:06 +0100
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sat, 16 Feb 2013 19:55:06 +0100
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Lars Michael <lh_post <at> yahoo.com> writes:

> At the same time we noticed (by using strace) that there is an excess=
ive and=20
continously sequence of system
> calls at normal program execusion:
>=20
> 333 (__NR_GET_THREAD_AREA), and 335 (__NR_ATOMIC_CMPXCHG_32)

Yes, that is in fact normal. If you stop using programs (and libraries)
that use TLS (thread-local storage) and atomics, you=E2=80=99ll notice =
a massive
speedup as these syscalls will no longer be issued.

The only way out of this is an ABI breakage, with at least
* set one CPU register aside for the TLS base
* add a VDSO or some other kind of page for =E2=80=9Cfast syscalls=E2=80=
=9D,
  to optimise away the need for cmpxchg to call into the
  kernel (if possible), and maybe speed up e.g. gettimeofday
* bump time_t to 64 bit (pet peeve of mine)
* =E2=80=A6 maybe others? I=E2=80=99m not a Linux kernel coder.

bye,
//mirabilos
PS: Does strace by now know about these two syscalls,
    and possibly filter them out? Does qemu=E2=80=99s userspace
    emulation provide for them?
