From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: atafb and X/fbdev
Date: Sat, 7 Jul 2012 07:54:07 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1207070751590.7146@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1207062301330.12225@herc.mirbsd.org>
 <4FF7AFD7.8000005@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:19449 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751095Ab2GGHzH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 7 Jul 2012 03:55:07 -0400
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
	by herc.mirbsd.org (8.14.5/8.14.5) with ESMTP id q677s9FL030531
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Sat, 7 Jul 2012 07:54:13 GMT
In-Reply-To: <4FF7AFD7.8000005@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
Cc: linux-m68k@vger.kernel.org

schmitz dixit:

> Have you tried the VGA modes (vga256 for instance)? That might boil d=
own to
> interleaved planes in the end though.

Yes, vgs256 was interleaved too. From my limited understanding of
atafb.c all modes are interleaved or monochrome.

> You will have to go back to one of the earlier Debian releases (slink=
 or
> potato) for Atari support in the X server. potato should still have t=
he
> required code.

Hrm, okay. I couldn=E2=80=99t find much in the =E2=80=99net except a re=
ference to
xfree68 but was unable to find that, either. Too bad, all the history=E2=
=80=A6
you don=E2=80=99t happen to know the _package_ name of the server, and =
the
needed config? ;-)

bye,
//mirabilos
--=20
  =E2=80=9CHaving a smoking section in a restaurant is like having
          a peeing section in a swimming pool.=E2=80=9D
						-- Edward Burr
