From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 15/17] [m68k] Atari: add platform device definitions for
 ISP1160 USB HCD
Date: Tue, 12 Feb 2013 09:32:59 +0100
Message-ID: <CAMuHMdWCX56bpawFO0dPHEEmdxPoDzSAeFj2M1ggM=A=nATASQ@mail.gmail.com>
References: <20130131003135.8B985360095@xplor.waratah.dyndns.org>
	<CAMuHMdU6qfE6AUGKFEGvnxGZHbpDZ7Yg2KO85rApEnPXxEo7zA@mail.gmail.com>
	<20130210224555.GC4977@mail.biophys.uni-duesseldorf.de>
	<CAMuHMdXGLEqchFEkYRCMNSzqDaMo9aRt_hjm-2Mz=vqnAMmUew@mail.gmail.com>
	<20130212012008.GA17333@mail.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ia0-f175.google.com ([209.85.210.175]:54545 "EHLO
	mail-ia0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758308Ab3BLIdA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 12 Feb 2013 03:33:00 -0500
Received: by mail-ia0-f175.google.com with SMTP id r4so7176340iaj.20
        for <linux-m68k@vger.kernel.org>; Tue, 12 Feb 2013 00:32:59 -0800 (PST)
In-Reply-To: <20130212012008.GA17333@mail.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

On Tue, Feb 12, 2013 at 2:20 AM, Michael Schmitz
<schmitz@mail.biophys.uni-duesseldorf.de> wrote:
>> > I'll have to check that CONFIG_ATARI_ETHERNEC is selected when either ne.c
>> > or isp116x driver are selected. It might otherwise be possible to select the
>> > USB driver only, and not the ethernet one, resulting in a nonfunctional
>> > driver.
>>
>> ATARI_USB should depend on ...?
>
> Either ATARI_ETHERNAT or ATARI_ETHERNEC, in practice. Not sure I'm building
> a kconfig dependency loop - can I rely on things set in Kconfig.devices when
> defining ATARI_USB in Kconfig.bus?

Sure.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
