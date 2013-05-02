From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/13] Atari EtherNAT/EtherNEC/NetUSBee support
Date: Thu, 2 May 2013 22:12:45 +0200
Message-ID: <CAMuHMdXQYSaUSTtsWR4dSWt9jqSmkdLKtDm139wOb=EXLk88Rg@mail.gmail.com>
References: <516E52F4.1020008@gmail.com>
	<CAMuHMdU8svz=FsCDDdn6PXwAOzUdfLSg8DbsD97sTOsS4Qoj8Q@mail.gmail.com>
	<20130428222621.GA5821@mail.biophys.uni-duesseldorf.de>
	<CAMuHMdU-Za_VqW4x9fJwDD4-VD=+DLaSNQNY6YrHibQq+GyC_A@mail.gmail.com>
	<20130429082049.GA10441@mail.biophys.uni-duesseldorf.de>
	<CAMuHMdVCfM8c=Aj-cgHMDLavFvbxcHAyHrh930S4ncV-6uDW_g@mail.gmail.com>
	<20130429213755.GA18688@mail.biophys.uni-duesseldorf.de>
	<CAMuHMdVJWU5uJB9iNRvOmXDV1C5C1dnCiEDPx4yG5n1C4hqtzQ@mail.gmail.com>
	<20130430075016.GA23189@mail.biophys.uni-duesseldorf.de>
	<CAMuHMdUkNUzF_Cr5xS+i7hFbW-wuxZYTa8Gh3wH2pyXVxDTouQ@mail.gmail.com>
	<20130430221052.GA1618@mail.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ia0-f174.google.com ([209.85.210.174]:63667 "EHLO
	mail-ia0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759629Ab3EBUMq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 2 May 2013 16:12:46 -0400
Received: by mail-ia0-f174.google.com with SMTP id e36so781998iag.5
        for <linux-m68k@vger.kernel.org>; Thu, 02 May 2013 13:12:45 -0700 (PDT)
In-Reply-To: <20130430221052.GA1618@mail.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, May 1, 2013 at 12:10 AM, Michael Schmitz
<schmitz@mail.biophys.uni-duesseldorf.de> wrote:
> Another question: Is there a way to find out which physical address maps to
> a given ioremapped one?
>
> If I let the USB driver print the physical address, the ioremapped address,
> and the result of __pa() on the ioremapped one, I get:
>
> ISP116X probe: data 80000012 virt. 21098012 pa 21098012 , addr 80000016
> virt. 21096016 pa 21096016
>
> for the EtherNAT instance, and
>
> ISP116X probe: data 00000340 virt. 2109e340 pa 2109e340 , addr 00000360
> virt. 2109c360 pa 2109c360
>
> for the NetUSBee instance. In both cases ioremapped and __pa() are equal.
>
> I had hoped to get the physical address back from __pa() in the first
> instance, and check for _pa(reg) > 0x8000000 to differentiate between the
> two instances. Not so simple, apparently.

__pa() (and virt_to_phys()) only work for system RAM, where the mapping is
just the addition of an offset.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
