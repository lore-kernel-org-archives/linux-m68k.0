From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: build warnings
Date: Thu, 17 Feb 2011 18:18:13 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1102171817230.3948@herc.mirbsd.org>
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
 <4D5CCCA5.1000106@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:42208 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757449Ab1BQSVa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Feb 2011 13:21:30 -0500
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
	by herc.mirbsd.org (8.14.5.Beta0/8.14.5.Beta0) with ESMTP id p1HIIGJS012931
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Thu, 17 Feb 2011 18:18:19 GMT
In-Reply-To: <4D5CCCA5.1000106@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
Cc: linux-m68k@vger.kernel.org

Michael Schmitz dixit:

> Diff in question - can anyone guess at what the problem may be?:

Is it reversed? Looks like that to me, from the commit msg.
Not a clue about the problem, though (but I didn=E2=80=99t read the
surrounding code either, just had a quick look at the diff
while waiting for the coffee machine).

bye,
//mirabilos
--=20
13:47=E2=8E=9C<tobiasu> if i were omnipotent, i would divide by zero
                all day long ;)
(thinking about http://lobacevski.tumblr.com/post/3260866481 by waga)
