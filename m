Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0DBC433E6
	for <linux-m68k@archiver.kernel.org>; Fri, 29 Jan 2021 22:26:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8541B64DED
	for <linux-m68k@archiver.kernel.org>; Fri, 29 Jan 2021 22:26:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233356AbhA2W0w (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 29 Jan 2021 17:26:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232902AbhA2W0v (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 29 Jan 2021 17:26:51 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D58DC061574
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 Jan 2021 14:26:11 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id u17so11013448iow.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 Jan 2021 14:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hoREvCWvBJhszWnTWxhBJMWPAqucDBF6nB5BDpkHUw0=;
        b=PIFrlF4KJnO5gnjnMTf+6tcWWFUUzJDvEix0/K3rnsowx/gLtBhDcAj+AdVuyLrslv
         jvGJVBm25QCt5dkH7qVsV8lNNnLTJJke5psYyELACqmyS+R0ywhMp9JiBApUcp6V0aGx
         i7uP+MPCtx/4u8dfGV4i0vs4FaByF/KNIRJNPLphu9gA82ARNkxGiGDc4CzOM6OG+Cuq
         sNRnR6f9ZvRy2pLB/UCwSRUgDL97p0dVuPIpPSmygngIjhTaCVaxM2ibHkVH+G9Y731c
         GT2SXTKy/8e1jXM9hn9bloxAsb7kP5nI/3Ssnf8EDEkmG6g6Pwg7RFfGJVSlRvBceamg
         lWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hoREvCWvBJhszWnTWxhBJMWPAqucDBF6nB5BDpkHUw0=;
        b=APzKePjXC9fcsPDQuzkH6qQy9wDojA9JMFvnauh9yCy1r8kK8xTCNKeWs6LhGCEw2I
         TG4XUlEXN04qsbcCDAKqnT5hLDr0f42RP51w2FStjVFP56TJS96kuAfsh563AlyfzCt7
         fPTb+x6o9EJ7FEU7bGXd5SlpqL37QT4ElpqBICzfwCxQXgLqQuLSFRftp/QIMPLNVKH0
         QtmZqeSvf7q7hBQct2VnTPAuaxAikuzsiw87xqss5YILsRw7JP2Qh5Ez4Pc7w6EY+DYL
         j+68t6hm+8pZRNH5AMjAS8HPJHQzFRA2b5UTplYYmAdpH6H+A2VQ07w/kt3WOBRaLRg2
         oMXg==
X-Gm-Message-State: AOAM5335qbQizzLdoUQ6sBJhrOZCk0VdY74xA6jl9LY1P+MApiEmc3N0
        q4DEmDD/j9QDwjU/nCFr75y4QpK4OeOqMCeExwk=
X-Google-Smtp-Source: ABdhPJxqqRwK8JdT3GzdfxL9UlffqvYdRrEY1TO8ZEn68c1kU0+hz/UGOOIWZtWQ3ziRx80FGZlUDabpmvvs1WtZvG8=
X-Received: by 2002:a6b:7501:: with SMTP id l1mr5068073ioh.92.1611959170750;
 Fri, 29 Jan 2021 14:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20210129204528.2118168-1-yury.norov@gmail.com>
 <20210129204528.2118168-4-yury.norov@gmail.com> <CAHp75VcSc=myrcvyBOkaUDguR6aPjJAFFXi2iSvmU21+1664Hw@mail.gmail.com>
In-Reply-To: <CAHp75VcSc=myrcvyBOkaUDguR6aPjJAFFXi2iSvmU21+1664Hw@mail.gmail.com>
From:   Yury Norov <yury.norov@gmail.com>
Date:   Fri, 29 Jan 2021 14:25:56 -0800
Message-ID: <CAAH8bW8MKh7LjsJ-9jaCRoTGFKSK_0+Gh5RuzVu-sMCO76=Oxg@mail.gmail.com>
Subject: Re: [PATCH 2/5] bits_per_long.h: introduce SMALL_CONST() macro
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-SH <linux-sh@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
        Dennis Zhou <dennis@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        David Sterba <dsterba@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Stefano Brivio <sbrivio@redhat.com>,
        "Ma, Jianpeng" <jianpeng.ma@intel.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jan 29, 2021 at 1:11 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Jan 29, 2021 at 10:49 PM Yury Norov <yury.norov@gmail.com> wrote:
> >
> > Many algorithms become simplier if they are passed with relatively small
>
> simpler
>
> > input values. One example is bitmap operations when the whole bitmap fits
> > into one word. To implement such simplifications, linux/bitmap.h declares
> > small_const_nbits() macro.
> >
> > Other subsystems may also benefit from optimizations of this sort, like
> > find_bit API in the following patches. So it looks helpful to generalize
> > the macro and extend it's visibility.
>
> > It should probably go to linux/kernel.h, but doing that creates circular
> > dependencies. So put it in asm-generic/bitsperlong.h.

[]

> > diff --git a/tools/include/asm-generic/bitsperlong.h b/tools/include/asm-generic/bitsperlong.h
> > index 8f2283052333..432d272baf27 100644
> > --- a/tools/include/asm-generic/bitsperlong.h
> > +++ b/tools/include/asm-generic/bitsperlong.h
>
> I think a tools update would be better to have in a separate patch.

Do you mean a single sync-patch for all tools/*, or doubling the
patchset by splitting each patch
to tools and kernel parts? Why is it any better than I have now?
