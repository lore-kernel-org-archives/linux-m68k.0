From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream and debian-kernel
Date: Sat, 30 Mar 2013 11:23:43 +0100
Message-ID: <CAMuHMdXVSXJww4piAF6a8pbWLDUywTzkf8eTxkBS7D+0RFxmFg@mail.gmail.com>
References: <5152996E.50800@gmail.com>
	<20130328211747.GA10917@chumley.earth.sol>
	<5154C5E0.3040608@gmail.com>
	<20130328231039.GA14587@chumley.earth.sol>
	<CAMuHMdWxCW0Gp8jYYk7R3WDJ8u-LJBZJ5d9jjaPAf27vXv3jDA@mail.gmail.com>
	<20130329080629.GB14587@chumley.earth.sol>
	<CAMuHMdXcy8Apvm58m4XudxfRTRa9aiTojRVanPtY3M=mTUUxqg@mail.gmail.com>
	<5155E1A3.7060307@gmail.com>
	<20130329193323.GD14587@chumley.earth.sol>
	<Pine.BSM.4.64L.1303292135220.3992@herc.mirbsd.org>
	<20130329224731.GA22830@chumley.earth.sol>
	<5156229B.7030606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:42138 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755230Ab3C3KXo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 30 Mar 2013 06:23:44 -0400
Received: by mail-ie0-f181.google.com with SMTP id 17so1202704iea.12
        for <linux-m68k@vger.kernel.org>; Sat, 30 Mar 2013 03:23:44 -0700 (PDT)
In-Reply-To: <5156229B.7030606@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, Wouter Verhelst <w@uter.be>, linux-m68k@vger.kernel.org, Ingo J?rgensmann <ij@2012.bluespice.org>

On Sat, Mar 30, 2013 at 12:24 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> Generic questions first - what is the best strategy to make Zorro boards
> work with platform device utilizing drivers?
> Should I go and add code to amiga/platform.c to enumerate all Zorro devices
> and add platform devices for those,
> or revert to looking up Zorro device data in the SCSI driver probe function?
> Geert?

Not platform devices, but zorro devices.
zorro_register_driver()

Cfr. a2091/gvp11/zorro7xx under drivers/scsi/
ariadne/a2065/hydra/zorro8390 under drivers/net/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
