From: Thorsten Glaser <tg@mirbsd.de>
Subject: [PATCH 0/2 v3] mkstemp() and m68k support
Date: Sun, 29 Jan 2012 00:48:48 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1201290042440.31292@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:21911 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752024Ab2A2AuU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 28 Jan 2012 19:50:20 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: klibc@zytor.com
Cc: linux-m68k@vger.kernel.org

Hi,

after a year, I decided to hack on klibc again. I=E2=80=99ve reworked
both the patch to add mkstemp(), discussing to use AT_RANDOM
as cheap entropy source on IRC (if there will ever be another
entropy consumer, I can quickly write a minimal arc4random()
seeded from it, as it has only 16 octets), capable of making
a working mksh (static and shared) on amd64/xen, and the m68k
support code, leading to (also, static and shared) mksh on it
iff compiled with -g (let=E2=80=99s say, GCC is the culprit).

The two patches _should_ follow (still not 100% sure how to
feed them to sendmail and ensure they end up with the right
recipients) and are independent from each other (but for an
mksh on m68k, you obviously need both).

Cc the Linux/m68k arch list for the m68k patch, to review.

(When this works I=E2=80=99m probably going to build mksh-static on
dietlibc-less Debian architectures against klibc, pending
testing on those platforms of course; the eglibc one is huge.)

bye,
//mirabilos
--=20
Support mksh as /bin/sh and RoQA dash NOW!
=E2=80=A3 src:bash (242 (261) bugs: 0 RC, 169 (183) I&N, 73 (78) M&W, 0=
 F&P)
=E2=80=A3 src:dash (73 (84) bugs: 3 RC, 27 (30) I&N, 43 (51) M&W, 0 F&P=
)
=E2=80=A3 src:mksh (1 bug: 0 RC, 0 I&N, 1 M&W, 0 F&P)
http://qa.debian.org/data/bts/graphs/d/dash.png is pretty red, innit?
