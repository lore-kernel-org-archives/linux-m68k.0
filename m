Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562E1C6FD1D
	for <linux-m68k@archiver.kernel.org>; Mon, 20 Mar 2023 14:30:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbjCTOa4 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 20 Mar 2023 10:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbjCTOay (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 20 Mar 2023 10:30:54 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E5D813539
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Mar 2023 07:30:52 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id c18so13215028qte.5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Mar 2023 07:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679322651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00l8z9oqCvhZjLEVBuQ8DT4Wwg7fPUKvNuCrA1BQAAo=;
        b=hrJGMBLrSEYHnGmSHdlIbeitOXlz+9X8+ckCwFrZ65swPZYzMSdm8XSiQ6OR+2A/6i
         aqVbsllwzXy7AQl78DC007oetVv3mafH+kgWv2hzd0O3X5GHdD+mRL3RyHNwxDjwaG3e
         yu8a2czgynuqMIzOhlpQ0oXGqaZF/7aR5PVf43HHsh90OhwCc/FAZapK+Xpteb0go97O
         DqCwYD7ola54WHVUORhlPdOxtySpYYtYg1Y8hu+JaZjd7GRJmUCyQW30hPK4xFp+lBFf
         AuaH7g+WOa2Cjq6MAFeSOrO/bjV6gj51feK0JHghs/x7zhORXPCVrE/Dk7J5TnDJklis
         9SrA==
X-Gm-Message-State: AO0yUKUtQH4Axy1GU6uPifOTlLUGbrd9yBNKyxhPmM50lWPZ7RjYSdXF
        LScluYp6H0/fWRv7vC2ZS3wr/ImrEDLMdQ==
X-Google-Smtp-Source: AK7set9nHGpREHkE4adsjSO7VK2KPKlZbbWNwp0opHznTkTkr7HlUaOLjzVgB8xGUuN13Aj/jrpbaA==
X-Received: by 2002:a05:622a:15d0:b0:3d7:db35:f2c1 with SMTP id d16-20020a05622a15d000b003d7db35f2c1mr23950551qty.15.1679322651271;
        Mon, 20 Mar 2023 07:30:51 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id q6-20020ac87346000000b003df5fd89e21sm3223113qtp.0.2023.03.20.07.30.50
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 07:30:50 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id l16so3730908ybe.6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Mar 2023 07:30:50 -0700 (PDT)
X-Received: by 2002:a25:3249:0:b0:a02:a3a6:78fa with SMTP id
 y70-20020a253249000000b00a02a3a678famr4214330yby.12.1679322650227; Mon, 20
 Mar 2023 07:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230320135418.2055-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20230320135418.2055-1-lukas.bulwahn@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Mar 2023 15:30:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWpYZr=v-pm4c2nCoHGv3ygdKiV+TKQ8jLkJOGQcYtreQ@mail.gmail.com>
Message-ID: <CAMuHMdWpYZr=v-pm4c2nCoHGv3ygdKiV+TKQ8jLkJOGQcYtreQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: Kconfig.machine: remove obsolete configs ROMBASE
 and ROMSIZE
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-m68k@lists.linux-m68k.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

CC Greg

On Mon, Mar 20, 2023 at 2:54 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> The configs ROMBASE and ROMSIZE were used in arch/m68k/68360/head-ram.S,
> which was removed with commit a3595962d824 ("m68knommu: remove obsolete
> 68360 support").
>
> Remove the obsolete configs ROMBASE and ROMSIZE.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Fixes: a3595962d82495f5 ("m68knommu: remove obsolete 68360 support")
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/arch/m68k/Kconfig.machine
> +++ b/arch/m68k/Kconfig.machine
> @@ -439,15 +439,6 @@ config ROM
>           that can be stored in flash, with possibly the text, and data
>           regions being copied out to RAM at startup.
>
> -config ROMBASE
> -       hex "Address of the base of ROM device"
> -       default "0"
> -       depends on ROM
> -       help
> -         Define the address that the ROM region starts at. Some platforms
> -         use this to set their chip select region accordingly for the boot
> -         device.
> -
>  config ROMVEC
>         hex "Address of the base of the ROM vectors"
>         default "0"
> @@ -465,14 +456,6 @@ config ROMSTART
>           Define the start address of the system image in ROM. Commonly this
>           is strait after the ROM vectors.
>
> -config ROMSIZE
> -       hex "Size of the ROM device"
> -       default "0x100000"
> -       depends on ROM
> -       help
> -         Size of the ROM device. On some platforms this is used to setup
> -         the chip select that controls the boot ROM device.
> -
>  choice
>         prompt "Kernel executes from"
>         help

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
