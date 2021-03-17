Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A65C4332B
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Mar 2021 06:41:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DC7F64FB6
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Mar 2021 06:41:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbhCQGkk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 17 Mar 2021 02:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbhCQGkQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 17 Mar 2021 02:40:16 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9A3C06175F
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Mar 2021 23:40:15 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id o9so39867636iow.6
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Mar 2021 23:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BbxV8FFQ5+F/TxA4Io3PIpeBpLDxtoC/hF5K9QMF6D8=;
        b=dBwe7vj/pgCDOU7q9uxw1w+siPNNDQQsm4MyExCl/kteM++nkzsTx2wozYZ/Q0EWyA
         XMN1jCSEU405emTKJrJnDONCHpGjWC/jqS0JV+Jq0/CFyIqQ88bwF2EmqppVFFI0599Z
         pYjNmC3YLG7G22QTontqrzwzb9QKXzH57W9DOHXP0TMoaXamCtuNSam/mHQrcHnhJ5zp
         Rtx/3ZRbeFDfMNYjCN2CJAX8ysvwRFhYRCd0Y3EPJ4d951qeMSxZ7dfFRxQb2qR76YCr
         ostjb3petHIqVMjgqRa3yZB2cpHFZIJvTFfy0Hrv2ipMRb3Y/wm1OMb77T0LtthsLdTx
         chyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BbxV8FFQ5+F/TxA4Io3PIpeBpLDxtoC/hF5K9QMF6D8=;
        b=DfgXeCaX8E6hBqaYDSKSOGwE3nER5hBC8bP+KnoIyXFdDUbqsYPE4mSGBN92567DhS
         JfSIL1NRrMK/MoAQKGMwoZALwlYQSLzr3DO+UfeqSCmvNnd7gnrG1pzXRls0bMfgFrby
         3PwLKfF1rn/gda5khf8DjqGpqRNOxtqTT9XwyNGE4K10gjGMoo+uhXEFTIPLrh6WOmnM
         IUtmBh1cGmXqqdzQhMB6ZM5WedlDl1NHMZ2mREV6fNq2ezG52vJ0JQ5NyAv6f+dRarqg
         JkJiAafMouoAAdsgSDu+ObmLx5UNne6lYaOa8D5ZiDDBXNgSTSIGy+TSIqp7CMJPVJEt
         n6GA==
X-Gm-Message-State: AOAM5308bOBWLtfGza84hMfvjwuPmM9byckwIgO1go8j0Xs7k1SAnzGy
        +ybwebMsgXQU1W2Wm6SqQJvIQzfJdd2UelpA4SU=
X-Google-Smtp-Source: ABdhPJzUIIrtKmaGZhfubqNTun6mLmQTTiaCQn1hOdTlRDX13D1LRT2tUa9aLsENTsdq0kdQm1GNr4/QneFvG5WX3sY=
X-Received: by 2002:a05:6638:2bb:: with SMTP id d27mr1681142jaq.98.1615963214856;
 Tue, 16 Mar 2021 23:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210316015424.1999082-1-yury.norov@gmail.com>
 <20210316015424.1999082-14-yury.norov@gmail.com> <YFCabyt9pfPtoQiZ@smile.fi.intel.com>
 <20210317044759.GA2114775@yury-ThinkPad> <eff989d0ceaede15216f1046c24829f1113c035f.camel@perches.com>
In-Reply-To: <eff989d0ceaede15216f1046c24829f1113c035f.camel@perches.com>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Wed, 17 Mar 2021 07:40:04 +0100
Message-ID: <CAKXUXMx9SFAxT_GoRw+Un7XyAuXh4LY0+RFwcKVOCG0vr2XUxw@mail.gmail.com>
Subject: Re: [PATCH 13/13] MAINTAINERS: Add entry for the bitmap API
To:     Joe Perches <joe@perches.com>
Cc:     Yury Norov <yury.norov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k@lists.linux-m68k.org, linux-arch@vger.kernel.org,
        linux-sh@vger.kernel.org, Alexey Klimov <aklimov@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>, David Sterba <dsterba@suse.com>,
        Dennis Zhou <dennis@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jianpeng Ma <jianpeng.ma@intel.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rich Felker <dalias@libc.org>,
        Stefano Brivio <sbrivio@redhat.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Mar 17, 2021 at 5:57 AM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2021-03-16 at 21:47 -0700, Yury Norov wrote:
> > [CC Andy Whitcroft, Joe Perches, Dwaipayan Ray, Lukas Bulwahn]
> >
> > On Tue, Mar 16, 2021 at 01:45:51PM +0200, Andy Shevchenko wrote:
> > > On Mon, Mar 15, 2021 at 06:54:24PM -0700, Yury Norov wrote:
> > > > Add myself as maintainer for bitmap API and Andy and Rasmus as reviewers.
> > > >
> > > > I'm an author of current implementation of lib/find_bit and an active
> > > > contributor to lib/bitmap. It was spotted that there's no maintainer for
> > > > bitmap API. I'm willing to maintain it.
> > > >
> > > > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > > > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> > > > ---
> > > >  MAINTAINERS | 16 ++++++++++++++++
> > > >  1 file changed, 16 insertions(+)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 3dd20015696e..44f94cdd5a20 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -3151,6 +3151,22 @@ F: Documentation/filesystems/bfs.rst
> > > >  F:       fs/bfs/
> > > >  F:       include/uapi/linux/bfs_fs.h
> > > >
> > > >
> > > > +BITMAP API
> > > > +M:       Yury Norov <yury.norov@gmail.com>
> > > > +R:       Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > +R:       Rasmus Villemoes <linux@rasmusvillemoes.dk>
> > > > +S:       Maintained
> > > > +F:       include/asm-generic/bitops/find.h
> > > > +F:       include/linux/bitmap.h
> > > > +F:       lib/bitmap.c
> > > > +F:       lib/find_bit.c
> > >
> > > > +F:       lib/find_find_bit_benchmark.c
> > >
> > > Does this file exist?
> > > I guess checkpatch.pl nowadays has a MAINTAINER data base validation.
> >
> > No lib/find_find_bit_benchmark.c doesn't exist. It's a typo, it should
> > be lib/find_bit_benchmark.c. Checkpatch doesn't warn:
> >
> > yury:linux$ scripts/checkpatch.pl 0013-MAINTAINERS-Add-entry-for-the-bitmap-API.patch
> > total: 0 errors, 0 warnings, 22 lines checked
>
> checkpatch does not validate filenames for each patch.
>
> checkpatch does have a --self-test=patterns capability that does
> validate file accessibility.

Joe meant: get_maintainers does have a --self-test=patterns capability
that does validate file accessibility.

You can run that before patch submission; otherwise, I run that script
on linux-next once a week and send out correction patches as far as my
"spare" time allows to do so.

Lukas
