Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EE0EB64D9
	for <linux-m68k@archiver.kernel.org>; Wed, 14 Jun 2023 09:35:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241618AbjFNJfh convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 14 Jun 2023 05:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244149AbjFNJfF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 14 Jun 2023 05:35:05 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E18552109
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jun 2023 02:34:50 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-56cfce8862aso5894427b3.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jun 2023 02:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686735289; x=1689327289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbNw7KSFt9rA0O4w0LVl8suouqVzbOa7coQNBiypPBM=;
        b=jQV4BiUopwIHbcj+GBE/xzX6fmQL3hbHJYCioQzT8murlGrrqdzRZ2ll6BR8o3dgnv
         SkXjrN10ablSt+cxWPLRneOhpySjqzdnnv0N9nSRK1NWLEtcjoCUImqk5S1Q9b4yKwVv
         3V755hko333c6QeuhjduVnRMJECGg/dQSpqgZTYKFwrNNxeXE/tOfKo8WQoXwQxu18kX
         +6V/QA00/OcnXieqM2dyofV+owcA0EZFhOAopb6E7ElrzDhsmijchFKgGEKo3bvFNHw9
         JGkuNiSZ7Lwx5cDB41ke5OQ/p1xi1hu8Dw3IDa1itqwqE6pDod3fJFirAzMbYyb/LOi+
         hkwg==
X-Gm-Message-State: AC+VfDzRy19B/JTqzgG6cSZfAnBqS3GvSMnRusc97Fie0bvBEIkbSg0C
        sxfkzxVhuuYmkbVOqx0sKw6TcgZogURgNg==
X-Google-Smtp-Source: ACHHUZ7JAd+yR7Aqk784XzXxv16tJl11FiSExfF62W7nI91jlEdcEvNCNIhlXBDSzelxyHAwtuJ2wQ==
X-Received: by 2002:a81:720a:0:b0:559:eae4:9671 with SMTP id n10-20020a81720a000000b00559eae49671mr1084678ywc.14.1686735289620;
        Wed, 14 Jun 2023 02:34:49 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id b72-20020a0dd94b000000b0056cea0480c6sm2859674ywe.2.2023.06.14.02.34.49
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 02:34:49 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-56ff9cc91b4so6000927b3.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jun 2023 02:34:49 -0700 (PDT)
X-Received: by 2002:a25:b096:0:b0:bac:69be:9494 with SMTP id
 f22-20020a25b096000000b00bac69be9494mr1910027ybj.36.1686735289225; Wed, 14
 Jun 2023 02:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230614032446.8391-1-zhanglibing@cdjrlc.com> <4c81c6406707cf2e26b43bd4c5caca3a@208suo.com>
 <74ed374c5d5ec504d3bbecef656c1b37@208suo.com>
In-Reply-To: <74ed374c5d5ec504d3bbecef656c1b37@208suo.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Jun 2023 11:34:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEOxVs1YOnmhbgqWMqpG-erahs8_OdpL1Jhck7KK+F0g@mail.gmail.com>
Message-ID: <CAMuHMdVEOxVs1YOnmhbgqWMqpG-erahs8_OdpL1Jhck7KK+F0g@mail.gmail.com>
Subject: Re: [PATCH] m68k/q40: Fix syntax error
To:     wuyonggang001@208suo.com
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Yonggang,

Thanks for your patch!

On Wed, Jun 14, 2023 at 8:16 AM <wuyonggang001@208suo.com> wrote:
>
> Fix the following checkpatch error:

The patch subject does not match the description.

>
> ERROR: space required after that ',' (ctx:VxV)
> ERROR: spaces required around that '<' (ctx:VxV)
>
> Signed-off-by: Yonggang Wu <wuyonggang001@208suo.com>

scripts/checkpatch.pl says:

    WARNING: From:/Signed-off-by: email name mismatch: 'From:
wuyonggang001@208suo.com' != 'Signed-off-by: Yonggang Wu
<wuyonggang001@208suo.com>'

> --- a/arch/m68k/q40/config.c
> +++ b/arch/m68k/q40/config.c

> @@ -270,7 +270,7 @@ static int q40_set_rtc_pll(struct rtc_pll_info *pll)
>       if (!pll->pll_ctrl) {
>           /* the docs are a bit unclear so I am doublesetting */
>           /* RTC_WRITE here ... */
> -        int tmp = (pll->pll_value & 31) | (pll->pll_value<0 ? 32 : 0) |
> +        int tmp = (pll->pll_value & 31) | (pll->pll_value < 0 ? 32 : 0)
> |

ERROR: patch seems to be corrupt (line wrapped?)

>                 Q40_RTC_WRITE;
>           Q40_RTC_CTRL |= Q40_RTC_WRITE;
>           Q40_RTC_CTRL = tmp;


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
