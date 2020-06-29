Return-Path: <SRS0=8jjU=AK=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F76DC433E3
	for <linux-m68k@archiver.kernel.org>; Mon, 29 Jun 2020 18:53:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11DFE204EC
	for <linux-m68k@archiver.kernel.org>; Mon, 29 Jun 2020 18:53:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgF2SxS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 29 Jun 2020 14:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729817AbgF2Swx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 29 Jun 2020 14:52:53 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2591C031C52
        for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2020 10:35:17 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id n24so14029809otr.13
        for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2020 10:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c+UH3wGWOQh5G+qJQo+Xjrt0bsgzB7MZcrtvAHyMuuA=;
        b=aSuxCXC1GRETB9+aba+jLDIF/0I5tXYb74lzHAqsjkEbdRMfbUrPNOisieRP1z2RjW
         K0P+UQ838z6d2hOMZf/3BPL5Wmt9mftRZZkegRZj1cwNsiaxHrW2OANsFksO5BPYD5TZ
         4khOH8Mp2PMe2sZNu7StcOYskAv7s72TwG83IYk+d2AB2WC+qbY1vNjLn9hBOxOXAELf
         zQod/62T1XsfznVeBCDfU+tGhEQseNxhHouyINKJzU1aPjszRW5uc0+vfEmIAusZ9n00
         ejoYhhH40zkOyXFWxW5tmKdI/Qedf8KgWc99jr6EvWZMQ5rAdBVaxIGFP/vgnjTbPe1r
         1uBg==
X-Gm-Message-State: AOAM532qbPLIV3SQk/DJ+Y3VIgwc55yJS+MxXvk2TD1lQLrqoSoX97/N
        wr0ilByvCVukiD0xN2/TVoEDhR8EzuPn83E9kGQZtA==
X-Google-Smtp-Source: ABdhPJyyh4FjacJgxndQ8k0y5wBka4OazaHJJ5vAav2ZoaFKx0KHCgrvsElzEreE/tpiDt9YewLIivzL/PrxLK0mim0=
X-Received: by 2002:a9d:6254:: with SMTP id i20mr14283840otk.145.1593452117318;
 Mon, 29 Jun 2020 10:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200526123810.301667-1-masahiroy@kernel.org>
In-Reply-To: <20200526123810.301667-1-masahiroy@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jun 2020 19:35:06 +0200
Message-ID: <CAMuHMdVi+N5mJo4WiKr7_wkYSShBmSGOca8abpkJbwbfRjavxA@mail.gmail.com>
Subject: Re: [PATCH 1/4] m68k: add arch/m68k/Kbuild
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, May 26, 2020 at 2:38 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> Use the standard obj-y form to specify the sub-directories under
> arch/m68k/. No functional change intended.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.9 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
