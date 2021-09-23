Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1B5C433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Sep 2021 14:52:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E225A610C9
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Sep 2021 14:52:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241769AbhIWOyD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Sep 2021 10:54:03 -0400
Received: from mail-vs1-f45.google.com ([209.85.217.45]:40605 "EHLO
        mail-vs1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241739AbhIWOyC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Sep 2021 10:54:02 -0400
Received: by mail-vs1-f45.google.com with SMTP id l19so6780321vst.7
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Sep 2021 07:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XbGazJaWAOjyEkjB6knrUugGeXAs0ejaCBIRTZeqKTU=;
        b=wZQ9AGFCN3cUacrmvX7ChTUE77CQSl+KoKy3tqlBsG28ZTusdUYUrrtKSOqc+gyuo2
         m+P4i/cvkR/tFBCnJ6Ws83ziG1FzXaxUUpi0EBxuo1om/s9mcA7A03/M1HC+yOZ1vGQm
         9QhyRlWTmUaiXy23sQf1jKKnN70avpEU5mcxkH4tizhQulnfTbZkG+xL+S8ezebIWPKA
         e8SbpxLbE33Ihi2QfNdldrepewDgECgqrpBPEvD/2FkNPhzcIHDjEFpBFciGtCiD3kt1
         4eQnibny8E6iK2nVY25JJ1IgKchachsS0LUWBGOC/N+41Ves0Aiy+8eSxliZVSpIq1Xi
         sK8w==
X-Gm-Message-State: AOAM533h8PECDNVc4Xkvt6mblcD/kB+iUahJtzXo1m4quKhCkPaSSEHp
        +UYvA+wCwZGIoxEew2k19Qv+YLtnrrnUsr+t7dQ=
X-Google-Smtp-Source: ABdhPJwWDLIhd0puUPv3LNfuDmyiMwrPFFRGilH6SQOnpPccaLAvc8gSpHXUMedW60CGoqGd7dCbKX2WTgaufXt7f4k=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr4753781vsl.9.1632408750907;
 Thu, 23 Sep 2021 07:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210916070405.52750-1-hch@lst.de> <1fc48604-f6e3-cfc2-93a5-94addd9c64f2@gmail.com>
In-Reply-To: <1fc48604-f6e3-cfc2-93a5-94addd9c64f2@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 16:52:19 +0200
Message-ID: <CAMuHMdV1GpEeU-cpp3pUP1++AGr9ZFY=69W42XR04awgJKgyeQ@mail.gmail.com>
Subject: Re: remove set_fs for m68k
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>, Greg Ungerer <gerg@linux-m68k.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Sep 17, 2021 at 7:41 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 16/09/21 19:03, Christoph Hellwig wrote:
> > Hi all,
> >
> > this series converts m68k to the new world where set_fs is gone to make
> > the uaccess routines work on kernel pointers.
> >
> > Changes from the RFC version:
> >   - simplify virt_to_phys_slow (and thus flush_icache_range)
>
> For the entire series:
>
> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
> Tested-by: Michael Schmitz <schmitzmic@gmail.com>
>
> (on 030)

And it boots on the real '040, too.

Thanks a lot, queuing in the m68k tree as fixes for v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
