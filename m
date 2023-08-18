Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DA8C7112F
	for <linux-m68k@archiver.kernel.org>; Fri, 18 Aug 2023 14:34:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377434AbjHROdf convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 18 Aug 2023 10:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377473AbjHROde (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 18 Aug 2023 10:33:34 -0400
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9AF13D
        for <linux-m68k@vger.kernel.org>; Fri, 18 Aug 2023 07:33:33 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3a412653352so660489b6e.0
        for <linux-m68k@vger.kernel.org>; Fri, 18 Aug 2023 07:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692369212; x=1692974012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CDLbD0DyJNMMtmxvqBGB5g4Nk5G927YP2erLVVEv/E=;
        b=CpEZy7aAu9gfeRfEDp7Bj3eUy5P5RQYr+SE5bvCgD1N4jzQHvD4WDp/3n9oep9MezO
         8IhGMKjGVBVWhRtkJixSx6nnWgv9eTZTgIYM7zOKMwqUEwGG5RRaRgSZj8Bbwbw8TEPu
         OomukjNYNT8tS9rL0bQZWq0DSy6wtAlxRB9RTxD+J08+maZi3aqz3WmVqTclRJ8R6UKA
         tHH/4wB//FrtNJ9xuUiNOy382DdSID129y4QYZjjD91TqnZm46DceKddfFihpD8XxTBN
         UxYAvAu2sHGqL56Fl3VN9nJtLS79IbtQBruXXT6Z+JrRPtlCULmMwlXBjFM4ry2z7oye
         JDxw==
X-Gm-Message-State: AOJu0Yz1ONLX272O9N+MAbgtKTLKQpVAI7hwiRgfnXCxu/T+Vjb7m8sF
        eo5cpjtwc73GqVS78QNlVslyc26VXM4TFGzx
X-Google-Smtp-Source: AGHT+IF9t1edMB6bI9IUXmtMcLFDDI6hTgnBotZLNapS/SBsaLrp+w24sZ/oLhHkOYqjnpTchyLUqA==
X-Received: by 2002:a05:6808:1795:b0:3a4:ccf:6a63 with SMTP id bg21-20020a056808179500b003a40ccf6a63mr3966932oib.55.1692369212330;
        Fri, 18 Aug 2023 07:33:32 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id bf15-20020a056808190f00b00396050dca14sm913436oib.28.2023.08.18.07.33.31
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 07:33:31 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3a7f74134e7so651270b6e.1
        for <linux-m68k@vger.kernel.org>; Fri, 18 Aug 2023 07:33:31 -0700 (PDT)
X-Received: by 2002:a05:6358:921:b0:139:bbae:1f3 with SMTP id
 r33-20020a056358092100b00139bbae01f3mr3469469rwi.3.1692369211551; Fri, 18 Aug
 2023 07:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230817035001.8400-1-schmitzmic@gmail.com> <20230817035001.8400-3-schmitzmic@gmail.com>
 <f604a8f6-6203-84c5-82b9-570348d416ec@linux-m68k.org> <CAMuHMdV6NWRKL8DAD2e4HPz=fbcAUqi6ww-8_9Mjg0t8eiZCGQ@mail.gmail.com>
 <8bf4980e-f269-48d2-5b77-3fd6c7270bef@gmail.com> <fd7cd3b9-3f86-feb4-e9ce-aafaea272840@gmail.com>
In-Reply-To: <fd7cd3b9-3f86-feb4-e9ce-aafaea272840@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Aug 2023 16:33:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXcz0koHQXAaWCoGXPJVva2a43C9CuwQf3mZeWhPaSiWw@mail.gmail.com>
Message-ID: <CAMuHMdXcz0koHQXAaWCoGXPJVva2a43C9CuwQf3mZeWhPaSiWw@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/2] m68k/q40: add data_swab option for pata_falcon
 to byte-swap disk data
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Finn Thain <fthain@linux-m68k.org>, will@sowerbutts.com,
        linux-m68k@vger.kernel.org, rz@linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Thu, Aug 17, 2023 at 11:28 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 18/08/23 07:21, Michael Schmitz wrote:
> >>>> +             priv->swap_mask = pata_falcon_swap_mask;
> >> priv->swap_mask = pata_falcon_swap_mask >> (2 * pdev->id);
> >
> > The Atari platform driver data is registered with pdev->id=-1. That'll
> > break here.
>
> Confirmed.

Oops.

> > (Not sure why that choice of pdev->id, and whether it can be changed
> > to 0 easily)
> Seems to work OK with ID set to 0, so I'll simplify that as you suggest.

-1 is used to indicate there can only ever be a single instance.
Of course 0 also works, but causes ".0" to be appended to the platform
device's name, visible in e.g. /sys/bus/platform/devices/.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
