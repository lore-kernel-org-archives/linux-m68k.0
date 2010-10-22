From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k atari: reserve some ST-RAM early on for device buffer use (was: Re: Aranym, more than 244MB FastRAM, garbled display)
Date: Fri, 22 Oct 2010 11:05:13 +0200
Message-ID: <m3hbged2d2.fsf@hase.home>
References: <alpine.LNX.2.00.1010011728270.4788@halbrend.uninett.no>
	<m2tyl5u9hu.fsf@igel.home>
	<alpine.LNX.2.00.1010011908550.4788@halbrend.uninett.no>
	<Pine.BSM.4.64L.1010041947160.3776@herc.mirbsd.org>
	<AANLkTinq7CXPpYVfAYhgH9ea1FQs_f+AhYsU1-+ZdUx+@mail.gmail.com>
	<Pine.BSM.4.64L.1010060910520.21623@herc.mirbsd.org>
	<AANLkTi=ZrDoFPxFNZ3OKurvcrBuN3fS0gTvAeYpLQqCi@mail.gmail.com>
	<AANLkTin+_c=Luvns2MYkVhBksB8vD3reDh8W6a8Bje2o@mail.gmail.com>
	<AANLkTikumgbPW12gcsUML-JqyCUUaws2=r1gY7NT4fgJ@mail.gmail.com>
	<4CC14067.8090903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:40339 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752965Ab0JVJFR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 22 Oct 2010 05:05:17 -0400
In-Reply-To: <4CC14067.8090903@gmail.com> (Michael Schmitz's message of "Fri,
	22 Oct 2010 20:42:31 +1300")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

Michael Schmitz <schmitzmic@googlemail.com> writes:

> +static int __init atari_stram_setup(char *arg)
> +{
> +        int rc=0;
> +
> +        if (!MACH_IS_ATARI)
> +                return 0;
> +
> +        if (!(rc = sscanf(arg, "%d", &pool_size))) {

           pool_size = memparse(arg, NULL);

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
