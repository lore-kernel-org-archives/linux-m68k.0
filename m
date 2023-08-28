Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23CCC83F13
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Aug 2023 06:55:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbjH1GzN convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 02:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjH1GzA (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Aug 2023 02:55:00 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9FBE0
        for <linux-m68k@vger.kernel.org>; Sun, 27 Aug 2023 23:54:57 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-58fc4eaa04fso33417617b3.0
        for <linux-m68k@vger.kernel.org>; Sun, 27 Aug 2023 23:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693205697; x=1693810497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uIc6PLzU/PfpAwQxmLYqj3rgEJiKXtf0AMHC+MRhdc=;
        b=TQInXaFKs9ORFM8hpl0o+YsqXlQ46I/PTeCOnuYgjCJeH9UaaUGiprHRVOSu41k8Ho
         nIHaVpvWvAwFYi+L1uwLhSXU7u5eGxwv3fCK2o1IQyFYPuA1b+hNOqRP2aPRk64wQl8k
         uxLVN6VLUz55vr766m9eB2OOVgy//b96TbbNQ9qnKOr94Es6eJuQc7a4zat457KO2F9A
         dDhDrlrBprCQNKTfp1mPkYkvoI7rQytqwv/uU9ZuGwy+fD8qRBeU99NMarkZAf6mIVUf
         8SqkFpPzby28PoCxAfTamzAH08ObLHm9NcqAJOAesOETgM58PetIhKPSOjYd4nCAW9nm
         iTbg==
X-Gm-Message-State: AOJu0Yzn0YZDK279EylsREEATDX8tSON2G+AFKFlgZb3t34XbbCBY6Q+
        4rsXHbr8PE1eapKvuY591mdV8hausRs74w==
X-Google-Smtp-Source: AGHT+IGZzqt2T092AyeArP4F5bWzqHxybIAJfZ7p4zIoGXvWl7vRtV8hPofqW8s8t9pSg6kWGOqOCg==
X-Received: by 2002:a0d:d712:0:b0:570:28a9:fe40 with SMTP id z18-20020a0dd712000000b0057028a9fe40mr24979125ywd.5.1693205696842;
        Sun, 27 Aug 2023 23:54:56 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id a6-20020a81bb46000000b00590f25ef8afsm1970923ywl.43.2023.08.27.23.54.56
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 23:54:56 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-58fc4eaa04fso33417517b3.0
        for <linux-m68k@vger.kernel.org>; Sun, 27 Aug 2023 23:54:56 -0700 (PDT)
X-Received: by 2002:a5b:8d1:0:b0:d77:d79b:d24d with SMTP id
 w17-20020a5b08d1000000b00d77d79bd24dmr11893701ybq.26.1693205695916; Sun, 27
 Aug 2023 23:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
 <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
 <5F114C03-5320-485F-86E3-946A334F16D1@arcor.de> <e323fa5f72e65ade8369e58c7dae39b682c3a6fc.camel@aura-online.co.uk>
In-Reply-To: <e323fa5f72e65ade8369e58c7dae39b682c3a6fc.camel@aura-online.co.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Aug 2023 08:54:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWY21bBuJ5Rmmx9rAY=aqS-sKGC9zbD+4zVAj1f7nuc0Q@mail.gmail.com>
Message-ID: <CAMuHMdWY21bBuJ5Rmmx9rAY=aqS-sKGC9zbD+4zVAj1f7nuc0Q@mail.gmail.com>
Subject: Re: Tuple and changes for m68k with -malign-int
To:     James Le Cuirot <chewi@aura-online.co.uk>
Cc:     Richard <richiezid@arcor.de>, debian-68k@lists.debian.org,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        libc-help@sourceware.org, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, Aug 26, 2023 at 11:00 PM James Le Cuirot
<chewi@aura-online.co.uk> wrote:
> On Sat, 2023-08-26 at 19:24 +0000, Richard wrote:
> > On August 26, 2023 10:51:39 AM UTC, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> wrote:
> > > On Sat, 2023-08-26 at 09:53 +0100, James Le Cuirot wrote:
> > > It's a regular occurrence that a package doesn't build on m68k due to it's unusual
> > > default alignment.
> >
> > Unfortunately. Some time ago m68k was not the only one with this problem?
>
> Possibly, but I wouldn't know. I suspect it may be the only one still in use
> with Linux. Gentoo supports most of the architectures to some degree, and I'm
> not aware of any those having this issue.

AXIS CRIS was in the same (or a similar) boat, but support for CRIS
was dropped in Linux v4.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
