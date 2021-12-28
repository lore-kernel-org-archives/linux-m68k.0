Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C436EC433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Dec 2021 08:40:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235714AbhL1IkC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 28 Dec 2021 03:40:02 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:36548 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235710AbhL1IkC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 28 Dec 2021 03:40:02 -0500
Received: by mail-ua1-f51.google.com with SMTP id r15so30945855uao.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Dec 2021 00:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1U54aUmdlVWzoRRCzQXLay8GEZgnNLlNR+vRREgVBq4=;
        b=ogs/NQefCjJp+4XybZdh2xLFyP/VZtxzaKcdVkORpMu6XRxjAED34u31xxZotP2bcm
         dtzfLLmpJeusGSBuXrAgJ8V9i+thgvcHJ5CVH8a8M9xCbGllyZYthBUl2JgNtQcF4vUx
         WBV3jdBGjlVUBvA+uEoOyP18J3u8vxYH8KSAL1GDiEI/V7djbpzSBL+/E9HxemIymWTO
         Oc57T+xgq78LlFgcZ4PFw9Cs69HutD08TvlXj8kIIEg1cbDn09k8+Usgy84dtWzTS7H+
         72o6y+Ormnzq2pAfHC6jet29ZPhm2dbCJzT7tB3neuZTREy6Zn/nkUtvw/HHhJ41T/8n
         XTyg==
X-Gm-Message-State: AOAM532XQU1q8/1yJJ0DS6vv7niO4SdHFvwdhmrCJGN4kMf06K+rtjO7
        hauZfvqW7e8OfUsW8uNy8LsalfChdIH1+w==
X-Google-Smtp-Source: ABdhPJxzQn/FmzczccHs8ZRpnWQ4AxQAnTh0N/DT7e1PK4DbVORkB1yVbzZqsGfpjKJvqqlteo2orA==
X-Received: by 2002:a67:e09d:: with SMTP id f29mr5603494vsl.6.1640680800867;
        Tue, 28 Dec 2021 00:40:00 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id h7sm3801605vke.54.2021.12.28.00.40.00
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Dec 2021 00:40:00 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id s1so9943820vks.9
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Dec 2021 00:40:00 -0800 (PST)
X-Received: by 2002:a1f:4641:: with SMTP id t62mr6304684vka.0.1640680800305;
 Tue, 28 Dec 2021 00:40:00 -0800 (PST)
MIME-Version: 1.0
References: <20211228020611.6582-1-hbh25y@gmail.com>
In-Reply-To: <20211228020611.6582-1-hbh25y@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Dec 2021 09:39:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXYuH6kgWCPjQhmd6Xi2N=oiyCSoE8U4NMg3tOrJ9bwDw@mail.gmail.com>
Message-ID: <CAMuHMdXYuH6kgWCPjQhmd6Xi2N=oiyCSoE8U4NMg3tOrJ9bwDw@mail.gmail.com>
Subject: Re: [PATCH v2] m68k/kernel: array out of bound access in process_uboot_commandline
To:     Hangyu Hua <hbh25y@gmail.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

CC greg

On Tue, Dec 28, 2021 at 3:06 AM Hangyu Hua <hbh25y@gmail.com> wrote:
>
> When the size of commandp >= size, array out of bound write occurs because
> len == 0.
>
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
>  arch/m68k/kernel/uboot.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
> index 928dbd33fc4a..63eaf3c3ddcd 100644
> --- a/arch/m68k/kernel/uboot.c
> +++ b/arch/m68k/kernel/uboot.c
> @@ -101,5 +101,6 @@ __init void process_uboot_commandline(char *commandp, int size)
>         }
>
>         parse_uboot_commandline(commandp, len);
> -       commandp[len - 1] = 0;
> +       if (len > 0)
> +               commandp[len - 1] = 0;
>  }
> --
> 2.25.1
