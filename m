From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH 32/35] m68k: add ColdFire FPU support for the V4e ColdFire CPU's
Date: Wed, 28 Dec 2011 13:47:54 +0100
Message-ID: <m21uroeubp.fsf@igel.home>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
	<1324610148-20666-33-git-send-email-gerg@snapgear.com>
	<CAMuHMdVBGR9p1f_dnk8abYwosvBm9n7j1foaGd+gMESKXm8+Vw@mail.gmail.com>
	<4EFAAEF3.6010709@snapgear.com>
	<CAMuHMdWaQstd2PUjuTspcp4vQTTMnQ78yQ8b_x-Yqwch+OfFug@mail.gmail.com>
	<4EFB0C43.20605@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:50511 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751356Ab1L1Mr7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 28 Dec 2011 07:47:59 -0500
In-Reply-To: <4EFB0C43.20605@snapgear.com> (Greg Ungerer's message of "Wed, 28
	Dec 2011 22:32:03 +1000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Greg Ungerer <gerg@snapgear.com> writes:

> But even still, compiling with -m68040 causes gcc to generate
> different code than compiling without it (so effectively with m68020).
> In cases I looked at the instructions used where still fine to run
> on either, so nothing specific to the 68040 was generated. But if
> anything ever was then again the ".chip 68k" would cause an error
> out. I guess there isn't much extra in the 68040... move16, anything
> else?  I guess gcc will never generate that in practice, so it is
> not a problem.

The only 040 specific insn that gcc would generate are the fpu insns,
but the kernel does not use any floating point.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
