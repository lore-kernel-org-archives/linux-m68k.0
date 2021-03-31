Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558C8C433ED
	for <linux-m68k@archiver.kernel.org>; Wed, 31 Mar 2021 15:00:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1921161008
	for <linux-m68k@archiver.kernel.org>; Wed, 31 Mar 2021 15:00:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236091AbhCaO71 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 31 Mar 2021 10:59:27 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:35754 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236085AbhCaO7S (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 31 Mar 2021 10:59:18 -0400
Received: by mail-ua1-f43.google.com with SMTP id j19so6229217uax.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 31 Mar 2021 07:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OSz6CJVoblhMY8XWXlg1kvvJ25J01Wnwx8w1J/DwPGI=;
        b=H0wLR9Mf9YTO3PXcnTMwP9dxLENxNuSXrP5ImIxyIJUt8XRm78wW2ZNizQ7yML4xBB
         yv/rkA6ZsGn01pUlMMUhPKor64ZC6hwI3m+BQBqqXO692FumNSTcAuU7zCZJwBhdjuqF
         Dwm/R1gpRXOFN+siyVYtfKChdnv3Gfqbve2fJxr+AMsUXFTJpH80dKNCjst5gOI5VNrs
         u0zmwx/deJC0YfMEV5iTuYs29E5CdUTbjaSPwRY/sSK7PJqwn4sC2Vp63IdvYXyvSdCy
         gS+G5ful4G+HVGPCzC0Go7/voK24GRNe0pQRw2YOifVpN+HZPYvhdtbH+UwdqzQZbuY1
         MpYg==
X-Gm-Message-State: AOAM532pcsrnKAitp2A5gxtCK9u5DcAj/pu6gTgWKhsRit7B7nj2Ff8W
        Lkk1viZOpF40p8dkuXxGllIWrYYkzJ0so/vieWc=
X-Google-Smtp-Source: ABdhPJzEmo+jaXA7S8yS/UF/SJmYHJFLOB/hurTZFxBIYrv1888gifZn3UHF5gKQrF1WMIIXGLgwWMxdEX3JjeWV9oA=
X-Received: by 2002:ab0:30b3:: with SMTP id b19mr1779026uam.58.1617202757611;
 Wed, 31 Mar 2021 07:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210331144336.25628-1-masahiroy@kernel.org>
In-Reply-To: <20210331144336.25628-1-masahiroy@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 31 Mar 2021 16:59:06 +0200
Message-ID: <CAMuHMdV2pR=rdN7ny_rLq8zCacFy9aw+hMuOQNnHcJ8q_nZYQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] m68k: remove meaningless $(OS_OBJS)
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Mar 31, 2021 at 4:44 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> 'git grep OS_OBJS' hits only this line. $(OS_OBJS) is just empty.

Indeed. All other users were removed in 2002.

> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.13 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
