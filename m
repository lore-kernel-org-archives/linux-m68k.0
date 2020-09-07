Return-Path: <SRS0=kwK6=CQ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B73C43461
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 08:48:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 519D720757
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 08:48:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728165AbgIGIsz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Sep 2020 04:48:55 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:34678 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728158AbgIGIsz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Sep 2020 04:48:55 -0400
Received: by mail-oo1-f66.google.com with SMTP id o20so824701ook.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Sep 2020 01:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=on9KmRH6DMVHO9fHrpOEj4xnTOOHT8S0iERDSyzY9js=;
        b=hzbKJ65Bmfmd9tTnB1zEbyoL6tHsg5LL8g3FHGDFPusx7+v4hUVph4f7PaSb2ayf0d
         1mk6CU9+gLY3R1fhohwPr0VlRR57DuLtcFCyAkqOGDYIXQH4T8LuRV2LpK1dO9dDVCxG
         rHvdfza486Y0Cq8nX7HFndpqJVoYeMPUd0xwT44mKWMuhfyGxXxD2LockDmtdnrAqkBL
         PJIP5H6LklBHN6qr9KJo9vbLadLIRzxLmUMHz5P0vdlnKc2YOkiYjYfi+n6O3nKmvuPT
         XyhmsjBB/og2lyIMhi+mPJ6CJvZkioYLxjKV55hh/sTNuwqdoXb/YxrwbXSwaMaSydED
         6w5w==
X-Gm-Message-State: AOAM533rvF/PKhDp1fQ0vBO7Cks9qAxzgywmPvmtSVZbqUnhyGbpSoEj
        15Mw1Mj2+376fffIJMLrRjMSVNCPTI40bYvmrX4I7NGg7S0=
X-Google-Smtp-Source: ABdhPJz1aOVXyCVRgUTI6L8X21Ho1uD/s+my3a/lNoe1APa1MVqzndeSETpGkqzwMTfGrSFSEzgf6g8P42wdA5W3lz8=
X-Received: by 2002:a4a:da4e:: with SMTP id f14mr14285911oou.40.1599468534657;
 Mon, 07 Sep 2020 01:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200826130103.25381-1-geert@linux-m68k.org>
In-Reply-To: <20200826130103.25381-1-geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Sep 2020 10:48:43 +0200
Message-ID: <CAMuHMdWzzWBhdsDVgQR11vmQufj+dwi7SLvmrNrLEf74qVrbgQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: mm: Use PAGE_ALIGNED() helper
To:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Aug 26, 2020 at 3:01 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Use the existing PAGE_ALIGNED() helper instead of open-coding the same
> operation.
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
