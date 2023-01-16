Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57804C54EBE
	for <linux-m68k@archiver.kernel.org>; Mon, 16 Jan 2023 10:10:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbjAPKKJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Jan 2023 05:10:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbjAPKJp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Jan 2023 05:09:45 -0500
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 766EC1A94B
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Jan 2023 02:09:03 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id jr10so16930597qtb.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Jan 2023 02:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcfbiaOtd0rIUu3J0LzMQ7r+7EcuQP5IsDRStK58JTY=;
        b=VbEGoGT6pET+7yU/cwmJKpyA51KwV4De/obUwf3xKyKfJRRdXdIzlwNsVpJ7mL/dW7
         Nw9c1M04omIWl0aqhFH9DUzjjP6uFi8QQ97SolJDIK+IxCjgjPEBNJLBoLKJ0XIzuObE
         CZwfGugeoSldbnxaE3kJENOERQK9hCzIvJZdLBNRkOm02V6H60Rto0ivm7SdRfnhYWme
         CXvoiN+zkOYGcRFF3NmZW5w/ogI+IIYnNU1edLZYYDNnOSXf8YlgkvOM0ItntYNq1XS3
         scqni4tOLpnZefy1RAkVELKFLm8+NbfwwIYly4ZtN0cIdXZwh+cqBb/6jcbkKl39l3du
         sYCQ==
X-Gm-Message-State: AFqh2kpZAgiIQX37wUhCxHZM+KAcXgdl/XfAT8Pxa7WZ8q6zftFo+PUK
        FCzK/h769xmNnuq01cr2nIK3gFdSre9ruw==
X-Google-Smtp-Source: AMrXdXtyk+IJ//tGOJ2/S5h0LklWseZTJqU3i1LyiNGDUlsaXBSsmcT7ePh2U+Hfw0174Ke5MnZdEA==
X-Received: by 2002:a05:622a:5d86:b0:3b6:371b:bafd with SMTP id fu6-20020a05622a5d8600b003b6371bbafdmr948239qtb.41.1673863742489;
        Mon, 16 Jan 2023 02:09:02 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id cr26-20020a05622a429a00b003a68fe872a5sm14298552qtb.96.2023.01.16.02.09.02
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 02:09:02 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id l139so29648828ybl.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Jan 2023 02:09:02 -0800 (PST)
X-Received: by 2002:a25:46c6:0:b0:7b8:a0b8:f7ec with SMTP id
 t189-20020a2546c6000000b007b8a0b8f7ecmr4703291yba.36.1673863245804; Mon, 16
 Jan 2023 02:00:45 -0800 (PST)
MIME-Version: 1.0
References: <Y7P9IcR7/jgYWMcq@osiris> <20230105095426.2163354-1-andrzej.hajda@intel.com>
In-Reply-To: <20230105095426.2163354-1-andrzej.hajda@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Jan 2023 11:00:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUhPjya8zWMxEN8U8pjf4M2u_+HOfxQ2NP1XOcX9EpAKg@mail.gmail.com>
Message-ID: <CAMuHMdUhPjya8zWMxEN8U8pjf4M2u_+HOfxQ2NP1XOcX9EpAKg@mail.gmail.com>
Subject: Re: [PATCH v4] arch: rename all internal names __xchg to __arch_xchg
To:     Andrzej Hajda <andrzej.hajda@intel.com>
Cc:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        Mark Rutland <mark.rutland@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Heiko Carstens <hca@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jan 5, 2023 at 10:54 AM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> __xchg will be used for non-atomic xchg macro.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: squashed all arch patches into one
> v3: fixed alpha/xchg_local, thx to lkp@intel.com
> v4: adjusted indentation (Heiko)

>  arch/m68k/include/asm/cmpxchg.h      |  6 +++---

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> [m68k]

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
