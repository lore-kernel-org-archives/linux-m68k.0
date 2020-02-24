Return-Path: <SRS0=5FMB=4M=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F562C3567B
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Feb 2020 10:10:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAA9920838
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Feb 2020 10:10:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbgBXKKK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Feb 2020 05:10:10 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42873 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbgBXKKE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Feb 2020 05:10:04 -0500
Received: by mail-ot1-f67.google.com with SMTP id 66so8166186otd.9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Feb 2020 02:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Om7nrQID6FlX5mnR8/K/zRP8xkeIh57Aql009khB7UA=;
        b=D9gBkh799qsK41/RfWrmuPwNzgZvcGmUoM5waOCh8fthVqJRjvjO7wE97khPp+Zs7g
         jkAkgAnlMVdwAFTNZ0W+NAQMzMwBm/N3jM7gFJoVANoWl9qlsHUtwD20kAHDtlpYlG4V
         q1mlIjOZv2SZ+/hAfroPbwU7gVtUXw64CsaC8rZcmiXTIJOvt5+JlEXPCREybdwtMGD+
         w2uQhm9uXO4mtGM+Qc4DMxe46za8rBV1ljzTicTBaCuqCSoMGzZQaT4oGGNZK2oh4I7d
         MhSwvuoFX86hPku6Gg78s8sTyYGGtgDtS1729CYJALp+5sYxVfakeCw/yTNjz+saoYHZ
         gpiA==
X-Gm-Message-State: APjAAAUCs8IyViZeoUHtFJzRO6Mdfk1BzPacnDKQ8CPedsikVatHhNIQ
        pw/fZLJbbPZm5kP8ym61sKPP6ccVuIx6A6fSYSs=
X-Google-Smtp-Source: APXvYqy+o+XiQlh0QOaMvapvhpar/cq7MfutM+nGBFLIiCFASeVH1V3juGWAUqxFnDRUGQgq4DrqTaiwZyWthqnvpxI=
X-Received: by 2002:a05:6830:1d4:: with SMTP id r20mr24550265ota.107.1582539003523;
 Mon, 24 Feb 2020 02:10:03 -0800 (PST)
MIME-Version: 1.0
References: <1582525304-32113-1-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1582525304-32113-1-git-send-email-anshuman.khandual@arm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Feb 2020 11:09:52 +0100
Message-ID: <CAMuHMdXMSTLevTH1gkM8B53LtRUQ80o=t+W27z0QT-dNKkkYgQ@mail.gmail.com>
Subject: Re: [PATCH] mm/vma: Append unlikely() while testing VMA access permissions
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     Linux MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org, linux-csky@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Anshuman,

Thanks for your patch!

On Mon, Feb 24, 2020 at 7:22 AM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> It is unlikely that an inaccessible VMA without required permission flags
> will get a page fault. Hence lets just append unlikely() directive to such

Why? Isn't it the idea that you get a page fault when the page is not
accessible?

> checks in order to improve performance while also standardizing it across
> various platforms.

Does it make a difference to add these? Have you benchmarked this?
https://lwn.net/Articles/420019/

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
