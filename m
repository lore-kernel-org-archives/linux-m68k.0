From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Atari TT (next)
Date: Mon, 9 Jan 2012 12:51:23 +1300
Message-ID: <CAOmrzkLH18VCY0dzJPM14dn5ccWmSBkiPzq8EFqnCDHiM3bECQ@mail.gmail.com>
References: <4F079F6B.8080502@fairlite.co.uk>
	<4F07EA66.6020603@gmail.com>
	<4F08E748.4020305@fairlite.co.uk>
	<4F0917E9.9090600@gmail.com>
	<4F0964EC.2080505@fairlite.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:65333 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754854Ab2AHXvX (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 18:51:23 -0500
Received: by pbdu13 with SMTP id u13so1905765pbd.19
        for <linux-m68k@vger.kernel.org>; Sun, 08 Jan 2012 15:51:23 -0800 (PST)
In-Reply-To: <4F0964EC.2080505@fairlite.co.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alan Hourihane <alanh@fairlite.co.uk>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Alan,

>> Come to think of it - does the TT video chipset actually require
>> screen memory to reside in ST-RAM? If it's fully 32 bit addressed we
>> should not have any problems with TT-RAM. The problems you see might
>> be caused by a fault in the TT codepath in atafb - I'm unsure this has
>> been tested since the last atafb rewrite.
>
> Looking at atafb, we always allocate FB memory from STRAM unless it's an
> external video card, i.e. VME, ISA etc.

That's right - but in your case ST-RAM is not being mapped at all so
it can't be used. You will get a chunk of TT-RAM assigned to atafb
(fallback in case there's no more ST-RAM), the framebuffer code will
happily draw there but the shifter cannot access it.

>> Can you try to have the kernel placed in ST-RAM?
>
> No, the kernel is too big. I've only got 4MB ST-RAM. And getting more on
> the TT is pretty rare as the only other option is 10MB using the onboard
> 2MB and an 8MB upgrade board.

You may have to pare the kernel down to the bare minimum (i.e.
modularize about everything you don't need to boot to initrd). Not
sure where the limit for this is these days.

>> You're right, this should be possible to test with ARAnyM - the
>> behavior is not new though. Loading the kernel in TT-RAM has been
>> problematic on the Falcon for a long time now.
>
> Sure, but by default Falcon's have only 4MB ST-RAM too, and yes lots of
> people have 14MB of ST-RAM now, but it's not uncommon to have 4MB ST-RAM.

I think my Falcon is the only machine kernels have been tested on in
the last few years - I've got 14MB ST-RAM so I was never affected. I
had played with getting the kernel run in TT-RAM briefly but MM is not
my strong suit so I never got anywhere.

> I'll dig in.

Much appreciated.

  Michael
