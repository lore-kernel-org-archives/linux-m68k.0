Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673FAC433FE
	for <linux-m68k@archiver.kernel.org>; Thu, 10 Mar 2022 12:17:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241925AbiCJMSC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 10 Mar 2022 07:18:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241987AbiCJMSB (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 10 Mar 2022 07:18:01 -0500
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0CA0C9A36
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Mar 2022 04:17:00 -0800 (PST)
Received: by mail-qv1-f42.google.com with SMTP id gm1so4331880qvb.7
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Mar 2022 04:17:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xfvrxYj0IL4efWC8i+iJcHTNZuPckG62QyK4wQ8esU8=;
        b=CWR6avwIpLyBwbgeGMDz8A4KbIOUAjW1VXzUvGPa8ceeVTTayP8EfoXIYDpQbjXGfB
         x65SxKxI4Vw7BFpCyknXXO8QRIanlY5+YEU/bhMJF5PLWY48WmHojEIPd2aMtDR05k/N
         tenxHjTishhGJZdekAdA/oUqHp+3oaBzz4EpTbNQo5rHtPXw4HZT/hITzWc/oS8wctNH
         67nJ7rNhELClmrBDKrTUnVs1peI5VyYDctcHo/o4yNzztNG1idZ+KTvckuqWnxtma7DG
         yyCjl/AslomrkoU6bdPpJhiklrBo4mb275Zkr8lLQ82SY7tn1ikjB4xx3Ez3KufpXRGb
         8w8Q==
X-Gm-Message-State: AOAM53056KCF50kujZpfbzkQy7IGslQoI+c9if7JHxhHdpSXRMJy7uAp
        UcQM+d6KStAxQgrlNNc4AuRlVxZskByr3A==
X-Google-Smtp-Source: ABdhPJwBqG/l5sXwxxIbPKB7aVp0tdcvpK+LCVEcIKKug6z39bvPgvDKoD3x1vPEw9NNJTpYGiSYpA==
X-Received: by 2002:a05:6214:21e7:b0:435:3078:3ce5 with SMTP id p7-20020a05621421e700b0043530783ce5mr3498360qvj.56.1646914619477;
        Thu, 10 Mar 2022 04:16:59 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id y24-20020a37e318000000b0067d43d76184sm1574400qki.97.2022.03.10.04.16.57
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 04:16:57 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2dc585dbb02so55023987b3.13
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Mar 2022 04:16:57 -0800 (PST)
X-Received: by 2002:a81:6dd1:0:b0:2dc:56d1:1dae with SMTP id
 i200-20020a816dd1000000b002dc56d11daemr3528698ywc.479.1646914617228; Thu, 10
 Mar 2022 04:16:57 -0800 (PST)
MIME-Version: 1.0
References: <20220310090048.1933020-1-laurent@vivier.eu> <20220310090048.1933020-4-laurent@vivier.eu>
In-Reply-To: <20220310090048.1933020-4-laurent@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Mar 2022 13:16:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLt4Q_TtGhOreW1kMjo0uLL3H5UKjaK8SXGo5dQUO+Tw@mail.gmail.com>
Message-ID: <CAMuHMdWLt4Q_TtGhOreW1kMjo0uLL3H5UKjaK8SXGo5dQUO+Tw@mail.gmail.com>
Subject: Re: [PATCH v15 3/5] rtc: goldfish: use gf_ioread32()/gf_iowrite32()
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-rtc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Mar 10, 2022 at 10:01 AM Laurent Vivier <laurent@vivier.eu> wrote:
> replace readl()/writel() by gf_ioread32()/gf_iowrite32()
> as done for goldfish-tty.
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Please include tags given on previous versions:
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
