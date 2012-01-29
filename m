From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 0/2 v3] mkstemp() and m68k support
Date: Sun, 29 Jan 2012 16:11:06 +1300
Message-ID: <4F24B8CA.1070300@gmail.com>
References: <Pine.BSM.4.64L.1201290042440.31292@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:45918 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752208Ab2A2DLK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 28 Jan 2012 22:11:10 -0500
Received: by pbaa10 with SMTP id a10so2779515pba.19
        for <linux-m68k@vger.kernel.org>; Sat, 28 Jan 2012 19:11:10 -0800 (PST)
In-Reply-To: <Pine.BSM.4.64L.1201290042440.31292@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: klibc@zytor.com, linux-m68k@vger.kernel.org

Thorsten,
> after a year, I decided to hack on klibc again. I=E2=80=99ve reworked
> both the patch to add mkstemp(), discussing to use AT_RANDOM
> as cheap entropy source on IRC (if there will ever be another
> entropy consumer, I can quickly write a minimal arc4random()
> seeded from it, as it has only 16 octets), capable of making
> a working mksh (static and shared) on amd64/xen, and the m68k
> support code, leading to (also, static and shared) mksh on it
> iff compiled with -g (let=E2=80=99s say, GCC is the culprit).
>
> The two patches _should_ follow (still not 100% sure how to
> feed them to sendmail and ensure they end up with the right
You appear to have failed. Care to post it to your p.d.o page?

(I've never tried talking to sendmail directly except for low level=20
testing - you'll have to manually prepare a valid mail message with the=
=20
attachments embedded for that to work I guess. That's what mutt and=20
friends are for)
> recipients) and are independent from each other (but for an
> mksh on m68k, you obviously need both).
>
> Cc the Linux/m68k arch list for the m68k patch, to review.
>
> (When this works I=E2=80=99m probably going to build mksh-static on
> dietlibc-less Debian architectures against klibc, pending
> testing on those platforms of course; the eglibc one is huge.)
Good luck with that.

Cheers,

   Michael
