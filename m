Return-Path: <SRS0=WAuH=7H=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3853C433E0
	for <linux-m68k@archiver.kernel.org>; Mon, 25 May 2020 08:48:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDA2F207FB
	for <linux-m68k@archiver.kernel.org>; Mon, 25 May 2020 08:48:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389257AbgEYIsC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 25 May 2020 04:48:02 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38692 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388800AbgEYIsB (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 25 May 2020 04:48:01 -0400
Received: by mail-ot1-f66.google.com with SMTP id o13so13335045otl.5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 25 May 2020 01:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yuQmz1vbzFzRiPHZ7yHORsAflnknRq9qadTHt4E+diA=;
        b=WjZDjB9aeFNw6KUbS0oXIT3OIFOc++8mPOpo5JSJC65RIStfy8G7voVeFd8segbO0W
         Haqp6puNtm73LFMkYfkQBaOeAI3yfFZMytwUylAOpCB82udKAj59MR8nsvWytiSxJScQ
         SvH5UniyDFEM/L7juslSYkmntGmH0t0aac1HYImPGKebSvQSS1RLxLACcufqMwsJp5rF
         ilqnXinV510QVwqe2zfBIgUatI9ug3vJco2eap0UEPI1sqXBsU/9EJEuoUM1OWYtuVkZ
         w76JH/5dD5ZJl19OFIw4kosuNNuaW8l6JxyT6IWRaElbRTl7INv5HywGYbIhCowJqMBc
         8j5g==
X-Gm-Message-State: AOAM5311oUIFdmEktn0DOJ8NpsuGVFodM8HERTVyeigB6S2pO75SIVwp
        F+m5WKJ2z8aNA4MuuMy/nQMUYKhFUgIi/qwsTv9W7INj
X-Google-Smtp-Source: ABdhPJz0vqXWtlP4TqBP+DguYlkkIuMQjwehAuzaBYeQKbfXEyZ3IBH6KLbqh8kyP7GVU0jQraapJHL7dY9LsTpjna4=
X-Received: by 2002:a05:6830:18d9:: with SMTP id v25mr19040328ote.107.1590396480166;
 Mon, 25 May 2020 01:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200520065750.8401-1-jasowang@redhat.com>
In-Reply-To: <20200520065750.8401-1-jasowang@redhat.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 May 2020 10:47:49 +0200
Message-ID: <CAMuHMdW2jLKP_sbnphW_LguYfX8tVYTQofPUOkTkO1dfiaM6zA@mail.gmail.com>
Subject: Re: [PATCH] m68k: add missing __user annotation in get_user()
To:     Jason Wang <jasowang@redhat.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, May 20, 2020 at 8:58 AM Jason Wang <jasowang@redhat.com> wrote:
> The ptr is a pointer to userspace memory. So we need annotate it with
> __user otherwise we may get sparse warnings like:
>
> drivers/vhost/vhost.c:1603:13: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const *__gu_ptr @@    got unsigned int [noderef] [usertypvoid const *__gu_ptr @@
> drivers/vhost/vhost.c:1603:13: sparse:    expected void const *__gu_ptr
> drivers/vhost/vhost.c:1603:13: sparse:    got unsigned int [noderef] [usertype] <asn:1> *idxp
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-kernel@vger.kernel.org
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Fixes: 7124330dabe5b3cb ("m68k/uaccess: Revive 64-bit get_user()")

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.8 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
