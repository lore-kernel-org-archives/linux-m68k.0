Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C57EC433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Jan 2022 18:04:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1388317AbiAYSEx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Jan 2022 13:04:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387518AbiAYSDJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Jan 2022 13:03:09 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72954C061744
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Jan 2022 10:03:08 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id y27so16377328pfa.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Jan 2022 10:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dax6sBTbarvMVAByZem6IyjyDz+EJk3QzR3MuWd+Hyw=;
        b=Xg1zwgHFM9V3Yr3FxDUTeaJApZatTSThKSAypfMcrDdlkPTWA/UURYOLbK4GG/nN2+
         t9RNgF3AEFgMNHmTXidxJVcT2mQH4YORoC/M380vK4MA1eMcN+U+suq3hI5TL3rS8Ue7
         Ngi38LfZDaXtYF7vJHcCzIwfDBNYgcaGwdSajHtd29OQ+WueQOKMhKycV+O86S5whBsZ
         MDgvq1vCe2tAOmOacVvFdoqHIUWAWcdL08rfDsN+1y+FKregy6cxogaAx1KgUT/r4qbU
         2J9/Z5IcNaWgJ7yuSNUZR3VdmcebSihwy8o0sFGgNZvaLcLtP+igzXhhDFD7hLEYaQjH
         K0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dax6sBTbarvMVAByZem6IyjyDz+EJk3QzR3MuWd+Hyw=;
        b=Lm0uswkYJHKAY+WQ2wjbc6LaJtFJBN8L4kHFzEZXfWy6tLXkFPjJWnuiYepEaB5G+b
         /NBY9pbCUuBAyrh0Wewa/oYu2k89jTjDt+jzVhyR0NscCeSDGXT6MJ5FB7xo00rZuT2M
         dXMfVZVmbZk1vL3V77H9hqKqGMA3/bGxMu97kuPyNLCRSVaQOW8caasv1jZ7cD/6PPx6
         LVMoRrf5VK/+z1EfPdYYevTeZjXJK/TqYupWFK3Ud7cbYvCuj55VdKMdpkLN+mQc5Z98
         pHIvfg2vqRR41QONUfQYkgrCussqbpXcxziw3LK2hMlr6tKGbAjovPiz7ikzEYuw2nQh
         fxnQ==
X-Gm-Message-State: AOAM530itXa8TsvgL7BLfV3T7vQifctKmx91fXAeBwNRavOgF+Hvd09Y
        iQ1dXSq5tsuMtVzwjg252TDOjX7t70aVl2Vp6z0=
X-Google-Smtp-Source: ABdhPJxJ6IgC/NPVkbHQKNjygoAWu1gP69dDZR8Z2mew2aA5HO8LG7mdrfK2Lnf7y8MLDtLZY5JS/SE4JYZ43xK+bKQ=
X-Received: by 2002:a05:6a00:70d:b0:4c0:1cbf:2394 with SMTP id
 13-20020a056a00070d00b004c01cbf2394mr19418330pfl.69.1643133787794; Tue, 25
 Jan 2022 10:03:07 -0800 (PST)
MIME-Version: 1.0
References: <20220125073137.1.83124@7e6451f583e7> <CAMuHMdVYhwpP0vSK4LT+50ZqB9opD8gcm-2aor8wAc49=GR+-w@mail.gmail.com>
In-Reply-To: <CAMuHMdVYhwpP0vSK4LT+50ZqB9opD8gcm-2aor8wAc49=GR+-w@mail.gmail.com>
From:   Yury Norov <yury.norov@gmail.com>
Date:   Tue, 25 Jan 2022 10:02:56 -0800
Message-ID: <CAAH8bW93TUpyn8GaZfB83pu8Kvrsz9PHPCBHcG3+UStU7v=s=A@mail.gmail.com>
Subject: Re: kisskb: FAILED linux-next/m68k-allmodconfig/m68k-gcc8 Tue Jan 25, 18:24
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jan 25, 2022 at 12:47 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> On Tue, Jan 25, 2022 at 8:31 AM <noreply@ellerman.id.au> wrote:
> > FAILED linux-next/m68k-allmodconfig/m68k-gcc8 Tue Jan 25, 18:24
> >
> > http://kisskb.ellerman.id.au/kisskb/buildresult/14688953/
> >
> > Commit:   Add linux-next specific files for 20220125
> >           d25ee88530253138d0b20d43511ca5acbda4e9f7
> > Compiler: m68k-linux-gcc (GCC) 8.1.0 / GNU ld (GNU Binutils) 2.30
> >
> > Possible errors
> > ---------------
> >
> > arch/m68k/include/asm/bitops.h:329:20: error: array subscript 2 is above array bounds of 'long unsigned int[1]' [-Werror=array-bounds]

The array-bounds warning has been enabled just recently. CC Kees Cook for this.

> > cc1: all warnings being treated as errors
> > make[4]: *** [scripts/Makefile.build:289: drivers/net/ipa/ipa_mem.o] Error 1
> > make[3]: *** [scripts/Makefile.build:572: drivers/net/ipa] Error 2
> > make[2]: *** [scripts/Makefile.build:572: drivers/net] Error 2
> > make[1]: *** [Makefile:1965: drivers] Error 2
> > make: *** [Makefile:226: __sub-make] Error 2
> >
> > No warnings found in log.
>
> The code that causes this is drivers/net/ipa/ipa_mem.c:ipa_mem_valid():
>
>         DECLARE_BITMAP(regions, IPA_MEM_COUNT) = { };
>         ...
>         for_each_clear_bit(mem_id, regions, IPA_MEM_COUNT) {
>                 if (ipa_mem_id_required(ipa, mem_id))
>                         dev_err(dev, "required memory region %u missing\n",
>                                 mem_id);
>         }
>
> This only happens with gcc-8, not with gcc-9, so it might be a
> compiler bug. I don't see anything wrong with c:ipa_mem_valid()
> nor with m68k's find_first_zero_bit().

I don't see any problems about how this code uses bitmap API.
The m68k version of find_first_zero_bit() looks correct as well.

Thanks,
Yury
