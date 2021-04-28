Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071CAC433ED
	for <linux-m68k@archiver.kernel.org>; Wed, 28 Apr 2021 12:08:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC44660FDB
	for <linux-m68k@archiver.kernel.org>; Wed, 28 Apr 2021 12:08:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbhD1MIr convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 28 Apr 2021 08:08:47 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:39755 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbhD1MIr (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 28 Apr 2021 08:08:47 -0400
Received: by mail-vs1-f54.google.com with SMTP id u22so20707412vsu.6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Apr 2021 05:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=J5mBs5jaQh3wtMQmRUFFXymD4w0OFf894XaJ7i3Natc=;
        b=rY8GkTla7RzEn6p1ySouJT1hGarxBHlkOkHactrlwCDd4j5zZJfnATrJcQ2jUEJQ+7
         nerCi/YDPEIpDF7hZLlZ/e8eDCI2qc1Q9m9wocXfW81aveK5t7JBpdjLl07eB/wfwQrI
         zwDswBl6eGaVFHD7ciyzhaz76xGrAPIu2tU9P2PJ4j6iUC1JeknFwKGgQKHH5rY+IYEo
         wyxMVfwsmuLofpY46wMDOF3G01VhaOu/PApuHsIB6usuV5jkU4x4lyNQWpIDwZG1UYQ/
         CIsT5093yHhHIhaUMsoajy7QSSTMILQ5HU6vu39BTRm9z0fRCA8xYhbZ07wpf8wYMus4
         YyJA==
X-Gm-Message-State: AOAM531n1LK2JJzRiB9oUHuYBs2zftm9MNO7whBpkYaGsz7CNWIEo+EY
        8UOwiKVdkN0OiBExJCEDso4puqjamvRS9jyPmwo=
X-Google-Smtp-Source: ABdhPJyt7LPnKkg4RokoJwXilgPmqlDDD/Bu5PTcYsE2WO63a5OjnRGES3axOm0jQe9YJGZ21DkJc+/8VBf1Z2ktDK0=
X-Received: by 2002:a67:8745:: with SMTP id j66mr24878487vsd.18.1619611682536;
 Wed, 28 Apr 2021 05:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210323221430.3735147-1-laurent@vivier.eu> <20210323221430.3735147-3-laurent@vivier.eu>
 <a9c75ae7-6023-6b6c-260f-a0d6841ea4fa@vivier.eu>
In-Reply-To: <a9c75ae7-6023-6b6c-260f-a0d6841ea4fa@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 28 Apr 2021 14:07:51 +0200
Message-ID: <CAMuHMdW49S_81Oip2p+yUO5YUL1-V3_K_C1WEXux7mQWcb-mKA@mail.gmail.com>
Subject: Re: [PATCH 2/2] m68k: introduce a virtual m68k machine
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Laurent,

On Tue, Apr 27, 2021 at 7:20 PM Laurent Vivier <laurent@vivier.eu> wrote:
> Le 23/03/2021 à 23:14, Laurent Vivier a écrit :
> > This machine allows to have up to 3.2 GiB and 128 Virtio devices.
> >
> > It is based on android goldfish devices.
> >
> > Signed-off-by: Laurent Vivier <laurent@vivier.eu>

> As 5.12 has been released, is this possible to consider having this new machine in the next release?
>
> All changes are contained under arch/m68k and protected by the CONFIG_VIRT flag. This should not
> have any impact on the other m68k machines. In any case, I'll be able to maintain the machine and
> fix any problem.

Thanks for the reminder!

Please accept my apologies: I had completely forgotten about your patch.
By the time it reappeared on my radar (due to Alexandre's reply), it was
already too late for v5.13.

I have tested and reviewed your patch, great work!
I'm confident this can make v5.14, with the small nits fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
