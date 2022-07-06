Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF48BC43334
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Jul 2022 09:30:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbiGFJaR convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbiGFJaQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 6 Jul 2022 05:30:16 -0400
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19661F612
        for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Jul 2022 02:30:14 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id g1so10587958qkl.9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=X0E6/6svoPI75a545bMY+0MRF9DfMtB/2WCtrH+xzXg=;
        b=1f3eoHcoH8yyQcnS+cdWZn/v6yvTI8gvJPLqy9Jh0YFgRPRjjqYWMpYHnGuQNQ8cXv
         qscIoE7gLAhvPttIbRYpuUAM6hYfLeAsUYMc2k5fUZekUA2F9ugLRidlSHadHiq3p5ub
         rl4u72vKMKEUrXialph3carqp7RUuDbbQq1sJDQFkd/Lrk31av26AbgiNQ1KlVNvwgjH
         2FXgT0Jg8cZ0142byTcNNWmPobw+bMQtLvijoHqK+jW+z0xUbtzs5GVOEjCaO2MqDlXC
         kFAkZnAV3xt+I8mzotXfVi54557r7ajrGucHw5MEDDB1gNPFOMdvHOOsexl47o+5Zngn
         IMtg==
X-Gm-Message-State: AJIora+MFSSkOq4JDDeI1FqC7mdDCUuFxdNInBG/j23By7bVUO253649
        FZRA8sEfYbVjpnsOx2xF5kd/N34z5OMRJQ==
X-Google-Smtp-Source: AGRyM1tFOWPMs+7J9kDnS2Qd/a6CPtKjtpz8HopfhLIFKvTpcTIThKSKHct1BHl/bUqCsgYOaFlTiw==
X-Received: by 2002:a37:dc41:0:b0:6af:6857:69b3 with SMTP id v62-20020a37dc41000000b006af685769b3mr26339023qki.150.1657099813817;
        Wed, 06 Jul 2022 02:30:13 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id bl10-20020a05620a1a8a00b006a67eb4610fsm29763178qkb.116.2022.07.06.02.30.13
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 02:30:13 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id j7so20002330ybj.10
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:30:13 -0700 (PDT)
X-Received: by 2002:a05:6902:701:b0:66e:a06d:53d7 with SMTP id
 k1-20020a056902070100b0066ea06d53d7mr788860ybt.604.1657099812787; Wed, 06 Jul
 2022 02:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220527115345.2588775-1-amadeuszx.slawinski@linux.intel.com> <20220527115345.2588775-3-amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220527115345.2588775-3-amadeuszx.slawinski@linux.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Jul 2022 11:30:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVnXGg4T3j5n9PUg6i60-vza1bjNiVp9wqNSqHccMc=-Q@mail.gmail.com>
Message-ID: <CAMuHMdVnXGg4T3j5n9PUg6i60-vza1bjNiVp9wqNSqHccMc=-Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] m68k: bitops: Change __fls to return and accept
 unsigned long
To:     =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= 
        <amadeuszx.slawinski@linux.intel.com>
Cc:     Vineet Gupta <vgupta@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Guenter Roeck <linux@roeck-us.net>,
        arcml <linux-snps-arc@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, May 27, 2022 at 1:53 PM Amadeusz Sławiński
<amadeuszx.slawinski@linux.intel.com> wrote:
> As per asm-generic definition and other architectures __fls should
> return and accept unsigned long as its parameter.
>
> No functional change is expected as return value should fit in unsigned
> long.
>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.20 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
