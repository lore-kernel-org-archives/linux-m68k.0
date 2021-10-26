Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E346C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 18:51:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 435BD600CD
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 18:51:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238470AbhJZSx3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Oct 2021 14:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236853AbhJZSxK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Oct 2021 14:53:10 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B54C061745
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 11:50:44 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id y26so783275lfa.11
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 11:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BP4NAe7ddaJVYhsIxokjyZQ5JW8fdTP3tJwi3u/Bta8=;
        b=OT/TeaF5L09lQEvDVMETii9ZF1FekcmI9FniessxiwaCY0/2c1/fU9X5X2m68fW9/U
         qzQVQDMGq77TMKFFikymTD2XE2u05CbKQGlQpbNI/BWvyvPveGGs3ngxEM5n2QOBeTHl
         mwF0G1HhAq6spGex+GCN3LXQEQ6VP23pvpQmFaEr/rN1tsQZ8Yqi/dZx6ZCN+kUbjYIx
         vEXsauZp23Pe2R112F8jObaUOfG3GygDQTUzRtanX4RtuwliVgXLR1IntFRHfOlF1pUk
         9dWQEtfBQTmHBrfKOPbY+vAeLSCf02bKk8pvLZk56yE4XTzHWKfi2qJK9H0uCUmhkA5i
         Zkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BP4NAe7ddaJVYhsIxokjyZQ5JW8fdTP3tJwi3u/Bta8=;
        b=XCcomqD4YQ1q6EidiCjTBqbdNW9A7IkWx6D9HTYSUY2CpnPFE3OQclNCjCZLAGKxwa
         MBibSSDZE8vTFzYCR/wE/+o/NX61vnnEA6FY4Or33iPjKncSHWI2obf+29dT2mvFz6Us
         KQ/A7RF0Vrlh+QgoPFJvR5Oi/kKU3cJ2hVqWWw5lOgEmkLHWude3oVONYC7WzB8mXuDX
         47eZxCvyQkpMDiRb14GW4q4d6KJSMzv9GuUiaWzMOTrJAfWYdp6QKMCrRD/GbPU3Dgcs
         yw4F9n+gIBVwtf52TQev+n2NVYkIe5zlGIKRSTE6cQMrgTudlt+mnV21Xft/GvDehh3f
         9hSA==
X-Gm-Message-State: AOAM533/CLuWxJ74zRhsTEAe+ttx0Gbg9AYKGsJMxLpl5aoZPZZjBU+Z
        rFnDJR7pesU2zJt2MEX8W1Lf/mBNU4RSjpg0J3kDaw==
X-Google-Smtp-Source: ABdhPJzK4Dha/q6HSrHHxcz81bIchY+vvTwR3f0p68xpNbHqCeDhn3qKld2X233U664gN+hNMB3NXO/CSZIYQpq8xAo=
X-Received: by 2002:ac2:59cc:: with SMTP id x12mr7735816lfn.501.1635274243249;
 Tue, 26 Oct 2021 11:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211026173822.502506-1-pasha.tatashin@soleen.com>
 <20211026173822.502506-3-pasha.tatashin@soleen.com> <57fbf167-b2e8-69f6-7f79-8e989162c889@oracle.com>
In-Reply-To: <57fbf167-b2e8-69f6-7f79-8e989162c889@oracle.com>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Tue, 26 Oct 2021 14:50:06 -0400
Message-ID: <CA+CK2bBuU5_8PrT8zd-bAJ-zJW29+9MncnBMAyoJ+JwDHp=WyQ@mail.gmail.com>
Subject: Re: [RFC 2/8] mm/hugetlb: remove useless set_page_count()
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        linux-m68k@lists.linux-m68k.org,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        william.kucharski@oracle.com, Vlastimil Babka <vbabka@suse.cz>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        schmitzmic@gmail.com, Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Roman Gushchin <guro@fb.com>, songmuchun@bytedance.com,
        weixugc@google.com, Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Oct 26, 2021 at 2:45 PM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 10/26/21 10:38 AM, Pasha Tatashin wrote:
> > prep_compound_gigantic_page() calls set_page_count(0, p), but it is not
> > needed because page_ref_freeze(p, 1) already sets refcount to 0.
> >
> > Using, set_page_count() is dangerous, because it unconditionally resets
> > refcount from the current value to unrestrained value, and therefore
> > should be minimized.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>
> Thanks!
>
> My bad for not removing the set_page_count when adding the page_ref_freeze.
>
> FYI, there have been additional changes to this routine in Andrew's
> tree.  Not really sure if we want/need the VM_BUG_ON_PAGE as that would
> only check if there was a 'bug' in page_ref_freeze.

I would like to keep it. Part of the idea of this series is to reduce
reliance on comments such as:

/* No worries, refcount is A therefore we can do B */

And instead enforce that via VM_BUG_ON().  It should be able to
prevent existing and future _refcount related bugs from manifesting as
memory corruptions.

Pasha

>
> --
> Mike Kravetz
>
> > ---
> >  mm/hugetlb.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 95dc7b83381f..7e3996c8b696 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -1707,7 +1707,7 @@ static bool prep_compound_gigantic_page(struct page *page, unsigned int order)
> >                       pr_warn("HugeTLB page can not be used due to unexpected inflated ref count\n");
> >                       goto out_error;
> >               }
> > -             set_page_count(p, 0);
> > +             VM_BUG_ON_PAGE(page_count(p), p);
> >               set_compound_head(p, page);
> >       }
> >       atomic_set(compound_mapcount_ptr(page), -1);
> >
