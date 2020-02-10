Return-Path: <SRS0=gnDg=36=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46564C352A3
	for <linux-m68k@archiver.kernel.org>; Mon, 10 Feb 2020 11:16:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1EEE32080C
	for <linux-m68k@archiver.kernel.org>; Mon, 10 Feb 2020 11:16:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbgBJLQh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 10 Feb 2020 06:16:37 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35199 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgBJLQh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 10 Feb 2020 06:16:37 -0500
Received: by mail-oi1-f195.google.com with SMTP id b18so8853605oie.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Feb 2020 03:16:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/sHvRjYuAL4q04OfdHJ+J4i9kMPuAT9CKga2TRUxDO4=;
        b=fq15tK8z1GrLkkrD3NA+ZeF2s2zAneGWi3rsq1AIoc3zGThm0OdLK7ADasyiFTMJZT
         2FD/sC9zgam2rd6Y0fXAkM0nZIjdg2/cPosWto5crH5QCb35HvSDhSgtpm2OWQtuJJNT
         SP9/Jspoe8Q2xRdYdo3ZQMg6oBV7TJCud920nvLyAVHf6LO8ghufGLdh4+3iX+yaHtax
         RLvk3ViIFFXuvVBPdqoS35VxD8M2REqrMWCPGmkjIO44+lDJwOBfXg1zU7jl94ACFn2q
         S7GGbjPL6/j9sxc/ptbDFPsPhlcu7VR76Op1mF+20gHjXxPfGCEiGPco8k97Vb0mlHtC
         iKTQ==
X-Gm-Message-State: APjAAAUz8AuRYXCogd9eNdS4Cjpz2wDY1TzqfKyEW3T9vIFM//bz8bc1
        PqoIKso8LxsJuW8wM1DyTIjUn0YHZTxo0D+EH7AjyA==
X-Google-Smtp-Source: APXvYqxVly9H6sMpaOqTnMW9Bw7Nf5hff740J9szh6Ede/hJKAYSp6/bFoqs00kXUtv+Btr5ojSDw0VkjcRcFVMDmyw=
X-Received: by 2002:aca:b4c3:: with SMTP id d186mr463219oif.131.1581333396784;
 Mon, 10 Feb 2020 03:16:36 -0800 (PST)
MIME-Version: 1.0
References: <20200112164949.20196-1-geert@linux-m68k.org>
In-Reply-To: <20200112164949.20196-1-geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Feb 2020 12:16:25 +0100
Message-ID: <CAMuHMdVJuF=J3L7X6p4YWhMAEuRU5ynwYn2nwzRd+8COWPSGuw@mail.gmail.com>
Subject: Re: [PATCH 0/5] zorro: Miscellaneous cleanups
To:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Jan 12, 2020 at 5:49 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> This patch series contains miscellaneous cleanups for the Zorro bus
> code.
>
> Geert Uytterhoeven (5):
>   zorro: Make zorro_match_device() static
>   zorro: Fix zorro_bus_match() kerneldoc
>   zorro: Use zorro_match_device() helper in zorro_bus_match()
>   zorro: Remove unused zorro_dev_driver()
>   zorro: Move zorro_bus_type to bus-private header file

Thanks, applied and queued for v5.7.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
