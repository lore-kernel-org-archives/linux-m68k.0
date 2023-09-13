Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6BEEDEC4F
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 13:00:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234679AbjIMNAp convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 09:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233238AbjIMNAp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 09:00:45 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C76A1989
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 06:00:41 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-59bdb3d03b1so3509937b3.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 06:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694610040; x=1695214840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKJCi8U2t5kB61ozBSUPXYFHc1pilb0uFJXQP0WcVJc=;
        b=UFaQ433wRbFlssWh8+1DVBM3clWkIbGu063y/6BTI/QZfr5Ik2ovbYmFPiRP0lL2Fm
         tAfezxy94qrmsqAA5rI0XoRFD/ZTPWvtpjW36FLvAYIVkELsnrJPVk4bqc23CQPjPQK+
         A8r70r8SLb9OTOx/ezpIVc/6AZex1p7oy2WijMiRO4tbpppC5hPWRsT4z/jtSPDfGIVU
         AaDo+QNfzuX3ZuP9yDyaBIoGuw8F9c7T5WQMsFzqeJ0oG65Wrclb+U0YONlvCrjaFHdm
         ap4zhbnhPrwyHnZa8HAfh+GEJRjLfzYDm6x6RNHuVoc5I1QxNC9LakkmCZApQsnzLCd7
         yPOw==
X-Gm-Message-State: AOJu0YwMsjSKlHaWFYESxSANGe5rMmpNWWUa+rL0RKG6ok14alyMF5Bq
        IxDGcBF1jiUsYw6O+08Y2cj7aPhbP8u6xw==
X-Google-Smtp-Source: AGHT+IH2Q0zXDzeRXxfg/+6Z47TEuvVpTdza53KOKINWkT1HPpQLSJwCv9yYEgiRV21gUkbotPZi2g==
X-Received: by 2002:a0d:ca93:0:b0:589:a4c6:a4ed with SMTP id m141-20020a0dca93000000b00589a4c6a4edmr2527860ywd.3.1694610039788;
        Wed, 13 Sep 2023 06:00:39 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id p139-20020a0de691000000b0057399b3bd26sm3114690ywe.33.2023.09.13.06.00.39
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 06:00:39 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d7225259f52so6169534276.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 06:00:39 -0700 (PDT)
X-Received: by 2002:a25:e78e:0:b0:d81:64e8:9b1f with SMTP id
 e136-20020a25e78e000000b00d8164e89b1fmr977751ybh.52.1694610039144; Wed, 13
 Sep 2023 06:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230913125159.2128567-1-gerg@kernel.org>
In-Reply-To: <20230913125159.2128567-1-gerg@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Sep 2023 15:00:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUhpXWfvu+sF+ARaXbeMrkxNA=e-tDNE2+nZberqqyCYQ@mail.gmail.com>
Message-ID: <CAMuHMdUhpXWfvu+sF+ARaXbeMrkxNA=e-tDNE2+nZberqqyCYQ@mail.gmail.com>
Subject: Re: [PATCH] m68knommu: improve config ROM setting defaults
To:     Greg Ungerer <gerg@kernel.org>
Cc:     linux-m68k@lists.linux-m68k.org,
        Greg Ungerer <gerg@linux-m68k.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

Thanks for your patch!

On Wed, Sep 13, 2023 at 2:52 PM Greg Ungerer <gerg@kernel.org> wrote:
> From: Greg Ungerer <gerg@linux-m68k.org>
>
> The ROM region configuration settings used on some nommu m68k systems
> (historically mostly 68328 (Dragonball) CPUs) default to an address
> of 0. That can easily clash with default RAM address settings which
> also default to 0. Of course that is invalid and those ranges overlap,
> but if you make no value selection that is what you end up with. Those
> default values produce a valid configuration but will fail compilation
> like this:
>
>     m68k-linux-ld: section .rodata VMA [0000000000001000,0000000000262227] overlaps section .text VMA [0000000000000400,0000000000455e7f]
>
> Looking at the platforms that use the ROM region configuration settings
> it is clear that we can choose much better defaults than 0. By far the
> most comman ROM region settings are these:

common

>     CONFIG_ROMVEC=0x10c10000
>     CONFIG_ROMSTART=0x10c10400
>
> So lets make these the default values.
>
> It is still possible to configure overlapping ROM and RAM regions, but
> at least the defult selections are now valid.

default

>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202305301407.z33zOjcG-lkp@intel.com/
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
