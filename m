From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Zero Divide in Kernel 3.12-rc4
Date: Sun, 20 Oct 2013 15:08:59 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1310201508100.19879@herc.mirbsd.org>
References: <dbbdc369c25c9eea7abc4ca331128de3@muaddib.hro.localnet>
 <CAMuHMdUkgQFBg8GJf6xsCVJ0_ciVs+HvtySh8YnvAeVHp8jS4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from eurynome.mirbsd.org ([81.169.181.30]:40379 "EHLO
	eurynome.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751061Ab3JTPTN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 20 Oct 2013 11:19:13 -0400
Received: from herc.mirbsd.org (root@herc.mirbsd.org [IPv6:2a01:198:25d:0:202:b3ff:feb7:54e8])
	by eurynome.mirbsd.org (8.14.5.Beta0/8.14.3) with ESMTP id r9KFJ6DS003582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-m68k@vger.kernel.org>; Sun, 20 Oct 2013 15:19:11 GMT
In-Reply-To: <CAMuHMdUkgQFBg8GJf6xsCVJ0_ciVs+HvtySh8YnvAeVHp8jS4Q@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: debian-68k@lists.debian.org
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven dixit:

>BIG FAT WARNING for Thorsten: 3.10.7 does _not_ have this fix!

Debian 3.10.7-1 does have it (as Debian-specific patch).
Otherwise my buildd couldn=E2=80=99t run that kernel as it uses btrfs.

bye,
//mirabilos
--=20
<diogenese> Beware of ritual lest you forget the meaning behind it.
<igli> yeah but it means if you really care about something, don't
    ritualise it, or you will lose it. don't fetishise it, don't
    obsess. or you'll forget why you love it in the first place.
