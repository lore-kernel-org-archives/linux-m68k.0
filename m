Return-Path: <SRS0=kwK6=CQ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49A8C43461
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 08:49:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66DD320757
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 08:49:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728343AbgIGIt6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Sep 2020 04:49:58 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46905 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728341AbgIGIty (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Sep 2020 04:49:54 -0400
Received: by mail-oi1-f196.google.com with SMTP id u126so12935484oif.13
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Sep 2020 01:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nv2gjf5qoPi2HtDlHA8cnrkF9O/rWavaJhhuMczBXTY=;
        b=d/CXwuL/I8cqmdXGITMKWZb1+KCHjLtncyT0sa969Z+XisffygE5xf4zMQEsoVH9pd
         EDTYDil7MhDXFLiZ+/PbIg/YahGHYMID69ySgu7XW4Vt3q0f5sOuTjOAapnMinKtLA7T
         ICwpCQCZZPARmZoAzg7OTUp+8ehG+/XdIg3kOnEADmlKD9GWUDwBRwdjFeY30+Mde5pA
         pufuRXds9WVcBizeb/dDO1T5DGqclzuSS3iRWLOrZwbLXFqrS3HQ625O/ajp+asg5IgN
         ddEALu/vRtRiDfjIn7LNt/SAjM/zrIyF+nd4JKs+nAwoSV4q3e9Re0m4yNCcOZJ1MnHn
         I7nQ==
X-Gm-Message-State: AOAM5307ggKfvyOk3J2zxK2ifncHzOcvy0r9VrWei2baIwlv4dA2uqDr
        eq3OXlAwf5XGcG1bTwgC3aO3a5CIgtBq9f8SNEXSpRMgdr8=
X-Google-Smtp-Source: ABdhPJxTLesV8cnuW1KqrJ13knxBNNS0KFiT5BLDyW7oRZ/gnSa8I6kNOKKW5C2E+QpV4k9bHR6J9NymBfMebMh3mO4=
X-Received: by 2002:aca:b742:: with SMTP id h63mr11348310oif.148.1599468593259;
 Mon, 07 Sep 2020 01:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200826130444.25618-1-geert@linux-m68k.org>
In-Reply-To: <20200826130444.25618-1-geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Sep 2020 10:49:42 +0200
Message-ID: <CAMuHMdWU7gqwEMqTZQz8JoOS1-_mrtic-sWGnSgB3umJhKW2SA@mail.gmail.com>
Subject: Re: [PATCH] m68k: mm: Remove superfluous memblock_alloc*() casts
To:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        Mike Rapoport <rppt@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Aug 26, 2020 at 3:04 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> The return type of memblock_alloc*() is a void pointer, so there is no
> need to cast it to "void *" or some other pointer type, before assigning
> it to a pointer variable.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks, queueing in the m68k for-v5.10 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
