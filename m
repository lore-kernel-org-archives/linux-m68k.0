From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: converting the NCR5380 drivers away from scsi_register
Date: Tue, 17 Jun 2014 10:38:18 +0200
Message-ID: <CAMuHMdUkMHoMahyppwttnm7qs6etoqMGtvk77HezUBj-GOeMKg@mail.gmail.com>
References: <20140616141853.GA32399@infradead.org>
	<alpine.LNX.2.00.1406171756040.17715@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:44322 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754609AbaFQIiU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 17 Jun 2014 04:38:20 -0400
Received: by mail-lb0-f177.google.com with SMTP id u10so1083409lbd.36
        for <linux-m68k@vger.kernel.org>; Tue, 17 Jun 2014 01:38:18 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1406171756040.17715@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Christoph Hellwig <hch@infradead.org>, Sam Creasey <sammy@sammy.net>, Michael Schmitz <schmitz@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,

On Tue, Jun 17, 2014 at 10:20 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
>> now that you've officially taken over NCR5380 is there a chance to look
>> into converting the drivers away from scsi_register to the modern
>> scsi_host_alloc/scsi_add_host method?
>
> Have any other conversions taken place? I'm curious to see what was
> involved. Hopefully not a re-write, like esp_scsi (?)

I did a few of them in 2009:

commit c2a24a4ca1137473971842461612e56a654e7edb
("m68k: amiga - A3000 SCSI platform device conversion")
commit c1d288a58936cd0654844d807e53a203f4838fb4
("m68k: amiga - GVP Series II SCSI zorro_driver conversion")
commit c737e22cde37e4e2ad126316e4aab7349a491ab3
("m68k: amiga - A2091/A590 SCSI zorro_driver conversion")

All of them without access to the hardware. So far I haven't heard any
complaints ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
