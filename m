Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C007EB64DA
	for <linux-m68k@archiver.kernel.org>; Wed,  5 Jul 2023 12:39:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbjGEMjE convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 5 Jul 2023 08:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231628AbjGEMjD (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 5 Jul 2023 08:39:03 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F01A130
        for <linux-m68k@lists.linux-m68k.org>; Wed,  5 Jul 2023 05:39:02 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5700b15c12fso79949947b3.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 05 Jul 2023 05:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688560741; x=1691152741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODdZw5w6iGqiraBXY4M8X7yrPsBvzOP0DzF3PrDV5GE=;
        b=R4nLATNTq9J9XDCFkz6aXiuz6LFLYoo95kZrb7pN6hcLmNpoQxTHncNI0ggtdrqQst
         1ZRRytcRYrIEP/gXaJSnTvZn4NmKkTg23W8CoYSvWSku/TfZSn3OObda8bWZ4Mz2maV1
         P6DGUJQ/JxIZGlRPnQ6OhUO08iVp3sPDLXYsBj20ImzXbEo8AcFPhv56iSGDn0ehoKWn
         oPCTW23j8slkRS2Wcjj2jpIcsSbXDkJlkLhncW81fqNWr6Eq/Wcdpk7J9B6Hqe/0IC1X
         TQLlA8X3b/zh5j4io1nKAEBGv9YjCbXzTPmaImoSnu5rhcBJLBkTruksLTkXkjJ5LOdT
         x4jw==
X-Gm-Message-State: ABy/qLZIJMhZsAavOwTTuQMzjhSIthv8kr9RrcRQ/tX6VbDHpSY6fSBK
        1t+DpKCMz6g9q9vSj35NZrjAqUkAnVDOMw==
X-Google-Smtp-Source: APBJJlG4oUmKcjWfrwtIiVHnn4EH+mFoNE2qGbETn49XA9OQkew23byowdvAVGkFVvMSswO5vB9R5g==
X-Received: by 2002:a81:5bd6:0:b0:56d:2e22:8b31 with SMTP id p205-20020a815bd6000000b0056d2e228b31mr16966804ywb.41.1688560741328;
        Wed, 05 Jul 2023 05:39:01 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id w192-20020a8149c9000000b00573a75cd331sm6054306ywa.143.2023.07.05.05.39.00
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 05:39:00 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-579d5d89b41so55620147b3.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 05 Jul 2023 05:39:00 -0700 (PDT)
X-Received: by 2002:a25:42c6:0:b0:c4e:f358:4dd6 with SMTP id
 p189-20020a2542c6000000b00c4ef3584dd6mr8280017yba.25.1688560740643; Wed, 05
 Jul 2023 05:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230705121307.17204-1-duminjie@vivo.com>
In-Reply-To: <20230705121307.17204-1-duminjie@vivo.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Jul 2023 14:38:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVCyO5JUpMExBK0OgoGfe0MYhP4WcOfrwqQkbb7FUsrxw@mail.gmail.com>
Message-ID: <CAMuHMdVCyO5JUpMExBK0OgoGfe0MYhP4WcOfrwqQkbb7FUsrxw@mail.gmail.com>
Subject: Re: [PATCH v1] m68k: apollo: Remove a duplicate assignment in dn_timer_int
To:     Minjie Du <duminjie@vivo.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
        open list <linux-kernel@vger.kernel.org>,
        opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Minjie,

On Wed, Jul 5, 2023 at 2:13 PM Minjie Du <duminjie@vivo.com> wrote:
> Delete a duplicate statement from this function implementation.
>
> Signed-off-by: Minjie Du <duminjie@vivo.com>

Thanks for your patch, which is presumably untested on real hardware?

> --- a/arch/m68k/apollo/config.c
> +++ b/arch/m68k/apollo/config.c
> @@ -173,7 +173,6 @@ irqreturn_t dn_timer_int(int irq, void *dev_id)
>         legacy_timer_tick(1);
>         timer_heartbeat();
>
> -       x = *(volatile unsigned char *)(apollo_timer + 3);
>         x = *(volatile unsigned char *)(apollo_timer + 5);

This is intentional: the use of volatile makes sure the registers at
offsets 3 and 5 are read, in that order.

I agree this could be made more obvious by converting the code to the
more modern READ_ONCE() helper.
But please do not send such a patch without testing.

>
>         return IRQ_HANDLED;

NAKed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
