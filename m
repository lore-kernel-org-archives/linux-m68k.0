Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87BFC433B4
	for <linux-m68k@archiver.kernel.org>; Fri,  7 May 2021 10:06:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 851736141E
	for <linux-m68k@archiver.kernel.org>; Fri,  7 May 2021 10:06:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235229AbhEGKGx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 7 May 2021 06:06:53 -0400
Received: from mail-vk1-f179.google.com ([209.85.221.179]:35356 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234097AbhEGKGx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 7 May 2021 06:06:53 -0400
Received: by mail-vk1-f179.google.com with SMTP id n7so1807162vkl.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 May 2021 03:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8OhSK4/fRuA4HwTCIuizFPGiwNOBd8/VP64HP5BG0u0=;
        b=haWLrlgUQDq/uaJOroRYr4CylSge0PX9ps1RnOzkCvcyQfyUI5garkhjYC9gmjCDPH
         1RYNtIKn0Jxqkc/5h+r6zPt9x8skQ6U5csFjAY+76WmFCeaYOVPuqO/yEywsAcyUjr+Z
         Aa8r6V70xYc/OvV3LvPf0VFW65mznflGwXhhvG04W/2jTbRtAiZR3y1Iglk4IgFNmoag
         x9Pb4LHnVUtDPogjb2haTrHOBqDrqhIQBCgZG9csULqTkiC6LWfAutgUEamAN24M9MA0
         z8zp0yFI8Zx4eWGQmvW+yg32BeFEZTUGIdX3Vl+f3dDG+eQ+vFww3Ci1fKbn+rRzniAW
         gwzw==
X-Gm-Message-State: AOAM5339BqpK3FS6fJ/bdN8XQC3VPGd6gas5LHLBVFClA/f7oGBe98RK
        2IBbX4YBZ4elP9dFt73JgGuOnyuDfnNPLXa6GSM=
X-Google-Smtp-Source: ABdhPJxt+pOzDHWc5H2t65kh+4s2Qz3s7gwuQ1GebHLmrZDDKPnZtkesGIVfbF6W7iXFexTUx2RQ4J/cfrxj3ln6qbM=
X-Received: by 2002:a1f:5682:: with SMTP id k124mr6833991vkb.2.1620381947610;
 Fri, 07 May 2021 03:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <87k0oaq311.wl-chenli@uniontech.com>
In-Reply-To: <87k0oaq311.wl-chenli@uniontech.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 7 May 2021 12:05:36 +0200
Message-ID: <CAMuHMdWapV4ZypzpC0gvS01BKRQvPjsiD2uS7odb78dEeP=63Q@mail.gmail.com>
Subject: Re: [PATCH] mm: update legacy flush_tlb_* to use vma
To:     chenli@uniontech.com
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Jonas Bonn <jonas@southpole.se>,
        Openrisc <openrisc@lists.librecores.org>,
        Chris Zankel <chris@zankel.net>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, May 7, 2021 at 11:58 AM Chen Li <chenli@uniontech.com> wrote:
> 1. These tlb flush functions  have been using vma instead mm long time ago, but there
> is still some coments use mm as parameter.
>
> 2. the actual struct we use is vm_area_struct instead of vma_struct.
>
> 3. remove unused flush_kern_tlb_page.
>
> Signed-off-by: Chen Li <chenli@uniontech.com>

>  arch/m68k/include/asm/tlbflush.h     |  2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
