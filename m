From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] [m68k] Atari: support for NetUSBee register access to
 isp116x.h
Date: Tue, 5 Jun 2012 17:57:08 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1206051756340.9588@herc.mirbsd.org>
References: <CAOmrzkL4BNWr6aLijfpg91m8VKU4A0DRsx1mjOa22qWPrysqtQ@mail.gmail.com>
 <CAMuHMdWpW5aPKasazs2yJX8BZv2F_KXreSAY3+_kXGUqGZVJEw@mail.gmail.com>
 <CAOmrzk+2bYgDNtcW6DVy4WYT2i+07n8xR4bbNbwFJ@mail.gmail.com>
 <loom.20120605T174709-209@post.gmane.org>
 <CAMuHMdWC8agVJoPt5uoxkK-Z6hpEwhoVq6hyniqP6XSXSuzwQg@mail.gmail.com>
 <Pine.BSM.4.64L.1206051623360.9588@herc.mirbsd.org> <m2sje94pdf.fsf@igel.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:34234 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752837Ab2FESGM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Jun 2012 14:06:12 -0400
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
	by herc.mirbsd.org (8.14.5/8.14.5) with ESMTP id q55Hv9f4010522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Tue, 5 Jun 2012 17:57:13 GMT
In-Reply-To: <m2sje94pdf.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
Cc: linux-m68k@vger.kernel.org

Andreas Schwab dixit:

>That is not true.  8BITMIME will handle that correctly.

8BITMIME is not ubiquitous. Worse, most current MTAs do *not* handle
conversion of an 8bit mail to QP/Base64 correctly and violate the RFC.

bye,
//mirabilos
--=20
13:37=E2=8E=9C=C2=ABNatureshadow=C2=BB Deep inside, I hate mirabilos. I=
 mean, he's a good
guy. But he's always right! In every fsckin' situation, he's right. Eve=
n
with his deeply perverted taste in software and borked ambition towards
broken OSes - in the end, he's damn right about it :(! [=E2=80=A6] work=
s in mksh
