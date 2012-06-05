From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] [m68k] Atari: support for NetUSBee register access to
 isp116x.h
Date: Tue, 5 Jun 2012 16:51:38 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1206051650590.9588@herc.mirbsd.org>
References: <CAOmrzkL4BNWr6aLijfpg91m8VKU4A0DRsx1mjOa22qWPrysqtQ@mail.gmail.com>
 <CAMuHMdWpW5aPKasazs2yJX8BZv2F_KXreSAY3+_kXGUqGZVJEw@mail.gmail.com>
 <CAOmrzk+2bYgDNtcW6DVy4WYT2i+07n8xR4bbNbwFJ@mail.gmail.com>
 <loom.20120605T174709-209@post.gmane.org> <m2wr3l4su3.fsf@igel.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:47970 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754428Ab2FEQxk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Jun 2012 12:53:40 -0400
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
	by herc.mirbsd.org (8.14.5/8.14.5) with ESMTP id q55Gpe0Q013957
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Tue, 5 Jun 2012 16:51:43 GMT
In-Reply-To: <m2wr3l4su3.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
Cc: linux-m68k@vger.kernel.org

Andreas Schwab dixit:

>How about using formail and mailx instead?

mksh: formail: not found

Also, mailx would mangle headers; directly invoking the MSA works,
at least for me. (And none of these can fix the 8bit issue.)

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
