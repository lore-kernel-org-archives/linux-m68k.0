Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8F8C77B73
	for <linux-m68k@archiver.kernel.org>; Wed, 24 May 2023 10:15:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232374AbjEXKPB convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 24 May 2023 06:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232495AbjEXKO1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 24 May 2023 06:14:27 -0400
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523C0BF
        for <linux-m68k@lists.linux-m68k.org>; Wed, 24 May 2023 03:14:01 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-ba1815e12efso671058276.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 24 May 2023 03:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684923240; x=1687515240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dz+M1KSdnKMmcmYWNiYwzrnxigtUcBsMNIJcHfr8PAI=;
        b=ZDBl7soyJIvvyTzaRdxHfbcjvXypyNwU2C49jYp53Yb2BCF/ckY7L2awfckukL+Ieo
         H+A36ZpRyNKYv+NTt7KawTaDU0If3lNlXTfid1GHFe4oX/wLyifLVfxZGajluodvnww5
         oVriq8s6lNXdpeEPhBwbQUBpXouNF4az/q/BMjhiClmfJiYjmsIe5I2pb2H09Dl2UP3N
         nAAvFT1CNCqjH2Hhlno0dVieqNL2Nyy12bUwlKi301fkOfkY8xlAlfOvmYEBsdiTc5fs
         HzNiW5E4lv+hFjxWNLNKAS99w2GtLVZ94HwKS9H5/4vtDvGzlRqfYK+ReWqPU6C1yLmO
         cHEw==
X-Gm-Message-State: AC+VfDyU4xJl1RXie4nUKwsA+cTvxPS2LAB0XsFOMr5nUNoTGb/dA2h/
        gw3OqkopP11kNAn5CHPpK5ikB0m8QU81Uw==
X-Google-Smtp-Source: ACHHUZ6S7B2jObygrSmjV0xj/RO2Y0xdAbGPPH7auGD7GYuMjykYe4DFe8LToMQO4H/Ool9VQIOoFg==
X-Received: by 2002:a25:dc14:0:b0:ba8:2009:ccbb with SMTP id y20-20020a25dc14000000b00ba82009ccbbmr18375171ybe.46.1684923240316;
        Wed, 24 May 2023 03:14:00 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id s99-20020a25aa6c000000b00ba87bc06fe5sm2494731ybi.52.2023.05.24.03.13.59
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 03:13:59 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-563b1e5f701so7030227b3.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 24 May 2023 03:13:59 -0700 (PDT)
X-Received: by 2002:a81:5ac3:0:b0:565:347a:46ee with SMTP id
 o186-20020a815ac3000000b00565347a46eemr6575440ywb.7.1684923239253; Wed, 24
 May 2023 03:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230503-virt-to-pfn-v6-4-rc1-v3-0-a16c19c03583@linaro.org> <20230503-virt-to-pfn-v6-4-rc1-v3-12-a16c19c03583@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v3-12-a16c19c03583@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 May 2023 12:13:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFX6vtiiNgZyXTLmhcxdsyOwRL3kb3tDZ4E_LUN2MaeA@mail.gmail.com>
Message-ID: <CAMuHMdVFX6vtiiNgZyXTLmhcxdsyOwRL3kb3tDZ4E_LUN2MaeA@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] m68k/mm: Make pfn accessors static inlines
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Vineet Gupta <vgupta@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Greg Ungerer <gerg@linux-m68k.org>, linux-mm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-cifs@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, May 23, 2023 at 4:05 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> Making virt_to_pfn() a static inline taking a strongly typed
> (const void *) makes the contract of a passing a pointer of that
> type to the function explicit and exposes any misuse of the
> macro virt_to_pfn() acting polymorphic and accepting many types
> such as (void *), (unitptr_t) or (unsigned long) as arguments
> without warnings.
>
> For symmetry, do the same with pfn_to_virt().
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
