Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FF3C433E0
	for <linux-m68k@archiver.kernel.org>; Wed,  3 Mar 2021 05:37:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5AEB64EC3
	for <linux-m68k@archiver.kernel.org>; Wed,  3 Mar 2021 05:37:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236110AbhCCFWR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 3 Mar 2021 00:22:17 -0500
Received: from mail-vs1-f51.google.com ([209.85.217.51]:39355 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376819AbhCBNin (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 2 Mar 2021 08:38:43 -0500
Received: by mail-vs1-f51.google.com with SMTP id p123so10584131vsp.6
        for <linux-m68k@lists.linux-m68k.org>; Tue, 02 Mar 2021 05:38:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S83xpZrRO2vsmOHrKP4fYqAMwPLcdiuf0B6CB48W+1Y=;
        b=hrgKSzD4em+hBEtpOPjw2ymQxATY0AobTXG0Qw2a1mPVP6h0H6VAdFh4H4WDtchjXw
         OChmx5fgQcdOUJKtddxztLHk4KVtJDgRpBGARuFZPD+q7iVDbe2v139DGa6epeLdxqqv
         NtMw27A5MTlr13aeT5WvwEl4KZ9YfvFUF6mg8H3a3KSmzeVW0CHxZNpgJSg4npNrPoUn
         9woIwA0c/TH8brU6Ob06x/SIa70dtpKUnU83WkYmGmBF2XzhLDc7pZi4jB8lPT+8rVyt
         LwLVJ0ENN8IXDjHitmsMT/5J4AxPMfHwFDiaQN6zi0U0EH8GQ4B6jFZ2Uvu/+RIL/M+k
         r2IQ==
X-Gm-Message-State: AOAM5317K76mVs5xAA1G0Ai3H4df21QFby+gAH8XOVYAl/3LgyYKl9Pa
        nPaTGwtPzvcGvYPqIX+DVjcHRDsEBBaXMb3izVU=
X-Google-Smtp-Source: ABdhPJwF1CH14dyYdQNyF0S76UdIAbCyxS08yhx/MaBD+X5Om8NSEqFnrUJiw9WD0G45PsGWhQNBQ4Xitb1TOVPdJkE=
X-Received: by 2002:a67:fe90:: with SMTP id b16mr2294947vsr.40.1614692274640;
 Tue, 02 Mar 2021 05:37:54 -0800 (PST)
MIME-Version: 1.0
References: <20210301142112.342909-1-masahiroy@kernel.org>
In-Reply-To: <20210301142112.342909-1-masahiroy@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 2 Mar 2021 14:37:43 +0100
Message-ID: <CAMuHMdWyxwqYp_xV17ESJtRZ19iGT1Bsm8YrxpGuXcRQiBiSEQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] m68k: syscalls: switch to generic syscalltbl.sh
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Mar 1, 2021 at 3:21 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> Many architectures duplicate similar shell scripts.
>
> This commit converts m68k to use scripts/syscalltbl.sh.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.13 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
