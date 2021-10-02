Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F85C433EF
	for <linux-m68k@archiver.kernel.org>; Sat,  2 Oct 2021 09:19:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEF9B6103C
	for <linux-m68k@archiver.kernel.org>; Sat,  2 Oct 2021 09:19:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbhJBJVB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 2 Oct 2021 05:21:01 -0400
Received: from mail-vk1-f176.google.com ([209.85.221.176]:34671 "EHLO
        mail-vk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232618AbhJBJU6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 2 Oct 2021 05:20:58 -0400
Received: by mail-vk1-f176.google.com with SMTP id z202so5487954vkd.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 02 Oct 2021 02:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x+xYE8hczlO6GFnDveXBiRxByg4CFjvmx5N3gLcK3ic=;
        b=SUYrip2Ntj10Iq9ItI7x6+AhQ5Bq6rc/gDYo0fZN7Dv6QQ36DKuKoVioIERMvcbZQN
         VyXAepUNh8pyj0lYrliFQ+UjOkYLbWd5fCJG7zf7M1PoM71SF0u9EhQT1CTZcV3ESt4F
         BbwvAf4IdZ1GqkrlPvc+WnEoknpiM03cZA4AVWb6Ma+itPLGKjmzUlTf3/sewbYKUXh2
         f+ULLJYf8tIufN+wLCH24VTtK/i/QhBC3Achvv5p17cbN2cVzD5qL20M4TFE2UNs94mE
         ziUPk28Q5vCDlZ40wAgAmwN5mzZR2RBuFcJMQ1IuVqcTxPdMdzz8HHADthcOAJ1e86nJ
         aTEA==
X-Gm-Message-State: AOAM5339MSukbPWj9CKP7pdRc/Cd0SArWT17VapACujbK25kP1vx2/lM
        Hsq+vFhIKTDS75tjLpWC7aUNO+jsVNZInBZbYiY=
X-Google-Smtp-Source: ABdhPJwcOdFmtRf0gkHzfZgpjXe/xFEruOKZ49Kymm8VmXyF5sO6oaNWBSQVsNwTDMHXSX07vsIGfcSGECzgtDSlD8w=
X-Received: by 2002:a1f:1841:: with SMTP id 62mr10464590vky.26.1633166352464;
 Sat, 02 Oct 2021 02:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211001213228.1735079-1-kuba@kernel.org> <20211001213228.1735079-2-kuba@kernel.org>
In-Reply-To: <20211001213228.1735079-2-kuba@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 2 Oct 2021 11:19:01 +0200
Message-ID: <CAMuHMdXaq=7bkL6Vx5CHve2mLTifa48y3-4KO2tdjAp3fQ-9Nw@mail.gmail.com>
Subject: Re: [PATCH net-next 01/11] arch: use eth_hw_addr_set()
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        netdev <netdev@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Oct 1, 2021 at 11:32 PM Jakub Kicinski <kuba@kernel.org> wrote:
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

>  arch/m68k/emu/nfeth.c               | 2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
