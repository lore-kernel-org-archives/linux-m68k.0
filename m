Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52428CE79AA
	for <linux-m68k@archiver.kernel.org>; Tue, 19 Sep 2023 18:53:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbjISSxM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 19 Sep 2023 14:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232573AbjISSxI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 19 Sep 2023 14:53:08 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 713B7DE
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Sep 2023 11:53:02 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9ad8d47ef2fso757951866b.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Sep 2023 11:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1695149580; x=1695754380; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qoumeRTE+qtQQI/kZW10ezE5GjBnHd3+HNtP5YPVTpo=;
        b=fR2GW+qmXHI5Od+s1U9JBdhXO2ZuUH9eukEVvSQRtasjPKcRSX/ugPiKGgdcREQIyN
         GT3K+n3T0A/mWzqsyW/V3sv755CfRqM+REKyH3dmBa4JsgsNgf9gfNYxul3GRPP1bvcm
         j4W/fBIwUe+pWeg/+AIXEGi7552L+xQe4MoBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695149580; x=1695754380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoumeRTE+qtQQI/kZW10ezE5GjBnHd3+HNtP5YPVTpo=;
        b=ucM8J/mQe38epfwYcaA7VSSt7J6ryAlAo8fIEKo/KmIFFi8nZCUCXCisYhc3lv8ouG
         iJByBx8+xQwy/ob316Z5q/N45NTuzUGjfAwBYp3SJvptvRsq4bJdELEOkMLrTW8QuS1f
         dIuTCpIzNpTq0Xkm21VHkpRkCrbXU8ONCvsXity03CH3vryYZM3X8tnCXgi65k46UHG2
         cT8jsSrxcqR7DnrEDwbFPbGlmL2WTARz8QSJvp+gYuwfO5Wyk1XCjVNSe213VmywHKWB
         f/iZz1NKWfNTMvIbud8LnN8D6kjGUG2fMRtLurF3zdteyTxT2eJV5qSsLvQ5WvRVIsV5
         vlNQ==
X-Gm-Message-State: AOJu0YwE1KV9MwbooxzaGG4GKlkIl8xmpHNgoDuYP1Cjr1/ajJlCeco+
        0HddserBSYmOgvy5HRlJdJNEXd6LxQ9AN31yieS+gi/7
X-Google-Smtp-Source: AGHT+IH6dhP4dV23rSCj/hv95cTlZRIAWxbOLK90+qnDFQmWq6NTB3+URuJryPlx6AK1MkMUxbDcGg==
X-Received: by 2002:a17:906:cc58:b0:9a5:cc73:a2a5 with SMTP id mm24-20020a170906cc5800b009a5cc73a2a5mr237119ejb.1.1695149580677;
        Tue, 19 Sep 2023 11:53:00 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id h27-20020a170906111b00b009a1fef32ce6sm8327264eja.177.2023.09.19.11.53.00
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 11:53:00 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5315b70c50dso2437480a12.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Sep 2023 11:53:00 -0700 (PDT)
X-Received: by 2002:a50:fc0e:0:b0:532:e71b:5ead with SMTP id
 i14-20020a50fc0e000000b00532e71b5eadmr258934edr.32.1695149559235; Tue, 19 Sep
 2023 11:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <87zg1u1h5t.fsf@oracle.com> <CAHk-=whMkp68vNxVn1H3qe_P7n=X2sWPL9kvW22dsvMFH8FcQQ@mail.gmail.com>
 <20230911150410.GC9098@noisy.programming.kicks-ass.net> <87h6o01w1a.fsf@oracle.com>
 <20230912082606.GB35261@noisy.programming.kicks-ass.net> <87cyyfxd4k.ffs@tglx>
 <CAHk-=whnwC01m_1f-gaM1xbvvwzwTiKitrWniA-ChZv+bM03dg@mail.gmail.com>
 <87led2wdj0.ffs@tglx> <ZQmbhoQIINs8rLHp@casper.infradead.org>
 <0e69f7df80dc5878071deb0d80938138d19de1d1.camel@physik.fu-berlin.de>
 <20230919134218.GA39281@noisy.programming.kicks-ass.net> <a6c84803274116ec827cd4bdd4e72a8d0c304c27.camel@physik.fu-berlin.de>
 <CAHk-=wgUimqtF7PqFfRw4Ju5H1KYkp6+8F=hBz7amGQ8GaGKkA@mail.gmail.com>
 <87pm2eui95.ffs@tglx> <20230919143816.1741760a@gandalf.local.home>
In-Reply-To: <20230919143816.1741760a@gandalf.local.home>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 19 Sep 2023 11:52:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wizB-G40OxALNnz3-uNxuEAPf95H9hubAPeG2r2mrhwHA@mail.gmail.com>
Message-ID: <CAHk-=wizB-G40OxALNnz3-uNxuEAPf95H9hubAPeG2r2mrhwHA@mail.gmail.com>
Subject: Re: Arches that don't support PREEMPT
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        Ankur Arora <ankur.a.arora@oracle.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        akpm@linux-foundation.org, luto@kernel.org, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, mgorman@suse.de,
        jon.grimm@amd.com, bharata@amd.com, raghavendra.kt@amd.com,
        boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
        jgross@suse.com, andrew.cooper3@citrix.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, 19 Sept 2023 at 11:37, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> We could simply leave the cond_resched() around but defined as nops for
> everything but the "nostalgia club" to keep them from having any regressions.

I doubt the nostalgia club cares about some latencies (that are
usually only noticeable under extreme loads anyway).

And if they do, maybe that would make somebody sit down and look into
doing it right.

So I think keeping it around would actually be both useless and
counter-productive.

              Linus
