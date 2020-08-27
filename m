Return-Path: <SRS0=O3TF=CF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B276DC433E1
	for <linux-m68k@archiver.kernel.org>; Thu, 27 Aug 2020 09:33:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F9E422BF3
	for <linux-m68k@archiver.kernel.org>; Thu, 27 Aug 2020 09:33:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728422AbgH0Jdx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 27 Aug 2020 05:33:53 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41007 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728372AbgH0Jdw (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 27 Aug 2020 05:33:52 -0400
Received: by mail-ot1-f66.google.com with SMTP id a65so3861433otc.8
        for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Aug 2020 02:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=erOE8TrBl8kvb1HNiu2tPG2od/TXcbDQmkj/FRCOogE=;
        b=YJWXmUdJQg9C0gGJ9Uc2yedEyjSIJWof7JOcg+MR6lGRUR4bHJbufjdDicUMckEWZ2
         Xh91tqg/lWesD19VV3Ld741YS+A4Q7sYGj7emCPWYlQM6PEpKZ1YYSOx97vSA5bkeXnr
         7DHORUuqUJ25Nf2Q33FpOvCadar0PFmfILZrJT0MBUlfzBU9aJnmZUXjwHzzdQrWRYg/
         A3rx38h1/G5rRtUjMT4Lta3dTkgyPg87ZMilwVO9UhobPBqdkJP2uZBVehWnj1j/u1rz
         A1+QJAGTJ5KkgytSNCcvI4fGQWapBxKIv8LWYS1rl51IM1bU+oWIr7tOD84njR1YLcD8
         Wuww==
X-Gm-Message-State: AOAM532ftg2oKP5MJY9iVsN3q+KhCrgimwioJycJ3AKMbhJ2dtaYBEq2
        aEt9MiOnEJXTmIRxCytni9qIF0zzO9fnWCmvGsg=
X-Google-Smtp-Source: ABdhPJzf5Rkx0MMkmy1DhlPa7m6zteOCzt6mslUfJ+2pjnLB14NhM0Z4C9ViJf9/MwLtHCDrl20l9yZOG5kwebfd3OE=
X-Received: by 2002:a9d:32e5:: with SMTP id u92mr11767634otb.107.1598520831934;
 Thu, 27 Aug 2020 02:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145249.745432-1-npiggin@gmail.com> <20200826145249.745432-10-npiggin@gmail.com>
In-Reply-To: <20200826145249.745432-10-npiggin@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Aug 2020 11:33:40 +0200
Message-ID: <CAMuHMdX5qo+2XpEm5QNbuwWRn508Ewee9rHYtmCBadj0x=3VnA@mail.gmail.com>
Subject: Re: [PATCH v2 09/23] m68k: use asm-generic/mmu_context.h for no-op implementations
To:     Nicholas Piggin <npiggin@gmail.com>
Cc:     Linux-Arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Aug 26, 2020 at 4:53 PM Nicholas Piggin <npiggin@gmail.com> wrote:
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

With the below fixed:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/arch/m68k/include/asm/mmu_context.h
> +++ b/arch/m68k/include/asm/mmu_context.h
> @@ -79,19 +76,6 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>         set_context(tsk->mm->context, next->pgd);
>  }
>
> -/*
> - * After we have set current->mm to a new value, this activates
> - * the context for the new mm so we see the new mappings.
> - */
> -static inline void activate_mm(struct mm_struct *active_mm,
> -       struct mm_struct *mm)
> -{
> -       get_mmu_context(mm);
> -       set_context(mm->context, mm->pgd);
> -}

Assumed switch_mm() in [PATCH v2 01/23] is revived with the above body.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
