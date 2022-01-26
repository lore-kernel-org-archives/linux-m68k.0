Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90578C28CF5
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Jan 2022 19:23:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231829AbiAZTXF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Jan 2022 14:23:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbiAZTXF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Jan 2022 14:23:05 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 308B2C06173B
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jan 2022 11:23:05 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id a18so570590edj.7
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jan 2022 11:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OR88/sfRY5SMmc2c9xo/1F4PCsLLeRL/qMHWSYMFz3I=;
        b=EYKETIbY/P3WkYufym3oL6Eqta+w/21YPUVijxyAM9rrurbda5tFdxg/eHVy6dTxTm
         zilVzZg1MJd/4lNhyhG8cXT+Tf7cXcquWRxZoFFXwc1qTl32xSNqPq0eaFApM9YZ2yl8
         6S64485VemOg4pRzgADUQWMu/4IouFdPFeDQt4lF1fivP9H2kyUxWnCBhTFzsFDNwVxr
         nuZsGrV/NPl00sZOw2xXPWSLhGQG6AqtHaPzZDlmkEb3e5Fw01Db04ghZpTTSt7uFNCA
         oA6+gypt3mOLvw92drow2IJlgnrQ8YyzRKTz6PKkZkhfGjTBMCOrVltJ9vPihjUXX4Ou
         cefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OR88/sfRY5SMmc2c9xo/1F4PCsLLeRL/qMHWSYMFz3I=;
        b=RwDPOXkxpSZ5xTs9g7uHEjZjcuXRVB7tv8j4ttuMXyWI5xBJgLK8DdlovxhgqFI3qW
         hCp0ys90meimMvIfx8U8HQuX9nNIzsMZVmYebll4GhHUUmrY7qeKSHMQaCQC3MN2q7Y+
         CBSazwB4/9GFOajuUH5kzPt172n6Ow7gRhwItzwdQ92GgPrkZ+hzd/WwklXy0zRaiUEd
         lnPj36rxP49Fr9z/NpyStCwfzxmmjXw/T+WSF3RFxI3wrz7eSQ6tcWPuo4bYinomCHXV
         gNfD7Sqie0um6nurzseYEC6mwZ1c5DI6LgCjum3HMSEExpC0DUWWUFwLBs08bCe4PMNY
         eknw==
X-Gm-Message-State: AOAM532c8Up4hc84LIkMPojRkmWmDqAr99eS5qT/Mhc+vHSzAjNcGAL0
        XLABjUUKUo/svpfrA8bH15LKQxleOVcwcCDVHn6j/w==
X-Google-Smtp-Source: ABdhPJwHpdzySdqPiWFjt2cOrzaJ9iFbSVQyBQjRBWw+Sc1wrVLOI+Keh8xzsaUAdgYN+E5YBWV1U0UT+F+wDWhLd+c=
X-Received: by 2002:a05:6402:3c3:: with SMTP id t3mr482443edw.336.1643224983732;
 Wed, 26 Jan 2022 11:23:03 -0800 (PST)
MIME-Version: 1.0
References: <20220126183429.1840447-1-pasha.tatashin@soleen.com>
 <20220126183429.1840447-2-pasha.tatashin@soleen.com> <YfGZ/0hhkqVeX04p@casper.infradead.org>
In-Reply-To: <YfGZ/0hhkqVeX04p@casper.infradead.org>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Wed, 26 Jan 2022 14:22:26 -0500
Message-ID: <CA+CK2bDHkOQbTrK=GbsGbojAj_6gaAX_8w3cBCd_LWqXt--yZA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] mm: add overflow and underflow checks for page->_refcount
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
        Muchun Song <songmuchun@bytedance.com>,
        Wei Xu <weixugc@google.com>, Greg Thelen <gthelen@google.com>,
        David Rientjes <rientjes@google.com>,
        Paul Turner <pjt@google.com>, Hugh Dickins <hughd@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jan 26, 2022 at 1:59 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Wed, Jan 26, 2022 at 06:34:21PM +0000, Pasha Tatashin wrote:
> > The problems with page->_refcount are hard to debug, because usually
> > when they are detected, the damage has occurred a long time ago. Yet,
> > the problems with invalid page refcount may be catastrophic and lead to
> > memory corruptions.
> >
> > Reduce the scope of when the _refcount problems manifest themselves by
> > adding checks for underflows and overflows into functions that modify
> > _refcount.
>
> If you're chasing a bug like this, presumably you turn on page
> tracepoints.  So could we reduce the cost of this by putting the
> VM_BUG_ON_PAGE parts into __page_ref_mod() et al?  Yes, we'd need to
> change the arguments to those functions to pass in old & new, but that
> should be a cheap change compared to embedding the VM_BUG_ON_PAGE.

This is not only about chasing a bug. This also about preventing
memory corruption and information leaking that are caused by ref_count
bugs from happening.
Several months ago a memory corruption bug was discovered by accident:
an engineer was studying a process core from a production system and
noticed that some memory does not look like it belongs to the original
process. We tried to manually reproduce that bug but failed. However,
later analysis by our team, explained that the problem occured due to
ref_count bug in Linux, and the bug itself was root caused and fixed
(mentioned in the cover letter).  This work would have prevented
similar ref_count bugs from yielding to the memory corruption
situation.

Pasha
