Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D08C9C433F5
	for <linux-m68k@archiver.kernel.org>; Mon,  2 May 2022 08:37:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383793AbiEBIlU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 2 May 2022 04:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382649AbiEBIlT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 2 May 2022 04:41:19 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9A9E183AB
        for <linux-m68k@lists.linux-m68k.org>; Mon,  2 May 2022 01:37:51 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id h3so6016246qtn.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 02 May 2022 01:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GfOGQBmuow0XJRSClS83s9wqJs62SvttChLLjbwtT1k=;
        b=EGc5unuyHLKT3Kjoui+48XB1urSapZyFqrD2e1f+lWk4V3rGjljkYJkRzHyeMBi/TA
         TWJdbbw++lbJDvIdVbcsyljLcjpR0OHC0zix2Z4OQDOx8RChTpXsTeR3uX7B9SC0N5wF
         Lp69fOMaQoaMYBNyJaZgzn85Cfcf30TdVb/fqiWuZsahdZSnGtsKxCVtOyhuW9gHYrmF
         UOo+RAr0oNyx9ahVv76cqjZwgswjySPPgdJ5J/Y1nGIV01XTxsfrk9wC+aq2jhE00s9V
         Uw3Ey5PANQjcYIh7sJub1mEFOCWEqjutpDnE+Itaklvrn/g76ALe4AbxJtqzEbKgPTEY
         gTyg==
X-Gm-Message-State: AOAM533OOXQ357PcIw6LwOJ/03GyUi2Ql83/MRjONHHKfb8l4D6Nw7+T
        xeCVt/TaKH9k9KVQwuYSMA6C7BB/bwgf2g==
X-Google-Smtp-Source: ABdhPJx4bCMTp3DaXtpc4mZZHjrNXfXFQBpXEBCJNt+rbqag/inZ7//YQg9Kpc0CLSKUjVCbCSu+RA==
X-Received: by 2002:ac8:7d8c:0:b0:2f3:707e:650b with SMTP id c12-20020ac87d8c000000b002f3707e650bmr9195131qtd.499.1651480670559;
        Mon, 02 May 2022 01:37:50 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id h9-20020ae9ec09000000b0069fc13ce246sm3991918qkg.119.2022.05.02.01.37.50
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 01:37:50 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2ebf4b91212so140403167b3.8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 02 May 2022 01:37:50 -0700 (PDT)
X-Received: by 2002:a0d:d953:0:b0:2f7:d5ce:f204 with SMTP id
 b80-20020a0dd953000000b002f7d5cef204mr10194780ywe.502.1651480669896; Mon, 02
 May 2022 01:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220430191122.8667-7-Julia.Lawall@inria.fr>
In-Reply-To: <20220430191122.8667-7-Julia.Lawall@inria.fr>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 10:37:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX03F0zbGHik4zqqHZEu4Xwu7679HO9HHNcLRdr=0T9Bw@mail.gmail.com>
Message-ID: <CAMuHMdX03F0zbGHik4zqqHZEu4Xwu7679HO9HHNcLRdr=0T9Bw@mail.gmail.com>
Subject: Re: [PATCH] m68k/math-emu: fix typos in comments
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, Apr 30, 2022 at 9:11 PM Julia Lawall <Julia.Lawall@inria.fr> wrote:
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.19 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
