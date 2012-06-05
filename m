From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] [m68k] Atari: support for NetUSBee register access to
 isp116x.h
Date: Tue, 5 Jun 2012 19:59:42 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1206051956320.9588@herc.mirbsd.org>
References: <CAOmrzkL4BNWr6aLijfpg91m8VKU4A0DRsx1mjOa22qWPrysqtQ@mail.gmail.com>
 <CAMuHMdWpW5aPKasazs2yJX8BZv2F_KXreSAY3+_kXGUqGZVJEw@mail.gmail.com>
 <CAOmrzk+2bYgDNtcW6DVy4WYT2i+07n8xR4bbNbwFJ@mail.gmail.com>
 <loom.20120605T174709-209@post.gmane.org>
 <CAMuHMdWC8agVJoPt5uoxkK-Z6hpEwhoVq6hyniqP6XSXSuzwQg@mail.gmail.com>
 <Pine.BSM.4.64L.1206051623360.9588@herc.mirbsd.org> <m2sje94pdf.fsf@igel.home>
 <Pine.BSM.4.64L.1206051756340.9588@herc.mirbsd.org>
 <CAMuHMdUoQ+iRCpi0MNV2tdsfjW5M3i4RHECgu6Phtn9t1FAGeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:47756 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752497Ab2FEUFn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Jun 2012 16:05:43 -0400
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
	by herc.mirbsd.org (8.14.5/8.14.5) with ESMTP id q55JxhOB012415
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Tue, 5 Jun 2012 19:59:47 GMT
In-Reply-To: <CAMuHMdUoQ+iRCpi0MNV2tdsfjW5M3i4RHECgu6Phtn9t1FAGeQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
Cc: linux-m68k@vger.kernel.org

Geert Uytterhoeven dixit:

>I used "git format-patch" to create a patch, which contains a.o. the f=
ollowing
>headers:
>
>| Content-Type: text/plain; charset=3DUTF-8
>| Content-Transfer-Encoding: 8bit

Yes, but that will not pass through all SMTP servers, since 8bit is
an optional extension which, for example, exim4 does not support=C2=B9 =
by
default, and other servers=C2=B2 can be configured to be strict, too (o=
r
simply not show=C2=B3 8BITMIME support).

[=E2=80=A6]
>No Base64 or QP involved.

Yes, but you cannot _depend_ on that.

=E2=91=A0 exim4 can be configured to either display 8BITMIME in the EHL=
O
  response or not, but that doesn=E2=80=99t change its handling =E2=80=93=
 it=E2=80=99s
  simply oblivios of whether the message contains 8bit or not,
  just passes them on in either case (violating the SMTP RFC)

=E2=91=A1 for curiosity reasons, I run such servers

=E2=91=A2 e.g. those that don=E2=80=99t do EHLO at all; I *bet* there a=
re still
  commercial SMTP implementations like that around

bye,
//mirabilos
--=20
=E2=80=9CIt is inappropriate to require that a time represented as
 seconds since the Epoch precisely represent the number of
 seconds between the referenced time and the Epoch.=E2=80=9D
	-- IEEE Std 1003.1b-1993 (POSIX) Section B.2.2.2
