Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14596C77B7C
	for <linux-m68k@archiver.kernel.org>; Tue,  9 May 2023 08:51:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234651AbjEIIvX convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 9 May 2023 04:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234483AbjEIIvV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 9 May 2023 04:51:21 -0400
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F54D10D4
        for <linux-m68k@lists.linux-m68k.org>; Tue,  9 May 2023 01:51:20 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-559e2051d05so80620737b3.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 09 May 2023 01:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683622279; x=1686214279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g8+9AC6S3z51D9b6RJB732xmtylxElOzATEHA3R+ppU=;
        b=Ori0Y/IM+oTKHIwjId7XHBGeLJlGNmLBCbDiDDOVGk/MD5sA1vKE5PIibn/MREY3R6
         a0g/VG5ObkD+92WvB2KXXHUhpoyoAbexxyyvEQS22ZCqWPEMbDr0tMeZ/2DbUnR1M+ZW
         QNJiMmZSaHyfcF0kngxYDPJwsUL/hcu0fz31ZXxOyGn+oO0eb5rDRKNmCFmqavi/wFbj
         FVTMtuHhZWL9nlsEjsvu1/zQKzhw+J2DyVTKgJnYI/gJh4StCaOZV2oaIgAAmQW1tjpW
         zXHR97og9gOj+r7tZvOy7yr0K37M2IxltTM6OX7ac+70RnPQ4LfLso/OdHMwjhDr0wNi
         TzTg==
X-Gm-Message-State: AC+VfDwAd8IQtMSTLJNIyz63RsKRb/h9+maopG1UpLdXYBSBf/7XY9mg
        loK9ONm65T6he0GvoctINfEOOGuT4Nh/sA==
X-Google-Smtp-Source: ACHHUZ4gV/niuIVe1vyr4OM41dPVfikclOwIpQLlaWEwgtJQ+BSXQlukkYDsiksRcklUwe1bw7XLpw==
X-Received: by 2002:a0d:db15:0:b0:55a:3cd6:cded with SMTP id d21-20020a0ddb15000000b0055a3cd6cdedmr16437133ywe.4.1683622279257;
        Tue, 09 May 2023 01:51:19 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id d185-20020a814fc2000000b00545cb6adc16sm3125245ywb.6.2023.05.09.01.51.17
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 01:51:17 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-b9e6ec482b3so7257528276.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 09 May 2023 01:51:17 -0700 (PDT)
X-Received: by 2002:a25:ac9d:0:b0:ba1:90d2:cfbe with SMTP id
 x29-20020a25ac9d000000b00ba190d2cfbemr13326995ybi.8.1683622277230; Tue, 09
 May 2023 01:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230314121216.413434-1-schnelle@linux.ibm.com>
 <20230314121216.413434-29-schnelle@linux.ibm.com> <202303141252027ef5511a@mail.local>
 <aa68b4afdca34bf3bfd2439b03e6f9bcfad94903.camel@linux.ibm.com>
 <b7017996-b079-4534-a24a-080003772a66@app.fastmail.com> <CAMuHMdXJ=hsB=A_umQnPMVSU+BGqeHt3O-2ygr3p_f7pHHvf=Q@mail.gmail.com>
 <552c51fb-41b2-430b-b13c-0e578098dbf6@app.fastmail.com>
In-Reply-To: <552c51fb-41b2-430b-b13c-0e578098dbf6@app.fastmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 May 2023 10:51:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV-CY_foGPY5PZV=W92rnvSa0X3PTsUoBpzQ6vCNLSzEw@mail.gmail.com>
Message-ID: <CAMuHMdV-CY_foGPY5PZV=W92rnvSa0X3PTsUoBpzQ6vCNLSzEw@mail.gmail.com>
Subject: Re: [PATCH v3 28/38] rtc: add HAS_IOPORT dependencies
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Niklas Schnelle <schnelle@linux.ibm.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-kernel@vger.kernel.org,
        Linux-Arch <linux-arch@vger.kernel.org>,
        linux-pci@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
        linux-rtc@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Arnd,

On Tue, May 9, 2023 at 10:23 AM Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, May 9, 2023, at 08:38, Geert Uytterhoeven wrote:
> > On Mon, May 8, 2023 at 10:01 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >> On Mon, May 8, 2023, at 17:36, Niklas Schnelle wrote:
> >>
> >> I think the m68k/atari and mips/dec variants don't necessarily
> >> qualify as PIO, those are really just pointer dereferences, and
> >> they don't use the actual inb/outb functions.
> >>
> >> On atari, it looks like HAS_IOPORT may be set if ATARI_ROM_ISA
> >> is, but on dec it's never enabled.
> >
> > Atari does not use RTC_DRV_CMOS, but still relies on generic RTC
> > instead.
>
> Ah right, I now remember working on that code, so we're good on
> m68k then. I think it should work for everyone using
>
>        depends on HAS_IOPORT || ARCH_DECSTATION
>
> in that case, as that is the only exception.
>
> > Last time (in 2013?) I tried converting to RTC_DRV_CMOS by registering
> > an "rtc_cmos" platform device, I couldn't get it to work.
>
> If you ever want to revisit this, I suspect the harder part here
> is to detach arch/m68k/ from the RTC_DRV_GENERIC code first, pushing
> the device registration into the individual machine specific time.c
> code. It's probably not even worth trying to share the rtc-cmos
> driver, but it might be useful to share the library code like
> RTC_DRV_ALPHA does.

Arch/m68k is not that entangled with RTC_DRV_GENERIC, as amiga_defconfig
does not enable it, but enables CONFIG_RTC_DRV_MSM6242 and
CONFIG_RTC_DRV_RP5C01 instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
