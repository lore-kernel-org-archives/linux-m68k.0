Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255D5C433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 25 Nov 2021 10:42:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354467AbhKYKqE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 25 Nov 2021 05:46:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350042AbhKYKoE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 25 Nov 2021 05:44:04 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B416C06173E
        for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Nov 2021 02:40:53 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id d10so10601208ybe.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Nov 2021 02:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Xa1vZazox6ICgKLpFIvg6K1JUC/KEtKPUA08cmaogzs=;
        b=L36hQ4y5VJsbScrIBBG+WJ8b9mItC1MabGVvD7Hq8NLo3lExxon0sapneQA6D9FRb0
         gk8wk2D+TNQIgYNY6lCAaitOEE1jvS0kD6/VmRm6wU3fB4RG8ttCeEjqzUKAgVz/cnnL
         UudUlOvxjC6U51KWZbtVZeTu9hG8lKHwakVzl4RjisfZs1hpl4J4FZTdYmTg1VOSs20q
         XaVrpEtiXRMcVknmAppC/E/3noqRW1obHfzHz8cE+WnPId6sLHTWSp34Y2ZvxbsZiRRk
         XX7hQdbM431wElGWKJv54RoNllBuPluhoGI0jnEeujYtLkzHDv4iVqpfNpfZhMpPnyXc
         Ccwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Xa1vZazox6ICgKLpFIvg6K1JUC/KEtKPUA08cmaogzs=;
        b=GIYmrn2wpMD5mU48+IFZUCNu/qitIEed9bVJ+ZpDW5nWndCkNxD1wGRrFI+AUL2lyy
         hGbmcvWtYXmzdaIq8F0S5dDtivDLbjU1bCDMashMeDpcwTuVOJg5p/CtVOJbmt3rbFl8
         3FyTo1MrfCM9PzfhLBvY7UcdhmaqlMnfior60hX8d0Tg2ft/zumZqsRzS8Z/dTBKKapC
         07o03LJRMoLWhnzM8xoVwXerIcIUH3meaDPHEEk8wtQg1ufWPPbUFSJjRm1pGV3WxMbQ
         S1/Uq77pCoWdTGYVsATZTSDKed7+gf/7BopgkhmYO/BZQlxWdXsTxKYX9Twqz+xTqguh
         gbqw==
X-Gm-Message-State: AOAM531g60ZFYsk8rO796U3A916ygv9E5kV3WG4i130FuU9owRa7F5j0
        mCobigvkfgFrhMJQGgT4XxbrwYhHtsw1exIy/7WYNw==
X-Google-Smtp-Source: ABdhPJzhuxUwCLB7988KOPawNrwByY8pulkA5xPXvlbDYjRLBwkua/kCFbfwQXye+MghxY6YVJaxtrLROtoPY+PwKpM=
X-Received: by 2002:a25:b0a8:: with SMTP id f40mr5033138ybj.125.1637836852216;
 Thu, 25 Nov 2021 02:40:52 -0800 (PST)
MIME-Version: 1.0
References: <20211125083808.82560-1-geert@linux-m68k.org>
In-Reply-To: <20211125083808.82560-1-geert@linux-m68k.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 25 Nov 2021 18:40:11 +0800
Message-ID: <CAMZfGtWUYR0d2QyDA9Y7KZ9dUH4Yj1L6LjfsQ_8qaYyg7s4-aQ@mail.gmail.com>
Subject: Re: [PATCH -next] nubus: Rename pde_data var to fix conflict with
 external function
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-m68k@lists.linux-m68k.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Nov 25, 2021 at 4:38 PM Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
>
> In file included from drivers/nubus/proc.c:24:
> drivers/nubus/proc.c: In function =E2=80=98nubus_proc_rsrc_show=E2=80=99:
> ./include/linux/proc_fs.h:123:21: error: called object =E2=80=98pde_data=
=E2=80=99 is not a function or function pointer
>   123 | #define PDE_DATA(i) pde_data(i)
>       |                     ^~~~~~~~
> drivers/nubus/proc.c:112:13: note: in expansion of macro =E2=80=98PDE_DAT=
A=E2=80=99
>   112 |  pde_data =3D PDE_DATA(inode);
>       |             ^~~~~~~~
> drivers/nubus/proc.c:110:30: note: declared here
>   110 |  struct nubus_proc_pde_data *pde_data;
>       |                              ^~~~~~~~
>
> Fix this by renaming the local variable to "pde".  Do this everywhere
> for consistency.
>
> Reported-by: noreply@ellerman.id.au
> Fixes: e7e935db128e724f ("fs: proc: store PDE()->data into inode->i_priva=
te")

Since the commit ID is not stable, Fixes tag is unnecessary.

> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Not fixed by commit 5de6353a96bec91d ("proc: remove PDE_DATA()
> completely"), which just removes the macro indirection.
> ---

My bad. I didn't realize this situation. Thanks for fixing this.

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
