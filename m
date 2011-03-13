From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: build warnings
Date: Sun, 13 Mar 2011 10:37:25 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1103131036510.11986@herc.mirbsd.org>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
 <alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>
 <AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com>
 <AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com>
 <Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org>
 <AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com>
 <Pine.BSM.4.64L.1101162226120.11797@herc.mirbsd.org>
 <AANLkTi=QH7=6ddP=KoTywDpYrwnB21XGnmwhmFkZganD@mail.gmail.com>
 <4D44F92C.2050707@gmail.com> <AANLkTimB1fpvMsSeTbRn5ZTU1NCpZpjrAXQ+xRShAsZN@mail.gmail.com>
 <4D461512.8080609@gmail.com> <alpine.LNX.2.00.1101311424100.6256@nippy.intranet>
 <Pine.BSM.4.64L.1102052339100.22476@herc.mirbsd.org> <4D575F50.1020601@gmail.com>
 <4D5CCCA5.1000106@gmail.com> <Pine.BSM.4.64L.1102171817230.3948@herc.mirbsd.org>
 <AANLkTi=RUod3zBnOpCX5pvg5CTVU2t5xAKh8qNo+Z14i@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:12290 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752738Ab1CMKkq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 13 Mar 2011 06:40:46 -0400
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
	by herc.mirbsd.org (8.14.5.Beta0/8.14.5.Beta0) with ESMTP id p2DAbThc004244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Sun, 13 Mar 2011 10:37:33 GMT
In-Reply-To: <AANLkTi=RUod3zBnOpCX5pvg5CTVU2t5xAKh8qNo+Z14i@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
Cc: linux-m68k@vger.kernel.org

Michael Schmitz dixit:

>the reversal seems to result from the way I ended the bisect. Applying

Ah okay.

>the posted patch to the Debian 2.6.27 source you had used initially
>does indeed seem to fix the problem.  I still need to test that after

Good, then I can use that (for now).

Many thanks!
//mirabilos
--=20
=E2=80=9CIt is inappropriate to require that a time represented as
 seconds since the Epoch precisely represent the number of
 seconds between the referenced time and the Epoch.=E2=80=9D
	-- IEEE Std 1003.1b-1993 (POSIX) Section B.2.2.2
