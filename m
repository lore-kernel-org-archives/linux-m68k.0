From: Alan Hourihane <alanh@fairlite.co.uk>
Subject: Re: Atari TT
Date: Thu, 05 Jan 2012 17:04:18 +0000
Message-ID: <4F05D812.6020109@fairlite.co.uk>
References: <4F0488A9.5030100@fairlite.co.uk> <Pine.BSM.4.64L.1201041911580.19192@herc.mirbsd.org> <alpine.LNX.2.00.1201052128060.6601@nippy.intranet> <4F059460.5040305@fairlite.co.uk> <CAMuHMdUxQq_29g7yeaS2Ktz193CcHNX5FaP8PR9ijU0htnKbZg@mail.gmail.com> <4F059AE1.6070707@fairlite.co.uk> <4F059DB9.1050209@fairlite.co.uk> <CAMuHMdUK=2tkFtxQjua6LLGDJuEkrbK0W+mMVQ6PLBB9MfqPSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from fairlite.demon.co.uk ([80.176.228.186]:48819 "EHLO
	fairlite.demon.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754871Ab2AEREV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 5 Jan 2012 12:04:21 -0500
In-Reply-To: <CAMuHMdUK=2tkFtxQjua6LLGDJuEkrbK0W+mMVQ6PLBB9MfqPSw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@telegraphics.com.au>, Thorsten Glaser <tg@mirbsd.de>, debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>

On 05/01/12 14:42, Geert Uytterhoeven wrote:
> On Thu, Jan 5, 2012 at 13:55, Alan Hourihane <alanh@fairlite.co.uk> wrote:
>> Linux version 3.1.0-atari-00246-gbff0dc7 (root@server) (gcc version
> bff0dc7 = m68k-v3.1. That kernel still has the SCC driver, but it depends on
> BROKEN, so you cannot select it.
> If you revert 173808aa9203cf752518acd80fde3c9c910ddd0f ("m68k/atari: SCC
> - Mark Atari serial driver BROKEN") you can select CONFIG_ATARI_SCC again,
> and get a real serial console.
>
> But first the interrupt storm must be fixed.
>
>> unexpected interrupt from 112
> That's the vector number, so the actual IRQ number is 112 / 4 = 28, which is
> IRQ_TT_MFP_TIMD. Sorry, no clues.

It's worth enhancing that message then as the NR_IRQs reported was 72.
And it really confused me that 112 appeared.

Maybe...

"unexpected interrupt from 28, vector 112" ?

> Can you please try a pristine v3.1? The only relevant differences are the
> conversion to the genirq framework and the Atari SCC driver.

Will do.

> If that works, I guess it's a regression introduced by the genirq conversion.
> Then you can bisect between v3.1 and m68k-v3.1.
>
> BTW, in between 9fa434585e5f6cfeae685505b4cd8465dbab1dff ("m68k/irq:
> Add genirq support") and 971ae31663e817a5e5b673d30c7652d9160145f0
> ("m68k/irq: Remove obsolete m68k irq framework"), genirq support is a config
> option that can be turned on or off.
>

O.k. thanks.

Alan.
