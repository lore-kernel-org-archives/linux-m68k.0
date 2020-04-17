Return-Path: <SRS0=9AVM=6B=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA877C352BE
	for <linux-m68k@archiver.kernel.org>; Fri, 17 Apr 2020 07:28:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B60F322201
	for <linux-m68k@archiver.kernel.org>; Fri, 17 Apr 2020 07:28:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbgDQH23 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 17 Apr 2020 03:28:29 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34637 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728591AbgDQH20 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 17 Apr 2020 03:28:26 -0400
Received: by mail-ot1-f68.google.com with SMTP id m2so716591otr.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 17 Apr 2020 00:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CAlxRW45me+SFTqp2fMa5KvZpf6cMRTo76EH5fkTTvc=;
        b=cGvM/V2+NPiiIE/6NZI3U8rTR7kFxnl0DQFZjdv+igElT8xsRK7SWH+HiWRlK7MfSk
         8lflR5wFpOznit867JeeNUDOCR687HwZpDt5SKjqzDMVb9HGLiaIO8RrSdlc/iAFpreq
         fv5XDwreGRb4YoiHvx0+zUU3yfNCEK77tk1P5oz39qS2t/tG73G9/Gk6C0Se3EdUCrro
         Cv9cfDWQWcviEi7OFrgduJIIPmLOT6kDK13XJKDnvxKuNobdTV+TUbXN2+8hHfvP/O9b
         OsJzAABbLiEULiEx8r+znLKFSUOZqz24dejD1mHVO87HB5fTHuS2fUUizUWgPn8yqHin
         ieVg==
X-Gm-Message-State: AGi0PubG5Sf4nyKL/QHAhZoqdeQa5uQ7rg8RZEWCE9A2GQwJ9le80+vL
        DAMDqkz9/i0bCkYMmRwBa019TDH/aiuE1ZTy53o=
X-Google-Smtp-Source: APiQypK7KuRAoPktsLMQh2Me8mfNzHEYpwL9p+AMo7Mc+i20vMVMtApNzN65ngvXei2FszcvDlo15xrOTNLy+/p43Ec=
X-Received: by 2002:a9d:7590:: with SMTP id s16mr1548442otk.250.1587108505576;
 Fri, 17 Apr 2020 00:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200416220130.13343-1-willy@infradead.org>
In-Reply-To: <20200416220130.13343-1-willy@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Apr 2020 09:28:14 +0200
Message-ID: <CAMuHMdWxhVoPCZ5+=Pf1LFpdE9vPv9GGTqTYMQP9oFz7eCxDaQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] Make PageWriteback use the PageLocked optimisation
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Linux MM <linux-mm@kvack.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Matthew,

On Fri, Apr 17, 2020 at 12:01 AM Matthew Wilcox <willy@infradead.org> wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> PageWaiters is used by PageWriteback and PageLocked (and no other page
> flags), so it makes sense to use the same codepaths that have already been
> optimised for PageLocked, even if there's probably no real performance
> benefit to be had.
>
> Unfortunately, clear_bit_unlock_is_negative_byte() isn't present on every
> architecture, and the default implementation is only available in filemap.c
> while I want to use it in page-writeback.c.  Rather than move the default
> implementation to a header file, I've done optimised implementations for
> alpha and ia64.  I can't figure out optimised implementations for m68k,
> mips, riscv and s390, so I've just replicated the effect of the generic
> implementation in them.  I leave it to the experts to fix that (... or
> convert over to using asm-generic/bitops/lock.h ...)
>
> v3:
>  - Added implementations of clear_bit_unlock_is_negative_byte()
>    to architectures which need it

I have two questions here?
  1. Why not implement arch_clear_bit_unlock_is_negative_byte()
     instead, so the kasan check in asm-generic is used everywhere?
  2. Why not add the default implementation to
     include/asm-generic/bitops/instrumented-lock.h, in case an arch_*()
     variant is not provided yet?

Note that you did 1 for s390.
Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
