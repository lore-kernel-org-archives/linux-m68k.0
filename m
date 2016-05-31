From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Tue, 31 May 2016 12:41:04 +0200
Message-ID: <CAMuHMdWfs9jEnR=g=pACg31cbnab2sxRXtjN5nc4TFj-=umtqA@mail.gmail.com>
References: <21393.43065.207399.530921@gargle.gargle.HOWL>
	<mvm1tuv6dhk.fsf@hawking.suse.de>
	<21426.40682.197715.245775@gargle.gargle.HOWL>
	<CAOmrzkK7vXueZ4SYSr49DAZDZn5cVkm=6rYUn6GJq4cvXLSmew@mail.gmail.com>
	<21786.40688.53001.509365@gargle.gargle.HOWL>
	<22217.61083.254294.356622@gargle.gargle.HOWL>
	<alpine.LNX.2.00.1605311429500.12286@nippy.intranet>
	<22349.25130.697316.272584@gargle.gargle.HOWL>
	<CAMuHMdVwZvPyqknDuu_v072xeKgA+i-sZVQB3Pzc0hUNMx-A6w@mail.gmail.com>
	<2782d89d-8baa-c4b1-b1cc-4a48008ef1fa@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35040 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751340AbcEaKlF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 31 May 2016 06:41:05 -0400
Received: by mail-io0-f193.google.com with SMTP id k19so5994780ioi.2
        for <linux-m68k@vger.kernel.org>; Tue, 31 May 2016 03:41:05 -0700 (PDT)
In-Reply-To: <2782d89d-8baa-c4b1-b1cc-4a48008ef1fa@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Mikael Pettersson <mikpelinux@gmail.com>, Finn Thain <fthain@telegraphics.com.au>, Michael Schmitz <schmitzmic@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Adrian,

On Tue, May 31, 2016 at 12:39 PM, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 05/31/2016 12:21 PM, Geert Uytterhoeven wrote:
>> That's upstream commit c33bd8354f3a3bb26a98d2b6bf600b7b35657328?
>>
>> Well done! Looks indeed like a suspect for the behavior you're seeing.
>> I suppose you will follow up with the mm people?
>
> Yay, great news. I'm currently building a native GHC package for Debian/m68k
> on Aranym and [kswapd] is taking around half of the CPU load. The suggestion
> with drop_caches doesn't help all the time, unfortunately, so I'm really
> looking forward getting this fixed :).

I expect the bad commit can just be reverted, as the surrounding code hasn't
changed?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
