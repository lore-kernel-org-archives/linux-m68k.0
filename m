Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1F3C47095
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Jun 2021 04:06:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54B31610A1
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Jun 2021 04:06:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhFIEIK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 9 Jun 2021 00:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhFIEIK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 9 Jun 2021 00:08:10 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57554C061574
        for <linux-m68k@lists.linux-m68k.org>; Tue,  8 Jun 2021 21:06:00 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id z26so17388322pfj.5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 08 Jun 2021 21:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=iomXZtD/qsZqrP6kAHlwp1I+cFQWnfJ4iA8obm5XnzU=;
        b=tKN4F2mWufYcpFTkVzlROIYJhFdcdAar532CC84zCz7opPfxkP35eu2izEZlWslDE2
         mefDfzyNxBpMDtNPxmIUEgQ8f04ZJSXiNLU1rtCwnogZiEcfW+ZISotAfA8MIcwQTRUG
         lKMP79Ui6zGHdGTyRPQw9NZg/OorFz5CGiy+HvXWNJ3kuDcy/IWf1pGoIITdAPAwqnYL
         M2EtkfwfMUgvpdDyIpQXPtWyvL9V8B7XZ8FaLO1i2CyLjmbmzyxCem50fnNupAgaBk2Q
         AoCnsdDliteQaGpEq/QcWuBw8seA+BPalv6Xrl5PeDj66b4fChGYFj35mPJZyp+97kOI
         1kbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=iomXZtD/qsZqrP6kAHlwp1I+cFQWnfJ4iA8obm5XnzU=;
        b=L++NvXMi5+LterN+f0xueKh3ThMR1V/T0UAHbITnoVbJejUwnrVtb8Kw2WULpRTyXp
         k6S77dMWbL7XV1VQIFAYRSk4DYPBuWZuZpNY3LpUVMus68YFDztHrxY+/J3a0TEpmKsG
         +tA8UMitoYC/fnMrrluVuLBFBCPKGWaMux5zJYjYFLzMDbdge33HTkCexI+6vID3CK3a
         uJuE6nlLJHcVwh3nyPhCcQbv6tLEuV2JjYUbUJtKGhyLBkhHwr9fWlQCeVoDJ4yyH9ra
         W5qpKYf45Yts77jz+BQzuFY6FOhOSZpz6KSPOXnUBhnzumPNQ/tY5Bz96wq6/Db1fzHg
         L0NQ==
X-Gm-Message-State: AOAM532yvFnpIUeOAysgN4LCfyFByfaYOf0C2XxzS7Dv7+pQFlDZF48i
        C827/If/D27w7bGyXDGSI9A=
X-Google-Smtp-Source: ABdhPJz8N4dlxeNP+XaEz9efIvt2zfmp6mTZZ8KqCzGKMxyB4WW8sVPsRUL7bAc/UD6W+si7Qrr4Gg==
X-Received: by 2002:a63:1a49:: with SMTP id a9mr1725693pgm.63.1623211559859;
        Tue, 08 Jun 2021 21:05:59 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id j16sm3444027pjn.55.2021.06.08.21.05.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 21:05:59 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Use libata platform drivers to replace deprecated
 m68k IDE drivers
To:     Finn Thain <fthain@linux-m68k.org>
References: <cover.1623131194.git.fthain@linux-m68k.org>
 <YL+AqIEPjMgG519L@infradead.org>
 <d3c70f7a-368a-ad9a-6575-8289234b0ce0@kernel.dk>
 <36f7519d-698f-1284-551a-0dbd82e2a0d8@gmail.com>
 <1016d48a-a276-f7b0-49a8-4571f4f75a61@linux-m68k.org>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Christoph Hellwig <hch@infradead.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Joshua Thompson <funaho@jurai.org>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Richard Zidlicky <rz@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <e1099cb5-c83f-d259-d16d-c07e3a3dcdc1@gmail.com>
Date:   Wed, 9 Jun 2021 16:05:50 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1016d48a-a276-f7b0-49a8-4571f4f75a61@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 09.06.2021 um 15:53 schrieb Finn Thain:
> On Wed, 9 Jun 2021, Michael Schmitz wrote:
>
>> please note that Finn's patch depends on one of mine currently under review.
>> Without that one, Q40 support may break in certain cases.
>>
>
> AFAIK, that's only true for a configuration that enables both CONFIG_Q40
> and CONFIG_ATARI. In my tests with stock v5.12, such a configuration
> presently doesn't work correctly on Atari.
>
> This patch series doesn't make this issue any worse.

You're right, it's not a regression (that combination was broken before) 
, and there's no patch dependency or conflict either.

> Besides, I think it is a non-issue because the problem is so rare that
> no-one noticed it before I did, and the workaround for CONFIG_Q40 users is
> trivial anyway (disable CONFIG_ATARI).
>
> Is there really some benefit in holding up this patch series?

On second thought - no point in holding this up.

Cheers,

	Michael


