Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288E4C433F5
	for <linux-m68k@archiver.kernel.org>; Tue,  9 Nov 2021 08:15:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BDB1611BF
	for <linux-m68k@archiver.kernel.org>; Tue,  9 Nov 2021 08:15:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243987AbhKIISc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 9 Nov 2021 03:18:32 -0500
Received: from mail-ua1-f43.google.com ([209.85.222.43]:37680 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235389AbhKIISc (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 9 Nov 2021 03:18:32 -0500
Received: by mail-ua1-f43.google.com with SMTP id l43so36930457uad.4
        for <linux-m68k@vger.kernel.org>; Tue, 09 Nov 2021 00:15:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tQmJQ0theI2WYPUDat4qPwi5IRdzZ241bY4hdW+wuiU=;
        b=YyFf8Ewk+6OMi07C5sAgsH63Fi/4RlpAkZ9nbRltZ8jEnLmYZURdw1X3Zj0ocp6pAR
         4wzRR/Gel7/BREBfBkAax4u4pSTQ3zNjbjrPz3Z9DPy5rh4QgkqlM7aGr8odW//zes0L
         Q86R2z41Ev6RYe1KspLp4ed0GkRGgUNAeG09/r2XsVNRjn1ANl5S1SzdiQVTQn9zCigY
         58AJui/z4lVUTAy+UD01qiZSA1vksNMd4i/XUJjPIc1NsDMCcUGG/G8TdFtvvPVNMldA
         4xVYo3XmomLdOPdmwdmbwGfKVRswFCWxlgPpeUJ3/ApkqrH0ICw90J5yo1rSlL2YeGky
         Fxcw==
X-Gm-Message-State: AOAM532IAkXUZMjHmfcptlZPjk/XKvt7pk23S00YzNf9HGTMS7BXLoFi
        Djl9/9wIxuSYr4zDy5cN269oqdqF1mvGayUg
X-Google-Smtp-Source: ABdhPJyFaj//ebA6i8xPU/VrCO1kcPYGfhqB8dUZvARaCVRIITnASI3m5shm+LhgIFJ/UpBNk3vDLQ==
X-Received: by 2002:ab0:7784:: with SMTP id x4mr7571028uar.143.1636445746513;
        Tue, 09 Nov 2021 00:15:46 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id m15sm1581515vkl.40.2021.11.09.00.15.46
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 00:15:46 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id p37so35791077uae.8
        for <linux-m68k@vger.kernel.org>; Tue, 09 Nov 2021 00:15:46 -0800 (PST)
X-Received: by 2002:a05:6102:3a07:: with SMTP id b7mr84379870vsu.35.1636445746049;
 Tue, 09 Nov 2021 00:15:46 -0800 (PST)
MIME-Version: 1.0
References: <20211109040242.11615-1-schmitzmic@gmail.com> <20211109040242.11615-3-schmitzmic@gmail.com>
In-Reply-To: <20211109040242.11615-3-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Nov 2021 09:15:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWQNzntik0Op6vdpLOD31SCUiu+Lr5bbL9EKOyo3feYNQ@mail.gmail.com>
Message-ID: <CAMuHMdWQNzntik0Op6vdpLOD31SCUiu+Lr5bbL9EKOyo3feYNQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] m68k: io_mm.h - add APNE 100 MBit support
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        ALeX Kazik <alex@kazik.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Nov 9, 2021 at 5:03 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Add code to support 10 Mbit and 100 Mbit mode for APNE driver.
>
> A new ISA type ISA_TYPE_AG16 dynamically switches the Amiga
> ISA inb accessor to word access as required by the 100 Mbit cards.
>
> Patch modified after patch "[PATCH RFC net-next] Amiga PCMCIA
> 100 MBit card support" submitted to netdev 2018/09/16 by Alex
> Kazik <alex@kazik.de>.
>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

You forgot to add my tag ;-)

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
