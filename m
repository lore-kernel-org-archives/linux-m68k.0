Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7537C4167B
	for <linux-m68k@archiver.kernel.org>; Mon,  2 Jan 2023 08:31:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbjABIbI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 2 Jan 2023 03:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231921AbjABIbF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 2 Jan 2023 03:31:05 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22A2E7B
        for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Jan 2023 00:31:02 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id s9so22021463qtx.6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 02 Jan 2023 00:31:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jo2CI5pKv7C2jtNLeQsFhlozXL/lFYNzin08UvE0x2c=;
        b=ztWyTAzoeqZ8mLIvAFStBzxilgc9sPSKdd5Q/ZK8kSX45d8f/68JWIOzC1ZSZkwnHC
         lcIx1w4Rbu2s59NB2K2848SnHZQETU0DZq4Tyuzm9PI3URablWm+zwAvXQAqmGlOcWdn
         Bw7LKrTniLhDQqYKnG2XjymJS+vD9dVeZ9ee53o5GQFAAF8ueRg6vZQFQaXRLBVEhbw9
         MOt+Kg7OP2GNeGfbB3a5HmdIuyg+Yzz5u60KS0f9G2GaQK/u8UDxvOmMAuehlsblrRNy
         my63aKbffaErWWiih3B047aoHEbCuzMcz0NIEZGwKgWMr979OE1GdrHeFSc287KWV84X
         VVRA==
X-Gm-Message-State: AFqh2kr4wGlgli17jvDiGs2XbtjaDZY276i6QsfgIVhjvv40ycp+mHRb
        w5aXBT4F+bJiWDGCrhoUa475+ZJbAqavbA==
X-Google-Smtp-Source: AMrXdXus1i2FveU/6Zq/LxMmNDoERziy1/gLJ8f5Xdp/N00bVRGT+bcIpSkWAuDAiGNzbFwpeiikxw==
X-Received: by 2002:a05:622a:4a0f:b0:3ab:5bbc:bbe3 with SMTP id fv15-20020a05622a4a0f00b003ab5bbcbbe3mr58601414qtb.19.1672648261776;
        Mon, 02 Jan 2023 00:31:01 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id v7-20020a05620a0f0700b006faf76e7c9asm20267658qkl.115.2023.01.02.00.31.00
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 00:31:01 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id 186so29588008ybe.8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 02 Jan 2023 00:31:00 -0800 (PST)
X-Received: by 2002:a25:d243:0:b0:702:90b4:2e24 with SMTP id
 j64-20020a25d243000000b0070290b42e24mr2730771ybg.365.1672648260480; Mon, 02
 Jan 2023 00:31:00 -0800 (PST)
MIME-Version: 1.0
References: <78b23407-bdd0-4b1b-bf6e-ecd4c00294ab@app.fastmail.com> <20221229113338.2436892-1-andrzej.hajda@intel.com>
In-Reply-To: <20221229113338.2436892-1-andrzej.hajda@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 Jan 2023 09:30:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVaq9Xg3HrqLo1x5SCuwtJBsczLjWAWmH=23ZtNf_e9hQ@mail.gmail.com>
Message-ID: <CAMuHMdVaq9Xg3HrqLo1x5SCuwtJBsczLjWAWmH=23ZtNf_e9hQ@mail.gmail.com>
Subject: Re: [PATCH v2] arch: rename all internal names __xchg to __arch_xchg
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
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Dec 29, 2022 at 12:34 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> __xchg will be used for non-atomic xchg macro.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> [m68k]

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
