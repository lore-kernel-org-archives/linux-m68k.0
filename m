From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Atari console corruption
Date: Sun, 30 Jan 2011 14:17:55 +0000
Message-ID: <Pine.BSM.4.64L.1101301417070.30539@herc.mirbsd.org>
References: <AANLkTimZ4q3mGhy27qVo5gQHMCM2U8jrc_fNPH4YUXev@mail.gmail.com>
 <m2fww9dczv.fsf@igel.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:49858 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753834Ab1A3OST convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Jan 2011 09:18:19 -0500
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1PjY6Z-0004VL-4W
	for linux-m68k@vger.kernel.org; Sun, 30 Jan 2011 15:18:15 +0100
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sun, 30 Jan 2011 15:18:15 +0100
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sun, 30 Jan 2011 15:18:15 +0100
In-Reply-To: <m2fww9dczv.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Andreas Schwab dixit:

>> become corrupted.
>
>Minimal testcase:
>
>$ printf 'abcd\10\10\33[@\n'

Doesn=E2=80=99t happen on the 2.6.32-5+m68k.5-atari I just built. Good =
news
too, video=3Datafb:vga2 is no longer needed either.

bye,
//mirabilos
--=20
22:20=E2=8E=9C<asarch> The crazy that persists in his craziness becomes=
 a master
22:21=E2=8E=9C<asarch> And the distance between the craziness and genia=
lity is
only measured by the success                       22:21=E2=8E=9C<mksh>=
 it=E2=80=99s a
very thin line anyway=E2=80=A6 with some, you don=E2=80=99t know which =
side they=E2=80=99re on
