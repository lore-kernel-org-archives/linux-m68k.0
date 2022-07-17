Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DE3C43334
	for <linux-m68k@archiver.kernel.org>; Sun, 17 Jul 2022 09:27:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbiGQJ1A (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 17 Jul 2022 05:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232578AbiGQJ07 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 17 Jul 2022 05:26:59 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D23CB14D00
        for <linux-m68k@lists.linux-m68k.org>; Sun, 17 Jul 2022 02:26:58 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id h22so6839976qta.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 17 Jul 2022 02:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7HeCYddJCGbkDNDHsUTtOmQ56hC/czPPwpqxa8CXhwQ=;
        b=xSlaNY8Xm+K16phBNb+f58jj7f/WFnhLLG8hN8DE9cGGNnMBVkq2zgiCJXHkTbi+F6
         XGHemqzrP7t30UQ9tagobKYPBkbjfYjBI57q9hGjCcRQjstchAkeydcXnrAZBw4DRR51
         a0lqYn6nD0izPsby9AvIkWZEPyfI+eWWjvqCYp3DvyvVgBQv8I1CveSWnrkDSU9wv4QM
         0tbooaRKxHSCMVYNEnqf/tUfMBBBnJRLQlYOBtcmD5yg57fZGzx2ealFveJTHUU1dsvm
         lB/Hx5bRx5RSc63gts9palrcEaFNEYJpL6e7r6IGJx3kM05lnHZO1tusNsJciaNWskr6
         p51A==
X-Gm-Message-State: AJIora+H3pZAvCt1SxEOJCoVECtYPalDYrv2ZdMVVWzexbnTHwoIGA7/
        dOQsowaq+Kx98VVkUQcYEn6jeepF+BjFpA==
X-Google-Smtp-Source: AGRyM1uSKACrI/zoANKRrymdgD9squ0W7oOr14xEQ+TPE6zIGoqHgdBzEBiPVuNEu9LL47arvUAk8w==
X-Received: by 2002:ac8:5cd0:0:b0:31e:c352:b12b with SMTP id s16-20020ac85cd0000000b0031ec352b12bmr17958986qta.405.1658050017726;
        Sun, 17 Jul 2022 02:26:57 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id m3-20020a05620a24c300b006b47dc92e15sm8836051qkn.36.2022.07.17.02.26.57
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Jul 2022 02:26:57 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 75so15953895ybf.4
        for <linux-m68k@lists.linux-m68k.org>; Sun, 17 Jul 2022 02:26:57 -0700 (PDT)
X-Received: by 2002:a05:6902:1246:b0:66e:ea31:8d05 with SMTP id
 t6-20020a056902124600b0066eea318d05mr22992792ybu.89.1658050016840; Sun, 17
 Jul 2022 02:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220716161022.16902-1-dengshaomin@cdjrlc.com>
In-Reply-To: <20220716161022.16902-1-dengshaomin@cdjrlc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 17 Jul 2022 11:26:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUhGHXnd=tzLNKT-_enBfs_YZgAHNv6jeNTQ=c_e63urw@mail.gmail.com>
Message-ID: <CAMuHMdUhGHXnd=tzLNKT-_enBfs_YZgAHNv6jeNTQ=c_e63urw@mail.gmail.com>
Subject: Re: [PATCH] mm:%Lx is non-standard C
To:     dengshaomin@cdjrlc.com
Cc:     Sam Creasey <sammy@sammy.net>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

CC linux-m68k.

On Sat, Jul 16, 2022 at 6:10 PM shaom Deng <dengshaomin@cdjrlc.com> wrote:
> replace %Lx with %lx, because %Lx is not standard
>
> Signed-off-by: shaom Deng <dengshaomin@cdjrlc.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.20 branch.

> --- a/arch/m68k/sun3/sun3dvma.c
> +++ b/arch/m68k/sun3/sun3dvma.c
> @@ -77,7 +77,7 @@ static void print_use(void)
>         pr_info("%d entries in use total\n", j);
>
>         pr_info("allocation/free calls: %lu/%lu\n", dvma_allocs, dvma_frees);
> -       pr_info("allocation/free bytes: %Lx/%Lx\n", dvma_alloc_bytes,
> +       pr_info("allocation/free bytes: %lx/%lx\n", dvma_alloc_bytes,
>                 dvma_free_bytes);
>  }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
