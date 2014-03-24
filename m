From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: kswapd0 bug
Date: Mon, 24 Mar 2014 21:46:38 +0100
Message-ID: <874n2nz5n5.fsf@igel.home>
References: <Pine.BSM.4.64L.1403221138430.7386@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:37132 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753862AbaCXUqk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 24 Mar 2014 16:46:40 -0400
In-Reply-To: <Pine.BSM.4.64L.1403221138430.7386@herc.mirbsd.org> (Thorsten
	Glaser's message of "Sat, 22 Mar 2014 11:41:00 +0000 (UTC)")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: debian-68k@lists.debian.org, linux-m68k@vger.kernel.org

Thorsten Glaser <tg@mirbsd.de> writes:

> I just had the kswapd0 bug: it using 49.9% CPU, dpkg-deb the other 49=
=2E9%
> (I=E2=80=99m just finishing building eglibc 2.18 in the background si=
nce the
> buildds are currently limited).
>
> This =E2=80=9Cfixed=E2=80=9D it:
>
> # echo 1 >/proc/sys/vm/drop_caches
>
> The system was not swapping, but almost all free RAM was used up for
> the bugger cache, which I suspect triggered it.

I guess this suggests that there is something wrong with vm scanning?

Andreas.

--=20
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint =3D 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4=
ED5
"And now for something completely different."
