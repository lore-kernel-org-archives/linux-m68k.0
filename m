Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533E0C433FE
	for <linux-m68k@archiver.kernel.org>; Mon, 10 Jan 2022 14:21:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235472AbiAJOVw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 10 Jan 2022 09:21:52 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:33412 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235466AbiAJOVw (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 10 Jan 2022 09:21:52 -0500
Received: by mail-ua1-f46.google.com with SMTP id u6so23784215uaq.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Jan 2022 06:21:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uKBRWv0ZtQW0j4K4yY6WOWacYW+WViNADP4qa506v6E=;
        b=P5lcWTn2m6lSAJ8Y8Igj5CR59AbPXjDOFDY90kBAI00nMrvOncLkMBUDXVp9uFGyVm
         Rp86dMcd+uPfhJXdyEKY4ZF6T/klueniudv9aqBx+IMfkeckjDc3N+bWaFgLaFF08uDj
         Jux/lNxPmMNLKd3rbjN9tfPEaMhQlVIg9U7x7BDuKzIGFlZ9Mn+33j0HEUgFnvEdp64U
         gLbA1jdYaYmfpPQfHdt5Cnl8UBsXxG4XNixwFGZ1iu60gS7ALsIlF6q5v4dtcG30oW90
         yBSVMFoLOZYD2hMjr/7fiKrV031d+7XBoOMmHg08y5zfoMlD0Ttnu0lLWdQqJgVH1opr
         RTNQ==
X-Gm-Message-State: AOAM530OtEzDd54njtF7+vUBeMmtLf1I4WjRjFwig1TYXO7queLD6ccv
        +ZfmlAn5FIRNIOWaF5X4jjUyiRaT/sdFKg==
X-Google-Smtp-Source: ABdhPJxXQd7+67eemOiQG12b8ULCL0z0LBsyuR+weV3BqWYgbuzvIESSYvhXVh9kvKEzyTdnYB6KNA==
X-Received: by 2002:a05:6102:3585:: with SMTP id h5mr25253427vsu.73.1641824511334;
        Mon, 10 Jan 2022 06:21:51 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id b14sm3769272vkk.22.2022.01.10.06.21.50
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 06:21:51 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id w206so7292152vkd.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Jan 2022 06:21:50 -0800 (PST)
X-Received: by 2002:a1f:5702:: with SMTP id l2mr470497vkb.33.1641824510503;
 Mon, 10 Jan 2022 06:21:50 -0800 (PST)
MIME-Version: 1.0
References: <20220110084239.1597511-1-laurent@vivier.eu> <20220110084239.1597511-2-laurent@vivier.eu>
In-Reply-To: <20220110084239.1597511-2-laurent@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Jan 2022 15:21:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWtEZ3WqFw0ihSAAcTP76TdR+jtqjkX+=UwOi+=04xOWQ@mail.gmail.com>
Message-ID: <CAMuHMdWtEZ3WqFw0ihSAAcTP76TdR+jtqjkX+=UwOi+=04xOWQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] m68k: add asm/config.h
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Laurent,

On Mon, Jan 10, 2022 at 9:42 AM Laurent Vivier <laurent@vivier.eu> wrote:
> To avoid 'warning: no previous prototype for' error, declare all
> the parse_bootinfo and config functions prototypes into asm/config.h
> and include it in arch/m68k/kernel/setup_mm.c and arch/m68k/*/config.c
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/m68k/include/asm/config.h
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0

scripts/checkpatch.pl says this is the wrong one.

> +
> +/*
> + * This file contains prototypes provided by each m68k machine
> + * to parse bootinfo datastructure and to configure the machine

data structures

> + */
> +
> +#ifndef _M68K_CONFIG_H
> +#define _M68K_CONFIG_H
> +
> +extern int amiga_parse_bootinfo(const struct bi_record *);
> +extern int atari_parse_bootinfo(const struct bi_record *);
> +extern int mac_parse_bootinfo(const struct bi_record *);
> +extern int q40_parse_bootinfo(const struct bi_record *);
> +extern int bvme6000_parse_bootinfo(const struct bi_record *);
> +extern int mvme16x_parse_bootinfo(const struct bi_record *);
> +extern int mvme147_parse_bootinfo(const struct bi_record *);
> +extern int hp300_parse_bootinfo(const struct bi_record *);
> +extern int apollo_parse_bootinfo(const struct bi_record *);

Missing parameter names.

I can fix those while applying.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.18 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
