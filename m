Return-Path: <SRS0=kwK6=CQ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1547C433E2
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 08:45:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FDC920732
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 08:45:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbgIGIpa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Sep 2020 04:45:30 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42972 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728290AbgIGIp3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Sep 2020 04:45:29 -0400
Received: by mail-oi1-f194.google.com with SMTP id x14so12947143oic.9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Sep 2020 01:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L+EHi2XR9MD4uz2c6qMrc9aO2txOuSKIm/lxpOY1Ydg=;
        b=VfSlm35jzqWLyuVa69PVcEu3Db3VHFvy/1605nuuaXgwZgw/xlrAJlMuijBxynuFdn
         8Ill0EX09MMmGJVOiL7Z0Qf3LwBzAFGvEj5dDCSVOhOnWL9KzzXn0jjkEQ0BP2BV1Q2o
         MnJET1glpSd7zvDD8vfrxDKDeIxp/7fBHrZGppW+LDERrUIoofLFF4Pdl5N80uuohv1l
         YbFLAWe4AIIBt0HEYyDlF1MlsT+/W5mhu7Z1p/iRujxWOgD1/j+Mqf8XbtT3VLVZ2Cl2
         28QrGr1EPCNlo4v3QzKWRpoKQ6BBxovtUWhgI11SzN1dm4Qk9RDjZRxbh+AUe+MCw1QV
         NEkw==
X-Gm-Message-State: AOAM5332amzm0Wirki8ffPftJaxZlVDyC44YJsz0/EqFAAvJxkTVqJOG
        Eeh/I+X1Y+8A3j8RZUL+mo3OdH8lfDQ3BI6ZmoYkQ9OI
X-Google-Smtp-Source: ABdhPJwLvEZ1MTxg/ftLIK+LwF+Qt5TKEIxtCyoZYcyHfoixAaB2x5MbsxABSqdOStHGVn3RCENRqiMG3Rje/OqtefE=
X-Received: by 2002:aca:4441:: with SMTP id r62mr795734oia.153.1599468328250;
 Mon, 07 Sep 2020 01:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200826125124.23863-1-geert@linux-m68k.org>
In-Reply-To: <20200826125124.23863-1-geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Sep 2020 10:45:17 +0200
Message-ID: <CAMuHMdVd=4dhv234z7y75ssMimAcAn1=GUOY4BzQ5+Rrrx1wcQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: amiga: Clean up Amiga hardware configuration
To:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Aug 26, 2020 at 2:51 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Move the generic Amiga hardware configuration section out of the
> switch statement, which allows to replace all ugly jumps by break
> statements.
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
