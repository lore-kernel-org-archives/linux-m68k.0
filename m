Return-Path: <SRS0=kwK6=CQ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD9DC433E2
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 08:48:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 381EC20757
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 08:48:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgIGIsP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Sep 2020 04:48:15 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:35337 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbgIGIsP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Sep 2020 04:48:15 -0400
Received: by mail-oo1-f67.google.com with SMTP id k13so3123851oor.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Sep 2020 01:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AtYD4UoRySoM9KhU37kTz8JxnSV4bSKd+NMUzmY7q1s=;
        b=pXjr+cXTxAmbBO2m0lpT6Qu4Ph1kB6q1ifR/qxE13mPKWPycd+1Nk0I0eFDZDQaZBn
         O6PbtWUQDVSvyEzkJ/8nhK0FcOAuPPLwOHkNHRCvV1uDjZL0ae6BIDZQyA6dAjP0i+CM
         xfGWMWD4Q5Vgb0ozdljHBdAXYnUKLAICKxxOFlaBEeFsBGN+B/TbxXlsK3K/rGX/OtXG
         qKKBRTKwsf3d/kqfhAXyXRxLLiNk/NCiz8DBVVXCgclj86mELg3vN1oDXiRINd//luli
         yZllQ8fpsKuYdn6S1gMyve2eoamka2N3PGcCbG69AylTcy/+rWIqP1SIUdBbcm2yFGib
         oeCg==
X-Gm-Message-State: AOAM531+kHA91UWwuJxqPUwk5kKQSVtWs17+xruZEYBg7p/WH+7WiSS9
        cbqUuUkYHdxk27mlzLHGdx7YJcJz5EDcW1zVjfOx3yBg
X-Google-Smtp-Source: ABdhPJyQDtQfupQbcI/xUiI2iCvz/yJNxzV9OYTDWPgXBg8ae531TuVzol8RF7CReqYzvdkhvBjgZoHUGvgbNBM523E=
X-Received: by 2002:a4a:5403:: with SMTP id t3mr14453719ooa.11.1599468494094;
 Mon, 07 Sep 2020 01:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200826125259.24069-1-geert@linux-m68k.org>
In-Reply-To: <20200826125259.24069-1-geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Sep 2020 10:48:03 +0200
Message-ID: <CAMuHMdV7AJ+HX=XhRPhZ8OCDi7BhnTC+YN8wGjGo4hbQDZzteA@mail.gmail.com>
Subject: Re: [PATCH] m68k: Sort selects in main Kconfig
To:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Aug 26, 2020 at 2:53 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Sort the list of select statements in the main Kconfig file for the m68k
> architecture, to avoid conflicts when modifying this list.
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
