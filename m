Return-Path: <SRS0=8jjU=AK=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546F9C433E1
	for <linux-m68k@archiver.kernel.org>; Mon, 29 Jun 2020 18:47:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4111E204EC
	for <linux-m68k@archiver.kernel.org>; Mon, 29 Jun 2020 18:47:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgF2SrU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 29 Jun 2020 14:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729134AbgF2Smw (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 29 Jun 2020 14:42:52 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18BE2C031C71
        for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2020 11:05:31 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id 12so8643986oir.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2020 11:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rX104BbGwOQ14WsCLGGZ1Udo7R4aRoXzrV5bYBGECLY=;
        b=lQERSX6qBi3SQkQHPgOrFJ+BMbTecIoLQ1A2vmIxPidpE48dxm+EEgN4iJYXPa4h+w
         43hRtTiGJgBDINXIe64UVF6ni2mwaBbICXKqTZlg+8WXPPcZpARfFdDHuUCwexgYOI6i
         QRFvwn8XdqctTbnqqnSZ10oi5kxVVy5/YLK9QQzimXczW2aorM8utN65LA1QCzEPEj4g
         LTSdyDbS8dTGw5ISMRP8B1Fq6zzOUVduH+IRlvQDaaUAuOK69R9V71zVMrmOcoHpjsy0
         pYFvHyioermsn6GPshrkJKYsEDtuJxmxUu4eI9I1xY1GhmcQf1cGybTk/LNBUKclDx3f
         vMIw==
X-Gm-Message-State: AOAM533ip8bSqkDrED+Q2aEhkdYKGVuOG+TH8ohQ99SVEpNUxukXfOnD
        3Urz5jLO4hrMSLv/xRi4zk6gT8xsJxVVQaQP6QA=
X-Google-Smtp-Source: ABdhPJwsvity5Fqa3Bi5hbSxakVB8FJykdbCncdXMItCKPpxk9NXvAeHCG+2YII5PZLpL5lQcwoU0I3VjdwnVcZx9k8=
X-Received: by 2002:aca:1801:: with SMTP id h1mr8338348oih.148.1593453930463;
 Mon, 29 Jun 2020 11:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200527133942.GA10408@embeddedor>
In-Reply-To: <20200527133942.GA10408@embeddedor>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jun 2020 20:05:19 +0200
Message-ID: <CAMuHMdUXaW9PwBcLwct5S=dUduN9drpZ5nMYdB_QvpVpeK=V1Q@mail.gmail.com>
Subject: Re: [PATCH] m68k: Use sizeof_field() helper
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, May 27, 2020 at 3:34 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
> Make use of the sizeof_field() helper instead of an open-coded version.
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.9 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
