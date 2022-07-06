Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FF5C433EF
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Jul 2022 09:15:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233024AbiGFJPO (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232967AbiGFJPI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 6 Jul 2022 05:15:08 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D09DFA
        for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Jul 2022 02:15:07 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id f14so10626889qkm.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NyuJdlq0J6ZQ1JNEf5bqR4BNFIBiYk0Fgz9plyVNlpI=;
        b=hSB/iAKmWt5X8/kPW53tCkGWA0FvEe90p0LGydPbiLPj5g6CwEHuNVYblNVRlTdU9L
         14JnZK20YLT2X5HkcpQ4MBmULme0KdNcJTl/ihwWXsMfFMylNqwmvn+X4SFhh60b2ft5
         CI/iWI4Ptt0VcBtXE0NyikFYgixSLSRljuEj+XpRu30jDq2jvcoUMNhXoIY7bP93nFsh
         0zBPRr8toysRjXcuwiKe1IcNww2B8/umvNirPTHDMDWj0UdkSFoezOxfgI3sCMeZYBN+
         IiKer1AbbDdJxd0CzKsJH00tpydu4enGDZ6P46Qmg3re7H/FJxqol/cEpUI0huuIHwvA
         VMiQ==
X-Gm-Message-State: AJIora8TFW1fSFHn2Sotp/S6JK+c7/KwbnmptU7GTCPoek+PZs8OW50G
        1TK3h8NszHFoLNUq0ymLcvaFPAGNmeAi5Q==
X-Google-Smtp-Source: AGRyM1t6ZUotTvXcyWVC24+WGG+/ZDGsXy/CS17nlZ1cqZWwwFpGRSss9nMonKS5p4BQ+G/GYENofw==
X-Received: by 2002:a05:620a:2a0e:b0:6b4:68a0:39fe with SMTP id o14-20020a05620a2a0e00b006b468a039femr8899797qkp.3.1657098906358;
        Wed, 06 Jul 2022 02:15:06 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id j13-20020a05620a288d00b006a3325fd985sm31612991qkp.13.2022.07.06.02.15.05
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 02:15:06 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id l11so26248395ybu.13
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:15:05 -0700 (PDT)
X-Received: by 2002:a05:6902:1143:b0:66e:8ad6:34c with SMTP id
 p3-20020a056902114300b0066e8ad6034cmr5217971ybu.89.1657098905609; Wed, 06 Jul
 2022 02:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220630085037.72420-1-jiaming@nfschina.com>
In-Reply-To: <20220630085037.72420-1-jiaming@nfschina.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Jul 2022 11:14:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWg=8aAN6xup_MUy+3GvRuAOH2s55NQvXnNMdFk8Hr10g@mail.gmail.com>
Message-ID: <CAMuHMdWg=8aAN6xup_MUy+3GvRuAOH2s55NQvXnNMdFk8Hr10g@mail.gmail.com>
Subject: Re: [PATCH] m68k/mm: Fix spelling mistake
To:     jiaming@nfschina.com
Cc:     Sam Creasey <sammy@sammy.net>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        liqiong@nfschina.com, renyu@nfschina.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jun 30, 2022 at 10:50 AM Zhang Jiaming <jiaming@nfschina.com> wrote:
> Change 'writeable' to 'writable'.
>
> Signed-off-by: Zhang Jiaming <jiaming@nfschina.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.20 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
