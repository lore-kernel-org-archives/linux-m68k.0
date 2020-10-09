Return-Path: <SRS0=PEg3=DQ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F0DC433E7
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Oct 2020 10:10:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF8DA2226B
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Oct 2020 10:10:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731368AbgJIKKK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Oct 2020 06:10:10 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34741 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730142AbgJIKKK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Oct 2020 06:10:10 -0400
Received: by mail-oi1-f193.google.com with SMTP id n2so9693834oij.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Oct 2020 03:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VXgTAeNLVRwrvbBQvZBKH0svcGPL7IUxdBe/H8dLzzA=;
        b=F7Vws4tVp0V5MnMjLIFgbrK8Okj8n38mvfQxEYT4ag3ONNrSynGN6FEwDMoXJR2WLY
         pqf5gtYTHbg2vXIy9x9vTG97oYvNmANZdZKHTgSxAkP6GjrAET7zcwZ5IcLsND5l8NTx
         wUumLB+rrBA3vAzRYtF2k1AKS4ZudquRYBxA20stOAyqb26KdowLqE5mAzI5bEDIV9C1
         hW6U3CFWEDupgvF6FdVXC5pE6xa/YH/lA/elzwb8PkkQCCPIt7Jxxv3+DN6iFpkv85Ee
         VRFBA4b7tLVtJnkxTlDnu9ln2wQX0q9LbmuGGXYmilnroQwkTDjGS0h+gKscw0Js9OQs
         jrDQ==
X-Gm-Message-State: AOAM5304WusL9gUYahxujStYfLoizk8XHm8Cf6lZZoMYUfOBiwQjlRA3
        UFgSYusmJHhISKD6VpsAoJCmVDEoyqpIlnx2D14=
X-Google-Smtp-Source: ABdhPJzCiM2XmUWGqDX7CzY9RyUkC0BiX6GPjQTNsOIQ6Ki/UsmD18hb6kCuXY2SG1Dw7ubQLpxfUyUXadw8itY2Wco=
X-Received: by 2002:aca:4441:: with SMTP id r62mr1823303oia.153.1602238209569;
 Fri, 09 Oct 2020 03:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201009095621.833192-1-laurent@vivier.eu>
In-Reply-To: <20201009095621.833192-1-laurent@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 9 Oct 2020 12:09:58 +0200
Message-ID: <CAMuHMdXa=6xbSka9VYzwu1a1hDYufTcOCF=-Qdd9WGzU0vT4Gg@mail.gmail.com>
Subject: Re: [PATCH] m68k: remove unused mach_max_dma_address
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Roman Zippel <zippel@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Philip Blundell <philb@gnu.org>,
        Joshua Thompson <funaho@jurai.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        Sam Creasey <sammy@sammy.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Oct 9, 2020 at 11:56 AM Laurent Vivier <laurent@vivier.eu> wrote:
> This information is unused since the discontinuous memory support
> has been introduced in 2007.
>
> Fixes: 12d810c1b8c2 ("m68k: discontinuous memory support")
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.11 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
