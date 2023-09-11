Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6049ACA0ED5
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Sep 2023 22:26:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243298AbjIKWYR convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238210AbjIKNvT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Sep 2023 09:51:19 -0400
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4746FA
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Sep 2023 06:51:14 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d80211e8df8so2815207276.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Sep 2023 06:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694440274; x=1695045074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDloSeE/RMJ8xb0vN0WHP8xkcaLq8Ztl0V6yiAC98sM=;
        b=g8X2/AhEQzG500/CLJGWvzRRuSON2hNqtZOndnoTCAYsumXNxK7X68NQ4eFZAp7q2m
         GAMhv6EwhPfMxV1ofyEhAPdOrRLmhp/3efproX0tkNAafzcs+Di/BF3R+Ua1FDmikj2j
         Hzcz7DIwAODRQeyXfrfVbaGJdeApJf4/NVPxCD6htf6iKTXLiLDzQNL0ke8JkHqR7joy
         cT+G3maL74JxyNfBQ7S2LKp6cu65VyiKFRD0TDowTNSDKCKP7AgrgfM6N0wgCkWzIK4D
         /lS+0BWpkYpwvmkCWQTyfnmfgGkdHK+Qsw7g2IZGkbSR5WAywIwtnAl88OFtaF72YnTa
         IADQ==
X-Gm-Message-State: AOJu0YybWv6Z3bJxHnX61hVX54uhWV0Gs7e1R1XrJrIG+CdMWrFP0Eg9
        KCHv66qOWX9youOJpV50SD3LgynCO1vvQw==
X-Google-Smtp-Source: AGHT+IGMl/ihDhfz/vr3Cq0G25y2euOvF7Q4GEetSWktz+d+XmPXIcEnPh/u6b4e51bY1p1StCr6eg==
X-Received: by 2002:a25:8750:0:b0:d78:48b0:21d2 with SMTP id e16-20020a258750000000b00d7848b021d2mr8130596ybn.3.1694440273910;
        Mon, 11 Sep 2023 06:51:13 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id j12-20020a25d20c000000b00d7481ed7e45sm1699136ybg.56.2023.09.11.06.51.13
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 06:51:13 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d80211e8df8so2815197276.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Sep 2023 06:51:13 -0700 (PDT)
X-Received: by 2002:a5b:191:0:b0:d08:5a25:e6b4 with SMTP id
 r17-20020a5b0191000000b00d085a25e6b4mr9656076ybl.28.1694440273428; Mon, 11
 Sep 2023 06:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694093327.git.geert@linux-m68k.org> <6894409da1a0d8667bf74b9100067485ce3c37ac.1694093327.git.geert@linux-m68k.org>
 <0424526e-e9fd-7a3f-71ed-c43855ab1290@linux-m68k.org>
In-Reply-To: <0424526e-e9fd-7a3f-71ed-c43855ab1290@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Sep 2023 15:51:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+KNa6VEydk0uA5E2qn96Jb+ejdd8NHjqFRaC3uuCxKg@mail.gmail.com>
Message-ID: <CAMuHMdU+KNa6VEydk0uA5E2qn96Jb+ejdd8NHjqFRaC3uuCxKg@mail.gmail.com>
Subject: Re: [PATCH 06/52] m68k: kernel: Add and use "process.h"
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>,
        Finn Thain <fthain@linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Philip Blundell <philb@gnu.org>,
        Joshua Thompson <funaho@jurai.org>,
        Sam Creasey <sammy@sammy.net>,
        Laurent Vivier <laurent@vivier.eu>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Mon, Sep 11, 2023 at 3:42 PM Greg Ungerer <gerg@linux-m68k.org> wrote:
> Nice cleanups. My plan is to clean up the ColdFire/68000 warnings as well.

Thanks in advance!

> On 7/9/23 23:41, Geert Uytterhoeven wrote:
> > --- a/arch/m68k/kernel/process.c
> > +++ b/arch/m68k/kernel/process.c
> > @@ -38,6 +38,7 @@
> >   #include <asm/machdep.h>
> >   #include <asm/setup.h>
> >
> > +#include <process.h>
>
> I applied all 52 patches to linux-6.6-rc1 and see this:
>
>      $ ARCH=m68k CROSS_COMPILE=m68k-linux- make amiga_defconfig
>      $ ARCH=m68k CROSS_COMPILE=m68k-linux- make W=1
>      ...
>        CC      arch/m68k/kernel/process.o
>      arch/m68k/kernel/process.c:41:10: fatal error: process.h: No such file or directory
>       #include <process.h>
>                ^~~~~~~~~~~
>
> Of course trivially fixed by doing this:
>
> diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
> index d2d6a5735650..2584e94e2134 100644
> --- a/arch/m68k/kernel/process.c
> +++ b/arch/m68k/kernel/process.c
> @@ -38,7 +38,7 @@
>   #include <asm/machdep.h>
>   #include <asm/setup.h>
>
> -#include <process.h>
> +#include "process.h"

Thanks, will fix (and any other similar typos, if any).

I usually build in separate output directories, which causes

    -I${srcdir}/include
    -I${srcdir}/arch/m68k/kernel
    -I./arch/m68k/kernel

to be added to the include path, causing <...> to work as well :-(

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
