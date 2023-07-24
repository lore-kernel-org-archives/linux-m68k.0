Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C659C001B0
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Jul 2023 09:18:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbjGXJS5 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Jul 2023 05:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232222AbjGXJSs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Jul 2023 05:18:48 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7E8E7A
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 02:18:46 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-583b47809beso18049497b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 02:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690190325; x=1690795125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auSj/YqkFpBoqyvR9iArXsraNG0PdoY9urEx1pkdLEs=;
        b=HFOvgQCaE0ei0vtZ+WBeQnX6Iut8Q4khlN83DskapQ2GB72qH74kmUpCZMDYmNA1NX
         GHrs/0ETAdyWklXoIh/1/7/J9EJsnCEC6IIcZVUdLd9Su0EYreynFP0yRi6jGMo5RsTL
         knxgLkaFsG7gx/lnE1ghTPtKRrTjwED5eLN/LTFT66xhwOWul2LzotmQLb0K+jow5blS
         FFWXEbgWSKG2m0SZQnNfvJl1FuEuGtnUDohOaAgA6zolGo6LyVLnqhoS0cDyqADNu8Cn
         QFufMjlhIgnz9DflNuEZqFqEAmudk0/df7P8g/FarRJUtGjt+SN+oTZ2gYbiCAu3BFQw
         3a/A==
X-Gm-Message-State: ABy/qLYZmIjUKT5swzzVRmHpHeAKWRBE1AZLxmIt6+AvMo8rPsXN6bMj
        rkoDrTun+wC2iXOokWXHq1/JfdKzgNq3iw==
X-Google-Smtp-Source: APBJJlGEkQzsYeuGZWCYqc/KMFQjwEYGe6DA4VqFXPxyk+j6v7F0cgpecDj5kpLLJV7rEgj/dlBXiw==
X-Received: by 2002:a81:dd0d:0:b0:579:f60f:d08f with SMTP id e13-20020a81dd0d000000b00579f60fd08fmr5395773ywn.48.1690190325552;
        Mon, 24 Jul 2023 02:18:45 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id h12-20020a81b40c000000b005836fc85bb9sm2664088ywi.85.2023.07.24.02.18.45
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 02:18:45 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d124309864dso412340276.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 02:18:45 -0700 (PDT)
X-Received: by 2002:a25:6943:0:b0:d0b:47e7:9295 with SMTP id
 e64-20020a256943000000b00d0b47e79295mr3000359ybc.25.1690190324939; Mon, 24
 Jul 2023 02:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <4994ede231971e39e3b7f51844d8868a@208suo.com>
In-Reply-To: <4994ede231971e39e3b7f51844d8868a@208suo.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Jul 2023 11:18:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWTD756HS+Egt6uHWjJvt8Z+Oz8GpVcJGiP4q6O6fjP+g@mail.gmail.com>
Message-ID: <CAMuHMdWTD756HS+Egt6uHWjJvt8Z+Oz8GpVcJGiP4q6O6fjP+g@mail.gmail.com>
Subject: Re: [PATCH] m68k: Fix the following checkpatch error:
To:     zhangyongle001@208suo.com
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Zhangyong,

On Thu, Jul 20, 2023 at 11:50 AM <zhangyongle001@208suo.com> wrote:
> ERROR: that open brace { should be on the previous line
> ERROR: that open brace { should be on the previous line
> ERROR: else should follow close brace '}'
>
> Signed-off-by: zhangyongle <zhangyongle001@208suo.com >

Thanks for your patch!

But obviously you forgot to run scripts/checkpatch.pl on your own patch:

    WARNING: A patch subject line should describe the change not the
tool that found it
    #2:
    Subject: [PATCH] m68k: Fix the following checkpatch error:

    ERROR: Unrecognized email address: 'zhangyongle
<zhangyongle001@208suo.com >'
    #14:
    Signed-off-by: zhangyongle <zhangyongle001@208suo.com >

    WARNING: From:/Signed-off-by: email address mismatch: 'From:
zhangyongle001@208suo.com' != 'Signed-off-by: zhangyongle
<zhangyongle001@208suo.com >'

> --- a/arch/m68k/bvme6000/config.c
> +++ b/arch/m68k/bvme6000/config.c
> @@ -290,8 +290,7 @@ int bvme6000_hwclk(int op, struct rtc_time *t)
>
>         rtc->msr = 0x40;        /* Ensure clock and real-time-mode-register
>                                  * are accessible */
> -       if (op)
> -       {       /* Write.... */
> +       if (op) {       /* Write.... */
>                 rtc->t0cr_rtmr = t->tm_year%4;
>                 rtc->bcd_tenms = 0;
>                 rtc->bcd_sec = bin2bcd(t->tm_sec);
> @@ -303,9 +302,7 @@ int bvme6000_hwclk(int op, struct rtc_time *t)
>                 if (t->tm_wday >= 0)
>                         rtc->bcd_dow = bin2bcd(t->tm_wday+1);
>                 rtc->t0cr_rtmr = t->tm_year%4 | 0x08;
> -       }
> -       else
> -       {       /* Read....  */
> +       } else {        /* Read....  */
>                 do {
>                         t->tm_sec  = bcd2bin(rtc->bcd_sec);
>                         t->tm_min  = bcd2bin(rtc->bcd_min);

This patch is whitespace-damaged, and fails to apply.

These problems are present in all your patches, so something is
wrong in your workflow.  Please test your patches by running
scripts/checkpatch.pl, emailing them to yourself, and trying to
apply them.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
