Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3258C001DF
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Jul 2023 09:06:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbjGXJGn convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Jul 2023 05:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231966AbjGXJGk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Jul 2023 05:06:40 -0400
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F8BD133
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 02:06:36 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-cf284f4d7afso4624159276.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 02:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690189595; x=1690794395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnTcJANMzNU9SJo+kur+ytZi7HW/VI2ifVeb/K70ZlM=;
        b=NJZ2mYbFN2kBmGQgelAd/ffBTQun+PbN3qtFIW+avSd6jbknqa/n3cKIQxLfT9Wkgb
         +JhwFRjx+GXEbmFRJoRuKoxW/fM6aNNgiDZIhQTe/h49MHTLUwKadaWzm2rP66+UFm6G
         ij4NFcU8NaBxZgCXq65GytmYSOSV1nwgkhOlVU6UzrGgaFqUaB1Rz80lrWLgzY6aqiu9
         gj/IEJ+OO8VOCN9TklDq8vxZKhqTfRgpgJyUToWG2ZMuBQec8OFO38Xn/EjAaI5Or7IP
         V7uqmXUU73IcpOA5l2y4pe4HHCL+31rJP1ci5wROWuK1oN9+aJVxiWS3BOqhoEfsVkhG
         7HqQ==
X-Gm-Message-State: ABy/qLZh4EWTTdh/Jigs0tofbXBLE9SCxPnkobOEVIfhe8p/SZN5TPTU
        uFMfdtBnrVxcIkm/FeMAywNsb0+1inspcQ==
X-Google-Smtp-Source: APBJJlHJudTNZP34Nuj8c2E3p/k0JZSRDiPZzQDGNMe7OHefyS7+zyARsIUusC2TgDz9q6jYcAdabg==
X-Received: by 2002:a25:202:0:b0:d0f:3b2:49a2 with SMTP id 2-20020a250202000000b00d0f03b249a2mr2160398ybc.46.1690189595362;
        Mon, 24 Jul 2023 02:06:35 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id e192-20020a2569c9000000b00d0cae244e50sm771533ybc.35.2023.07.24.02.06.35
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 02:06:35 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5838881e30bso44141327b3.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 02:06:35 -0700 (PDT)
X-Received: by 2002:a25:27c9:0:b0:c4c:fee5:428 with SMTP id
 n192-20020a2527c9000000b00c4cfee50428mr6804002ybn.24.1690189594869; Mon, 24
 Jul 2023 02:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230720033737.2092-1-xujianghui@cdjrlc.com> <006368d8cf146a4e41d860b615d4b3ec@208suo.com>
In-Reply-To: <006368d8cf146a4e41d860b615d4b3ec@208suo.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Jul 2023 11:06:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_hdNHcH5jbqc2kAZ4ba0uH=AXsKcj0teXN0Pj5G9s=A@mail.gmail.com>
Message-ID: <CAMuHMdV_hdNHcH5jbqc2kAZ4ba0uH=AXsKcj0teXN0Pj5G9s=A@mail.gmail.com>
Subject: Re: [PATCH] m68k: q40: add missing spaces around '='
To:     sunran001@208suo.com
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Ran,

On Thu, Jul 20, 2023 at 5:54 AM <sunran001@208suo.com> wrote:
> add missing spaces to clear checkpatch errors.
>
> ERROR: spaces required around that '=' (ctx:VxV)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>

WARNING: From:/Signed-off-by: email name mismatch: 'From:
sunran001@208suo.com' != 'Signed-off-by: Ran Sun
<sunran001@208suo.com>'

> ---
>   arch/m68k/q40/q40ints.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/m68k/q40/q40ints.c b/arch/m68k/q40/q40ints.c
> index 127d7ecdbd49..fdd6e48f4fe3 100644
> --- a/arch/m68k/q40/q40ints.c
> +++ b/arch/m68k/q40/q40ints.c
> @@ -132,10 +132,10 @@ static irqreturn_t q40_timer_int(int irq, void
> *dev_id)
>   {
>         ql_ticks = ql_ticks ? 0 : 1;
>         if (sound_ticks) {
> -               unsigned char sval=(sound_ticks & 1) ? 128-SVOL : 128+SVOL;
> +               unsigned char sval = (sound_ticks & 1) ? 128-SVOL : 128+SVOL;
>                 sound_ticks--;
> -               *DAC_LEFT=sval;
> -               *DAC_RIGHT=sval;
> +               *DAC_LEFT = sval;
> +               *DAC_RIGHT = sval;
>         }
>
>         if (!ql_ticks) {
> @@ -171,7 +171,7 @@ void q40_sched_init (void)
>
>   struct IRQ_TABLE{ unsigned mask; int irq ;};
>   #if 0
> -static struct IRQ_TABLE iirqs[]={
> +static struct IRQ_TABLE iirqs[] = {
>     {Q40_IRQ_FRAME_MASK,Q40_IRQ_FRAME},
>     {Q40_IRQ_KEYB_MASK,Q40_IRQ_KEYBOARD},
>     {0,0}};
> @@ -189,7 +189,7 @@ static struct IRQ_TABLE eirqs[] = {
>   };
>
>   /* complain only this many times about spurious ints : */
> -static int ccleirq=60;    /* ISA dev IRQs*/
> +static int ccleirq = 60;    /* ISA dev IRQs*/
>   /*static int cclirq=60;*/     /* internal */
>
>   /* FIXME: add shared ints,mask,unmask,probing.... */

This patch is whitespace-damaged, so it fails to apply.

These problems are present in all your patches, so something is
wrong in your workflow.  Please test your patches by running
scripts/checkpatch.pl, emailing them to yourself, and trying to
apply them.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
