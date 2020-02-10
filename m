Return-Path: <SRS0=gnDg=36=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E51CC3F68F
	for <linux-m68k@archiver.kernel.org>; Mon, 10 Feb 2020 11:16:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 62A3C2080C
	for <linux-m68k@archiver.kernel.org>; Mon, 10 Feb 2020 11:16:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbgBJLQa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 10 Feb 2020 06:16:30 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39087 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgBJLQa (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 10 Feb 2020 06:16:30 -0500
Received: by mail-ot1-f65.google.com with SMTP id 77so5907481oty.6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Feb 2020 03:16:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HdAxilYe8KD8dugXEEGfXakClyulMrqBVKReUZpkgWE=;
        b=i1egI/juyrRNKtXCa0oInzvnLOwEHN4bU1PFwW0FoaItdd+TyCMi1SkEjr/n+1SB29
         1Hy9HTs+c7uh90Tzmh8NCKGuYLZ6FLwSPv3lpPjiWRhqpwFc7gi01g492CGZ8naSCwPV
         Vx+smgmD5+sn4MWPpHiZF4y5HDRLlij8Abd4QWKHtid3Pkju5SUVwQQAke8dHdYcEzit
         rN+hed+IT22OxwuV1zneiaBD6TuZhz55QaCfWaiio2vM6WBjum2JGqsbnWQJLDTeIyx+
         U02NHnhD3krHVMoC+zpuet9pXUSNHLF6nlxF3B782YscJ030SN2wncO+mS9EMMTR3+Ta
         FXVg==
X-Gm-Message-State: APjAAAXyp/N9pYkuvpZ4VA1BhzGMZ4HiGFwAAJlvfloTs9wwtRTlG5ce
        hP5fXzrXNUa465zZNUYARbq84qT+HoU4kpHFYXM=
X-Google-Smtp-Source: APXvYqyetNy63oYOZHinAU/sOLwqx25PceWQ0RFStuq+WBFOFX1G0Sio06WE6u8OAavcpqcd0PvLoQPsNTZVNJH+F28=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr678554ots.250.1581333388498;
 Mon, 10 Feb 2020 03:16:28 -0800 (PST)
MIME-Version: 1.0
References: <20200131124531.623136425@infradead.org>
In-Reply-To: <20200131124531.623136425@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Feb 2020 12:16:17 +0100
Message-ID: <CAMuHMdX-Vj-ewD7Kh+d5FdRs16eebwtM6hykZH62ha0Wq8dukQ@mail.gmail.com>
Subject: Re: [PATCH -v2 00/10] Rewrite Motorola MMU page-table layout
To:     Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Peter, Will,

On Fri, Jan 31, 2020 at 1:56 PM Peter Zijlstra <peterz@infradead.org> wrote:
> In order to faciliate Will's READ_ONCE() patches:
>
>   https://lkml.kernel.org/r/20200123153341.19947-1-will@kernel.org
>
> we need to fix m68k/motorola to not have a giant pmd_t. These patches do so and
> are tested using ARAnyM/68040.
>
> Michael tested the previous version on his Atari Falcon/68030.
>
> Build tested for sun3/coldfire.
>
> Please consider!

Thanks, applied and queued for v5.7, using an immutable branch named
pgtable-layout-rewrite.

https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/log/?h=pgtable-layout-rewrite

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
