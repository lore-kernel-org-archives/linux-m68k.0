Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E993AC433EF
	for <linux-m68k@archiver.kernel.org>; Fri,  4 Mar 2022 08:55:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235216AbiCDI4G (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 4 Mar 2022 03:56:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235197AbiCDI4F (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 4 Mar 2022 03:56:05 -0500
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C91CC19E0A0
        for <linux-m68k@lists.linux-m68k.org>; Fri,  4 Mar 2022 00:55:17 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id 63so3284720uaw.10
        for <linux-m68k@lists.linux-m68k.org>; Fri, 04 Mar 2022 00:55:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L/NeTMxhGm+l5YpPOiR/XhgTXlp1h5VVk6yshpmQCRE=;
        b=ypbXtUCbjI+JD5OqO+MHCBv3xwchEpOaX0tgoa5Z2c69imXRrU7XHTwcLOfImG844i
         uMQseY3wg7G25NX/c8F2ulJxUugUYCJA4MgzEpr/CiSzb9T2FTZru/cmjsxnkvpdIugL
         Mc7XwYZnK5Tv8G/vy6OLsyFwjhTNoTJb9I3qUg0ClPUBoR5DWPQprV/OOgnYyJfI8nsx
         jfBfRMe8qVKDk9a7jRR48sfhMGoF96o+8QzafXRZeiE5eEVItMvT2Nyp3b9h+0JVx8VL
         VUDkeB/kQeBVxpI9UBVua89t6ukKBFFoMfU6GTqCPTHSYiEi0rtEYHWWDc/cFdg2EC/x
         nuCQ==
X-Gm-Message-State: AOAM530qaHS9ODfoqVjeaWhvXgBgd44frin1odjsNM+zvuC8Tl/H4+1g
        yAbpUyiNMMt43Ptg7hoLDFmnz7Xwejk3TA==
X-Google-Smtp-Source: ABdhPJxd/BoI6mf90jfcHYtBqxtCr6k38/MfM1LJjtJBduX+xvBgt6nWWQzWEe58bMsFPBvoqPmHrg==
X-Received: by 2002:ab0:6486:0:b0:343:2539:6e23 with SMTP id p6-20020ab06486000000b0034325396e23mr16003834uam.38.1646384116587;
        Fri, 04 Mar 2022 00:55:16 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 4-20020a1f1604000000b00330d7b11691sm648887vkw.51.2022.03.04.00.55.16
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 00:55:16 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id z10so3293635uaa.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 04 Mar 2022 00:55:16 -0800 (PST)
X-Received: by 2002:ab0:3da4:0:b0:306:a7f8:f28b with SMTP id
 l36-20020ab03da4000000b00306a7f8f28bmr17141959uac.47.1646384115825; Fri, 04
 Mar 2022 00:55:15 -0800 (PST)
MIME-Version: 1.0
References: <20220304033531.28667-1-rdunlap@infradead.org>
In-Reply-To: <20220304033531.28667-1-rdunlap@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Mar 2022 09:55:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWM_a7gmBw3gQd+BCTuFGpsHN3o9HuU=ivWnZraYXewqQ@mail.gmail.com>
Message-ID: <CAMuHMdWM_a7gmBw3gQd+BCTuFGpsHN3o9HuU=ivWnZraYXewqQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: tweak coldfire/device.c for COMPILE_TEST
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        patches@lists.linux.dev, kernel test robot <lkp@intel.com>,
        Angelo Dureghello <angelo@sysam.it>,
        Greg Ungerer <gerg@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        uClinux development list <uclinux-dev@uclinux.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Randy,

On Fri, Mar 4, 2022 at 4:35 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> When CONFIG_MCF_EDMA is set (due to COMPILE_TEST, not due to
> CONFIG_M5441x), coldfire/device.c has compile errors due to
> missing MCFEDMA_* symbols. In the .config file that was provided,
> CONFIG_M5206=y, not CONFIG_M5441x, so <asm/m5441xsim.h> is not
> included in coldfire/device.c.
>
> Only build the MCF_EDMA code in coldfire/device.c if both MCF_EDMA
> and M5441x are enabled.
>
> Fixes these build errors:
>
> ../arch/m68k/coldfire/device.c:512:35: error: 'MCFEDMA_BASE' undeclared here (not in a function); did you mean 'MCFDMA_BASE1'?
>   512 |                 .start          = MCFEDMA_BASE,
> ../arch/m68k/coldfire/device.c:513:50: error: 'MCFEDMA_SIZE' undeclared here (not in a function)
>   513 |                 .end            = MCFEDMA_BASE + MCFEDMA_SIZE - 1,
> ../arch/m68k/coldfire/device.c:517:35: error: 'MCFEDMA_IRQ_INTR0' undeclared here (not in a function)
>   517 |                 .start          = MCFEDMA_IRQ_INTR0,
> ../arch/m68k/coldfire/device.c:523:35: error: 'MCFEDMA_IRQ_INTR16' undeclared here (not in a function)
>   523 |                 .start          = MCFEDMA_IRQ_INTR16,
> ../arch/m68k/coldfire/device.c:529:35: error: 'MCFEDMA_IRQ_INTR56' undeclared here (not in a function)
>   529 |                 .start          = MCFEDMA_IRQ_INTR56,
> ../arch/m68k/coldfire/device.c:535:35: error: 'MCFEDMA_IRQ_ERR' undeclared here (not in a function)
>   535 |                 .start          = MCFEDMA_IRQ_ERR,
>
> Fixes: d7e9d01ac292 ("m68k: add ColdFire mcf5441x eDMA platform support")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Thanks for your patch!

> --- linux-next-20220303.orig/arch/m68k/coldfire/device.c
> +++ linux-next-20220303/arch/m68k/coldfire/device.c
> @@ -480,7 +480,7 @@ static struct platform_device mcf_i2c5 =
>  #endif /* MCFI2C_BASE5 */
>  #endif /* IS_ENABLED(CONFIG_I2C_IMX) */
>
> -#if IS_ENABLED(CONFIG_MCF_EDMA)
> +#if IS_ENABLED(CONFIG_MCF_EDMA) && IS_ENABLED(CONFIG_M5441x)

As this protects hardware description, I'm wondering if this and
below shouldn't just be"#ifdef CONFIG_M5441x"?

See also commit 322c512f476f07e9 ("m68knommu: include SDHC support
only when hardware has it")

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
