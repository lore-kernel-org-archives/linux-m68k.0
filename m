Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C131BC433EF
	for <linux-m68k@archiver.kernel.org>; Fri, 20 May 2022 12:46:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349345AbiETMqj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 May 2022 08:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347362AbiETMqf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 20 May 2022 08:46:35 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 822FB5C342
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 May 2022 05:46:34 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id 135so4262754qkm.4
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 May 2022 05:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UhZYflED6/DiNr1feOC9OhkU49iweDam4jS4WznrIsk=;
        b=nopuiogHUkmuHp1nac8662VzvWGIpJ0CcCSNNDYQUo7XAAWM1cgkPIvy9GNv7o5j6/
         6zjkLe8jYGHQJweSFJzKuIhV4t3xcHxnMa7BaAxBuGYjLYBZIr1c4HGVjqT6MwXEl77p
         7vkfXvS7HvNQWiIvKtiU9xCTgRkhp7PRkCdUX17H1o0WrOO49TE9Ud2X1XFXZuPr72qA
         VM7ih5uUl08Fg6IWTIW6yMIpnVlNBzbUkw/VC6cHuj5ABRs55tLLQ0GZGCuom1r+GzJi
         HFjoWO+pXAXeCR9/CvQwxygkYQSFgVCeoxckuW59IUDU0Ubtdub5cxf/WOA0epX4hysu
         RkAQ==
X-Gm-Message-State: AOAM530g5qxflNf1/OPM37jkAyFQcgr+7VMR3s/gaLv6wC+h7XpZqcNL
        Ki22W95ZXA7lLtGFdH3tn2mYC9VkIzhaGg==
X-Google-Smtp-Source: ABdhPJzBVv9ibdwvw59+iMRm7y+Xda5vl98nkiUeZzPUzLK/Vhk0JUlHzgAwlNo03Eno0TV5jX4AjA==
X-Received: by 2002:a05:620a:2407:b0:6a0:5027:f4d5 with SMTP id d7-20020a05620a240700b006a05027f4d5mr6068742qkn.318.1653050793229;
        Fri, 20 May 2022 05:46:33 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id t19-20020ac85893000000b002f3e2435ee2sm3462177qta.63.2022.05.20.05.46.32
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 05:46:32 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id q135so13993495ybg.10
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 May 2022 05:46:32 -0700 (PDT)
X-Received: by 2002:a05:6902:389:b0:633:31c1:d0f7 with SMTP id
 f9-20020a056902038900b0063331c1d0f7mr9068692ybs.543.1653050792549; Fri, 20
 May 2022 05:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <6285958d.+Z2aDZ4O1Y9eiazd%lkp@intel.com> <0530d502-1291-23f3-64ac-97bd38a26bd4@roeck-us.net>
 <CAMuHMdU3SYOwE5ftDwymQpVwWmpbC=1Ytyp0Y9GaeUS2i1cP+A@mail.gmail.com>
In-Reply-To: <CAMuHMdU3SYOwE5ftDwymQpVwWmpbC=1Ytyp0Y9GaeUS2i1cP+A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 May 2022 14:46:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVx7r-4TVV9uVJppT-7ZAriov01BUNk4ghU9Bs4uY28vQ@mail.gmail.com>
Message-ID: <CAMuHMdVx7r-4TVV9uVJppT-7ZAriov01BUNk4ghU9Bs4uY28vQ@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION 736ee37e2e8eed7fe48d0a37ee5a709514d478b3
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     kernel test robot <lkp@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-staging@lists.linux.dev,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>, linux-nvme@lists.infradead.org,
        linux-hwmon@vger.kernel.org,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, May 20, 2022 at 2:40 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, May 19, 2022 at 8:48 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > On 5/18/22 17:55, kernel test robot wrote:
> > > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > branch HEAD: 736ee37e2e8eed7fe48d0a37ee5a709514d478b3  Add linux-next specific files for 20220518
> > >
> > > Error/Warning reports:
> > >
> > > https://lore.kernel.org/linux-mm/202204291924.vTGZmerI-lkp@intel.com
> > > https://lore.kernel.org/linux-mm/202205041248.WgCwPcEV-lkp@intel.com
> > > https://lore.kernel.org/linux-mm/202205122113.uLKzd3SZ-lkp@intel.com
> > > https://lore.kernel.org/linux-mm/202205172344.3GFeaum1-lkp@intel.com
> > > https://lore.kernel.org/linux-mm/202205190527.o9wVEvHI-lkp@intel.com
> > >
> > > Error/Warning: (recently discovered and may have been fixed)
> > >
> > [ .. ]
> > > drivers/hwmon/nct6775-platform.c:199:9: sparse:    unsigned char
> > > drivers/hwmon/nct6775-platform.c:199:9: sparse:    void
> >
> > This is getting tiresome. Every driver using outb() on m68k will
> > experience that "problem". As far as I can see, it is caused by
> >
> > #define out_8(addr,b) (void)((*(__force volatile u8 *) (unsigned long)(addr)) = (b))
> >
> > in arch/m68k/include/asm/raw_io.h. I have no idea what the
> > "(void)" is for,
>
> The "(void)" makes sure there is no return value.
> Which matters if the result of a function returning void is propagated
> to another function returning void.

Which, FTR, sparse also doesn't like:

    error: return expression in void function

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
