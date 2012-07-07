From: schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: atafb and X/fbdev
Date: Sat, 07 Jul 2012 15:41:11 +1200
Message-ID: <4FF7AFD7.8000005@biophys.uni-duesseldorf.de>
References: <Pine.BSM.4.64L.1207062301330.12225@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:65427 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750956Ab2GGDlc (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 6 Jul 2012 23:41:32 -0400
Received: by pbbrp8 with SMTP id rp8so15647330pbb.19
        for <linux-m68k@vger.kernel.org>; Fri, 06 Jul 2012 20:41:32 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1207062301330.12225@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

Thorsten,
> X/xfbdef gets SIGFPE. X/fbdev doesn=E2=80=99t like *any* atafb mode: =
it likes
> neither interleaved planes nor 1bpp modes, and I don=E2=80=99t think =
there are
>  =20
Have you tried the VGA modes (vga256 for instance)? That might boil dow=
n=20
to interleaved planes in the end though.
> any others. How can we get an X server on ARAnyM running (I=E2=80=99v=
e got both
> current x.org from sid and XFree86 from woody installed)?
>  =20
You will have to go back to one of the earlier Debian releases (slink o=
r=20
potato) for Atari support in the X server. potato should still have the=
=20
required code.
> Sitting at BAAMM! so quick response appreciated ;)
>  =20
Geert is your best shot at getting framebuffer device questions answere=
d.

Cheers,

    Michael
  =20
> http://lists.debian.org/debian-68k/2012/05/msg00027.html
>
> bye,
> //mirabilos
>  =20
