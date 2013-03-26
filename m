From: Wouter Verhelst <w@uter.be>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream
 and debian-kernel
Date: Tue, 26 Mar 2013 09:12:57 +0100
Message-ID: <51515889.6040106@uter.be>
References: <1364193464-3890-1-git-send-email-schmitz@debian.org> <Pine.BSM.4.64L.1303251751380.27649@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from barbershop.grep.be ([89.106.240.122]:44872 "EHLO
	barbershop.grep.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759487Ab3CZI41 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 26 Mar 2013 04:56:27 -0400
In-Reply-To: <Pine.BSM.4.64L.1303251751380.27649@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Michael Schmitz <schmitzmic@gmail.com>, geert@linux-m68k.org, linux-m68k@vger.kernel.org

On 25-03-13 18:53, Thorsten Glaser wrote:
> Michael Schmitz dixit:
>=20
>> This patch series should be suitable for inclusion in the debian/68k=
 kernel
>> packages (if policy allows).
>=20
> Sadly, policy allows only stuff that=E2=80=99s in Linus=E2=80=99 tree=
=2E

Nothing says we can't put a kernel with those patches into unreleased
(or what was it called again?) for the time being...

> But once it went upstream, we can just build a bleeding
> edge kernel from Debian/experimental with no amount of
> manual fiddling required.

That also works, I suppose.

> It just won=E2=80=99t go into the stable kernel. But it=E2=80=99s no
> regression, as the old driver was never in it either=E2=80=A6

Indeed.

--=20
Copyshops should do vouchers. So that next time some bureaucracy
requires you to mail a form in triplicate, you can mail it just once,
add a voucher, and save on postage.
