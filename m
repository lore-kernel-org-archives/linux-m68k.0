Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39855C433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 24 Feb 2022 08:59:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232458AbiBXJAE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 24 Feb 2022 04:00:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbiBXI7u (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 24 Feb 2022 03:59:50 -0500
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBDE3163073
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Feb 2022 00:59:20 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id d26so1443436vsh.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Feb 2022 00:59:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=glczv0l5uaIHGX0k1sHQaF0Req6u5NGSTbrWdrmUApU=;
        b=PZK54xTbFB2QV4RWaaYbz9gsnKOGJOpHmOPWfkBfuWrojnPmeLey5+fNlplw1hhPPN
         IIg32SeaehjTdaCBOZk001qkyMJCUjjnSUZtmwOxR4mZLrjyfUv5iRarqmbYy4o5cOFW
         IoxmDIztapgfXydIoAZAkd8cwX3Vn1HqnUUuQj224djqFrYurk58rhkMyXjya59IqOAB
         tQ5eV/d1TRI9T0WBJVYdDOSoCnLbOjXnpIuj+Rn6laCDGMZx3rQmf5hWpjlybe7EvgkV
         tAOvP7UTJnWvzF7RluQyC/U9+N8Wdr2pqiW4YKVP2isrJwpxX8z0lEVSeb1FxgPf1hrw
         Clig==
X-Gm-Message-State: AOAM533TBtDmAO8B23p16hCj52mB/Lf6Isbk8ReHfz3CA+9Z6hvcvGyv
        HE5ctygYI76iQO6wnZWLpqulYbHNQTUH5A==
X-Google-Smtp-Source: ABdhPJwttvshTsHrAt4PppnikYdLxDBSg64+ri0eGO8fKIu/iNn6ZRtAv7NV8C/r8IauChJ2HpkJUw==
X-Received: by 2002:a67:5fc3:0:b0:31c:1962:f8c5 with SMTP id t186-20020a675fc3000000b0031c1962f8c5mr754714vsb.1.1645693159692;
        Thu, 24 Feb 2022 00:59:19 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id x24sm277721vsk.29.2022.02.24.00.59.19
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 00:59:19 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id d26so1443417vsh.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Feb 2022 00:59:19 -0800 (PST)
X-Received: by 2002:a05:6102:4411:b0:31b:6df1:3b80 with SMTP id
 df17-20020a056102441100b0031b6df13b80mr696559vsb.5.1645693159137; Thu, 24 Feb
 2022 00:59:19 -0800 (PST)
MIME-Version: 1.0
References: <20220224060448.1856091-1-keescook@chromium.org>
In-Reply-To: <20220224060448.1856091-1-keescook@chromium.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Feb 2022 09:59:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVioQLy_T2LimgWdfWM=j=fomfpayuS1mbXnBLZj4gGQA@mail.gmail.com>
Message-ID: <CAMuHMdVioQLy_T2LimgWdfWM=j=fomfpayuS1mbXnBLZj4gGQA@mail.gmail.com>
Subject: Re: [PATCH] m68k: Implement "current_stack_pointer"
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Kees,

On Thu, Feb 24, 2022 at 7:04 AM Kees Cook <keescook@chromium.org> wrote:
> To follow the existing per-arch conventions, add asm "sp" as
> "current_stack_pointer". This will let it be used in non-arch places
> (like HARDENED_USERCOPY).
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Thanks for your patch!

> --- a/arch/m68k/include/asm/current.h
> +++ b/arch/m68k/include/asm/current.h
> @@ -24,6 +24,8 @@ static inline struct task_struct *get_current(void)
>
>  #define        current get_current()
>
> +register unsigned long current_stack_pointer __asm__("sp");

I don't know what HARDENED_USERCOPY does, so I don't know if you need
"usp" (see rdusp()) or "sp"?

> +
>  #endif /* CONFNIG_MMU */
>
>  #endif /* !(_M68K_CURRENT_H) */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
