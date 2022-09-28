Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A40C32771
	for <linux-m68k@archiver.kernel.org>; Wed, 28 Sep 2022 20:19:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234284AbiI1UTt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 28 Sep 2022 16:19:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234336AbiI1UTr (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 28 Sep 2022 16:19:47 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC1B2DCA
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Sep 2022 13:19:36 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id x18so8600666qkn.6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Sep 2022 13:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Q7UihWS8ORDR1BxKnz81VzSp5IRI1MlAxyRbPq+5h9k=;
        b=xPdECMhawz2inhRnHjdyu0gGDuF/WZ5ckf8n8d82O1Xyue/NLINxmVB2JO3qeJ7ESm
         YgJ3WIG82I2BuXvBlv99UVY0GdjWhwobfCrFgNp/DxGhIG6g44whu0PFM6KKOvk95dpx
         5a5WEKPnItEy69/VOYqI2GnA4+RdObPzlP+30BmbXIdws2vT4kHBE1efIEAd9kCS+7Pz
         r2VN3/u8ceNtquw7I3g2/je2YasyU2Z3ovIPYq4UnOWJHoUO6zfGCeyziRZfMM0YPp2f
         YFKjMzMEc/a1cT4JaIFVIiK7FajVl+6fsAS/g4xlMMLjGda9oKO98zJmdvLbOzpe32Xt
         efhw==
X-Gm-Message-State: ACrzQf3GXTCrQtIy7Clfg3MetQh9AzcbMS/hu+RIrNQ3FUg9pGudOlaS
        JU2kN31zrDJifQpacO0bXNrKGSK1ElCWHw==
X-Google-Smtp-Source: AMsMyM7aG/CJ/Pb01HeHwtKLYkK1+6SE7KpXsBKwkqnlk2O3MMI8cR/7nq8IMSNq1XGtYLlIFEid/w==
X-Received: by 2002:a05:620a:44cb:b0:6ce:b942:709f with SMTP id y11-20020a05620a44cb00b006ceb942709fmr22734481qkp.124.1664396374892;
        Wed, 28 Sep 2022 13:19:34 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id x204-20020a3763d5000000b006ce9d6e51f4sm3764226qkb.67.2022.09.28.13.19.34
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 13:19:34 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id e145so15505975yba.11
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Sep 2022 13:19:34 -0700 (PDT)
X-Received: by 2002:a5b:506:0:b0:6af:ffac:4459 with SMTP id
 o6-20020a5b0506000000b006afffac4459mr30086528ybp.365.1664396373995; Wed, 28
 Sep 2022 13:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220927130835.1629806-1-Jason@zx2c4.com>
In-Reply-To: <20220927130835.1629806-1-Jason@zx2c4.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 28 Sep 2022 22:19:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUeE-2+aAoNSMtySt6YSbbJB=OpdKD_LmuL9bDAYZgBew@mail.gmail.com>
Message-ID: <CAMuHMdUeE-2+aAoNSMtySt6YSbbJB=OpdKD_LmuL9bDAYZgBew@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] m68k: process bootinfo records before saving them
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Sep 27, 2022 at 3:09 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> The RNG seed boot record is memzeroed after processing, in order to
> preserve forward secrecy. By saving the bootinfo for procfs prior to
> that, forward secrecy is violated, since it becomes possible to recover
> past states. So, save the bootinfo block only after first processing
> them.
>
> Fixes: a1ee38ab1a75 ("m68k: virt: Use RNG seed from bootinfo block")
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.1 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
