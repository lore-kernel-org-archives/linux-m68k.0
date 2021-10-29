Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C52DC433F5
	for <linux-m68k@archiver.kernel.org>; Fri, 29 Oct 2021 18:05:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78B12610CF
	for <linux-m68k@archiver.kernel.org>; Fri, 29 Oct 2021 18:05:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbhJ2SHm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 29 Oct 2021 14:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbhJ2SHl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 29 Oct 2021 14:07:41 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D07C061570
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 Oct 2021 11:05:12 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i13so13045851lfe.4
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 Oct 2021 11:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K6KCBeD/pNCG9HZQnIVtuH+wCZVkgQgovkR8K6qXsz0=;
        b=DK+Tp3O/3gtk6Mj6EirsKfvX8mAe0+szIVxVBHJaMcoxLOtuvV48Rqi0Ta0I9gUMTR
         F0btd8b3EQOXM97fEoJPbO3hLFaaM//stWMVDGe6zk5xsGZmTRz6EQE2YKHKyw7CXr/F
         N8UoFNI/13+/GBJUOvYX4fRekOCCnOhfYNR30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K6KCBeD/pNCG9HZQnIVtuH+wCZVkgQgovkR8K6qXsz0=;
        b=HPJdixRfxDFo07mUXkU7E9mzyQ2IQqG/kCrrYkW2CRTGEUGBuh9lXwY9BUJV/qAaJv
         RUsNTVrCrikey7OispYfgNSgiuZrxnjRtrPW1nY/ky/uD1jtmwMr4FexS/Ienh7lAJ4P
         zGbVhJlQB+CE5uU9ijfFOFZd++L46VH2cmkO6Xt5yZ+Hva4Qy7jO45qwgsoX0kkYNian
         FleIg+G0wy9rTP/sjjCB+ZxAzHWRW3M5pU2oPXyqVTgb0JEtbOJACylsIgWFfIZB8MGC
         U0Xl9lHahkmzecNXTxZZ6jEQcDeQbO14A+jyZxQnDeMw15sQhCmiLY35Xi3fmiX/IqIY
         h4JA==
X-Gm-Message-State: AOAM532hCGcz3hAiWjqkmqFRAgTj7eSwT4akczYzBhBuf5L9shWQhSVJ
        5oR02ZiWJlHuATXxhtA57v5WZSEHozGxmlWcYms=
X-Google-Smtp-Source: ABdhPJx1Nf5RPywvN5yOTjC1FV6XHj3c1GbjbHbIkVFEx+E+ZUUe0JYvDAoF3DqINJez4sPAycWCJg==
X-Received: by 2002:a05:6512:3887:: with SMTP id n7mr11924655lft.356.1635530710102;
        Fri, 29 Oct 2021 11:05:10 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id v10sm129506lfo.80.2021.10.29.11.05.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 11:05:09 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id u11so22643994lfs.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 Oct 2021 11:05:09 -0700 (PDT)
X-Received: by 2002:a05:6512:3993:: with SMTP id j19mr9826124lfu.402.1635530709299;
 Fri, 29 Oct 2021 11:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211029120709.79366-1-ulf.hansson@linaro.org>
In-Reply-To: <20211029120709.79366-1-ulf.hansson@linaro.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 29 Oct 2021 11:04:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgQLtvDh-3zhGNCWNAssubDxgxC+7RdEmHBmK_84rLT2Q@mail.gmail.com>
Message-ID: <CAHk-=wgQLtvDh-3zhGNCWNAssubDxgxC+7RdEmHBmK_84rLT2Q@mail.gmail.com>
Subject: Re: [GIT PULL] MMC fixes for v5.15-rc8
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-mmc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Oct 29, 2021 at 5:07 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
>  - winbond: Silences build errors on M68K

I think this one is wrong.

I think the problem is that m68k declares "claim_dma_lock()" in the
wrong header file. It's in <asm/floppy.h> instead of <asm/dma.h>

I'm somewhat surprised that this doesn't hit m68k in other places -
there are other drivers that use that same ISA DMA interface.

I've pulled this, but I hate how random that fix is.

(And on the topic of hate - the merge messages are just auto-munged
from the commit line - please spend a _bit_ more time on it, ok? Or at
least make it closer to proper English - things like "Re-enable card
irqs after a reset in tmio driver" instead of "tmio: Re-enable card
irqs after a reset")

              Linus
