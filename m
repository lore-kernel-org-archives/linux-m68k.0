From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Linux 3.1-2-m68k config (was: Re: Linux 3.10-2-m68k FPU support)
Date: Mon, 11 Nov 2013 01:10:07 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1311110108550.15024@herc.mirbsd.org>
References: <CAMuHMdXDDyzdy80gDvS-i96pMSgiCw9AJTD3ts=HaCwC26KWUw@mail.gmail.com>
 <alpine.LNX.2.00.1311111111320.10595@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from eurynome.mirbsd.org ([81.169.181.30]:32410 "EHLO
	eurynome.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750904Ab3KKBUo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Nov 2013 20:20:44 -0500
Received: from herc.mirbsd.org (root@herc.mirbsd.org [IPv6:2a01:198:25d:0:202:b3ff:feb7:54e8])
	by eurynome.mirbsd.org (8.14.5.Beta0/8.14.3) with ESMTP id rAB1KShV026663
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-m68k@vger.kernel.org>; Mon, 11 Nov 2013 01:20:35 GMT
In-Reply-To: <alpine.LNX.2.00.1311111111320.10595@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

=46inn Thain dixit:

>Would this prevent the macfb framebuffer console from working in the=20
>absence of kernel modules?

With the switch to initrd, absence of modules is simply no longer
supported at all, period. I am not happy about this myself, but,
realistically, the monoliths cannot be kept working as generic
kernels, only those tailored to a specific system.

Besides, if multi_defconfig has it as =E2=80=98n=E2=80=99=E2=80=A6

bye,
//mirabilos
--=20
=E2=80=9ECool, /usr/share/doc/mksh/examples/uhr.gz ist ja ein Grund,
mksh auf jedem System zu installieren.=E2=80=9C
	-- XTaran auf der OpenRheinRuhr, ganz begeistert
(EN: =E2=80=9C[=E2=80=A6]uhr.gz is a reason to install mksh on every sy=
stem.=E2=80=9D)
