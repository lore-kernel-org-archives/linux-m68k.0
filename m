Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D34C433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 07:47:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3FE160EB4
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 07:47:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235616AbhJ0Htr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 27 Oct 2021 03:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbhJ0Htq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 27 Oct 2021 03:49:46 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2459C061745
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 00:47:21 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id y80so4037866ybe.12
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 00:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=loo6J+IxIj4clOI8hbAYwr44QCVgT2WqP23IkmlyE90=;
        b=ejNHgkTEI3rvzEqVdyGTwC4ZsTd3PDCtXvqQq6h7xYm339qXrcU/LTl4td5IJ9K80l
         PDNmBPPXvQvVaBiiZy7PN77C7Czz+NStfGWc39W0PiK9prM9AT9f9ivIUH3nZFIriI5F
         DqBL6YR/3Pd9WTECoGr0FNUp0mAdSqAJ7x9IvKOjAF4Eei+IrsiX3gCMIpSS8lnvQcfO
         tPV9rmIQvzqweHp9j7FRlN2Aj2U94P3ECNMGnwpExpWsaG1pcGzR7r6cwjmGGRlxZ+mv
         ldbrKEaIAHjOHVr8Oia34oebIlHlXXUlIpNgUsWRdXVA3jtrqvR+tD1bkjSJLRjLJwUp
         2Ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=loo6J+IxIj4clOI8hbAYwr44QCVgT2WqP23IkmlyE90=;
        b=vcm2Cgn3HSgSxMMu8m/r+7a9Or2coo61AJj9XBVKc4FlRMtwm/eo8vBdVaw+h/KdeR
         TRFBfGEYfouoT1MPX84/CnJqhSNm1bJuyqrHd9UA3++4VFyqW3Ago/OmL5OOZXbSxfjQ
         nzU9bDt0SPBt460h9eqcX43t715rcyhNQe59ZAQbHhoWJIa/c9GD8/Fr+RrI44lqzC6A
         7wYr7F/8AJv2uLKu1PXT+mu2QiPPjPvI+Tfpovcjo/BzYz+/VZSDQ9C9shYWgUWOpiZQ
         v6wFGbl+BsllK7nJDURx+wvoCYYrJmSM4NtNnXFxSLDwtFL9FrDDNc0haLCipmYG5+ce
         v2vA==
X-Gm-Message-State: AOAM533nBRJwaPJdoiLfwpDZMjjRSDqJi6tyJrfickEUvoDriDX93te0
        dlPkDJDZCDbRGBWGu3TS13ykijMp2iWZCjlSrag9+A==
X-Google-Smtp-Source: ABdhPJz+XebE2bOjEj4+R9On6uOHRAEk9nRXfXlxTPyeWvga0rJ1rMsvtN+tWifQabRIRggo5SvYAy4Nno4c280mUp4=
X-Received: by 2002:a25:3b50:: with SMTP id i77mr1035222yba.404.1635320840664;
 Wed, 27 Oct 2021 00:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211026173822.502506-1-pasha.tatashin@soleen.com> <20211026173822.502506-2-pasha.tatashin@soleen.com>
In-Reply-To: <20211026173822.502506-2-pasha.tatashin@soleen.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 27 Oct 2021 15:46:42 +0800
Message-ID: <CAMZfGtVS2ZRAsd9HLODoLa1vVp0XCcBOTXjsmpoWwDcdGaADvQ@mail.gmail.com>
Subject: Re: [RFC 1/8] mm: add overflow and underflow checks for page->_refcount
To:     Pasha Tatashin <pasha.tatashin@soleen.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-m68k@lists.linux-m68k.org,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        william.kucharski@oracle.com,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, geert@linux-m68k.org,
        schmitzmic@gmail.com, Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Roman Gushchin <guro@fb.com>, weixugc@google.com,
        Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Oct 27, 2021 at 1:38 AM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> The problems with page->_refcount are hard to debug, because usually
> when they are detected, the damage has occurred a long time ago. Yet,
> the problems with invalid page refcount may be catastrophic and lead to
> memory corruptions.
>
> Reduce the scope of when the _refcount problems manifest themselves by
> adding checks for underflows and overflows into functions that modify
> _refcount.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

I found some atomic_add/dec are replaced with atomic_add/dec_return,
those helpers with return value imply a full memory barrier around it, but
others without return value do not. Do you have any numbers to show
the impact? Maybe atomic_add/dec_return_relaxed can help this.

Thanks.
