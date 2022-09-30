Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B27DC433F5
	for <linux-m68k@archiver.kernel.org>; Fri, 30 Sep 2022 09:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbiI3Jgh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 30 Sep 2022 05:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231506AbiI3Jg0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 30 Sep 2022 05:36:26 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 210A8127C9F
        for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Sep 2022 02:36:25 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id g23so2320960qtu.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Sep 2022 02:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=M1K0WsiF135t2j3SUZO6oV2iG51jDxP4cy8f0SHNSvU=;
        b=KxLy14O7MFaTMC/lL4U+jgPGn60re1S6rUTfeWD1v3oMF6DjXu7HHdjXyBvQUuTW4i
         DgK9FjdyJq71L+84YRLG9yzR5tQsSpadpigErqF1COm88IG0Fmlpcg3T7VTGR3/C6NM3
         jVdDZjSw4/RWhpVIDRu8GD4zGiOjw+WOLCZhOgHsGGZCgrNaGJCFRgA5jirlyPq5wHco
         M14IU+OOy8pYhYxhaseUimOHq/rEvhi8A0NgmDMimsWEgZDPN3qFVQKH5QSGzqqGYcmI
         4Le5ggj0SsvNlGcVkv9gbnINz+GHRAR2nWN1r4jfPrs/Y0pSkIzF+Efp5C7pya04FV67
         RZuw==
X-Gm-Message-State: ACrzQf1M2cUM3XsUnMZNpMqLHlsto/VaTtAM7dHJqX4Qsq3TOHSPupiA
        wH5/q/orexwWfgZzHLztExp9s6DaqZB0jg==
X-Google-Smtp-Source: AMsMyM6Yd2RcvnFeMDqrchNLplWIZBd1Uuzk8nM4Gzz8y6uvliOrtaYQhjyCFfjglfKbfeHFlA8EKA==
X-Received: by 2002:ac8:4e45:0:b0:35d:49ce:bdcf with SMTP id e5-20020ac84e45000000b0035d49cebdcfmr5905076qtw.426.1664530583735;
        Fri, 30 Sep 2022 02:36:23 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id w41-20020a05622a192900b0035d432f5ba3sm1377770qtc.17.2022.09.30.02.36.22
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 02:36:23 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 63so4614299ybq.4
        for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Sep 2022 02:36:22 -0700 (PDT)
X-Received: by 2002:a25:8e84:0:b0:696:466c:baa with SMTP id
 q4-20020a258e84000000b00696466c0baamr7335432ybl.604.1664530582128; Fri, 30
 Sep 2022 02:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220930080717.290016-1-xu.panda@zte.com.cn>
In-Reply-To: <20220930080717.290016-1-xu.panda@zte.com.cn>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 30 Sep 2022 11:36:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQJkY=+CSez7FmOb2no0SZ9rkeAAWpRr_zLvBAYUwKXw@mail.gmail.com>
Message-ID: <CAMuHMdVQJkY=+CSez7FmOb2no0SZ9rkeAAWpRr_zLvBAYUwKXw@mail.gmail.com>
Subject: Re: [PATCH linux-next] m68k: Move from strlcpy with unused retval to strscpy
To:     cgel.zte@gmail.com
Cc:     laurent@vivier.eu, arnd@arndb.de, rppt@kernel.org,
        dmitry.osipenko@collabora.com, fthain@linux-m68k.org,
        linux-kernel@vger.kernel.org, Xu Panda <xu.panda@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

CC linux-m68k

On Fri, Sep 30, 2022 at 10:07 AM <cgel.zte@gmail.com> wrote:
> From: Xu Panda <xu.panda@zte.com.cn>
>
> The implementation of strscpy() is more robust and safer.
> That's now the recommended way to copy NUL terminated strings.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
> ---
>  arch/m68k/kernel/setup_mm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
> index 06ee394db610..401a8deb6ffc 100644
> --- a/arch/m68k/kernel/setup_mm.c
> +++ b/arch/m68k/kernel/setup_mm.c
> @@ -231,7 +231,7 @@ void __init setup_arch(char **cmdline_p)
>         setup_initial_init_mm((void *)PAGE_OFFSET, _etext, _edata, _end);
>
>  #if defined(CONFIG_BOOTPARAM)
> -       strncpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
> +       strscpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
>         m68k_command_line[CL_SIZE - 1] = 0;
>  #endif /* CONFIG_BOOTPARAM */
>         process_uboot_commandline(&m68k_command_line[0], CL_SIZE);
> --
> 2.15.2
