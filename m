Return-Path: <SRS0=/voU=4U=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15738C3F2CD
	for <linux-m68k@archiver.kernel.org>; Tue,  3 Mar 2020 09:57:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA348214D8
	for <linux-m68k@archiver.kernel.org>; Tue,  3 Mar 2020 09:57:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728189AbgCCJ5b (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 3 Mar 2020 04:57:31 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43531 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727823AbgCCJ5b (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 3 Mar 2020 04:57:31 -0500
Received: by mail-oi1-f195.google.com with SMTP id p125so2370938oif.10
        for <linux-m68k@lists.linux-m68k.org>; Tue, 03 Mar 2020 01:57:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9YqxdQa1ilWOSiLraQPjm7TPTEifD+tyJWNIlA8bYpk=;
        b=PPXiCo4cMOq8FhjLwmeYdvtdch6wsfBKzfV1DC5Q5mOiqbKUogfEX9SkTdXPPVPXXq
         geyiPOgUjyaWaGRxKWdpi+XhfAfN8zr+wOYl9OgU2PXucTlHo+UHGyXtVtowP/iKBwlY
         CN2RitoZ6r/u6tRfWxuR9wr9X/vlJqwecfAzzVHEOhv3Drlk20M9JeJkTXb1GpVffgPQ
         6Qcb71EZ3gTjbMJaH3RqRc0y4MEk2f2u+ayrLOguJGPn4L/QVtfM9kYjn72SrW4WE6K1
         52m3evNb9R4c4jmExF8hc3OMrCKteCh6/kERctsdX5cWZ62Inzq3ygU55ClFoabGw91E
         0yPQ==
X-Gm-Message-State: ANhLgQ3w/H9a9FdIbxuIXwnz2V4CnuywunUMobxblNLwaQGl2i3GMSa5
        Nxy9mamfH1RMnKBc5JXMQGD8vaWyQa1FjHNFlE4=
X-Google-Smtp-Source: ADFU+vs9z4mBtCuZweCHY2/aqnLaygT4ej9HMxCl8wm4hVja8W8jGcq442xFYlOU/W0oazaGHEEdSqsMhYOZ6MqTl2M=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr1781294oig.153.1583229450514;
 Tue, 03 Mar 2020 01:57:30 -0800 (PST)
MIME-Version: 1.0
References: <20200227183748.GA31018@embeddedor>
In-Reply-To: <20200227183748.GA31018@embeddedor>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 Mar 2020 10:57:19 +0100
Message-ID: <CAMuHMdXCWtgGKM1Uqtps4CYbGsfBZtoQ8e4t8VrMoL29nP4V3w@mail.gmail.com>
Subject: Re: [PATCH] zorro: Replace zero-length array with flexible-array member
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Gustavo,

Thanks for your patch!

On Thu, Feb 27, 2020 at 7:35 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
>
> struct foo {
>         int stuff;
>         struct boo array[];
> };
>
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
>
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
>
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
>
> This issue was found with the help of Coccinelle.
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Note that in practice, this "undefined behavior" may lead to corrupting
the next member, when the zero-length array is written to.

> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.7 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
