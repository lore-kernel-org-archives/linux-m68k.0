Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F0DC433E0
	for <linux-m68k@archiver.kernel.org>; Wed,  3 Mar 2021 05:47:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B08E564EBB
	for <linux-m68k@archiver.kernel.org>; Wed,  3 Mar 2021 05:47:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237146AbhCCFgg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 3 Mar 2021 00:36:36 -0500
Received: from mail-vk1-f180.google.com ([209.85.221.180]:40243 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381487AbhCBNjC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 2 Mar 2021 08:39:02 -0500
Received: by mail-vk1-f180.google.com with SMTP id s12so2798176vkh.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 02 Mar 2021 05:38:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XWZdpcHeT1R5sfyhKtA1mnaVc79LvHvbhW8TOXbn9wc=;
        b=g4CZPKjkeHgTV5lb6c/4jdyd2tnXjXz2wVDfuR16PYc4vAO/5vb5s+FK55RxGPPGAL
         FmWvlGi7GztFfIJGqIqwE5+bcYuZGyKsn7mnxXHo3D5H3b2061ZfaETRYgfaTao13hkK
         pNFGs+Srt6bfqrwVCtiQeB+aq6MlTAuSKJ6CNpnNsHfKf/mcmF+e3fjzoHLQGfWWelMy
         N7hzwZJ8gVWxAKC4n5+N9r0PiOyhthiMEkRoR5i7fa8NayFH2TZQxt9DQMPvzUmFmEmM
         DxhKZChFT1Oj+a6yhG3D7MxTZc9Vx7xqJq0tpncjBKxhQ81TUBc6w9XhLK0UOisfO2sb
         OJAw==
X-Gm-Message-State: AOAM5324f8wvhUQNerPvPdu0aphXm/6eH7OJn6FO0PYMpNBLpi35eVrJ
        Ql3z85IsZAOwIMGhLnI6pe7ws2wQJplVBuDu9qM=
X-Google-Smtp-Source: ABdhPJxCMLNnvIMpxGkp46lwLCQC8YS9/rNk7SISZi9kiUH74flgaNTrLvNlEzYxgSxCv3sy/kMsovOd5ffHohzqSuQ=
X-Received: by 2002:a1f:2502:: with SMTP id l2mr1949221vkl.5.1614692299993;
 Tue, 02 Mar 2021 05:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20210301142112.342909-1-masahiroy@kernel.org> <20210301142112.342909-2-masahiroy@kernel.org>
In-Reply-To: <20210301142112.342909-2-masahiroy@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 2 Mar 2021 14:38:08 +0100
Message-ID: <CAMuHMdVBci8Xsiq2-R++chr3oK9Xd3SFRBpnJsMcr3Tfzj8jdQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] m68k: syscalls: switch to generic syscallhdr.sh
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
> This commit converts m68k to use scripts/syscallhdr.sh.
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
