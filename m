Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4068E92FF7
	for <linux-m68k@archiver.kernel.org>; Fri,  6 Oct 2023 07:49:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbjJFHtD convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 6 Oct 2023 03:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbjJFHtC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 6 Oct 2023 03:49:02 -0400
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97901E9
        for <linux-m68k@lists.linux-m68k.org>; Fri,  6 Oct 2023 00:49:01 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d857c8a1d50so1968764276.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 06 Oct 2023 00:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696578540; x=1697183340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0PtcKDzJDsW5toVlEGvFD3Fant3Vd4B6VHpgV1yH3I=;
        b=hlSVGIPg/V35vsfAHTfioz2wQvVtUe9g3IXL1YsVkcos8nrbm5QDEmEvvKTL4CrYIV
         z47RTXf5ZY8+8CyHo1gcLNvyx3ceATsuJhV6tb/NNdqV3T4pjouMpW/0PNRpwT2c1Lba
         Upm4s13fXV+kyXl+jLp6SdZ9pEAMt0qae1VbChs1C6uomxXJDzhww31BaSwyu0cKFN1l
         Rg+eWQQWM6fPq21/pIxXa6lGg/alyk4QCJLE0alsfudvKhJ0hM4O7AQJAYEOzQTmz94q
         e6tWHt7YV2wKgfYO7p/eRVlfe2zcSZhoC09oRh+geeQZ55dBXI2Jk2YTb3R/YEQb8m3m
         +MyQ==
X-Gm-Message-State: AOJu0Yx9ecnrIzHbOfcnmea80SNTKQR1NuImKrqBK2nuwcMm1jHv/Et6
        yQ+iDCYJAcssxcgt+YhfVQJNobN8ulsXBg==
X-Google-Smtp-Source: AGHT+IEIN9Mpl4dzchAee9FMaxsyyln4rwf0QFu7mfHQN6dB+V5KvcwwG1j7k27OSBrT5ac7JGSoCQ==
X-Received: by 2002:a25:dbc2:0:b0:d84:90c5:4e1f with SMTP id g185-20020a25dbc2000000b00d8490c54e1fmr6739258ybf.63.1696578540550;
        Fri, 06 Oct 2023 00:49:00 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id a14-20020a25f50e000000b00d677aec54ffsm890936ybe.60.2023.10.06.00.49.00
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 00:49:00 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-59e77e4f707so22579777b3.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 06 Oct 2023 00:49:00 -0700 (PDT)
X-Received: by 2002:a0d:dfc6:0:b0:57a:2e83:4daf with SMTP id
 i189-20020a0ddfc6000000b0057a2e834dafmr7779019ywe.32.1696578539932; Fri, 06
 Oct 2023 00:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230925155328.443664-1-arnd@kernel.org> <CAMuHMdWFCSQgsf_0qwdkkAif3zDXM2N-WEymJBa1eeT4N6Ezcw@mail.gmail.com>
 <d5836a46-c614-4270-8473-05c98bbab41f@app.fastmail.com>
In-Reply-To: <d5836a46-c614-4270-8473-05c98bbab41f@app.fastmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 Oct 2023 09:48:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU7v-TNV63zrMhFQ62P6zOYomszW7B6VScraszLFj4aMw@mail.gmail.com>
Message-ID: <CAMuHMdU7v-TNV63zrMhFQ62P6zOYomszW7B6VScraszLFj4aMw@mail.gmail.com>
Subject: Re: [PATCH] m68k: asm/io.h: mark mmio read addresses as const
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     kernel test robot <lkp@intel.com>, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Oct 2, 2023 at 9:42 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Mon, Oct 2, 2023, at 15:12, Geert Uytterhoeven wrote:
> > On Mon, Sep 25, 2023 at 5:53 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >>  #define out_8(addr,b) (void)((*(__force volatile u8 *) (unsigned long)(addr)) = (b))
> >>  #define out_be16(addr,w) (void)((*(__force volatile u16 *) (unsigned long)(addr)) = (w))
> >
> > Shouldn't a similar change be made to rom_in_{8,be16,le16}()?
>
> Right, these seem to have escaped my regex searches.
>
> > I can do that while applying...
>
> Ok, thanks!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.7 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
