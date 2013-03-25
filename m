From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream
 and debian-kernel
Date: Mon, 25 Mar 2013 17:53:01 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1303251751380.27649@herc.mirbsd.org>
References: <1364193464-3890-1-git-send-email-schmitz@debian.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:48446 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932333Ab3CYSL7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 25 Mar 2013 14:11:59 -0400
In-Reply-To: <1364193464-3890-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: geert@linux-m68k.org, linux-m68k@vger.kernel.org

Michael Schmitz dixit:

>This patch series should be suitable for inclusion in the debian/68k k=
ernel
>packages (if policy allows).

Sadly, policy allows only stuff that=E2=80=99s in Linus=E2=80=99 tree.

But once it went upstream, we can just build a bleeding
edge kernel from Debian/experimental with no amount of
manual fiddling required.

It just won=E2=80=99t go into the stable kernel. But it=E2=80=99s no
regression, as the old driver was never in it either=E2=80=A6

bye,
//mirabilos
--=20
[DJBDNS Zone] TTL 86400 =E2=80=93 <Natureshadow> kann man da auch 1d sc=
hreiben?
<mirabilos> n=C3=B6, au=C3=9Ferdem kann ein Deutscher oder ein Japaner =
mit 1d
    ja erstmal nix anfangen, oder k=C3=B6nntest du 1=E6=97=A5 im zone f=
ile lesen?
<Natureshadow> das hei=C3=9Ft f=C3=BCr mich: ein Regal, das u.U. schief=
stehen k=C3=B6nnte
