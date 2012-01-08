From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Atari TT (next)
Date: Mon, 9 Jan 2012 08:21:42 +1300
Message-ID: <CAOmrzkJ6eCKCd0FRfYk7C5VvJeyhRT9Y7yy8m-mGPQeOaRScuQ@mail.gmail.com>
References: <4F079F6B.8080502@fairlite.co.uk>
	<4F07EA66.6020603@gmail.com>
	<4F08E748.4020305@fairlite.co.uk>
	<4F0917E9.9090600@gmail.com>
	<CAMuHMdX2BaAp2N0e4aYPz7roaMFD14V1Y076geQQjpPw6-g-5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:47699 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752212Ab2AHTVn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 14:21:43 -0500
Received: by dajs34 with SMTP id s34so1818681daj.19
        for <linux-m68k@vger.kernel.org>; Sun, 08 Jan 2012 11:21:42 -0800 (PST)
In-Reply-To: <CAMuHMdX2BaAp2N0e4aYPz7roaMFD14V1Y076geQQjpPw6-g-5Q@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alan Hourihane <alanh@fairlite.co.uk>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

>> ST-RAM (breaking the above assumption). Something similar is done for Amiga
>> chip RAM - exactly how does the chip RAM situation differ, Geert? Is chip
>> RAM being claimed by mem_init or is it being left aside?
>
> Chip RAM is different in that Linux (unlike AmigaOS) doesn't use it as
> system RAM.
> Being on the Zorro II bus (first 16 MiB), it's slow on most machines and doesn't
> support RMW cycles (needed for page tables) on Zorro III-capable machines.
> In general, we don't use Z2 RAM as system memory on Z3 capable machines.

But is its physical address lower than the kernel segment's, as in this case?

(thanks to Andreas for the discontigmem commit pointer ... )

> It's limited to 24-bit addresses.

Thanks, that's what I could not find on the spot.

Looks like we'll have to fix the bootstrap or our discontig memory
support. Is there a strict requirement (from the kernel's early
startup and mem_init POV) that the kernel has to reside in the first
bootinfo memory chunk?

Cheers,

  Michael
