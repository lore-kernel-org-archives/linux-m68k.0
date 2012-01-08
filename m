From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Atari TT (next)
Date: Sun, 08 Jan 2012 23:05:35 +0100
Message-ID: <m2ipklluj4.fsf@igel.home>
References: <4F079F6B.8080502@fairlite.co.uk> <4F07EA66.6020603@gmail.com>
	<4F08E748.4020305@fairlite.co.uk> <4F0917E9.9090600@gmail.com>
	<CAMuHMdX2BaAp2N0e4aYPz7roaMFD14V1Y076geQQjpPw6-g-5Q@mail.gmail.com>
	<CAOmrzkJ6eCKCd0FRfYk7C5VvJeyhRT9Y7yy8m-mGPQeOaRScuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:38384 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754663Ab2AHWFj (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 17:05:39 -0500
In-Reply-To: <CAOmrzkJ6eCKCd0FRfYk7C5VvJeyhRT9Y7yy8m-mGPQeOaRScuQ@mail.gmail.com>
	(Michael Schmitz's message of "Mon, 9 Jan 2012 08:21:42 +1300")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Alan Hourihane <alanh@fairlite.co.uk>, Linux/m68k <linux-m68k@vger.kernel.org>

Michael Schmitz <schmitzmic@googlemail.com> writes:

> Looks like we'll have to fix the bootstrap or our discontig memory
> support. Is there a strict requirement (from the kernel's early
> startup and mem_init POV) that the kernel has to reside in the first
> bootinfo memory chunk?

It is a requirement that the kernel is mapped at virtual address zero
since it is not relocatable.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
