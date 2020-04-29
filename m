Return-Path: <SRS0=uzpD=6N=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14465C83003
	for <linux-m68k@archiver.kernel.org>; Wed, 29 Apr 2020 07:45:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2F692076B
	for <linux-m68k@archiver.kernel.org>; Wed, 29 Apr 2020 07:45:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgD2HpJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 29 Apr 2020 03:45:09 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:38564 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgD2HpJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 29 Apr 2020 03:45:09 -0400
Received: by mail-oo1-f68.google.com with SMTP id i9so222733ool.5
        for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Apr 2020 00:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rEZmeAk6jaK+T2WOTA1eNC+ayuAXk5EqXJwMbJKfWVc=;
        b=QfhWNs0PEc8FP2Jm7MI2y5NF729ScppKQblabavIebLUgGzBdmRW9JmvZdhtbHrOEK
         /yoa1YoiH6HvlcV5m2vU8gOb/dhLxsRzaoGIQosrK4WDIoxtuPijMakH7tUzPH7w6Syg
         fcxhKKL5d/DIKojZqA8/Biwb3dJYoqp2jk2dn3yJy1Jm3iCsN/5gYvAiXuZ74dLxcUtu
         Um4Y6DjNUmeGK8VijM1ilMTIgBokMdTv68/NtjAJhNZsTPmas0nuOnoKBmx0qT0Des4S
         FsaOqekpSx7IYX+WRN5gXs5IBjTxTsxV+buEwiZOlVAw0U4YOqniwKbxZWqnhrZDeQgY
         9Ckw==
X-Gm-Message-State: AGi0Pubnj/8JOUyUhJhGU7mwsLdToicrortPrgBzxsyLApvQK8FvyrU1
        J32sfl/xAMHc4XuaFov2EtpmkEuNyeQGUwKQSZk=
X-Google-Smtp-Source: APiQypIP3h/7moyhoQ8NqmMh0j1DwjTSMQmWJqAXa8x2R/o6FD1rPckgRmfvL+mogKMUh9WhHIH2d1grrdKwA3kzpE4=
X-Received: by 2002:a4a:eb08:: with SMTP id f8mr2660450ooj.1.1588146307169;
 Wed, 29 Apr 2020 00:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200428194449.22615-1-willy@infradead.org> <20200428194449.22615-6-willy@infradead.org>
In-Reply-To: <20200428194449.22615-6-willy@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 29 Apr 2020 09:44:56 +0200
Message-ID: <CAMuHMdXdHTm2gN2cZFupYpP=qn2ijAViyyQ6jaMGBNKNXMfiAg@mail.gmail.com>
Subject: Re: [PATCH 5/7] m68k: Thread mm_struct throughout page table allocation
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Linux MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Apr 28, 2020 at 9:45 PM Matthew Wilcox <willy@infradead.org> wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>
> An upcoming patch will pass mm_struct to the page table constructor.
> Make sure m68k has the appropriate mm_struct at the point it needs to
> call the constructor.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
