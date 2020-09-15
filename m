Return-Path: <SRS0=+VAR=CY=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1279DC43461
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Sep 2020 18:43:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3F1020872
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Sep 2020 18:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600195430;
	bh=zbNV4LoRm2SpxcQFTYkt0SpiZ9LfDT0MD1EunDcGBGg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=A7pCqSlNfA31U9pawdtfMz42pUx3y0tQpODPEnLqQtkKCPCLB1whELmX0fkUl7/JA
	 svHoul9bQOh6R8WG2JCm1U7XJUBxbSvmRpgntX7qg62tY5GtBA1bim2+k4KkRvhYOQ
	 R+tyP6NWz7vewjOVfSKNoDM2CofBUkcM4jHJe6oM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgIOSnm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Sep 2020 14:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727913AbgIORfm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 15 Sep 2020 13:35:42 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E800CC06174A
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2020 10:35:34 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id w1so3888588edr.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2020 10:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xSVHWYbzu3UQ8PBlLDNLl6dehpYO4ZB4CwIyD75ZWAE=;
        b=HrsWxAPBdchRgJHFmShgtgLo+DYOxZ4XfJAXkzfzzcfRKd+SalkgHXOKOAhxqlhHgQ
         V1SM0m5nq2pQBoktRVl1X3TADwVGw68gQTnxbkgl/4Ys1lUtjCYE6YOc6zJjNuYpT6Oi
         cumGXilNIqaAVXq/H8sUmOpuXNhTWtrjfr3qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xSVHWYbzu3UQ8PBlLDNLl6dehpYO4ZB4CwIyD75ZWAE=;
        b=n2tTeZzOTWeBBrIln4/ZOhKlJ3sKrO8NPH8jBhv7Bm5Ugflvsv6kU5ofzpZfKUjxoE
         /N9jSO6WQm9XV1iEufg/DEsrP9iOL9HfhfOabWw6ygPSx+u29LGW3wxhLy+/RX53xNDm
         8DG3Yf1mbA2kLK/8UPly1VBSe59eHLcwV4EHnNAmwFq/jDavpU2OGP1+luXFvZOh6CTW
         Bif8I7VdI1QjQ7DVHdgroVjXhMeYDWHSHso6Q0jwUqq+OSAZFgNhvaSUit1PKvtdYENJ
         3sCE1JRG57kx6dAfhWq+ddusooVi2LaO5cu+lZsMGrxfaZPvjU7bpUV3i495EqrNOTxB
         TC7w==
X-Gm-Message-State: AOAM531yAZrJRSgINqMRREz3JoknTF/IXwD/IbCgSXGBDyF+FSY0HVE0
        yvU2bSMmLMl8MK242ApBQXqhJNdz03ZHbA==
X-Google-Smtp-Source: ABdhPJwCgw9R5o4etjASTsUoyfC9CYFJ757+sFYIT84QGeePvgwtETHuxMiAhxbhxYEEcAEHqQD39Q==
X-Received: by 2002:a50:f197:: with SMTP id x23mr24568021edl.367.1600191333246;
        Tue, 15 Sep 2020 10:35:33 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id be2sm12115140edb.0.2020.09.15.10.35.32
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 10:35:33 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id q13so6215671ejo.9
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2020 10:35:32 -0700 (PDT)
X-Received: by 2002:a19:521a:: with SMTP id m26mr7168489lfb.133.1600191006488;
 Tue, 15 Sep 2020 10:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200914204209.256266093@linutronix.de> <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
 <871rj4owfn.fsf@nanos.tec.linutronix.de> <CAHk-=wj0eUuVQ=hRFZv_nY7g5ZLt7Fy3K7SMJL0ZCzniPtsbbg@mail.gmail.com>
 <CAHk-=wjOV6f_ddg+QVCF6RUe+pXPhSR2WevnNyOs9oT+q2ihEA@mail.gmail.com>
 <CAMj1kXHrDU50D08TwLfzz2hCK+8+C7KGPF99PphXtsOYZ-ff1g@mail.gmail.com>
 <20200915062253.GA26275@gondor.apana.org.au> <CAHk-=wir6LZ=4gHt8VDdASv=TmEMjEUONuzbt=s+DyXPCvxaBA@mail.gmail.com>
 <87een35woz.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87een35woz.fsf@nanos.tec.linutronix.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 15 Sep 2020 10:29:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg_koVS=8bYurGCZ8zs=zDH5cOKVzFdoj4AkUWEW9mKjA@mail.gmail.com>
Message-ID: <CAHk-=wg_koVS=8bYurGCZ8zs=zDH5cOKVzFdoj4AkUWEW9mKjA@mail.gmail.com>
Subject: Re: [patch 00/13] preempt: Make preempt count unconditional
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Ard Biesheuvel <ardb@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um <linux-um@lists.infradead.org>,
        Brian Cain <bcain@codeaurora.org>,
        linux-hexagon@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Will Deacon <will@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>, Ingo Molnar <mingo@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Shuah Khan <shuah@kernel.org>, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Sep 15, 2020 at 12:24 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Alternatively we just make highmem a bit more expensive by making these
> maps preemptible. RT is doing this for a long time and it's not that
> horrible.

Ack.

In fact, I've wanted to start just removing kmap support entirely. At
some point it's not so much about "I have an old machine that wants
HIGHMEM" but about "I have an old CPU, and I'll just run an old
kernel".

It's not that 32-bit is irrelevant, it's that 32-bit with large
amounts of memory is irrelevant.

Last time this was discussed, iirc the main issue was some
questionable old ARM chips that were still very common in embedded
environments, even with large memory.

But we could definitely start de-emphasizing HIGHMEM.

                     Linus
