From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] m68k: handle Atari interrupts in multi-platform kernels
Date: Mon, 26 Aug 2013 11:57:59 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1308261156270.19888@herc.mirbsd.org>
References: <1293022446.232897.1377516773736.open-xchange@ox-webdesk.1and1.fr>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from eurynome.mirbsd.org ([81.169.181.30]:44047 "EHLO
	eurynome.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755370Ab3HZMFp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 26 Aug 2013 08:05:45 -0400
Received: from herc.mirbsd.org (root@herc.mirbsd.org [IPv6:2a01:198:25d:0:202:b3ff:feb7:54e8])
	by eurynome.mirbsd.org (8.14.5.Beta0/8.14.3) with ESMTP id r7QC5btZ019405
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-m68k@vger.kernel.org>; Mon, 26 Aug 2013 12:05:42 GMT
In-Reply-To: <1293022446.232897.1377516773736.open-xchange@ox-webdesk.1and1.fr>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <laurent@vivier.eu>
Cc: Debian m68k <debian-68k@lists.debian.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Laurent Vivier dixit:

>Thanks, but what is the URL, I want to wget it. I didn't find it on
>ftp.debian.org.

They=E2=80=99re on debian-ports, not debian.org, of course.

>> The .deb is not usable outside of a running unstable installation.
>
>Why ? There are some (useless) new dependencies ?

There are some use*ful* new dependencies: stuff to generate the
initramfs, which is now REQUIRED for the Debian distro kernel.

>I'm using a 3.10-rc2 from GIT in a etch-m68k distro and it works fine.

A self-compiled monolithic kernel will run fine, sure, but we
switched to requiring an initrd for 3.10 in Debian.

This *will* not work with etch-m68k.

Also, the *.deb files are now xz compressed instead of gzip,
which needs squeeze or newer.

bye,
//mirabilos
--=20
  "Using Lynx is like wearing a really good pair of shades: cuts out
   the glare and harmful UV (ultra-vanity), and you feel so-o-o COOL."
                                         -- Henry Nelson, March 1999
