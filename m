Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A3EC433EF
	for <linux-m68k@archiver.kernel.org>; Fri, 10 Jun 2022 08:27:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346895AbiFJI1R (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 10 Jun 2022 04:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244918AbiFJI0s (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 10 Jun 2022 04:26:48 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D45F195937
        for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Jun 2022 01:24:26 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id k18so110031qtm.9
        for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Jun 2022 01:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ePiWLMIFFFMTZGAPUYMPtOQbf4rBsBwydN2vOsIC08U=;
        b=POPy9csp2FpiUI5YElq5Et1K+jVVImmoreu4DOg2Q6YCg64AI1m85dWErTd3F6PThE
         qhTxWMTDs5GX3KAIAjOG3JA2A6Td32U2OTwmmqy2uBlU76Kh9DVPToG5vsvci7bhP88D
         ou4/4dDO/onhsMmB7iEiDhJi0z6E5zu6Xu2t+j2XXWvW3fmGTY2DYpSP8KV6aXTb2ZRG
         rxMvhDUr7MsK7YRJe0rpzPUqhBg36TXJ2zag1N1cB1TUMlvmyQ8tNZ0DaA+pTJ/01c8n
         46/seA8Ut0AqkTvrtzDR/ycJC7kdNltsYMFcNl9Qtk6DEjTO6srNsUQQMn6Ohl91/TsS
         qG4A==
X-Gm-Message-State: AOAM532RsvlxJfhm+4rOa9+QbnhWBUZbHqgirSimEj0HMzwOmyd/7HD4
        uYglphNXs0ZZQ0G98jcn+FMRkLI3COvfYg==
X-Google-Smtp-Source: ABdhPJyrcjcY0mvPkKMwDdR7pa8Bay5MMHJG9WolVdXZ70kJgBzXTgoKVSY4whu49b4sIE7AKyzjcA==
X-Received: by 2002:a05:622a:408:b0:305:1a9c:7f14 with SMTP id n8-20020a05622a040800b003051a9c7f14mr2270655qtx.255.1654849465442;
        Fri, 10 Jun 2022 01:24:25 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id u5-20020a05620a454500b006a6cadd89efsm10430289qkp.82.2022.06.10.01.24.24
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 01:24:25 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-3137316bb69so70270437b3.10
        for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Jun 2022 01:24:24 -0700 (PDT)
X-Received: by 2002:a81:6157:0:b0:30c:7e4d:b28e with SMTP id
 v84-20020a816157000000b0030c7e4db28emr46912140ywb.502.1654849464556; Fri, 10
 Jun 2022 01:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220610082150.23677-1-wangxiang@cdjrlc.com>
In-Reply-To: <20220610082150.23677-1-wangxiang@cdjrlc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Jun 2022 10:24:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCo+_WbpXtA1XJPM=t4LQ=UuO7Pd5nw4i5R7mJaWZmjQ@mail.gmail.com>
Message-ID: <CAMuHMdWCo+_WbpXtA1XJPM=t4LQ=UuO7Pd5nw4i5R7mJaWZmjQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: mac: Fix typo in comment
To:     Xiang wangx <wangxiang@cdjrlc.com>
Cc:     Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Xiang,

On Fri, Jun 10, 2022 at 10:22 AM Xiang wangx <wangxiang@cdjrlc.com> wrote:
> Delete the redundant word 'an'.
> Delete the redundant word 'and'.
>
> Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>

Thanks for your patch!

> --- a/arch/m68k/mac/iop.c
> +++ b/arch/m68k/mac/iop.c
> @@ -25,7 +25,7 @@
>   *               check this.)
>   * 990605 (jmt) - Rearranged things a bit wrt IOP detection; iop_present is
>   *               gone, IOP base addresses are now in an array and the
> - *               globally-visible functions take an IOP number instead of an
> + *               globally-visible functions take an IOP number instead of

OK

>   *               an actual base address.
>   * 990610 (jmt) - Finished the message passing framework and it seems to work.
>   *               Sending _definitely_ works; my adb-bus.c mods can send
> @@ -66,7 +66,7 @@
>   * a shared memory area in the IOP RAM. Each IOP has seven "channels"; each
>   * channel is connected to a specific software driver on the IOP. For example
>   * on the SCC IOP there is one channel for each serial port. Each channel has
> - * an incoming and and outgoing message queue with a depth of one.
> + * an incoming and outgoing message queue with a depth of one.

The second "and" should not be deleted, but replaced by "an".

>   *
>   * A message is 32 bytes plus a state byte for the channel (MSG_IDLE, MSG_NEW,
>   * MSG_RCVD, MSG_COMPLETE). To send a message you copy the message into the

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
