Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE98C433FE
	for <linux-m68k@archiver.kernel.org>; Wed, 19 Jan 2022 09:58:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353357AbiASJ6t convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 19 Jan 2022 04:58:49 -0500
Received: from mail-ua1-f49.google.com ([209.85.222.49]:38796 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352023AbiASJ6q (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 19 Jan 2022 04:58:46 -0500
Received: by mail-ua1-f49.google.com with SMTP id n15so1987420uaq.5
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Jan 2022 01:58:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e8QRIwDey7YYITBsuH1RwLEavOxMt4TqPLNn4dY2EeQ=;
        b=ZyV+rwcH9RNSIpPTTaTt+URf5Pmp4AxzHnINDecDBYoN075KoSrK3ZUnEYf7BI1X7p
         mVI4ftymxODnLIqZdVU8FH1GwOcv+Wxrnd0oIOQ4CfOz2qFdFDrRocFPUs6ReAFHgUi4
         ou2VyBbDuWkuU4vwiShibTab7LE1LA+wDHbMsLQJkiM12z3o9DTvUgnboiChlhLq05fa
         lbo5ao7xhfmAGUNKF5YJcXD/3+I9XXTRBC8TJyDTQYWjd6l/iNp7GBO1niOe4Ouz6mlx
         n3bzJz4mScT2D0sAJRzpPPhNy58aibXVIl4sbTTrOAxVfykD0Wlfm7rSFX103ROz7vCE
         zTcA==
X-Gm-Message-State: AOAM5326LuKVX7vbuHIqmCWNg8oYpttVfmSLWn+JAosygzz69XJ811FN
        NU4OqHIiBkvutcNREIdwjDTKHqQJu/9SYoOn
X-Google-Smtp-Source: ABdhPJzOOkRFdcJaQY7lbCZ7mD5arxxe7Obxa1CG6yHZHc1fEtjjOPVelVRz/Pia3OXlK55Orv1W4g==
X-Received: by 2002:ab0:36b9:: with SMTP id v25mr3016581uat.129.1642586326049;
        Wed, 19 Jan 2022 01:58:46 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id t19sm3711058vsq.0.2022.01.19.01.58.44
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 01:58:44 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id p1so3448604uap.9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Jan 2022 01:58:44 -0800 (PST)
X-Received: by 2002:a67:e95a:: with SMTP id p26mr7058311vso.38.1642586324355;
 Wed, 19 Jan 2022 01:58:44 -0800 (PST)
MIME-Version: 1.0
References: <20220119000506.1299843-1-laurent@vivier.eu> <20220119000506.1299843-3-laurent@vivier.eu>
 <CAMuHMdXSFU4N+FLYkCLJCJcWJ74g=8Vr23Rx0cka-kDTBs6Z4Q@mail.gmail.com>
 <CAK8P3a2fjbet+nNAVt_WUxedUDWdRwb880KEa+MY1cFwYNC4SA@mail.gmail.com> <64d4b52f-cb5b-2024-e7f9-7a5babc62170@vivier.eu>
In-Reply-To: <64d4b52f-cb5b-2024-e7f9-7a5babc62170@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 19 Jan 2022 10:58:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVfK9gsXphDepvQCdMpLjROiR9OKwdb28eCfVdDrQRVjQ@mail.gmail.com>
Message-ID: <CAMuHMdVfK9gsXphDepvQCdMpLjROiR9OKwdb28eCfVdDrQRVjQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/5] rtc: goldfish: introduce goldfish_ioread32()/goldfish_iowrite32()
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        John Stultz <john.stultz@linaro.org>,
        linux-rtc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Laurent,

On Wed, Jan 19, 2022 at 10:11 AM Laurent Vivier <laurent@vivier.eu> wrote:
> Le 19/01/2022 à 09:49, Arnd Bergmann a écrit :
> > On Wed, Jan 19, 2022 at 9:21 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >> On Wed, Jan 19, 2022 at 1:05 AM Laurent Vivier <laurent@vivier.eu> wrote:
> >>
> >> I've just discovered include/linux/goldfish.h, which already has gf_*()
> >> accessors for 64-bit, so it'd make sense to move the above there,
> >> and adjust the names.
> >
> > Yes, good idea.
>
> So the idea is to put goldfish accessors inside a "#ifdef CONFIG_M68K ... #else ... #endif" in
> include/linux/goldfish.h and not in generic-asm/io.h for the generic version and
> m68k/include/ams/io.h for the m68k version?

No, just move

+#ifndef goldfish_ioread32
+#define goldfish_ioread32 ioread32
+#endif
+#ifndef goldfish_iowrite32
+#define goldfish_iowrite32 iowrite32
+#endif

to <linux/goldfish.h>, and rename them to gf_*().

Architectures can still override them in their own <asm/io.h>
(<linux/goldfish.h> includes <linux/io.h>).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
