From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Linux/m68k on Atari
Date: Thu, 16 Apr 2009 11:19:09 +0200
Message-ID: <10f740e80904160219j7f4a71e5rceb634e3fb9cc4a3@mail.gmail.com>
References: <20090327163917.e2b1d865.mandin.patrice@orange.fr>
	 <alpine.DEB.1.00.0904051035290.30160@zirkon.biophys.uni-duesseldorf.de>
	 <20090409214055.f250de3c.mandin.patrice@orange.fr>
	 <1239307252.11875.4.camel@joy>
	 <20090410185538.04034623.mandin.patrice@orange.fr>
	 <alpine.DEB.1.00.0904120652210.2715@zirkon.biophys.uni-duesseldorf.de>
	 <20090412094419.ab2ba909.mandin.patrice@orange.fr>
	 <alpine.DEB.1.00.0904140429240.18464@zirkon.biophys.uni-duesseldorf.de>
	 <20090414084002.2d6f20ef.mandin.patrice@orange.fr>
	 <alpine.DEB.1.00.0904140911470.29340@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f165.google.com ([209.85.219.165]:49657 "EHLO
	mail-ew0-f165.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752600AbZDPJTL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 16 Apr 2009 05:19:11 -0400
Received: by ewy9 with SMTP id 9so303063ewy.37
        for <linux-m68k@vger.kernel.org>; Thu, 16 Apr 2009 02:19:09 -0700 (PDT)
In-Reply-To: <alpine.DEB.1.00.0904140911470.29340@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Patrice Mandin <mandin.patrice@orange.fr>, debian-68k@lists.debian.org, linux-m68k@vger.kernel.org

On Tue, Apr 14, 2009 at 09:22, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>> > Anyway: do you have a section like this in your log?
>> >
>> > Ignoring memory chunk at 0x0:0xe00000 before the first chunk
>> > Fix your bootloader or use a memfile to make use of this area!
>>
>> Yes, I have this message in my log. Full log attached (seems minicom
>> cut it at 80 cols).
>
> Must be a minicom setting problem - mine doesn't (at least not what's copied to
> the log after ^A L).
>
> Geert, Roman: does paging_init rely on part of the first memory chunk being
> mapped in head.S, or just part of the chunk the kernel resides in? Could I
> reorder the m68k_memory[] elements in setup.c to fix the ordering problems?

Should work. config_amiga() removes Zorro II memory chunks, and that's
just before
paging_init() is called. of course you cannot reorder the first chunk,
as that one is
already in use.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
