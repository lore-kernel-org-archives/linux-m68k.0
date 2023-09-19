Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 477DACD5BC2
	for <linux-m68k@archiver.kernel.org>; Tue, 19 Sep 2023 13:34:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232369AbjISNeb convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 19 Sep 2023 09:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231960AbjISNe3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 19 Sep 2023 09:34:29 -0400
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97DC2F5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Sep 2023 06:34:23 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-59bdad64411so57874877b3.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Sep 2023 06:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695130462; x=1695735262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgBzNeouwMIIeGDTMgFICEbkSUZU58KfvTsi1HmIQSU=;
        b=npkC6wFnPndRlcuxgWsuvGTs8fUIoWesritYGB6ezoFF2MppEcwm6qTYAg2Olfqyee
         4Mgo6QEqa3uQXQo54d9faYAYZnJGXg7TplOfWjfuqm8dfOiFaNNmUbdoOo8F4FP9BGTa
         jKFTJMxXgA4W4kjyXRbeeUADnxWT5Fan3Onj/PJ/oawv1w2OmdlRL2rq/xr7RFMvo5YB
         qga3a2uWbzl8rM2EAPgwWt9ljIxA4ugI1jpE0/+qDIMrfcKogZbljmfm/bMnhfzMq8Q1
         konwiCDdJKKmOQce3sw7MfcpP4AGPHvIuGWROYNI7sspWkT0TDLCuxEgNRzxtmeICap2
         h66A==
X-Gm-Message-State: AOJu0Yz3oZwrofZO7ezDQWVqmpQ6Foxq8sAYiQi0H2bVqQ3PaKxdqki7
        5wOhod7qEMJsinVf3fl7CAqiK/QcQb78HA==
X-Google-Smtp-Source: AGHT+IGEhQ2lVEI5hTuYJCNyu+7a2AyDbL+DRsHXUpq+D8LSBOkGGpGVYLdTTlxxTNg23drkiXvWPA==
X-Received: by 2002:a81:5c82:0:b0:59b:fcca:afc6 with SMTP id q124-20020a815c82000000b0059bfccaafc6mr12138374ywb.50.1695130462103;
        Tue, 19 Sep 2023 06:34:22 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id s66-20020a819b45000000b0059c01bcc363sm2948260ywg.49.2023.09.19.06.34.20
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 06:34:20 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-59e8d963adbso26129437b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Sep 2023 06:34:20 -0700 (PDT)
X-Received: by 2002:a0d:cc55:0:b0:59b:cb53:ad5a with SMTP id
 o82-20020a0dcc55000000b0059bcb53ad5amr12005299ywd.35.1695130459846; Tue, 19
 Sep 2023 06:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <87edj64rj1.fsf@oracle.com> <CAHk-=wi0bXpgULVVLc2AdJcta-fvQP7yyFQ_JtaoHUiPrqf--A@mail.gmail.com>
 <87zg1u1h5t.fsf@oracle.com> <CAHk-=whMkp68vNxVn1H3qe_P7n=X2sWPL9kvW22dsvMFH8FcQQ@mail.gmail.com>
 <20230911150410.GC9098@noisy.programming.kicks-ass.net> <87h6o01w1a.fsf@oracle.com>
 <20230912082606.GB35261@noisy.programming.kicks-ass.net> <87cyyfxd4k.ffs@tglx>
 <CAHk-=whnwC01m_1f-gaM1xbvvwzwTiKitrWniA-ChZv+bM03dg@mail.gmail.com>
 <87led2wdj0.ffs@tglx> <ZQmbhoQIINs8rLHp@casper.infradead.org>
In-Reply-To: <ZQmbhoQIINs8rLHp@casper.infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Sep 2023 15:34:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXd=jtggL3H4XuBuuNY3QtLDK7Ny=AaSWEjhmRyLwjAGQ@mail.gmail.com>
Message-ID: <CAMuHMdXd=jtggL3H4XuBuuNY3QtLDK7Ny=AaSWEjhmRyLwjAGQ@mail.gmail.com>
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

These links don't really point out there is a grave problem?

> Let's cc those maintainers so they can remove this and fix whatever
> breaks.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
