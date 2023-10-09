Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F059EE95A96
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Oct 2023 12:01:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346431AbjJIMBH convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Oct 2023 08:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346376AbjJIMBE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 9 Oct 2023 08:01:04 -0400
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1BEA6
        for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Oct 2023 05:01:01 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d81dd7d76e0so5194182276.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Oct 2023 05:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696852860; x=1697457660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gtciP7pJ5ePDuZs6hrkiwcAh6cWpIDvabFqt+RxIBw=;
        b=wyLe6jfAsL3OmtsOJ9HP2D/WTOS0qXq1ysXK8Pwsmjkh5AJOocWzu3G9bpwOXiPCR9
         K0PvwGZ6QCCcRfHc+PFWeVVMt2MPhYoL2EgtCUamEYGIAGVruGMYRoRpaL/Me33DTmC8
         601YooC2CbUOCYGc8FreM9RuutQAvTSRslSmf8yoYalCWwvy1MB6IeBrQq9vc7iC4yFJ
         ok66Rz1TL3NQgQ7HYyHh+BkYuQvrGzWjPOKMtfPnJ1GGG0SJJStejGCIJqseKIHRrDCY
         +ikpZ9BL+nzhanc5iY8/TMTV+jh73sW4bDcacDy3Jx6mLWh6TGAxBblxG4ITbzgUEpbV
         waiA==
X-Gm-Message-State: AOJu0YxgWzpMo3eQ6kOgdL8hNyWvali3/TYIoEDWXhu28hTljDqU0NQX
        WPSStD5N5icSnfrNg7n5tCHRHhYxlDjfSQ==
X-Google-Smtp-Source: AGHT+IFbU05JQWGbZdehv8hlg7OkqKL9rjsvmkfmNmplOf1dKGvDJlWe9OGSpNrQrJM7EM5jfCGIYw==
X-Received: by 2002:a25:ef08:0:b0:d81:754a:7cba with SMTP id g8-20020a25ef08000000b00d81754a7cbamr13807104ybd.15.1696852860219;
        Mon, 09 Oct 2023 05:01:00 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 201-20020a250bd2000000b00d687cf69599sm3073851ybl.52.2023.10.09.05.01.00
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 05:01:00 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5a7af45084eso716127b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Oct 2023 05:01:00 -0700 (PDT)
X-Received: by 2002:a81:7309:0:b0:59b:fcca:afc6 with SMTP id
 o9-20020a817309000000b0059bfccaafc6mr14770713ywc.50.1696852859893; Mon, 09
 Oct 2023 05:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <7858a184cda66e0991fd295c711dfed7e4d1248c.1696603287.git.geert@linux-m68k.org>
 <CAMuHMdVT7QEfagWcLx9z7YGtFiKRW5-J3F6gyxKYEzFBb=2_Gg@mail.gmail.com> <61d3b62380fb78b87003a09cc08827fb28de7942.camel@physik.fu-berlin.de>
In-Reply-To: <61d3b62380fb78b87003a09cc08827fb28de7942.camel@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Oct 2023 14:00:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbHS3tvLF3_JaG=0Hoxcwf71HGbSX+mo2WXQruWSL=nQ@mail.gmail.com>
Message-ID: <CAMuHMdUbHS3tvLF3_JaG=0Hoxcwf71HGbSX+mo2WXQruWSL=nQ@mail.gmail.com>
Subject: Re: [PATCH/RFC] m68k: Add full preempt support
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Greg Ungerer <gerg@linux-m68k.org>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Matthew Wilcox <willy@infradead.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On Mon, Oct 9, 2023 at 1:45 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Mon, 2023-10-09 at 13:29 +0200, Geert Uytterhoeven wrote:
> > On Fri, Oct 6, 2023 at 4:49 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > Currently, a Preemptible Kernel is only supported on the Coldfire CPU
> > > family.  Extend preempt support to the full Classic M68K CPU family
> > > (68020+ with MMU, and 68000-derivatives without MMU).
> > >
> > > Make sure preemption is disabled in loops involving cache and TLB
> > > flushing.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > ---
> > > Tested on ARAnyM, using none/voluntary/full preemption.
> >
> > bloat-o-meter summaries for atari_defconfig:
> >
> > PREEMPT_NONE -> PREEMPT_VOLUNTARY:
> >
> >     add/remove: 0/0 grow/shrink: 238/30 up/down: 2804/-748 (2056)
> >     Total: Before=4478149, After=4480205, chg +0.05%
> >
> > PREEMPT_VOLUNTARY -> PREEMPT:
> >
> >     add/remove: 735/277 grow/shrink: 3050/347 up/down: 244359/-11440 (232919)
> >     Total: Before=4480205, After=4713124, chg +5.20%
> >
> > Ouch.
>
> What exactly does the change document? More scheduling events?

No, kernel image size.  Hence enabling full preemption increases kernel
size by ca. 229 KiB (which is more or less the equivalent size increase of
upgrading the kernel by 10 releases).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
