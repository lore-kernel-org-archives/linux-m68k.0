Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E07CE79AD
	for <linux-m68k@archiver.kernel.org>; Wed, 20 Sep 2023 07:32:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233769AbjITHcv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 20 Sep 2023 03:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233755AbjITHcu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 20 Sep 2023 03:32:50 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E50D3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Sep 2023 00:32:43 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-401ec23be82so69882055e9.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Sep 2023 00:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695195162; x=1695799962; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWzgC+PpnfmZJpwJToZon+LX7cLfjuMVcroIeSc6zGs=;
        b=ngg83nLOJwAZbduZ7oDJO2cR/bG/MfJhsMdOX2gvsCrfORbVqyIc10SDa8qGn3+HOf
         B9UlhzY1IONa5eJnMvc/CWzUdbJVC4o8TmiLELSHzpTzu9uMDGX/L/BC8dLh46B5C9AV
         /GqxLSsHKBtLsYu3rEr2Psk/vGmh8VCSa2PH0xmN6jpE9ENGTWWm1yLXRGHBrRVU1tJj
         z8hrElMiJjveFE7wACBIF7dZ+MQraIBqhvY60/Yzpg42lJh063s8OPREATd+8je/BA1T
         5LldyWowTlNrOpGhLrBJPgr6OHr5wVbhGHlTZDuAO847lebrS58yK3sg3jnP84xofF82
         ccMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695195162; x=1695799962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWzgC+PpnfmZJpwJToZon+LX7cLfjuMVcroIeSc6zGs=;
        b=imNIad76fOxbQoZw2SfLUpyPuV1fKjVo9MYorBQBcepnBQNad0O7LORpERc49wuSVD
         5JwBOwLzfztSEHHqjdOVh49q30OFZ8a0LBbkk7iAUWpDZj84Z+vhskygw+7c53xOww7K
         hrmH21Sl0NZMMvmy8UklXCeE7NYONXMt0q+XgpJqA80yOs6fr/YDg5NPedd2XX0ZZylS
         urH0QH4/RnSkJN1czgOHWtJD+RpKZUzdxahfvvy8e34cy/laspo4b+xuaoloYpG3uVdQ
         czZatfBhbEBkoiBOlDiGhM8BJuciQjCzOF1sKweWkMAWRl0rrWlBlsdouclh1UjLEI8k
         rfAA==
X-Gm-Message-State: AOJu0YzXxHJdLRNhbxQG2egBniswjunOqxVE9b4n1ZQ4B/JViM6HIQ/S
        U68XwrpgpD3I1euJkKYXLCc=
X-Google-Smtp-Source: AGHT+IFlh1qPrteRsulMqGbbOgPwlxP6U162lurEOGcRJRUAWbbb9DGlfVvYxyhGzmU9ONgAgb+Ukw==
X-Received: by 2002:a7b:cbc5:0:b0:3fd:30f7:2be1 with SMTP id n5-20020a7bcbc5000000b003fd30f72be1mr1579415wmi.39.1695195161611;
        Wed, 20 Sep 2023 00:32:41 -0700 (PDT)
Received: from gmail.com (1F2EF265.nat.pool.telekom.hu. [31.46.242.101])
        by smtp.gmail.com with ESMTPSA id h4-20020a05600c350400b00402f713c56esm1165817wmq.2.2023.09.20.00.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 00:32:41 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date:   Wed, 20 Sep 2023 09:32:38 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
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
Subject: Re: Arches that don't support PREEMPT
Message-ID: <ZQqgFpA6l1eK1KKV@gmail.com>
References: <87cyyfxd4k.ffs@tglx>
 <CAHk-=whnwC01m_1f-gaM1xbvvwzwTiKitrWniA-ChZv+bM03dg@mail.gmail.com>
 <87led2wdj0.ffs@tglx>
 <ZQmbhoQIINs8rLHp@casper.infradead.org>
 <0e69f7df80dc5878071deb0d80938138d19de1d1.camel@physik.fu-berlin.de>
 <20230919134218.GA39281@noisy.programming.kicks-ass.net>
 <a6c84803274116ec827cd4bdd4e72a8d0c304c27.camel@physik.fu-berlin.de>
 <CAHk-=wgUimqtF7PqFfRw4Ju5H1KYkp6+8F=hBz7amGQ8GaGKkA@mail.gmail.com>
 <87pm2eui95.ffs@tglx>
 <20230919143816.1741760a@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919143816.1741760a@gandalf.local.home>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


* Steven Rostedt <rostedt@goodmis.org> wrote:

> On Tue, 19 Sep 2023 20:31:50 +0200
> Thomas Gleixner <tglx@linutronix.de> wrote:
> 
> > The removal of cond_resched() might cause latencies, but then I doubt
> > that these museus pieces are used for real work :)
> 
> We could simply leave the cond_resched() around but defined as nops for
> everything but the "nostalgia club" to keep them from having any regressions.

That's not a good idea IMO, it's an invitation for accelerated rate bitrot 
turning cond_resched() meaningless very quickly.

We should remove cond_resched() - but probably not as the first step. They 
are conceptually independent of NEED_RESCHED_LAZY and we don't *have to* 
remove them straight away.

By removing cond_resched() separately there's an easily bisectable point to 
blame for any longer latencies on legacy platforms, should any of them 
still be used with recent kernels.

Thanks,

	Ingo
