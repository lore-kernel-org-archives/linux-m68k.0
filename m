Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A088C432BE
	for <linux-m68k@archiver.kernel.org>; Thu,  2 Sep 2021 12:42:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71E87610D2
	for <linux-m68k@archiver.kernel.org>; Thu,  2 Sep 2021 12:42:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234247AbhIBMni (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 2 Sep 2021 08:43:38 -0400
Received: from mail-vk1-f176.google.com ([209.85.221.176]:46793 "EHLO
        mail-vk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234098AbhIBMni (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 2 Sep 2021 08:43:38 -0400
Received: by mail-vk1-f176.google.com with SMTP id s71so560460vke.13
        for <linux-m68k@vger.kernel.org>; Thu, 02 Sep 2021 05:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pk7VzqBJ4zY2KJM5ER0/tAYZ1vUXVwprJrULG9LAhE8=;
        b=WRP3TRVxq73vrPftOnR111yCHMP65TJUuSbmSZdsBZGOdYhsVg3dB68pYj6l5G8KDE
         mVxjVJPTDx5hJwFnSypvcsV4tK4BGf6GympGFInHqUcIHrQE5TXD+9jc2uU3f8miP+3W
         2qbO+pFcJIoCbvRFB0+oNwNLtpAuuXLziwUoiZvJVxAphQ+WhgmPXo3XEYZgcRtY4i2J
         60BpUvM/tr1HMlELEqseq5b/7ciWhrrM0dkYA7BBRIcHD3XJo2TjFsLCXg9QdkNg4w1k
         iIoAO0CCr42hIMTKj7gzmxOkj5UfZl8zAaCZbB3FPn/A5cE6bHujBhdMDOHudcf/VTZw
         h/gw==
X-Gm-Message-State: AOAM532fGO74telgG3yF/wQ3MRJzMqTF39TEX3emCyi6Y8xuYEGLLSC4
        blLJHwmuGYkN/aN8XMriWxKFPe9YjEKx21WkLfQ=
X-Google-Smtp-Source: ABdhPJyE8ShkHjyAjmt32BH8j6odBbk0RbgtVQUscCnJcyC8VrUGAxhqATUx0q5Eu4swk3oPV8KMhNri1cT4AOcKmEc=
X-Received: by 2002:a1f:fe04:: with SMTP id l4mr1338007vki.9.1630586559903;
 Thu, 02 Sep 2021 05:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <1630206710-5954-1-git-send-email-schmitzmic@gmail.com> <1630206710-5954-2-git-send-email-schmitzmic@gmail.com>
In-Reply-To: <1630206710-5954-2-git-send-email-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 2 Sep 2021 14:42:28 +0200
Message-ID: <CAMuHMdV5hWcg=pPZ7=E5QEi5OqM=X4JsqymsL-vHWjMjDvyWQQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] m68k: Kconfig - select core PCMCIA support module
 for Amiga PCMCIA
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        ALeX Kazik <alex@kazik.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Sun, Aug 29, 2021 at 5:12 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> The 16 bit card support test for the apne.c driver needs a whole
> lot of hairy parser code which is already present in the core
> PCMCIA code - make use of that instead of duplicating it.
>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Thanks for your patch!

> --- a/arch/m68k/Kconfig.bus
> +++ b/arch/m68k/Kconfig.bus
> @@ -31,6 +31,8 @@ config ZORRO
>  config AMIGA_PCMCIA
>         bool "Amiga 1200/600 PCMCIA support"

Can this become tristate?

>         depends on AMIGA
> +       select PCCARD
> +       select PCMCIA

This is now forcing PCCARD and PCMCIA builtin instead of modular
in an allmodconfig kernel.

>         help
>           Include support in the kernel for pcmcia on Amiga 1200 and Amiga
>           600. If you intend to use pcmcia cards say Y; otherwise say N.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
