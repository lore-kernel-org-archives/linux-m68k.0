From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] m68k/irq: don't use pr_crit in an header
Date: Sat, 17 Dec 2011 21:19:38 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1112172117060.856@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1112161437090.856@herc.mirbsd.org>
 <1324152592-1718-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:36280 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751750Ab1LQVYT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 17 Dec 2011 16:24:19 -0500
In-Reply-To: <1324152592-1718-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, debian-kernel@lists.debian.org

Uwe Kleine-K=C3=B6nig dixit:

>so better use plain printk with KERN_CRIT directly.

Wasn=E2=80=99t it considered good style to switch f=CC=B2r=CC=B2o=CC=B2=
m=CC=B2 that t=CC=B2o=CC=B2 pr_crit?

In that case, my other patch from Message-ID
<Pine.BSM.4.64L.1112171426140.856@herc.mirbsd.org> can still
be used. Feel free to assume a Signed-off on that by me, if
this is the desired direction of change.

(Of course, aufs changes notwithstanding.)

bye,
//mirabilos
--=20
Support mksh as /bin/sh and RoQA dash NOW!
=E2=80=A3 src:bash (240 (258) bugs: 0 RC, 167 (181) I&N, 73 (77) M&W, 0=
 F&P)
=E2=80=A3 src:dash (72 (82) bugs: 3 RC, 27 (30) I&N, 42 (49) M&W, 0 F&P=
)
=E2=80=A3 src:mksh (1 bug: 0 RC, 0 I&N, 1 M&W, 0 F&P)
http://qa.debian.org/data/bts/graphs/d/dash.png is pretty red, innit?
