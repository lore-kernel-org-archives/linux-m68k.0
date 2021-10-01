Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56842C433EF
	for <linux-m68k@archiver.kernel.org>; Fri,  1 Oct 2021 22:59:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31F9261AD1
	for <linux-m68k@archiver.kernel.org>; Fri,  1 Oct 2021 22:59:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbhJAXBK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 1 Oct 2021 19:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbhJAXBJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 1 Oct 2021 19:01:09 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8A7FC06177E
        for <linux-m68k@lists.linux-m68k.org>; Fri,  1 Oct 2021 15:59:24 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id p13so11778827edw.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 01 Oct 2021 15:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YA12nK83s/TNYLDvQwUFF9PY5FM7hou6RsLv5OdhbxM=;
        b=bm/wO19DYmJWBUdZP9xxncVfqB6iNgJZredpzXZSB21J2YFKEaJzMrEl+hBmitM96x
         8594UGy041h6SjDS5W8vXYue3MYSoXxiimvB5F6taMnVfvAWT/0e28ehG20FStAaJT/e
         ZYgL0jSmxOGW1QTivg8FLAS/E+hFNf3c4W94P3nlXvkvf/A5w1Ul4j+E7KGLz6O8qdbR
         jlLkyaLVPA4KtiFkxK2c5Czuyg4JSdJ9/LBgY1E+jCBYZ2RFZ6syqkr9xYRFoI8i6yYJ
         95D8qpQXN8kGF0VROtIkgpqWt2/wf0x/bFlGsfH2+w7Ru2kkfwvxRlGusb7UKSIWD4nZ
         0h4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YA12nK83s/TNYLDvQwUFF9PY5FM7hou6RsLv5OdhbxM=;
        b=HstxcheYMiCILYKXr3P31vIuFbEVUmuvLStAbnvSSMqISCbwdKg1Pq41nYhnGJEaNM
         u5MOqtvrPWB/l/WL+hDsfo7Vo9XXGxxxl0gRbwvm24TMRN37jqSFXTAceD8erpPC2UaW
         5Lu4w+STHBzzuLUniCpFBBIFJuJ7c+t3nV0JxJ7Kl67gigWsc5FSw2BRK4/S4UTqIHdC
         bFMl0f5zWg/krbk5h0blL3GyZ4PcwDuxr48jIV2cPUtCo7l2bQ9GKRRyFJUXQb4nxfLC
         xj+qy+Lt3i4Oh48NTAv9QF8L6bSxLisJl5VoZOCA1xl58EMmYLkBpWicarWchCGxltvA
         u8qg==
X-Gm-Message-State: AOAM5339HeNfK9PmcqJMQGhWdmhMQuH6eSDdTap4AHv+P9ztVkGk06Ue
        30t3KXiak09I1ftQUPANfFrMwCB7ZFKHQUO1SaU=
X-Google-Smtp-Source: ABdhPJwWpDj5kHygwCCXM/715fS54f0YYUA5tYC9om9/vZhii3Qu5fpOpoaBBnG6byRP+Sm5G02E3QFHQIArOY0rCmw=
X-Received: by 2002:a17:906:3157:: with SMTP id e23mr683027eje.29.1633129163457;
 Fri, 01 Oct 2021 15:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211001213228.1735079-1-kuba@kernel.org> <20211001213228.1735079-2-kuba@kernel.org>
In-Reply-To: <20211001213228.1735079-2-kuba@kernel.org>
From:   Max Filippov <jcmvbkbc@gmail.com>
Date:   Fri, 1 Oct 2021 15:59:12 -0700
Message-ID: <CAMo8BfJja6c+Pppygk7kkuoALJqEcKZAkjpinO5Y7SRj9c1vow@mail.gmail.com>
Subject: Re: [PATCH net-next 01/11] arch: use eth_hw_addr_set()
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        netdev <netdev@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
        Chris Zankel <chris@zankel.net>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Oct 1, 2021 at 2:32 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> Commit 406f42fa0d3c ("net-next: When a bond have a massive amount
> of VLANs...") introduced a rbtree for faster Ethernet address look
> up. To maintain netdev->dev_addr in this tree we need to make all
> the writes to it got through appropriate helpers.
>
> Convert misc arch drivers from memcpy(... ETH_ADDR) to eth_hw_addr_set():
>
>   @@
>   expression dev, np;
>   @@
>   - memcpy(dev->dev_addr, np, ETH_ALEN)
>   + eth_hw_addr_set(dev, np)
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> --
> CC: Geert Uytterhoeven <geert@linux-m68k.org>
> CC: linux-m68k@lists.linux-m68k.org
> CC: Chris Zankel <chris@zankel.net>
> CC: Max Filippov <jcmvbkbc@gmail.com>
> CC: linux-xtensa@linux-xtensa.org
> ---
>  arch/m68k/emu/nfeth.c               | 2 +-
>  arch/xtensa/platforms/iss/network.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

For xtensa:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
