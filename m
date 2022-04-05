Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF12C433F5
	for <linux-m68k@archiver.kernel.org>; Tue,  5 Apr 2022 06:46:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbiDEGsU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 5 Apr 2022 02:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiDEGsT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 5 Apr 2022 02:48:19 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD3757147
        for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Apr 2022 23:46:20 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id a11so9660173qtb.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Apr 2022 23:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UuWjfy1DmKGBwxecHn9QW28Mp8RGeP8Fe6idp3HhRGs=;
        b=8QkR1sFNy5qVz2rHKNJFFxNzeCYebJauClh7zJiETtG5ULfjpPWFOs8KT1AOaJ2vCW
         lZOj2rF/dTAWoaDticeWVaBoOwU5NM9KCkfMkjlLTQZTc3sdZeutT+N/lQt00xtkrIRV
         G5l3fmzTfvw3MZp7By+pA1G4+5T88Mv2RUY9jO0fSZXMd2OSqcbv6Qkdl8k5dn7pO2Kq
         naGOf0/TlQOFOgauwDLCyf+bfRXrIJ27tmBbv9INo1FCqIn+cX3rQQr03jUdoj4aZPGB
         udOUaISi75jFsVP6/GnvfrykhPHyOFVvcAF6iUtJPrZLLLCt7TuhAg0zuv8XpuIY7Fdw
         GJcA==
X-Gm-Message-State: AOAM530fNizpOLH6ZqxxRcDCkVMggPfXSJZ+lFQZMiG/N6dpn3W9Hseu
        c8N1M2XCuNWzd6ejZuiLCIdPeoKpbiSYNQ==
X-Google-Smtp-Source: ABdhPJydD4bEMH4oesmBtTN77Da4FD/erdNmA9qI9Foge2QLRLcytgNpxclSd0thgu8tKoGEIFR3Pw==
X-Received: by 2002:ac8:5ac8:0:b0:2e1:df01:1a4b with SMTP id d8-20020ac85ac8000000b002e1df011a4bmr1614318qtd.675.1649141178895;
        Mon, 04 Apr 2022 23:46:18 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 78-20020a370551000000b0067e3a58c090sm7489664qkf.82.2022.04.04.23.46.18
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 23:46:18 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id j2so21794497ybu.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Apr 2022 23:46:18 -0700 (PDT)
X-Received: by 2002:a25:45:0:b0:633:96e2:2179 with SMTP id 66-20020a250045000000b0063396e22179mr1490905yba.393.1649141178137;
 Mon, 04 Apr 2022 23:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wg6FWL1xjVyHx7DdjD2dHZETA5_=FqqW17Z19X-WTfWSg@mail.gmail.com>
 <20220404074734.1092959-1-geert@linux-m68k.org> <alpine.DEB.2.22.394.2204041006230.1941618@ramsan.of.borg>
 <874k38u20c.fsf@tynnyri.adurom.net>
In-Reply-To: <874k38u20c.fsf@tynnyri.adurom.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Apr 2022 08:46:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_-3TOHYehUsHeqwHjQtzN1Ot886K7vwPr4P-4u8eehw@mail.gmail.com>
Message-ID: <CAMuHMdV_-3TOHYehUsHeqwHjQtzN1Ot886K7vwPr4P-4u8eehw@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.18-rc1
To:     Kalle Valo <kvalo@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
        Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        scsi <linux-scsi@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        linux-xfs@vger.kernel.org,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        linux-s390 <linux-s390@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Kalle,

On Mon, Apr 4, 2022 at 8:39 PM Kalle Valo <kvalo@kernel.org> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> >> /kisskb/src/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c:
> >> error: case label does not reduce to an integer constant: => 3798:2,
> >> 3809:2
> >
> > arm64-gcc5.4/arm64-allmodconfig
> > powerpc-gcc5/powerpc-allmodconfig
> > powerpc-gcc5/ppc64_book3e_allmodconfig
>
> After v5.17 there were two commits to brcmfmac/sdio.c:
>
> $ git log --oneline v5.17.. drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> ed26edf7bfd9 brcmfmac: Add BCM43454/6 support
> 6d766d8cb505 brcmfmac: pcie: Declare missing firmware files in pcie.c
>
> I can't see how either of them could cause this warning. Could something
> else cause this or am I missing something?

Doh, I should not have reduced the CC list in the xfs subthread...

The builds above are all gcc-5 builds, so they are affected by the same
issue as XFS: unsigned constants that don't fit in int are lacking a
"U" suffix.

I assume Arnd's patch for
drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
fixes this?
https://lore.kernel.org/all/CAK8P3a0wRiS03imdXk2WbGONkSSczEGdE-ue5ubF6UyyDE9dQg@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
