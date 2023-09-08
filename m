Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3510BEE57D9
	for <linux-m68k@archiver.kernel.org>; Fri,  8 Sep 2023 07:13:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241369AbjIHHNh convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 8 Sep 2023 03:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238648AbjIHHNg (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 8 Sep 2023 03:13:36 -0400
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE571BCB
        for <linux-m68k@lists.linux-m68k.org>; Fri,  8 Sep 2023 00:13:28 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-501bef6e0d3so2960945e87.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 08 Sep 2023 00:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694157204; x=1694762004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0v9HZl10d+1aEuTYsn3si5rKiEVCmNu7rrWd/6QlBLo=;
        b=ErAzLwxX4TAQ3nsZdvePp0PHLUyk4zHfQuxKoZmNfkOevReLYav0ieoEfELJH68KGw
         ZSrwgYrL0qhjWypVQfuoNAszd7lg7eFhjsXhgt4o3AYHDu/lP8fMZZ/TFr1TGc/tPIUt
         NRCqVoC+yuQSaj594MwOWV/ETdJTMYIwPrXHNvYtBUlV0FR4wqibUVTrA6l150nZ0/xX
         T18SbrLWKrmoHCZ58v/DnopC/2hIsRK9iP+Hf/72Ub1kfZexxPTP9pVoOp5OFo4eHJoj
         1NNTLmdfo0FzlzKHmmSOCH98AIb76J/RF0wdkEYn5mVB5g54Mj4flCemtwiL6OAoZbk3
         wnnA==
X-Gm-Message-State: AOJu0Yw2klg3G5c5L+g0M92ggfFmCkhHQRvwDKEspDsNlnbrpFgJOSlW
        9wtGyeZUA+JbDmRn5HhK08WXChOi0xy5pr6p
X-Google-Smtp-Source: AGHT+IGMT4Oo1mGnJFeBk162eTtMYIeAlVCicVuEiHP2x28N25j5ZUtTEwsVuq58eBulEIFAE7faCg==
X-Received: by 2002:ac2:5446:0:b0:500:9d4a:89ff with SMTP id d6-20020ac25446000000b005009d4a89ffmr1108633lfn.62.1694157204107;
        Fri, 08 Sep 2023 00:13:24 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id w10-20020ac2598a000000b004f86d3e52c0sm189700lfn.4.2023.09.08.00.13.23
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 00:13:23 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2bf5bf33bcdso22042121fa.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 08 Sep 2023 00:13:23 -0700 (PDT)
X-Received: by 2002:a05:651c:1029:b0:2bc:b45e:bb3f with SMTP id
 w9-20020a05651c102900b002bcb45ebb3fmr1188477ljm.13.1694157203559; Fri, 08 Sep
 2023 00:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694093327.git.geert@linux-m68k.org> <0778d9dd186928666d760d5523c7d2311f781621.1694093327.git.geert@linux-m68k.org>
 <142e4eb5-b47e-e27c-1be3-bc6c5df889c0@linux-m68k.org> <6ff868a4-d433-6e92-8bf2-573fee19ce2c@gmail.com>
 <291d4cb0-e3b8-1e7d-8b34-79aee23865fa@linux-m68k.org>
In-Reply-To: <291d4cb0-e3b8-1e7d-8b34-79aee23865fa@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Sep 2023 09:13:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAEWUvfO8-ASrb=PJwftYEu+BXLzY7kf+aJGY4DuUTbA@mail.gmail.com>
Message-ID: <CAMuHMdXAEWUvfO8-ASrb=PJwftYEu+BXLzY7kf+aJGY4DuUTbA@mail.gmail.com>
Subject: Re: [PATCH 22/52] m68k: atari: Add and use "atari.h"
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>,
        Philip Blundell <philb@gnu.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        Sam Creasey <sammy@sammy.net>,
        Laurent Vivier <laurent@vivier.eu>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Fri, Sep 8, 2023 at 3:05 AM Finn Thain <fthain@linux-m68k.org> wrote:
> On Fri, 8 Sep 2023, Michael Schmitz wrote:
> > atariints.h already has some prototypes, so yes on that account.
> >
> > atarihw.h only has inlines, but sound and time related prototypes could
> > be added there, too.
> >
> > Geert's intentions might have been avoiding inclusion of all the
> > hardware specific data in those two files, but the only source file to
> > benefit from this is config.c (the other three already include
> > atariints.h and atarihw.h).
> >
> > OTOH, considering this patch series adds a lot of other headers that
> > only contain prototypes, it might be better to keep to that pattern
> > everywhere.
>
> I think Geert's intention may have been to avoid adding definitions to the
> asm/foo.h headers shipped with "make headers_install". If that's the
> intention, there would seem to be a mess to be cleaned up, for which I'm
> partly to blame...

arch/m68k/include/asm/ is not shipped, (arch/m68k/include/uapi/asm/ is).
However, arch/m68k/include/asm/ is shared with the whole tree, while
only the core code under arch/m68k/ needs these definitions.

There is (are) definitely (an) opportunit{y,ies} for moving more stuff
around (from <asm/...> to "...", more extern declarations in C files, ...).
Not to mention the more substantial rework...
But Linux/m68k^WRome wasn't built in a decade neither... ;-)

And TBH, I also went for the "minimum amount of work" ;-)
(which didn't work out that well, yet another rabbit hole, as usual...).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
