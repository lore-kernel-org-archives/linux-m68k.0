Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAC6C07E9D
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Sep 2022 10:12:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234960AbiIZKMZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Sep 2022 06:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235063AbiIZKLs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Sep 2022 06:11:48 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A596481E5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 03:10:48 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id w4so4020882qvp.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 03:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=CF2vupylMrVXkLI1Pe7H2d1pZD7KM4FL97tpjOkeLIE=;
        b=WN/xzlJlTF8U57Mnl+pzuV8+cxaJE0aJY9LMEDvSGmsLcZhTx9q7oi9iv0e9RDlLgy
         W9FrdEV8U5Fpd+4uJWc8p+wfF09cBLnzVOW8LFJ5jU5JwcuXw1sC9lYeGBnc9En/zVtK
         Ekf/YxnFwWA3ZrWdkNNY4oxYDAkdLKQafU8vAWOfctk7XcvWBM29tC6d2OQGe4UbxRjP
         uuL4fF08tch4Mqxh01KxaZ0CIEfHZDxhAPl6hidcfbQPOcvK1UwXHO3XM4PPMAkAazJU
         TxbnZDmlUSP8HFurIQ6jo1arKY4so6f3yvr8dVfrDC1eT/TcVZjbUQVPu39kSsUtF8Tr
         3ROg==
X-Gm-Message-State: ACrzQf0JPy8Sz2EPEENSzW5GgJ81ICoWZLpAH4yVm8NJsoBwc0CJiAj+
        OIgl0XxY+R79tj8Pj/9rfY8wf3YrAyn+qw==
X-Google-Smtp-Source: AMsMyM7Spa/1wHDzIaC173mNdpzl0n1OY7CF8t6Wj30uh1ODYZ7Lt75qcr+5mwZHWrZ+KL3TrTIVRw==
X-Received: by 2002:ad4:5bc5:0:b0:4ad:73da:6083 with SMTP id t5-20020ad45bc5000000b004ad73da6083mr17201215qvt.69.1664187047333;
        Mon, 26 Sep 2022 03:10:47 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id l15-20020ac8148f000000b0034456277e3asm10204977qtj.89.2022.09.26.03.10.47
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 03:10:47 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-3450990b0aeso62915037b3.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 03:10:47 -0700 (PDT)
X-Received: by 2002:a81:758a:0:b0:345:450b:6668 with SMTP id
 q132-20020a81758a000000b00345450b6668mr19048935ywc.316.1664187046779; Mon, 26
 Sep 2022 03:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220923170340.4099226-1-Jason@zx2c4.com> <20220923170340.4099226-2-Jason@zx2c4.com>
In-Reply-To: <20220923170340.4099226-2-Jason@zx2c4.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Sep 2022 12:10:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWT8dhre5TGjYRnEwn_jCZ6CXxvMpLmKp3KKo_CjPOXRQ@mail.gmail.com>
Message-ID: <CAMuHMdWT8dhre5TGjYRnEwn_jCZ6CXxvMpLmKp3KKo_CjPOXRQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] m68k: virt: generate new RNG seed on reboot
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Jason,

On Fri, Sep 23, 2022 at 7:03 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Rather than rebooting into a system with no entropy, regenerate the RNG
> seed before rebooting, so that the new system has a fresh seed.
>
> Fixes: a1ee38ab1a75 ("m68k: virt: Use RNG seed from bootinfo block")
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Thanks for your patch!

I still doubt this is actually guaranteed to work, as the memory containing
the bootinfo might be overwritten during normal operation.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
