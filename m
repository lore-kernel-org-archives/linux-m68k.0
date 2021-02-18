Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F0CC433DB
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Feb 2021 14:13:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11B596146D
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Feb 2021 14:13:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233186AbhBROLj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 18 Feb 2021 09:11:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:60686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232141AbhBROAv (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 18 Feb 2021 09:00:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1E4364E85
        for <linux-m68k@lists.linux-m68k.org>; Thu, 18 Feb 2021 13:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613656784;
        bh=RT4x+beIoOZVYL4jYBlALf8JhbgGOWPj+TpV+50ymjk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Jf7NwF/0QbWiBIprLKL+3WCqlLn9GBFkNhTo5yc62PpJj2/3wvDRkuI3c566Kesz1
         CTz/cExe7q/cbbiiGmFQrAX9PXxNe0iOsL+99CMtmgrwpA/COQzRWjQ+ljohvCXgDQ
         jVKtUso9dlL5NZfcC0AqZH+e5//D1HmgKC3eyv/KagylSR47qaSnJvNjQC1FFKV4HK
         O7eaafKP8n7HvpXiMMK9+Ev3H8HQoHnlLbX5qUCv0/HOdYoT6mbxy9j5d4EmqEQ0Uv
         GxtbjARdVyFfJwvhOq1o4nW1Cxyze+x4nlmEU2wqHVN+aGUdk0W/TFGh/aU4XL3CiQ
         +YgH+001Xdr9Q==
Received: by mail-ot1-f43.google.com with SMTP id c16so1946663otp.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 18 Feb 2021 05:59:44 -0800 (PST)
X-Gm-Message-State: AOAM530+6YqPzDzVk5FTArk5uNhaaUsGqIxj9R/6YSQvG5Fj1NMDFION
        3Wn56TcCDtw97nLxKt54ymwnyWYPDqxHgC9kBgI=
X-Google-Smtp-Source: ABdhPJxC9ZR+yQA7BZhwjrnYxZNyV0JrLHICEmBzVMWp4WwRG3vC4wqCWg5ZPhPF0D8BarTDgRvFWMJsNG1p+fLodjU=
X-Received: by 2002:a9d:3403:: with SMTP id v3mr2926726otb.305.1613656783870;
 Thu, 18 Feb 2021 05:59:43 -0800 (PST)
MIME-Version: 1.0
References: <c46ddb954cfe45d9849c911271d7ec23@hisilicon.com>
 <CAK8P3a2adJsz5hRT_eMzSoHnUBC+aK9HZ18=oAYCZ-gisEkd1w@mail.gmail.com>
 <24e0652b3afa48cdbf7c83287e43c087@hisilicon.com> <CAK8P3a0fwMe9LaXMfKjH46yvt6o-euZJZ4HXtVRPhYbKvAUPKg@mail.gmail.com>
 <0b766dba0b004ced94131e158cd8e67d@hisilicon.com> <CAK8P3a2ZnKeeZ-zEWO+vHogs0DdLuDrZet61cSmJe_UMYhtaWQ@mail.gmail.com>
 <5148eb2aaceb42d78087bc6d8ce15183@hisilicon.com> <5fcea94e-6fc9-c340-d7d2-4ae8b69890b8@telegraphics.com.au>
 <0c0ea8eca77c45ea89f2d4432580211c@hisilicon.com> <28d4b91d-1774-a8a-df97-7ac9b365c2@telegraphics.com.au>
 <CAK8P3a0VquJPxvS8B=2kLQ5y=h5BftJDR7WJYmj3hgQ8yQY5=Q@mail.gmail.com> <CAMuHMdUFv2r+YAttodcXhLxEVe+2KXgAG=q8Z3vA6WUKQj7zVA@mail.gmail.com>
In-Reply-To: <CAMuHMdUFv2r+YAttodcXhLxEVe+2KXgAG=q8Z3vA6WUKQj7zVA@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 18 Feb 2021 14:59:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a08y3pH6OGtPnPs_HMHRh0Q8xnKr40Lt=vMCW6T1yjz6w@mail.gmail.com>
Message-ID: <CAK8P3a08y3pH6OGtPnPs_HMHRh0Q8xnKr40Lt=vMCW6T1yjz6w@mail.gmail.com>
Subject: Re: [RFC] IRQ handlers run with some high-priority interrupts(not
 NMI) enabled on some platform
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Finn Thain <fthain@telegraphics.com.au>,
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

On Thu, Feb 18, 2021 at 1:30 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> The reason drivers/ide is doing that may be related to IDE hard drive
> quirks.  The old WD Caviar drives didn't obey disabling the IDE interrupt
> at the drive level.  On PC, that worked fine, as IRQs 14 and 15 weren't
> shared with other devices.  On systems with shared interrupts, that
> broke badly, and led to an interrupt storm.

So presumably anyone that has one of those old drives will not be
able to move to drivers/ata then? I see that drivers/ata doesn't do
the transfers in interrupt mode, so it would seem to rely on masking
at the device level.

On the other hand, out of the five m68k specific IDE drivers
(gayle, buddha, falcon, mac_ide, q40), only the last two don't
seem to have an ata driver equivalent.

mac_ide uses the highest priority interrupts (NUBUS_C, NUBUS_F)
so it appears to not actually benefit from the nested hardirq but would
benefit being converted to a sata driver with processing at softirq time.

q40 in turn doesn't appear to share interrupts, though its irq_disable()
function probably doesn't do what it should. I could not figure out at
what priority this one runs, and if it is expected to get interrupted.

      Arnd
