Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DA6C433FE
	for <linux-m68k@archiver.kernel.org>; Thu, 10 Mar 2022 12:18:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236215AbiCJMTj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 10 Mar 2022 07:19:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232733AbiCJMTj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 10 Mar 2022 07:19:39 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901A037A26
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Mar 2022 04:18:35 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id h5so4385236qtb.7
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Mar 2022 04:18:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UxEoIGn264sRGsg/HhT4YP64PVzy4oCfplaz7ZY6sjU=;
        b=vMVcbnEGrF7WUGirJLfUGZGrWZClTfy5OjrwyTBeAxU6B6izBBXAsMzX9zA7D0zA98
         dGWshd8H6pY1DlbG+ddmlgYa8UScAEbqX/eooj/rV7XRzf3ROVpkQEQOQQBQHrTjyCC5
         J15rTIg8v0w8OLr1nL9r71W7SPrATntcGtKDQbS5usxv2gTmrZtnhLhNShKupwO/gIgq
         YzhMwbDS7vJukLu+a8MdU1NL2wJJkhthuwN9WURDBoECrmDTKOfJrq9FR44wWwrzR8cU
         lLJxMZsqjQVgiwo1k1CggOKfQAu70//3fP02yTrfA72X1INRw2xjeFTS4C/gwpfNl8oY
         tIuw==
X-Gm-Message-State: AOAM531t+Xc0Hi3xa64HQE4gHUCVB2RjQe5mWvuVPqmWgK9XCTY5EXy2
        cr6b9VO+dQATmYE7uXOhOMM5ahWrz4uqQQ==
X-Google-Smtp-Source: ABdhPJw1fa3NshsbP22LYXg3R59VSvB3B2ucBF5cdYlsmuqtxyQ1ODlLbAb31acSWK4r1VVwJ4pyiw==
X-Received: by 2002:a05:622a:1d6:b0:2e0:3366:9908 with SMTP id t22-20020a05622a01d600b002e033669908mr3537860qtw.321.1646914714532;
        Thu, 10 Mar 2022 04:18:34 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id d16-20020ac85ad0000000b002d71c463d9csm2949705qtd.24.2022.03.10.04.18.33
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 04:18:34 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2dc585dbb02so55068967b3.13
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Mar 2022 04:18:33 -0800 (PST)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr3691051ywb.132.1646914713434; Thu, 10
 Mar 2022 04:18:33 -0800 (PST)
MIME-Version: 1.0
References: <20220310090048.1933020-1-laurent@vivier.eu> <20220310090048.1933020-6-laurent@vivier.eu>
In-Reply-To: <20220310090048.1933020-6-laurent@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Mar 2022 13:18:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUGa8JAB4HZ303qy6BSadV0NVy-ZvhxMtj8ENavM8sHLw@mail.gmail.com>
Message-ID: <CAMuHMdUGa8JAB4HZ303qy6BSadV0NVy-ZvhxMtj8ENavM8sHLw@mail.gmail.com>
Subject: Re: [PATCH v15 5/5] m68k: introduce a virtual m68k machine
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
> This machine allows to have up to 3.2 GiB and 128 Virtio devices.
>
> It is based on android goldfish devices.
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Please include tags given on previous versions:
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
