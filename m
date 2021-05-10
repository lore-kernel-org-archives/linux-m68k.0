Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679ECC433B4
	for <linux-m68k@archiver.kernel.org>; Mon, 10 May 2021 10:19:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B69561007
	for <linux-m68k@archiver.kernel.org>; Mon, 10 May 2021 10:19:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbhEJKUS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 10 May 2021 06:20:18 -0400
Received: from mail-vk1-f180.google.com ([209.85.221.180]:36727 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbhEJKUL (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 10 May 2021 06:20:11 -0400
Received: by mail-vk1-f180.google.com with SMTP id c17so189044vke.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 May 2021 03:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KdRd6/gKBJmSyWKHkTLo2vWOf1KaAzTkqqnkH637tvE=;
        b=rHdOBexE32DZ1va8JBCCEJ53A+pspad1kjHl+ch5sQBu+8fzIZ0xQ4nh6otuKLWuXb
         DB8WBGmb0G+fhNfW8ZhHg5v/TFdqbTTTC0jIjQAgCpu09vZ8Wm50UtxSmtzQfv8ScVHc
         wM32sdk9Gc6uZ5zKmGRDtVnJd1wtmq8PuLwQ3f4Uf+N47EGB+7ui2FPKZSTDewxk10Sc
         S7/Q9xFCghhFkHQn3qKiOvPWmIOTUHP/T+juaXq3TwfAU94mTIo9Q+Rg9zcmBxlsRwHw
         wr9mAjToltgo+PPJH/BF4b7L07MTb+VGoFBeCYGa3S8TZk7IyNxWUOoMirJm5IsAKMNY
         W7zw==
X-Gm-Message-State: AOAM5335eW/mtEpJBTwR5TgEjWp2yC7SVDxaK2DnfNQlNOAdZALthe7q
        srj9mor8JCZ8qPvCu6mr+IwLQdctc2VbFz4gMoc=
X-Google-Smtp-Source: ABdhPJyaOXi+XArkeKM210IRY8QcEM26/c7KnI/L43ooxhYTjbJbpZlbZUWioVOj4c1tWLX5jGBLlpRzufl3a7TwMsc=
X-Received: by 2002:a1f:1f81:: with SMTP id f123mr16115181vkf.6.1620641946301;
 Mon, 10 May 2021 03:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210507220813.365382-1-arnd@kernel.org> <20210507220813.365382-5-arnd@kernel.org>
In-Reply-To: <20210507220813.365382-5-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 May 2021 12:18:55 +0200
Message-ID: <CAMuHMdWYoGfDafgcObE4Cb4spZ4vAAEDfWPt-4+1pmEebjM6Ow@mail.gmail.com>
Subject: Re: [RFC 04/12] m68k: select CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux-Arch <linux-arch@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Vineet Gupta <vgupta@synopsys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Arnd,

On Sat, May 8, 2021 at 12:10 AM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> All supported CPUs other than the old dragonball use the

Same comment about dragonball as for patch 01/12.

> include/linux/unaligned/access_ok.h implementation for accessing unaligned
> variables, so presumably this works everywhere.
>
> However, m68k never selects CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS,
> so none of the other conditionals in the kernel get the optimized
> implementation.
>
> Select this based on CPU_HAS_NO_UNALIGNED to make the two settings
> always match, and then use the generic version of the header.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -22,6 +22,7 @@ config M68K
>         select HAVE_AOUT if MMU
>         select HAVE_ASM_MODVERSIONS
>         select HAVE_DEBUG_BUGVERBOSE
> +       select HAVE_EFFICIENT_UNALIGNED_ACCESS if !CPU_HAS_NO_UNALIGNED

This was clearly forgotten in commit 58340a07c194e0ae ("introduce
HAVE_EFFICIENT_UNALIGNED_ACCESS Kconfig symbol"), which predates the
existence of CPU_HAS_NO_UNALIGNED.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
