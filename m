Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA10C001DE
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Jul 2023 08:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231975AbjGXIzu convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Jul 2023 04:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232003AbjGXIzg (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Jul 2023 04:55:36 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5084EE7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 01:55:32 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-576a9507a9bso75987827b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 01:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690188931; x=1690793731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SeL9Fwxd5AD4NKyHzXf07pn2OcHCNFziaHSPLDQBHPQ=;
        b=T5/jDg9Z8kOs4/cwhiZzhVLVcvuERcy4uR4MQXOI8OqO4tYFgtAUfjzb/XlWAQtyYe
         brp/VRIZnoebdTWdpyPMg3SkXZK7AokF02qXF7cw5Al0Cx4GtaRZ13trUXAjzK8qDLsF
         kCocdxy0hyGq4VcTOOegQSKeBm04Alz5iAp4Mcd3pxIwsXh0vrTLTXQFRqcu+hs6yJ/y
         L55CaQOzeZ/zGX3yBeNBUIyGCYda6TZfjAL3WCHtsYeVBolFxsrLV0ebNlWHLQU4BOQ8
         gqTODDuF7ItiiGlxkdM5fo/cbL9lX8myrDU4QqmDJE4nCr9yl/shyPbDQ9YCU8iztMFQ
         31Ug==
X-Gm-Message-State: ABy/qLaYyP+2lbNx5UYLZsk/soT1/ADQozwSryK1BflfdNKwiquEwdu2
        9V6OQgcwdnFKP+GTTzvXoeG1f0kqSPnMiQ==
X-Google-Smtp-Source: APBJJlGx58qfzCLf1lz1duaBpFingB1WTaH0rP2DG18Tq82jU5Ue3HyScNh/ZUB8vWd/3gELkdIlmw==
X-Received: by 2002:a0d:e80b:0:b0:56f:f0db:759a with SMTP id r11-20020a0de80b000000b0056ff0db759amr5485051ywe.13.1690188931392;
        Mon, 24 Jul 2023 01:55:31 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id o138-20020a0dcc90000000b00576e5af0249sm246800ywd.20.2023.07.24.01.55.30
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 01:55:30 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d13e0bfbbcfso335747276.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 01:55:30 -0700 (PDT)
X-Received: by 2002:a25:8005:0:b0:d08:7d6a:2221 with SMTP id
 m5-20020a258005000000b00d087d6a2221mr4165293ybk.18.1690188929804; Mon, 24 Jul
 2023 01:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_7098E5576B2FD785B3A3B9CD6CE0643D4C07@qq.com> <4d862263222c7358840745c2cd0ce0fa@208suo.com>
In-Reply-To: <4d862263222c7358840745c2cd0ce0fa@208suo.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Jul 2023 10:55:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOXvNykCmzJij=ZrVCxnM0DSrwB4_mX6c8-d7ztzNSUA@mail.gmail.com>
Message-ID: <CAMuHMdVOXvNykCmzJij=ZrVCxnM0DSrwB4_mX6c8-d7ztzNSUA@mail.gmail.com>
Subject: Re: [PATCH] m68k: q40: prefer 'unsigned int' to bare use of 'unsigned'
To:     xuanzhenggang001@208suo.com
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Zhenggang,

On Sat, Jul 8, 2023 at 6:06 PM <xuanzhenggang001@208suo.com> wrote:
> Fix the following warnings reported by checkpatch:
>
> ./arch/m68k/q40/q40ints.c:172: WARNING: Prefer 'unsigned int' to bare
> use of 'unsigned'
> ./arch/m68k/q40/q40ints.c:211: WARNING: Prefer 'unsigned int' to bare
> use of 'unsigned'
>
> Signed-off-by: Zhenggang Xuan <xuanzhenggang001@208suo.com>

Thanks for your patch!

But obviously you forgot to run scripts/checkpatch.pl on your own patch:

    WARNING: From:/Signed-off-by: email name mismatch: 'From:
xuanzhenggang001@208suo.com' != 'Signed-off-by: Zhenggang Xuan
<xuanzhenggang001@208suo.com>'

> --- a/arch/m68k/q40/q40ints.c
> +++ b/arch/m68k/q40/q40ints.c
> @@ -169,7 +169,7 @@ void q40_sched_init (void)
>    *
>   */
>
> -struct IRQ_TABLE{ unsigned mask; int irq ;};
> +struct IRQ_TABLE { unsigned int mask ; int irq ; };
>   #if 0
>   static struct IRQ_TABLE iirqs[]={
>     {Q40_IRQ_FRAME_MASK,Q40_IRQ_FRAME},
> @@ -208,7 +208,7 @@ static int aliased_irq;        /* how many times
> inside handler ?*/
>   /* got interrupt, dispatch to ISA or keyboard/timer IRQs */
>   static void q40_irq_handler(unsigned int irq, struct pt_regs *fp)
>   {
> -    unsigned mir, mer;
> +    unsigned int mir, mer;

This part is white-space damaged, and thus fails to apply.

>       int i;
>
>   //repeat:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
