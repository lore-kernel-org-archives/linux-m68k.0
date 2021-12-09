Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBF3C433F5
	for <linux-m68k@archiver.kernel.org>; Thu,  9 Dec 2021 01:24:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236463AbhLIB1g (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 8 Dec 2021 20:27:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233910AbhLIB1g (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 8 Dec 2021 20:27:36 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A207C0617A1
        for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Dec 2021 17:24:03 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id l25so14338908eda.11
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Dec 2021 17:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=djkd7kU0HKK9P5mJFWg35mLxaEd3Gn4ggjL+YYI2Fxg=;
        b=CdUQEtuDKMWi8LMopTU1N0gv5eoDqcN5kA9XghxcUH5sLhkkJBBRAbBMdyOKEV/ylv
         5x4WBjP+lfP1qFdPvkL7Hrrw0DHKy4r/JoIrcdODrR0HRGzpPk+cKuq6g6KpXaS/Xt8n
         giXoxnG6YXHtLfXeNQhgpjXz8UhMZ4MIO+j64lptb20F+ed4FSeigpswpZNSl3ZpRoZb
         tivmE4apjrS/j782YmiikjiIf836Jm8RU26RN0fvQNvUUGM1o1HFUdOpCGoxnDHwBnxp
         jJJmYxfA0pcLB+elptbTQTb5bvCrRGQC6FOjXTs544NPN/4n0i2dwIct+K5kySTizYin
         Bo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=djkd7kU0HKK9P5mJFWg35mLxaEd3Gn4ggjL+YYI2Fxg=;
        b=vZvpGmqffNo+tT1k5MFxHI3GyqfAUOvZlLvOvyd2K0MLMC2e+s+Qa1GR8kz0UNOhrV
         37vzI0bzgJ6Zs8E9Axn/EfYo0gFHES2W9MzIIWGF9SRrb5yJP5ApmE2NxFZLQNtSqIRM
         ATJV6lvWYigg2CAscLqVwFMC/XfQsOuSHQdeFYZ/GLpTSkdeTRA99zbxvixUxbkAiUCi
         yq5Sa8FQM2UUdxa+M5sSgIPAatRnRVwJnRQmGlDxKuuztS/jaWf+rDAcHGB7e+VdWmdT
         D8pNMuMzjtREoHPIMPjrNX0v7fvY9bhTyBLkJ4Ed4x2jARkKThV/c6MlPGM+qVjxRffO
         Mjsg==
X-Gm-Message-State: AOAM530C7W2w7H/3AFNTpoJURJj2eqHbLB6nOWeAWQcH/J5Zb4a1OVgh
        wGdGBfvaUMlI0pRE1OHNLbvr/WZjoKzhEkN92WbJwQ==
X-Google-Smtp-Source: ABdhPJzSKZQOBcRJ8636EiVUcNbp0iqM5adP6qAINVTurdqH+v8qFVpv2I212KR9BQDiBuJREbJg4zul5yOj9bL1PXY=
X-Received: by 2002:aa7:d34c:: with SMTP id m12mr24849425edr.269.1639013041984;
 Wed, 08 Dec 2021 17:24:01 -0800 (PST)
MIME-Version: 1.0
References: <20211208203544.2297121-1-pasha.tatashin@soleen.com> <YbEeKiatjGoCD6Yi@casper.infradead.org>
In-Reply-To: <YbEeKiatjGoCD6Yi@casper.infradead.org>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Wed, 8 Dec 2021 20:23:24 -0500
Message-ID: <CA+CK2bAnMGOXoszHRnFpmYAceF9K1BJRkf88N__ExgA4o1d2Sg@mail.gmail.com>
Subject: Re: [PATCH 00/10] Hardening page _refcount
To:     Matthew Wilcox <willy@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        linux-m68k@lists.linux-m68k.org,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        william.kucharski@oracle.com,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        schmitzmic@gmail.com, Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Roman Gushchin <guro@fb.com>,
        Muchun Song <songmuchun@bytedance.com>, weixugc@google.com,
        Greg Thelen <gthelen@google.com>,
        David Rientjes <rientjes@google.com>,
        Paul Turner <pjt@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Dec 8, 2021 at 4:05 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Wed, Dec 08, 2021 at 08:35:34PM +0000, Pasha Tatashin wrote:
> > It is hard to root cause _refcount problems, because they usually
> > manifest after the damage has occurred.  Yet, they can lead to
> > catastrophic failures such memory corruptions. There were a number
> > of refcount related issues discovered recently [1], [2], [3].
> >
> > Improve debugability by adding more checks that ensure that
> > page->_refcount never turns negative (i.e. double free does not
> > happen, or free after freeze etc).
> >
> > - Check for overflow and underflow right from the functions that
> >   modify _refcount
> > - Remove set_page_count(), so we do not unconditionally overwrite
> >   _refcount with an unrestrained value
> > - Trace return values in all functions that modify _refcount
>

Hi Matthew,

Thank you for looking at this series.

> You're doing a lot more atomic instructions with these patches.

This is not exactly so. There are no *more* atomic instructions. There
are, however, different atomic instructions:

For example:  atomic_add() becomes atomic_fetch_add()

On x86 it is:

atomic_add:
    lock add %eax,(%rsi)

atomic_fetch_add:
    lock xadd %eax,(%rsi)

On ARM64, I believe the same CAS instruction is used for both.

  Have you
> done any performance measurements with these patches applied and debug
> disabled?

Yes, I have done some performance tests exactly as you described with
CONFIG_DEBUG_VM disabled and these patches applied.
I tried: hackbench, unixbench, and a few more benchmarks; I did not
see any performance difference.

>  I'm really not convinced it's worth closing
> one-instruction-wide races of this kind when they are "shouldn't ever
> happen" situations.  If the debugging will catch the problem in 99.99%
> of cases and miss 0.01% without using atomic instructions, that seems
> like a better set of tradeoffs than catching 100% of problems by using
> the atomic instructions.

I think we should relax the precise catching of bugs only if there is
indeed a measurable performance impact. The problem is that if there
is a __refcount bug, the security consequences are dire as it may lead
to leaking memory from one process to another.

Thanks,
Pasha
