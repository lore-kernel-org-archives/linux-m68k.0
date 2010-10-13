From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Atari console corruption
Date: Wed, 13 Oct 2010 23:00:36 +0200
Message-ID: <m2fww9dczv.fsf@igel.home>
References: <AANLkTimZ4q3mGhy27qVo5gQHMCM2U8jrc_fNPH4YUXev@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:52976 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751763Ab0JMVAj (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 13 Oct 2010 17:00:39 -0400
In-Reply-To: <AANLkTimZ4q3mGhy27qVo5gQHMCM2U8jrc_fNPH4YUXev@mail.gmail.com>
	(Geert Uytterhoeven's message of "Wed, 13 Oct 2010 21:10:29 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> If your shell command line looks like:
>
> sh-3.1# abcd
>
> Then insert another 'b' in front of the existing 'b'. The 'c' will
> become corrupted.

Minimal testcase:

$ printf 'abcd\10\10\33[@\n'

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
