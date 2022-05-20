Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6708C433EF
	for <linux-m68k@archiver.kernel.org>; Fri, 20 May 2022 15:08:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350636AbiETPIa convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 May 2022 11:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350707AbiETPIY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 20 May 2022 11:08:24 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 522C51796EB
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 May 2022 08:08:10 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id v14so7118002qtc.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 May 2022 08:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pEvlCe4V/em2drNfzpLbMhZO2cZ4QaTzSiWNKrAJWLg=;
        b=G85dcZl9VXS6gAmB7nKcasnAB4lxWgyRDrCIAM26kLO2cTCDOKYfuaGkTfMOnhp46t
         36XjVgxeV8RjCh9hdd4rM6NOV+JtkXParzAOdmuclaXyyQnH/myHBEQ5kN8xqqCuAjR1
         58+Wn4UuQydZ/ipmpxb0AbA6TVhVgmfkXcUrPgOa7fJPLdo5BRwKc3V6zyoyiZDIVtjA
         xkhCdErLC+2AGs4CK9uaNOBLcEtlbNOMofV4axlVu7+Ixc/64c+JSNmukcB9XfkXUWtd
         wBsgjkSp7ozektvCA3HUbSi++KhzgdRbo2aDUiIfKT3pPeyd8Di8j3aR8CZeGtg7OCA+
         639A==
X-Gm-Message-State: AOAM530sVU6WEl7dKtHDtsoDrFP4guGJm3PVnQ0fV1p/MK9W1Nj0mJXP
        k0SUfCfKSXk0QogOQ0p3GDF10mMRT2nZXw==
X-Google-Smtp-Source: ABdhPJzytOkIyP6vIvJENoqONEP64HI7sMR+WF467Kr0Rl0+9P7PrZdMa0OtyFAOc4kraoYy5VB8Mg==
X-Received: by 2002:a05:622a:487:b0:2f3:cb77:b19c with SMTP id p7-20020a05622a048700b002f3cb77b19cmr8165815qtx.352.1653059288962;
        Fri, 20 May 2022 08:08:08 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id v20-20020ac85794000000b002f914fa980bsm2910313qta.79.2022.05.20.08.08.08
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 08:08:08 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-2fee9fe48c2so90541597b3.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 May 2022 08:08:08 -0700 (PDT)
X-Received: by 2002:a81:9b0c:0:b0:2f4:c522:7d3c with SMTP id
 s12-20020a819b0c000000b002f4c5227d3cmr10719893ywg.316.1653059288103; Fri, 20
 May 2022 08:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <c15bedc83d90a14fffcd5b1b6bfb32b8a80282c5.1653057096.git.geert@linux-m68k.org>
 <286a1eef-e857-a31f-839b-00a4c835dfa9@roeck-us.net>
In-Reply-To: <286a1eef-e857-a31f-839b-00a4c835dfa9@roeck-us.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 May 2022 17:07:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3EYrGPPUEZ3_YPyr6zHnV-xEW3mYB_QyFYaqg_grF-w@mail.gmail.com>
Message-ID: <CAMuHMdX3EYrGPPUEZ3_YPyr6zHnV-xEW3mYB_QyFYaqg_grF-w@mail.gmail.com>
Subject: Re: [PATCH] m68k: atari: Make Atari ROM port I/O write macros return void
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Günter,

On Fri, May 20, 2022 at 4:52 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 5/20/22 07:32, Geert Uytterhoeven wrote:
> > The macros implementing Atari ROM port I/O writes do not cast away their
> > output, unlike similar implementations for other I/O buses.
> > When they are combined using conditional expressions in the definitions of
> > outb() and friends, this triggers sparse warnings like:
> >
> >      drivers/net/appletalk/cops.c:382:17: error: incompatible types in conditional expression (different base types):
> >      drivers/net/appletalk/cops.c:382:17:    unsigned char
> >      drivers/net/appletalk/cops.c:382:17:    void
> >
> > Fix this by adding casts to "void".
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks!

> > Removing the casts instead causes issues with functions propagating void
> > return values (return expression in void function), which BTW sparse
> > complains about, too.
>
> We live and learn. I didn't even know that this was valid syntax.

I knew about the syntax, but didn't realize immediately why it was
done that way.

Initially I thought it was some relic from the "always cast to void
to make it clear you do not care about the return value"-frenzy, which
are inside Linux visible mostly in the various "(void)acpi_<foo>(...);"
calls.  AFAIK these are checked by some external tools.
In Linux, we have __must_check to annotate the important cases.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
