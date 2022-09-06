Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614A6C38145
	for <linux-m68k@archiver.kernel.org>; Tue,  6 Sep 2022 07:41:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239003AbiIFHlr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 6 Sep 2022 03:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239004AbiIFHla (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 6 Sep 2022 03:41:30 -0400
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 106627548D
        for <linux-m68k@lists.linux-m68k.org>; Tue,  6 Sep 2022 00:40:40 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id u5so3415957qvv.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 06 Sep 2022 00:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ITipaBruM/cJ2BGwp12t6jc5YkF0RukHMWFpDeiOSnQ=;
        b=2FG0H9XBmRxv7IWD56SwgExifjaT/BVTQL9WdMXIQwEs1IvnZ/Tui13sHwSZ0Ch0KT
         +YNCVAjyt7NnNH3IzsGYl0l7bNa6sZ1gOIj7LnR8ixI57e10KVPXun/ZD5Rd+XAMsVwn
         51GaaKzSByikta+5CUHGkvFyjLfojkIwglolxMC12Y0+iyWycTCKoDIz34P5E66Xx+2g
         rVA2MRFhoQ1GFSyMQmsnTiR0K718KCJrDkGz6k/CQ5TjKtlOKRVoLmgyIEYXe/ne6aIc
         wL7HAbSQVLS6HnHj1ps53ydMYqlmId61zMUxMBCvZ/YU/H+jE75PZAIEedeLdR/1N7ZV
         aSLA==
X-Gm-Message-State: ACgBeo0J6Eb5fzRpTllntDVWJHhfm2Mb74HDiM0CFcghB1jmCGiCxiiS
        ZaQsNkHGvA9UdOfmDlm4bm7X+U9roiHeqQ==
X-Google-Smtp-Source: AA6agR7Uk7g0YTqIzAfUlQ3WeCT5L+KHg9tAA82doG5plC67geLCS9zzbkE+YQNXIH6GK03bza6pcA==
X-Received: by 2002:a05:6214:20ef:b0:476:a48d:4c43 with SMTP id 15-20020a05621420ef00b00476a48d4c43mr24227691qvk.13.1662450039388;
        Tue, 06 Sep 2022 00:40:39 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id w18-20020a05620a0e9200b006ba9b2167a2sm10100644qkm.16.2022.09.06.00.40.38
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 00:40:39 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-3450990b0aeso61017897b3.12
        for <linux-m68k@lists.linux-m68k.org>; Tue, 06 Sep 2022 00:40:38 -0700 (PDT)
X-Received: by 2002:a81:1691:0:b0:345:17df:4fc6 with SMTP id
 139-20020a811691000000b0034517df4fc6mr10355274yww.502.1662450038598; Tue, 06
 Sep 2022 00:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220903102453.296ce496@vk3heg> <C8EF5850-C41A-4CD9-9F02-548EE21D31CB@2022.bluespice.org>
 <20220904115051.4ec95d62@vk3heg> <8675AEED-B370-4CBA-B32F-6F23C7F61476@2022.bluespice.org>
 <20220906114629.302188e8@vk3heg>
In-Reply-To: <20220906114629.302188e8@vk3heg>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 6 Sep 2022 09:40:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBozRmgfc+PP9NS62CzmjMCmOE39rtr-urzRXToE5R=Q@mail.gmail.com>
Message-ID: <CAMuHMdVBozRmgfc+PP9NS62CzmjMCmOE39rtr-urzRXToE5R=Q@mail.gmail.com>
Subject: Re: Booting Kernel on Amiga 3000
To:     Stephen Walsh <vk3heg@vk3heg.net>
Cc:     Debian m68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Stephen,

On Tue, Sep 6, 2022 at 3:47 AM Stephen Walsh <vk3heg@vk3heg.net> wrote:
> Debug booting 5.15.0-2
>
> [    0.000000] Linux version 5.15.0-2-m68k (debian-kernel@lists.debian.org) (gcc-11 (Debian 11.2.0-12) 11.2.0, GNU ld (GNU Binutils for Debian) 2.37) #1 Debian 5.15.5-2 (2021-12-18)
> [    0.000000] printk: console [debug0] enabled
> [    0.000000] Amiga hardware found: [A3000] VIDEO BLITTER AMBER_FF AUDIO FLOPPY A3000_SCSI KEYBOARD MOUSE SERIAL PARALLEL A3000_CLK CHIP_RAM PAULA DENISE_HR AGNUS_HR_PAL MAGIC_REKICK ZORRO3
> [    0.000000] Ignoring memory chunk at 0x7800000:0x800000 before the first chunk
> [    0.000000] Fix your bootloader or use a memfile to make use of this area!
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000008000000-0x000000ffffffffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000008000000-0x000000000fffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000008000000-0x000000000fffffff]
> [    0.000000] initrd: 0783283d - 08000000

So the initrd is located in motherboard RAM.

> Booting with kenel 5.18.0-4, but initrid 5.15.0-2
>
>
> [    0.000000] Linux version 5.18.0-4-m68k (debian-kernel@lists.debian.org) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU Binutils for Debian) 2.38.90.20220713) #1 Debian 5.18.16-1 (2022-08-10)
> [    0.000000] printk: debug: ignoring loglevel setting.
> [    0.000000] printk: console [debug0] enabled
> [    0.000000] Amiga hardware found: [A3000] VIDEO BLITTER AMBER_FF AUDIO FLOPPY A3000_SCSI KEYBOARD MOUSE SERIAL PARALLEL A3000_CLK CHIP_RAM PAULA DENISE_HR AGNUS_HR_PAL MAGIC_REKICK ZORRO3

Why is there no initrd line here?

Note that your initial bad boot report (kernel 5.18.0-4 with corresponding
initrd) had:

    initrd: 0f7f81c2 - 10000000

I.e. the initrd was located in the WarpEngine RAM.

What happens with the old kernel and the new initrd?

> [    0.000000] Ignoring memory chunk at 0x7800000:0x800000 before the first chunk
> [    0.000000] Fix your bootloader or use a memfile to make use of this area!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
