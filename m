Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46055CCA473
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Jul 2022 09:09:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233219AbiGFJJ2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233206AbiGFJJD (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 6 Jul 2022 05:09:03 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64BC7237CE
        for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Jul 2022 02:05:58 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id he28so17333561qtb.13
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NSGVQi5IKjbraoZnvUS5bTVf5cvEgksM+fBNwKEP++A=;
        b=aymWgHJvCrV8JbTcXp2YvY5qRKkN8D2DgxCjzpS1G7UXBFFvbXXe7XXwuKJ/JQpjXg
         LX4MZegrRQbJnfSUPbSYIHaU4eAkMIo652VVUc7fKdlNE6bMzaatE6W8ZUKIghwmPGCa
         m1kByaqQsp/VnXxJIvANrfoOMKx3fj1mwtdHXCHbvQ363KpIfjVdFaEJ0qGwny9No63W
         M+lqPKPEJgaiBIO7Y5nIEAgljyCGvSrSpAShyPgNCwo268BwsBzL8lztcdGDez9FNWNl
         AYefSck4PjXsUbPtL/Zsu5puQKxUKpxc4dDvPmAMB89DS4M4+srdf6ohZuG793pZY+PB
         voxQ==
X-Gm-Message-State: AJIora+16FhOpsmjXjZKdYvEr4TsOnm+1hDvGiPh1bPSHueYhwnG3sV8
        lpb9CgGGs22NfG8gxuz3eFTtSwSXu3ty/w==
X-Google-Smtp-Source: AGRyM1tm5yIt1DTIAcOkALDktUwYF1aKkqZrJyMIs5AcE1r/YGU86FVXycbpaTGOt6wb4oAVLM+eyQ==
X-Received: by 2002:ac8:5883:0:b0:31d:3d75:ffc1 with SMTP id t3-20020ac85883000000b0031d3d75ffc1mr18515105qta.302.1657098356881;
        Wed, 06 Jul 2022 02:05:56 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id g11-20020ac8480b000000b003051ba1f8bcsm23364110qtq.15.2022.07.06.02.05.56
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 02:05:56 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-31cf1adbf92so6475887b3.4
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:05:56 -0700 (PDT)
X-Received: by 2002:a81:9209:0:b0:31c:b1b7:b063 with SMTP id
 j9-20020a819209000000b0031cb1b7b063mr13226995ywg.383.1657098356032; Wed, 06
 Jul 2022 02:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <9df7a700-0744-3a9f-f925-48de994ba70e@vivier.eu> <20220626111804.330745-1-Jason@zx2c4.com>
In-Reply-To: <20220626111804.330745-1-Jason@zx2c4.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Jul 2022 11:05:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZ28mSeycCXMMtHchPNPY+yRC_=ysN4aTdA8OOJtHyXQ@mail.gmail.com>
Message-ID: <CAMuHMdXZ28mSeycCXMMtHchPNPY+yRC_=ysN4aTdA8OOJtHyXQ@mail.gmail.com>
Subject: Re: [PATCH v2] m68k: virt: pass RNG seed via bootinfo block
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Jun 26, 2022 at 1:18 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> This commit wires up bootinfo's RNG seed attribute so that Linux VMs can
> have their RNG seeded from the earliest possible time in boot, just like
> the "rng-seed" device tree property on those platforms. The link
> contains the corresponding Linux patch.
>
> Link: https://lore.kernel.org/lkml/20220626111509.330159-1-Jason@zx2c4.com/
> Based-on: <20220625152318.120849-1-Jason@zx2c4.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
