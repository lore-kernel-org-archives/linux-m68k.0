Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7F9C433ED
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Apr 2021 09:53:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 666AC611AD
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Apr 2021 09:53:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242339AbhDLJxi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Apr 2021 05:53:38 -0400
Received: from mail-ua1-f53.google.com ([209.85.222.53]:37798 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244132AbhDLJvd (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 12 Apr 2021 05:51:33 -0400
Received: by mail-ua1-f53.google.com with SMTP id s19so2850735uaq.4
        for <linux-m68k@vger.kernel.org>; Mon, 12 Apr 2021 02:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IO2DWy3AN/2hIxr0NwAXySR4KYGmjA07rlrAkv3+A7M=;
        b=Hogrc5/r8OyKygigCqgUX/s4RN5o7vyso+R1MjgCDyANEGYN+ZMUTLuzkKfcxY1XDG
         BvaVcDR5oKkb2UovkCp1z3wVAOtRZVxS/2h/rxmdksOKdSHfhKpELNtZi9AU1bz3hhB1
         kfXApwjXdkOjRNtfTZofDXFNjjpVuEg6dRCgWH9735IiPJqm8QvjdcwVyxg8m/X2hjAa
         ox9w0umCLiyIQp1CexCC2P9MAr6mUV4sD8C0NrwWbLqDfFOpykWVsdQdodFP2ldQrimR
         k5jA1XH5CeoidylycNhwIVJ2X69fzKS2pzcGdiE4ydsvXtzpl8vlpKmDrr+NM1RXjUHA
         QOVQ==
X-Gm-Message-State: AOAM5305XRHQEpjlgBPIn/fJlIWiUivbQAWtSYB7yfu/ZO8iYp8rgg7w
        SVQmPtC1NL+4in7PK8nduYbf3tZJP+uysMFsQ0+/8ftw
X-Google-Smtp-Source: ABdhPJyFaA+Y5WOpVUc5hV7c3VhCqVyIAGh1fv6hQ7Duxn6TV8z9Mfi1FDVzQr3bN1wYztg/oqSgog3/E6SyjYG3hyg=
X-Received: by 2002:ab0:3157:: with SMTP id e23mr17585715uam.106.1618221075136;
 Mon, 12 Apr 2021 02:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210228190828.392974-1-angelo@kernel-space.org>
In-Reply-To: <20210228190828.392974-1-angelo@kernel-space.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Apr 2021 11:51:03 +0200
Message-ID: <CAMuHMdW6bOpdZWjJEcXsEzaRRjib4voW7dXoE08GKLvygxzGUg@mail.gmail.com>
Subject: Re: [PATCH v2] m68k: fix flatmem memory model setup
To:     Angelo Dureghello <angelo@kernel-space.org>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Feb 28, 2021 at 9:12 PM Angelo Dureghello
<angelo@kernel-space.org> wrote:
> Detected a broken boot on mcf54415, likely introduced from
>
> commit 4bfc848e0981
> ("m68k/mm: enable use of generic memory_model.h for !DISCONTIGMEM")
>
> Fix ARCH_PFN_OFFSET to be a pfn.
>
> Signed-off-by: Angelo Dureghello <angelo@kernel-space.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

As this affects m68k-with-MMU, too, I have applied it, and queued it
in the m68k for-v5.13 branch.  But it should hit upstream before v5.12
due to Greg's pull request.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
