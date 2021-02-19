Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62074C433DB
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Feb 2021 08:11:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FFB364EBF
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Feb 2021 08:11:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhBSILu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 19 Feb 2021 03:11:50 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:39951 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhBSILu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 19 Feb 2021 03:11:50 -0500
Received: by mail-oi1-f181.google.com with SMTP id 18so5025951oiz.7
        for <linux-m68k@lists.linux-m68k.org>; Fri, 19 Feb 2021 00:11:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jPT6wduAtrMWTggH0orR+C1UazQfve0OuOkS45gl8nY=;
        b=XMd/h+YZxKVOBNQbVWstDUsP72YqumGEnmzCuEWSaqO+ZleaNOgGkd+trFSpRRX3Yu
         2GGoBrvnlViumhaNRkm59+8Y20ZPrryh90hs/wOTGm2hKcJwZqwf5KLq7rO5DGBfiSny
         uzLqvXJ4PxoiodZ6WS3F+prsFbp6Xoilu9K8S7xm+NaWG9HbpCNqCS9mlCjrNZ9ChSoh
         JAQRodJt96CQvFYZ4+NXyVDvrQBagziBLnDs/tsdPShAIwpVIMNyuXYJnE59B7t+Gja/
         bhgJmwKiZ8rzd3PjxNhyocklUDJ0LAjKe31cf1Be7EtDEWiHxvBomb6ZaYlCZM0uLpOZ
         ukkg==
X-Gm-Message-State: AOAM5339aUU/QNnxUvZxirnKSU8mBicEw3n7M+QOJ+O79NGIs7drL4CP
        QgeqD+WPs0qVw/CDZdeMGp6ph/zSq24b6FNl9n8=
X-Google-Smtp-Source: ABdhPJyfSiGUOklDk+pZ7+kPOH7+UKy79ImXV69aDZPSdlOwo5+D+0gSw7MvtoDHZ/JLtkZo/RFJZ+PEKeY7w0i2roc=
X-Received: by 2002:aca:744:: with SMTP id 65mr5573246oih.153.1613722269299;
 Fri, 19 Feb 2021 00:11:09 -0800 (PST)
MIME-Version: 1.0
References: <c46ddb954cfe45d9849c911271d7ec23@hisilicon.com>
 <CAK8P3a2adJsz5hRT_eMzSoHnUBC+aK9HZ18=oAYCZ-gisEkd1w@mail.gmail.com>
 <24e0652b3afa48cdbf7c83287e43c087@hisilicon.com> <CAK8P3a0fwMe9LaXMfKjH46yvt6o-euZJZ4HXtVRPhYbKvAUPKg@mail.gmail.com>
 <0b766dba0b004ced94131e158cd8e67d@hisilicon.com> <CAK8P3a2ZnKeeZ-zEWO+vHogs0DdLuDrZet61cSmJe_UMYhtaWQ@mail.gmail.com>
 <5148eb2aaceb42d78087bc6d8ce15183@hisilicon.com> <5fcea94e-6fc9-c340-d7d2-4ae8b69890b8@telegraphics.com.au>
 <0c0ea8eca77c45ea89f2d4432580211c@hisilicon.com> <28d4b91d-1774-a8a-df97-7ac9b365c2@telegraphics.com.au>
 <CAK8P3a0VquJPxvS8B=2kLQ5y=h5BftJDR7WJYmj3hgQ8yQY5=Q@mail.gmail.com> <a8595ec5-88db-072c-9cc3-7a3a301fe191@gmail.com>
In-Reply-To: <a8595ec5-88db-072c-9cc3-7a3a301fe191@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 Feb 2021 09:10:57 +0100
Message-ID: <CAMuHMdWBsupz06wVyVENHfjxP0uQ+1b7cnz6xGEMyqQkJFTeAA@mail.gmail.com>
Subject: Re: [RFC] IRQ handlers run with some high-priority interrupts(not
 NMI) enabled on some platform
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "funaho@jurai.org" <funaho@jurai.org>,
        "philb@gnu.org" <philb@gnu.org>, "corbet@lwn.net" <corbet@lwn.net>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Thu, Feb 18, 2021 at 11:11 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 19/02/21 12:19 am, Arnd Bergmann wrote:
> > drivers/net/ethernet/8390/apne.c
> > drivers/net/ethernet/8390/ax88796.c
> > drivers/net/ethernet/8390/hydra.c
> > drivers/net/ethernet/8390/mac8390.c
> > drivers/net/ethernet/8390/ne.c
> > drivers/net/ethernet/8390/zorro8390.c
> [...]
> > Most of these are normal short-lived interrupts that only transfer
> > a few bytes or schedule deferred processing of some sort.
> > Most of the scsi and network drivers process the data in
> > a softirq, so those are generally fine here, but I do see that 8390
> > (ne2000) ethernet and the drivers/ide drivers do transfer their
> > data in hardirq context.
> >
> >          Arnd
>
> 8390 ethernet drivers are widely used on m68k platforms (Amiga and
> Atari). At least on Amiga, the corresponding interrupt is a hardirq so
> I'd advise caution. That said, the 8390 drivers might benefit from some
> refactoring (the way these drivers are compiled does prevent e.g. the
> APNE driver from being used with two different variants of PCMCIA
> interfaces. I had begun some work on making IO primitives runtime
> selected two years ago but that ended up looking too ugly ...).
>
> Can't recall what IPL the 8390 interrupts operate at - Geert?

#define IRQ_AMIGA_PORTS         IRQ_AUTO_2

Zorro expansion boards can also use

#define IRQ_AMIGA_EXTER         IRQ_AUTO_6

and some boards may have a jumper to select the latter, but all Amiga
Linux drivers use IRQ_AMIGA_PORTS.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
