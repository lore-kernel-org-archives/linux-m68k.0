Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF332C07E9C
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 03:01:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D695361CD9
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 03:01:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbhGHDEf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 7 Jul 2021 23:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbhGHDEe (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 7 Jul 2021 23:04:34 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C0EC061574
        for <linux-m68k@lists.linux-m68k.org>; Wed,  7 Jul 2021 20:01:53 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id p21so10381486lfj.13
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jul 2021 20:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tGRidrRLzWEFp1s1N21PC8ToqpT6xI7i7fg9XBghpsc=;
        b=ai27sdrV5lgMqbLG2nrJeQnUt3USzoPvsFQeALPi4nD7UuQ0QShTPAFUzyEh95TRR7
         Ng9EPZlJ3YzNuubI4otH0LaqFFiLMs6AnK5ySMJhU+P49erBIjRddT6s7DUQRkLxCgpj
         GjWjCxPSFbwA6VGmtbBWmr5T4Lmoele/kAh5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tGRidrRLzWEFp1s1N21PC8ToqpT6xI7i7fg9XBghpsc=;
        b=qCFZpSaNlfrSxOD1hwCHh42p8TI1N+nIiOZZ0WbSkOBH/T6fvL621qDWSPPQhgn/LB
         hdQQjHDDyWfkuDhTPM0sDf8/XdPIt/t6GFDg6U5thF9jWPwo5T2w/jwg6d6EW9jDgKE5
         rBGsbdrZUM8CIQvwYN+lCZeJiL2qUUMgR+41YHxQ9oIIiHuzV5T8fWN935qR3IVlJ1DU
         c3YE0tH6+p16oLoulVs17waGZNgo5uy9rQ8OET523N3259KtJuh6eKuTq1VkXpqb5tLq
         djwVMeLKlsahGzk3dacpPFaj8Ximyw/YAJ3zxHmI3VIjOk3Ci1aldG6U9RtS3B/kShFZ
         5n8A==
X-Gm-Message-State: AOAM533LGetPQa/h5PcjhVn4OvW7DXONWAWX66ZodqxqhjHjh37NAes4
        mChg1Zo/jXorqIBUNl7O1c95IZk/UOTBVylNr7I=
X-Google-Smtp-Source: ABdhPJyRa/XbzGBrqokeQ0duFmXPgQ/RROKF3WWBW+Mzfakqe12RyrSPnJg8wpTASMT6OqmjzQWSbQ==
X-Received: by 2002:a2e:97c9:: with SMTP id m9mr9439575ljj.382.1625713310866;
        Wed, 07 Jul 2021 20:01:50 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id bn23sm90304ljb.48.2021.07.07.20.01.50
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 20:01:50 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id p16so10473666lfc.5
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jul 2021 20:01:50 -0700 (PDT)
X-Received: by 2002:ac2:4903:: with SMTP id n3mr21264746lfi.487.1625713309781;
 Wed, 07 Jul 2021 20:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <1625708899-29013-1-git-send-email-schmitzmic@gmail.com> <CAHk-=whRp-m0DFPF27=OZzMq4b=16J+6bQEG_jeDM=osuuZF2w@mail.gmail.com>
In-Reply-To: <CAHk-=whRp-m0DFPF27=OZzMq4b=16J+6bQEG_jeDM=osuuZF2w@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 7 Jul 2021 20:01:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgCp0X4Q=GkDF1j1=_XTq4gA_ZsKUXfkPBeeTJcoS6gwQ@mail.gmail.com>
Message-ID: <CAHk-=wgCp0X4Q=GkDF1j1=_XTq4gA_ZsKUXfkPBeeTJcoS6gwQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jul 7, 2021 at 7:51 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Ok, strange. If this works for you, then the _concept_ is fine, and
> there's something odd going on with the "macros with 'moves' vs 'move'
> as a parameter" thing.

Oh, I think I see the problem.

Or rather, I see it in Christoph's version of the patch, I don't think
I've seen Michael's version, but that one was apparently very similar,
so maybe it has the same bug.

Christoph does:

   #define __put_user_asm(inst, res, x, ptr, bwl, reg)    \
   asm volatile ("\n"                                     \
          "1:     #inst."#bwl"    %2,%1\n"
   ...

and then uses it with code like

                __put_user_asm(MOVES, __pu_err, __pu_val, ptr, b, d);

and

                __get_user_asm("move", __gk_err, __gk_dst, __gk_src, u8, b, d);

and the issue is that there's a '#' too many.

The '#' turns the argument into a string, but it was already
_supposed_ to be a string. But no, the problem is that it turns the
macro name MOVES into the _string_ "MOVES".

Which happens to compile just fine, because "moves" is a real
instruction. But it's actually _meant_ to be a macro that expands to
either the string "moves" or "move".

So what happens is that at least in Christoph's version, I think the
code _always_ uses "MOVES", even in configurations where the macro
MOVES should have just become "move".

So it all builds fine, looks fine to the assembler, but it uses the
wrong instruction.

Macro expansion with the '#' character and other macros used as
arguments is something people need to be very careful with.  It's why
we have a whole header file for just the "stringify" operation, see
<linux/stringify.h>

But in this case, it shouldn't have used '#' at all, since the
argument was already a string, and never needed to be turned into a
string by the pre-processor.

             Linus
