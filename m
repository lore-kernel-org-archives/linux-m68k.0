From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Atari TT
Date: Thu, 05 Jan 2012 16:49:47 +0100
Message-ID: <m2vcoqgndw.fsf@igel.home>
References: <4F0488A9.5030100@fairlite.co.uk>
	<Pine.BSM.4.64L.1201041911580.19192@herc.mirbsd.org>
	<alpine.LNX.2.00.1201052128060.6601@nippy.intranet>
	<4F059460.5040305@fairlite.co.uk>
	<CAMuHMdUxQq_29g7yeaS2Ktz193CcHNX5FaP8PR9ijU0htnKbZg@mail.gmail.com>
	<4F059AE1.6070707@fairlite.co.uk> <4F059DB9.1050209@fairlite.co.uk>
	<CAMuHMdUK=2tkFtxQjua6LLGDJuEkrbK0W+mMVQ6PLBB9MfqPSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.1]:36083 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932591Ab2AEQBb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 5 Jan 2012 11:01:31 -0500
In-Reply-To: <CAMuHMdUK=2tkFtxQjua6LLGDJuEkrbK0W+mMVQ6PLBB9MfqPSw@mail.gmail.com>
	(Geert Uytterhoeven's message of "Thu, 5 Jan 2012 15:42:35 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alan Hourihane <alanh@fairlite.co.uk>, Finn Thain <fthain@telegraphics.com.au>, Thorsten Glaser <tg@mirbsd.de>, debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> On Thu, Jan 5, 2012 at 13:55, Alan Hourihane <alanh@fairlite.co.uk> wrote:
>> Linux version 3.1.0-atari-00246-gbff0dc7 (root@server) (gcc version
>
> bff0dc7 = m68k-v3.1. That kernel still has the SCC driver, but it depends on
> BROKEN, so you cannot select it.
> If you revert 173808aa9203cf752518acd80fde3c9c910ddd0f ("m68k/atari: SCC
> - Mark Atari serial driver BROKEN") you can select CONFIG_ATARI_SCC again,
> and get a real serial console.
>
> But first the interrupt storm must be fixed.
>
>> unexpected interrupt from 112
>
> That's the vector number, so the actual IRQ number is 112 / 4 = 28, which is
> IRQ_TT_MFP_TIMD. Sorry, no clues.

This irq is used for the timer that generates the clock for the MFP
serial port.  It should really stay disabled.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
