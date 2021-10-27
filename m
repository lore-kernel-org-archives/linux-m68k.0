Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8ABC433F5
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 01:22:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC38060C4B
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 01:22:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237294AbhJ0BYe (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Oct 2021 21:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236342AbhJ0BYc (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Oct 2021 21:24:32 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DBACC061745
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 18:22:07 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id l2so1907038lji.6
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 18:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YXjf3eGpY1i6FTdK0pzrewu/J0t+i5gtLQ2TvcFFJOY=;
        b=PxVapz5Uqh/H1c4ohK8jJVIMexXh+95TCfq2vs9j8PwNACM/FvIfg5nt8P9lxazoor
         p25NImF9tbvqauK4fXRXGntjxBnJlNerDMLR0YcsfgPUiEIn63EWj9oU5OvcmtcOdRvn
         W35pn9w5/RVcCQW3Fw9EQvhNbaR1f7aqFHI30nMVxM1MWsQ/F+qUAZnW5Gmak4+VYzWu
         Etk+Fsn1i22vTM6A2vd5cpJ2lv7qwepnXknS002FXOyYpCz3rMY8Wo6ihBC8yXwz19+8
         nyTf5y2UgCmA6EIaso4lx0b/b9J8kmxge9EiP0N9b+Ya/mCE8Jyrv8cghLK6jjB/2+oE
         0Tow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YXjf3eGpY1i6FTdK0pzrewu/J0t+i5gtLQ2TvcFFJOY=;
        b=NUw7EscQKtgo8EmOvoRS7Z3tzUcrYYQIyL0RWB4R2izTUkmVyCgXZ/kOBXm519H8zK
         xg0jGEduMRw+JB4GnNKI69aBjgk9paengCQF5qzd2iWthC9brAa8GwJk0Pc7z/rLRsDc
         5qWFdaqkr9Zg0VSY/Yqb1+biN+Xkg8hqEHmsoGnA6CNI4Dag4cKDwqHTMkH5fQQSFixC
         mPLuRWWPweoTJ1ieim3EkrZm+KTq0q3UBO9s/om0vywfKJc9dMbGw3v4XAvjGi03pFf1
         hHO1/F5r95ZXDFEdKZd6UvL3+KUN66cYGmj1dxnIfAWq8CxnXmsfg7wp8S+TsMljB6ms
         EmBA==
X-Gm-Message-State: AOAM530co63g83GKSgLlap3v+LaqpN+XRubjuGWTTK+V1ncXcbnXZGZe
        p/t0D1nU4w+HgcntNsHVykL3D2rptQq7I7UXloDhkA==
X-Google-Smtp-Source: ABdhPJzEFKcMzaHxg5KoZbQlEcu4egmXSM6hrKj50R2HpUoChXbgvFqtcAmo/5SY71whr717TbZXtKdEI7jkWOi8x84=
X-Received: by 2002:a2e:810c:: with SMTP id d12mr30018141ljg.177.1635297725570;
 Tue, 26 Oct 2021 18:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211026173822.502506-1-pasha.tatashin@soleen.com>
 <20211026173822.502506-2-pasha.tatashin@soleen.com> <YXhbq/6OIpIAr7Tx@casper.infradead.org>
 <CA+CK2bCZO5J-NRqavWFKXt+yB1u17dFA9VrW48HLBepiQLJtcA@mail.gmail.com>
In-Reply-To: <CA+CK2bCZO5J-NRqavWFKXt+yB1u17dFA9VrW48HLBepiQLJtcA@mail.gmail.com>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Tue, 26 Oct 2021 21:21:29 -0400
Message-ID: <CA+CK2bBP_XJXN+wM=hmRO3C7x2Fi_SnbT_J0fU9xH0vnxU_Omg@mail.gmail.com>
Subject: Re: [RFC 1/8] mm: add overflow and underflow checks for page->_refcount
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
        Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Oct 26, 2021 at 5:34 PM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> On Tue, Oct 26, 2021 at 3:50 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Tue, Oct 26, 2021 at 05:38:15PM +0000, Pasha Tatashin wrote:
> > >  static inline void page_ref_add(struct page *page, int nr)
> > >  {
> > > -     atomic_add(nr, &page->_refcount);
> > > +     int ret;
> > > +
> > > +     VM_BUG_ON(nr <= 0);
> > > +     ret = atomic_add_return(nr, &page->_refcount);
> > > +     VM_BUG_ON_PAGE(ret <= 0, page);
> >
> > This isn't right.  _refcount is allowed to overflow into the negatives.
> > See page_ref_zero_or_close_to_overflow() and the conversations that led
> > to it being added.
>
> #define page_ref_zero_or_close_to_overflow(page) \
> 1204   ((unsigned int) page_ref_count(page) + 127u <= 127u)
>
>
> Uh, right, I saw the macro but did not realize there was an (unsigned int) cast.
>
> OK, I think we can move this macro inside:
> include/linux/page_ref.h
>
> modify it to something like this:
> #define page_ref_zero_or_close_to_overflow(page) \
>    ((unsigned int) page_ref_count(page) + v + 127u <= v + 127u)
>
> The sub/dec can also be fixed to ensure that we do not underflow but
> still working with the fact that we use all 32bits of _refcount.

I think we can do that by using:
atomic_fetch_*() and check for overflow/underflow after operation. I
will send the updated series soon.

Pasha
