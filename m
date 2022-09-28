Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4ADC04A95
	for <linux-m68k@archiver.kernel.org>; Wed, 28 Sep 2022 20:20:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234594AbiI1UU0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 28 Sep 2022 16:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234599AbiI1UUQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 28 Sep 2022 16:20:16 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD0396FA29
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Sep 2022 13:20:04 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id s13so8828718qvq.10
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Sep 2022 13:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=910BBTQr5adgJwQHpSIQOnfPtqGf4FO7r1/P+t7eo0c=;
        b=JJhosbgw7HylvecPy+51Vto7GdCimgoDTlid2gBZwZPuD6d5tPhkaOox8TN5QTWEK8
         RF63L/gU9L5TLqm8KIwt9Ejk/vkjkQYdmW77E2meBexzowUD8JSHpGzqFaxXNLtAJ8Te
         vBfFyGCZ9iqdfNrlK1pM1UndvjZ5UMKruyuOhLZ2kYMQtNNZA9pF2WxovFagMpGruJBh
         /bZmid0gxIHpe0bwOV/ahogKIjNPJmi1bToRm4eENVd84MQTK0lxzck10pL7A2otx30f
         Y/A/FjuFt/605dZHyUxYsR4I6PSElhExwOoNha5orCDZ4hd2Fmnu6dQbLfJ48Dz58NYb
         GKXQ==
X-Gm-Message-State: ACrzQf2UZFoMGRd6J+/TOhrugjWT9jCTjGyiWrqscuAbqqTh3zG3vkUF
        HUEFIymlhup6eCooB/ymGl8PXdi4aIqeLA==
X-Google-Smtp-Source: AMsMyM6n1NMqhGVao6a+tnFA10nrKGBBqwiQAb2gX55IEoTo1ggdn7WlIG2SNmJrKqEutg46jCAk8Q==
X-Received: by 2002:a05:6214:e49:b0:499:1500:4e3 with SMTP id o9-20020a0562140e4900b00499150004e3mr27661365qvc.26.1664396403082;
        Wed, 28 Sep 2022 13:20:03 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id o13-20020a05620a2a0d00b006ce622e6c96sm3843716qkp.30.2022.09.28.13.20.02
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 13:20:02 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id e81so17290753ybb.13
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Sep 2022 13:20:02 -0700 (PDT)
X-Received: by 2002:a25:8e84:0:b0:696:466c:baa with SMTP id
 q4-20020a258e84000000b00696466c0baamr30857137ybl.604.1664396402294; Wed, 28
 Sep 2022 13:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220927130835.1629806-1-Jason@zx2c4.com> <20220927130835.1629806-2-Jason@zx2c4.com>
In-Reply-To: <20220927130835.1629806-2-Jason@zx2c4.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 28 Sep 2022 22:19:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxQYYRh9oa-Ro791RynVrPZT07u9-HrFLe8RR-+Vj3_A@mail.gmail.com>
Message-ID: <CAMuHMdUxQYYRh9oa-Ro791RynVrPZT07u9-HrFLe8RR-+Vj3_A@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] m68k: rework BI_VIRT_RNG_SEED as BI_RNG_SEED
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Sep 27, 2022 at 3:09 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> This is useful on !virt platforms for kexec, so change things from
> BI_VIRT_RNG_SEED to be BI_RNG_SEED, and simply remove BI_VIRT_RNG_SEED
> because it only ever lasted one release, and nothing is broken by not
> having it. At the same time, keep a comment noting that it's been
> removed, so that ID isn't reused. In addition, we previously documented
> 2-byte alignment, but 4-byte alignment is actually necessary, so update
> that comment.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Fixes: a1ee38ab1a75 ("m68k: virt: Use RNG seed from bootinfo block")
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
