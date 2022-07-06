Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C88CCA480
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Jul 2022 09:43:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbiGFJnW convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231280AbiGFJnN (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 6 Jul 2022 05:43:13 -0400
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 210A1100F
        for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Jul 2022 02:43:13 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id z13so17431682qts.12
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pRz2jWZB6HIclNCCKe7glsz7OicgZC4tCqDwAaHaMfM=;
        b=ueAN/e7PISLFJIX64FM8fSrLN3Ni9Ao4VgIAeuEaYpUTc8YZ5y/fLGDWVe1TUgN1ML
         yjxiec85Ydjv8R+jZR2dM9GkTLu9ezfLaUHjXfqov/3EziJoHeiARSpdj4/GYbGSORLZ
         nV4NAvYm53Q7PQgUe9w5NAfyHADem0rljOwlea+K2RRk0GA8ZJPrLLp/Rx5nRBSj2ENY
         5hIj0ep/kMC4n5JKFCfYgv/x26TMRDTbXkjBkuSJmx03aTiuf/BMztex+vOwLj2mcQxD
         h/oimCVBedl2NQ9gfVI6e4sE8o/eZPAnJbQBPiS/WfN2osbG5yPC8EjKiGttHhnwMANe
         XStA==
X-Gm-Message-State: AJIora9S4axRZFiTCxH07GFRH06n2PjN5fzhSp0lBqoJANt++vCLhBnQ
        K6jXMN6dYQ6da/qlV4XgvJ4m1C0EVC3SOg==
X-Google-Smtp-Source: AGRyM1v0HW+Qt1iIG6R4nIJ/erHwaJRMm15YbY5a+n8J9ZBCQmgbCL6Yp2BVyqsfwqN7er1emz6ukQ==
X-Received: by 2002:ac8:7d11:0:b0:31d:3808:434b with SMTP id g17-20020ac87d11000000b0031d3808434bmr21200621qtb.537.1657100592194;
        Wed, 06 Jul 2022 02:43:12 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id l28-20020ac84cdc000000b00304f98ad3c1sm23394120qtv.29.2022.07.06.02.43.11
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 02:43:11 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-31c8bb90d09so80429677b3.8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:43:11 -0700 (PDT)
X-Received: by 2002:a81:9209:0:b0:31c:b1b7:b063 with SMTP id
 j9-20020a819209000000b0031cb1b7b063mr13401471ywg.383.1657100591485; Wed, 06
 Jul 2022 02:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <38f8aed1.9df.180eaccb295.Coremail.chenxuebing@jari.cn>
In-Reply-To: <38f8aed1.9df.180eaccb295.Coremail.chenxuebing@jari.cn>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Jul 2022 11:43:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkBpea2eTo6EiPgv=GbSHQnsH=7cp7Nujv-or0s6q1vQ@mail.gmail.com>
Message-ID: <CAMuHMdUkBpea2eTo6EiPgv=GbSHQnsH=7cp7Nujv-or0s6q1vQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: Use strscpy to replace strlcpy
To:     =?UTF-8?B?6ZmI5a2m5YW1?= <chenxuebing@jari.cn>
Cc:     kch@nvidia.com, Jens Axboe <axboe@kernel.dk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Finn Thain <fthain@linux-m68k.org>,
        Laurent Vivier <laurent@vivier.eu>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Xuebing,

On Mon, May 23, 2022 at 9:09 AM 陈学兵 <chenxuebing@jari.cn> wrote:
> The strlcpy should not be used because it doesn't limit the source
> length.  Preferred is strscpy.
>
> Signed-off-by: XueBing Chen <chenxuebing@jari.cn>

Thanks for your patch!

> --- a/arch/m68k/emu/natfeat.c
> +++ b/arch/m68k/emu/natfeat.c
> @@ -43,7 +43,7 @@ long nf_get_id(const char *feature_name)
>         char name_copy[32];
>         size_t n;
>
> -       n = strlcpy(name_copy, feature_name, sizeof(name_copy));
> +       n = strscpy(name_copy, feature_name, sizeof(name_copy));
>         if (n >= sizeof(name_copy))

You forgot to update the error checking: on failure, strscpy()
returns a negative  error code.  This is assigned to (unsigned)
size_t, hence will be larger than sizeof(name_copy).
So the check will still still work, but it is non-obvious.

>                 return 0;
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
