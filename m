Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767C7E81E03
	for <linux-m68k@archiver.kernel.org>; Fri,  6 Oct 2023 14:51:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbjJFOvY convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 6 Oct 2023 10:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232596AbjJFOvW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 6 Oct 2023 10:51:22 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B078F
        for <linux-m68k@lists.linux-m68k.org>; Fri,  6 Oct 2023 07:51:21 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-59f7f2b1036so26434237b3.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 06 Oct 2023 07:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696603880; x=1697208680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iH1WSSdRdMGN/blmpsRHcGzazR8XoV0oXL3Y8AOIRuQ=;
        b=wExBW/xoi47u/9xSpNS9cjUHs8GjEfRs6KJh36KXkeNLlsEiuIK9PAz0zDK6OoqgcH
         b4jcdheppFKvmqgByGexaci9cS0AUGMNfotGFhLEoR52/wgDRQzw8K3LhCLbMI8z8iOW
         Gpp3F2r+crZC/kNpNpLeI0c+NuenG6JPo7bqUsYJNOIvmhNdgEgtEZ9/q+aKhjGd2Zwa
         hhOXxQi84xgXT5z/2TQD73KqZ+NFLWC5cU9lkiobBJ60NYAaK8oWBQR138QzDcSly9q1
         FmlCQ1ev8FrjQwrtrevbB51Gpoo16AzkW1BjZ5cjOiLBkDvIa4/G0oLds1QRqrIV9usk
         Ks0g==
X-Gm-Message-State: AOJu0YxCIPylbU4aS+BQ5t3PaCo1+afQagWBBjv16QOLrhgg2+XZz+6C
        sep8qvVZr9bSoYbFKlpoRuR3aTI8vE6bLw==
X-Google-Smtp-Source: AGHT+IGpP+BGMV9OaO0KX3NJXtwEbGNXYFc5yVnvw4CXYtE31lASBlYLVU1IPP4/gzTpgtysRExldw==
X-Received: by 2002:a0d:cac5:0:b0:59f:5895:6e38 with SMTP id m188-20020a0dcac5000000b0059f58956e38mr9308006ywd.4.1696603880253;
        Fri, 06 Oct 2023 07:51:20 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id p65-20020a0dff44000000b005a2245c3506sm1331102ywf.42.2023.10.06.07.51.19
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 07:51:19 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5a1d0fee86aso26471657b3.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 06 Oct 2023 07:51:19 -0700 (PDT)
X-Received: by 2002:a0d:e841:0:b0:589:f491:de9c with SMTP id
 r62-20020a0de841000000b00589f491de9cmr8896800ywe.28.1696603879221; Fri, 06
 Oct 2023 07:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <87edj64rj1.fsf@oracle.com> <CAHk-=wi0bXpgULVVLc2AdJcta-fvQP7yyFQ_JtaoHUiPrqf--A@mail.gmail.com>
 <87zg1u1h5t.fsf@oracle.com> <CAHk-=whMkp68vNxVn1H3qe_P7n=X2sWPL9kvW22dsvMFH8FcQQ@mail.gmail.com>
 <20230911150410.GC9098@noisy.programming.kicks-ass.net> <87h6o01w1a.fsf@oracle.com>
 <20230912082606.GB35261@noisy.programming.kicks-ass.net> <87cyyfxd4k.ffs@tglx>
 <CAHk-=whnwC01m_1f-gaM1xbvvwzwTiKitrWniA-ChZv+bM03dg@mail.gmail.com>
 <87led2wdj0.ffs@tglx> <ZQmbhoQIINs8rLHp@casper.infradead.org>
In-Reply-To: <ZQmbhoQIINs8rLHp@casper.infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 Oct 2023 16:51:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV4qx3iQzqksfnvckk_PK9Zas0U=p-xv3pVwJ6hWLpejA@mail.gmail.com>
Message-ID: <CAMuHMdV4qx3iQzqksfnvckk_PK9Zas0U=p-xv3pVwJ6hWLpejA@mail.gmail.com>
Subject: Re: Arches that don't support PREEMPT
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ankur Arora <ankur.a.arora@oracle.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        akpm@linux-foundation.org, luto@kernel.org, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, mgorman@suse.de,
        rostedt@goodmis.org, jon.grimm@amd.com, bharata@amd.com,
        raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, jgross@suse.com, andrew.cooper3@citrix.com,
        linux-m68k@lists.linux-m68k.org,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um@lists.infradead.org, Brian Cain <bcain@quicinc.com>,
        linux-hexagon@vger.kernel.org,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Willy,

On Tue, Sep 19, 2023 at 3:01 PM Matthew Wilcox <willy@infradead.org> wrote:
> On Tue, Sep 19, 2023 at 02:30:59PM +0200, Thomas Gleixner wrote:
> > Though it just occured to me that there are dragons lurking:
> >
> > arch/alpha/Kconfig:     select ARCH_NO_PREEMPT
> > arch/hexagon/Kconfig:   select ARCH_NO_PREEMPT
> > arch/m68k/Kconfig:      select ARCH_NO_PREEMPT if !COLDFIRE
> > arch/um/Kconfig:        select ARCH_NO_PREEMPT
>
> Sounds like three-and-a-half architectures which could be queued up for
> removal right behind ia64 ...
>
> I suspect none of these architecture maintainers have any idea there's a
> problem.  Look at commit 87a4c375995e and the discussion in
> https://lore.kernel.org/lkml/20180724175646.3621-1-hch@lst.de/
>
> Let's cc those maintainers so they can remove this and fix whatever
> breaks.

Looks like your scare tactics are working ;-)
[PATCH/RFC] m68k: Add full preempt support
https://lore.kernel.org/all/7858a184cda66e0991fd295c711dfed7e4d1248c.1696603287.git.geert@linux-m68k.org

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
