Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C95C07E96
	for <linux-m68k@archiver.kernel.org>; Tue,  6 Jul 2021 18:47:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E51CB61C6B
	for <linux-m68k@archiver.kernel.org>; Tue,  6 Jul 2021 18:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231403AbhGFSuZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 6 Jul 2021 14:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231360AbhGFSuZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 6 Jul 2021 14:50:25 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ADC2C061574
        for <linux-m68k@lists.linux-m68k.org>; Tue,  6 Jul 2021 11:47:45 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id v14so14475008lfb.4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 06 Jul 2021 11:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LvCCh3BWoxUlOSyprsz6AuDfJG53KvgaRAB6wqLXsnY=;
        b=gUdCtnQTlhbAY8Sm4xnIeiB0VYLbEdUciVdwMTIP08GM3MNE5lfgR2+tuExnv7R2rl
         xWtAGGMmNlaQzgI6ryMYXMyNdu40HaKK4WRVIruTqxNUotxnyEl0og8ZC2r7sMNdvOHB
         aKYRUyzQDuQCUZiz88G1nGUAV8NI63yJrsqPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LvCCh3BWoxUlOSyprsz6AuDfJG53KvgaRAB6wqLXsnY=;
        b=l6lO+ToNKdOXovWAFTL4HFCN1RJDRm/9SBYl/PEQIdsGFyDvX4SykBxGdnC/lX1ZLW
         Fnw1iHRmUiwzSTjEY/VAbMpcATsRvFSFb43ihd4W4R9RQYrKP/kwdhlwW1FHndI2EuhH
         uZUBc4UM+/jM73SZ40OIKtZ+ULAswlX7EFuPyUbm9DpFS0Xs2aktAe1Vxm2gFpc18h1F
         2TbBwUOA7yiii3jK93twdkGHGDRTBM6+aaXXUPkiDbRt26JZer+fPy0s6uqE3ofDUI9/
         5nxr3g44n4Ax8Bd6FOnJYTJUiY8MKE6Gt1HrpqADsS879quyNIFJhpfJCPdUBSS6bCNU
         RnwA==
X-Gm-Message-State: AOAM5335u3zhl2pxeQ26fejBS2nPyrcwcEOyrM6oGzo61PPTFL7VNHhw
        yV2DIDtLDv//4MjU50zINIW2OwJbda9Mjo6g
X-Google-Smtp-Source: ABdhPJwXVTXxurnK//pogeFQvQd4Q4yj2N459F/w3vKaFJMlaJyBpdUceyOfIDsfH2wEn5hnZ0kNPA==
X-Received: by 2002:a05:6512:605:: with SMTP id b5mr11200311lfe.372.1625597263317;
        Tue, 06 Jul 2021 11:47:43 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id h2sm963391lfd.288.2021.07.06.11.47.42
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 11:47:42 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id a18so40004274lfs.10
        for <linux-m68k@lists.linux-m68k.org>; Tue, 06 Jul 2021 11:47:42 -0700 (PDT)
X-Received: by 2002:ac2:4903:: with SMTP id n3mr15483582lfi.487.1625597262624;
 Tue, 06 Jul 2021 11:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <1625527229-3224-1-git-send-email-schmitzmic@gmail.com>
In-Reply-To: <1625527229-3224-1-git-send-email-schmitzmic@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 6 Jul 2021 11:47:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjokOnXnth3jw1d9yOnOFMaYNhOftTC+qm2XVh9Pe+7=Q@mail.gmail.com>
Message-ID: <CAHk-=wjokOnXnth3jw1d9yOnOFMaYNhOftTC+qm2XVh9Pe+7=Q@mail.gmail.com>
Subject: Re: [PATCH RFC] Fixes to Linus' 'remove set_fs patch'
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jul 5, 2021 at 4:20 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> Linus' patch didn't compile out of the box. I'm a little
> worried that I had to patch mm/maccess.c,

Yeah, that's not the right way to do it.

See the other thread where Christoph rightly points out that the
problem is that m68k needs __{get,put}_kernel_nofault() and then just
enable CONFIG_HAVE_GET_KERNEL_NOFAULT.

__{get,put}_kernel_nofault() is basically the similar to
__get_user/__put_user, except for

 (a) it uses kernel addresses (so in m68k parlance, "move" rather than "moves")

 (b) it uses the "goto err_label" approach instead of being an
expression that returns an error value

That (b) is what allows the use of "asm goto" to implement the
exception case much more efficiently (but you can avoid having to
convert to that model by just doing something like

        if (unlikely(__gu_err)) goto err_label;

inside the macro instead - even architectures that use the "asm goto"
do that for old compilers that don't support "asm goto" with output
values.

It shouldn't be too hard to implement on m68k - you'd likely want to
make the helper macros in <asm/uaccess.h> take that "MOVES" thing as a
new argument, so that you can generate code for the "move" vs "moves"
cases using the same helper macros, just with different arguments.

            Linus
