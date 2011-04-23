From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Debian kernel v2.6.38
Date: Sat, 23 Apr 2011 19:58:08 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1104231956370.3979@herc.mirbsd.org>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
 <Pine.BSM.4.64L.1104231809290.3979@herc.mirbsd.org>
 <BANLkTimNekxddcHFFV1cAAyiCWsz2EY11g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:32907 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755343Ab1DWUDh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 23 Apr 2011 16:03:37 -0400
In-Reply-To: <BANLkTimNekxddcHFFV1cAAyiCWsz2EY11g@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Geert Uytterhoeven dixit:

>As for-2.6.39 got rebased in the mean time, you have to compare
>m68k-v2.6.38 with m68k-queue to see what's (not yet) upstream.

Actually, I think looking at your sent out pull requests will
be easier. Anyway, I=E2=80=99ve got the (cross-built) kernel running:

Linux ara4.mirbsd.org 2.6.38-1+m68k.1-atari #1 Sat Apr 23 16:18:16 UTC =
2011 m68k GNU/Linux

Now it=E2=80=99s a matter of
=E2=80=A2 reducing patches
=E2=80=A2 getting patches accepted
=E2=80=A2 Debian Kernel Team creates an ABI file (?)
=E2=80=A2 build entire _official_ package natively (takes a week)

But we can play with it already, until then.

bye,
//mirabilos
--=20
13:47=E2=8E=9C<tobiasu> if i were omnipotent, i would divide by zero
                all day long ;)
(thinking about http://lobacevski.tumblr.com/post/3260866481 by waga)
