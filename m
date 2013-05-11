From: Thorsten Glaser <tg@debian.org>
Subject: I/O macros redefined, inconsistent across m68k machdep headers
Date: Sat, 11 May 2013 15:19:50 +0000 (UTC)
Message-ID: <loom.20130511T171757-995@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:38738 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753058Ab3EKPZH (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 11 May 2013 11:25:07 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1UbBfT-0007e3-Jq
	for linux-m68k@vger.kernel.org; Sat, 11 May 2013 17:25:03 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sat, 11 May 2013 17:25:03 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sat, 11 May 2013 17:25:03 +0200
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi!

I *really* dislike seeing messages like this while compiling,
that=E2=80=99s why I=E2=80=99m sending them there. I had a look at both=
 files,
but there=E2=80=99s a lot of ifdeffery going on, and I don=E2=80=99t kn=
ow
which of the macro resolutions, if any, is supposedly correct.

  CC [M]  drivers/parport/parport_pc.o
In file included from /tmp/buildd/linux-3.8.12/drivers/parport/
parport_pc.c:67:0:
/tmp/buildd/linux-3.8.12/arch/m68k/include/asm/parport.h:14:0: warning:=
=20
"insl" redefined [enabled by default]
/tmp/buildd/linux-3.8.12/arch/m68k/include/asm/io_mm.h:280:0: note: thi=
s is=20
the location of the previous definition
/tmp/buildd/linux-3.8.12/arch/m68k/include/asm/parport.h:15:0: warning:=
=20
"outsl" redefined [enabled by default]
/tmp/buildd/linux-3.8.12/arch/m68k/include/asm/io_mm.h:283:0: note: thi=
s is=20
the location of the previous definition
In file included from /tmp/buildd/linux-3.8.12/drivers/parport/
parport_pc.c:67:0:
/tmp/buildd/linux-3.8.12/arch/m68k/include/asm/parport.h:14:0: warning:=
=20
"insl" redefined [enabled by default]
/tmp/buildd/linux-3.8.12/arch/m68k/include/asm/io_mm.h:280:0: note: thi=
s is=20
the location of the previous definition
/tmp/buildd/linux-3.8.12/arch/m68k/include/asm/parport.h:15:0: warning:=
=20
"outsl" redefined [enabled by default]
/tmp/buildd/linux-3.8.12/arch/m68k/include/asm/io_mm.h:283:0:this is th=
e=20
location of the previous definition


This is from building the amiga flavour (first of six!) of the Debian
unstable Linux kernel source package. We=E2=80=99ll have the new kernel=
s in
roughly 1=C2=BD-2 weeks, if everything works =E2=98=BA

bye,
//mirabilos
