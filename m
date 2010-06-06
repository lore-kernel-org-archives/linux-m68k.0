From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH 159/199] arch/m68k/hp300/hp300map.map: Checkpatch cleanup
Date: Sun, 06 Jun 2010 13:30:16 +0200
Message-ID: <m2y6esqtyv.fsf@igel.home>
References: <1274644930-26600-1-git-send-email-andrea.gelmini@gelma.net>
	<1274644930-26600-11-git-send-email-andrea.gelmini@gelma.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:60151 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755881Ab0FFLar (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 6 Jun 2010 07:30:47 -0400
In-Reply-To: <1274644930-26600-11-git-send-email-andrea.gelmini@gelma.net>
	(Andrea Gelmini's message of "Sun, 23 May 2010 22:01:55 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andrea Gelmini <andrea.gelmini@gelma.net>
Cc: Philip Blundell <philb@gnu.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org

Andrea Gelmini <andrea.gelmini@gelma.net> writes:

> diff --git a/arch/m68k/hp300/hp300map.map b/arch/m68k/hp300/hp300map.=
map
> index 6b45f0a..621c076 100644
> --- a/arch/m68k/hp300/hp300map.map
> +++ b/arch/m68k/hp300/hp300map.map
> @@ -182,71 +182,71 @@ string Prior =3D "\033[5~"
>  string Next =3D "\033[6~"
>  string Macro =3D "\033[M"
>  string Pause =3D "\033[P"
> -compose '`' 'A' to '=C0'
[...]
> +compose '`' 'A' to '=C3=80'

This is obviously wrong.  The composed character is supposed to be a
single latin-1 character (namely '\300').

A patch subject containing "checkpatch" should always ring the alarm
bells.

Andreas.

--=20
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint =3D 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4=
ED5
"And now for something completely different."
