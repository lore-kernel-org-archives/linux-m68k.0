Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42B4C47082
	for <linux-m68k@archiver.kernel.org>; Mon, 31 May 2021 07:48:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B334661278
	for <linux-m68k@archiver.kernel.org>; Mon, 31 May 2021 07:48:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbhEaHuS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 31 May 2021 03:50:18 -0400
Received: from mail-ua1-f53.google.com ([209.85.222.53]:36543 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbhEaHuQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 31 May 2021 03:50:16 -0400
Received: by mail-ua1-f53.google.com with SMTP id q10so5272086uam.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 May 2021 00:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=44YBbg2fYX/hfgSeWE3KOy+zaexOX+0Aw7Axnd+cQ8E=;
        b=KhuMMbOH/OgIXRn/lWqR44m+nHN74dE0QA4GAU1iBM+FdTvZiY8bvVZVmf8WhIfH8f
         /9S+Pnlsh6ER9xEEqIQgeBY4/F3G2PSZ5UgfDmHTcAHV9YndHBRx0ROX72ELxtwVxAeX
         1IHWuCvwLB/efzM5F5ssTdyqN8wrFOavvIXjat7tq/UdtZ8BfXqHVKh8WRFenDPPQbSy
         Vpi7To0N8IsAaNBtsCGKX5yYdtBjL8HV2faUMYueeQv5Gganq2AwA37a6JB5K4A+KiIf
         r2HKQLHrDS8i0BWyG81s2hil/v9tpayipsfKvgXAXydE7rnDoQ27U9UnCv6Ojwme3uUk
         va1A==
X-Gm-Message-State: AOAM530SbOjWl5ILzA/Qxlulg3yqhURZToKmQ+YMgxPi/PFxl3FKlwr0
        Tthw9oC++/GLpU8CFTTaKq7ZiYvbZX6S39xesEE=
X-Google-Smtp-Source: ABdhPJwxFVdG3TE/UeNQ9DPk4zX/a/VsvjhPOzB4LD00GlG0TMk25UF0idEqyTUFA1IU43hjsVTgF8co7MLPhRGrTMU=
X-Received: by 2002:ab0:7515:: with SMTP id m21mr1655831uap.2.1622447315059;
 Mon, 31 May 2021 00:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210529105504.180544-1-wangkefeng.wang@huawei.com> <20210529105504.180544-8-wangkefeng.wang@huawei.com>
In-Reply-To: <20210529105504.180544-8-wangkefeng.wang@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 31 May 2021 09:48:23 +0200
Message-ID: <CAMuHMdVvbA-bJCubhmKaJ_4VbKo+U538x7s34OkZ94kL7z4nrw@mail.gmail.com>
Subject: Re: [PATCH 07/15] m68k: convert to setup_initial_init_mm()
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Kefeng

(CC Greg for m68knommu)

On Sat, May 29, 2021 at 12:46 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> Use setup_initial_init_mm() helper to simplify code.
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Thanks for your patch!

> --- a/arch/m68k/kernel/setup_mm.c
> +++ b/arch/m68k/kernel/setup_mm.c
> @@ -258,10 +258,7 @@ void __init setup_arch(char **cmdline_p)
>                 }
>         }
>
> -       init_mm.start_code = PAGE_OFFSET;
> -       init_mm.end_code = (unsigned long)_etext;
> -       init_mm.end_data = (unsigned long)_edata;
> -       init_mm.brk = (unsigned long)_end;
> +       setup_initial_init_mm((void *)PAGE_OFFSET, _etext, _edata, _end);

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/arch/m68k/kernel/setup_no.c
> +++ b/arch/m68k/kernel/setup_no.c
> @@ -87,10 +87,7 @@ void __init setup_arch(char **cmdline_p)
>         memory_start = PAGE_ALIGN(_ramstart);
>         memory_end = _ramend;
>
> -       init_mm.start_code = (unsigned long) &_stext;
> -       init_mm.end_code = (unsigned long) &_etext;
> -       init_mm.end_data = (unsigned long) &_edata;
> -       init_mm.brk = (unsigned long) 0;
> +       setup_initial_init_mm(_stext, _etext, _edata, (void *)0);

Please use NULL instead of (void *)0.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
