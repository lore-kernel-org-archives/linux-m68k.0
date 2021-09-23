Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 372CEC433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Sep 2021 14:47:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B7BA61152
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Sep 2021 14:47:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241662AbhIWOtS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Sep 2021 10:49:18 -0400
Received: from mail-vk1-f171.google.com ([209.85.221.171]:38712 "EHLO
        mail-vk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241661AbhIWOtR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Sep 2021 10:49:17 -0400
Received: by mail-vk1-f171.google.com with SMTP id g15so2688007vke.5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Sep 2021 07:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O46kFOGWMCzi4PxqWPkyyZ1n2nuBvocSR+a4vgxNaCQ=;
        b=6brv931d+sULR+akL6mo21Dh35njzZpBKHECJzVMe9wT/+txuayHKsGqf3bxk8II3M
         +cw2OapZfaLhl6UW0UOsgWCVQ54q7Zw64FkAOzWxT4JCK0dspvhVjLTAbu2uniDJSjke
         0ZJfBu16TMwa0ik2b963kwoVxaiOO6spPkR2HBoINKxYsv85VzlOy8KwBPuMWQsUmq7N
         AsuSlpzZaopgqQptqcDLNCN2LXiokakaKjrWgLMLC0Y9PVoOops0Hm8snJK8mGnJVsDB
         hWxAVxswgapAIx0gmGVVxKmxq9dunnac7VLZsZMbrvcYes6iKVjI0YTX8ovveAjXO97r
         6fpA==
X-Gm-Message-State: AOAM532S/ctJLSk+WLjxp2/hoVL/3qhrHUA4AEZ1IgvcwKORY8b+j+PS
        s5eY8emSKaEGyZKTb/kdNXyIWPd6RQ1WS2z/bOg=
X-Google-Smtp-Source: ABdhPJwTPcwu6bHTj990X0xpAjv1llw+79GpsycZk6qJMtw21KOw3ckDzxIOA7+fkLV2zLvoV9DHoRsEmMuuWvbf2hU=
X-Received: by 2002:a1f:9187:: with SMTP id t129mr3807059vkd.15.1632408465110;
 Thu, 23 Sep 2021 07:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210916070405.52750-1-hch@lst.de> <20210916070405.52750-5-hch@lst.de>
In-Reply-To: <20210916070405.52750-5-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 16:47:33 +0200
Message-ID: <CAMuHMdWTcMZ_v_6ub7kCJ6jFKCrCVEWBwx2-ytwOH-tLKjvi2w@mail.gmail.com>
Subject: Re: [PATCH 4/6] m68k: factor the 8-byte lowlevel {get,put}_user code
 into helpers
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Sep 16, 2021 at 9:07 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Add new helpers for doing the grunt work of the 8-byte {get,put}_user
> routines to allow for better reuse.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
