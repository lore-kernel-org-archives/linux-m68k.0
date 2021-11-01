Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7B5C433FE
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Nov 2021 14:23:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAFF060F70
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Nov 2021 14:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbhKAOZz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 Nov 2021 10:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbhKAOZy (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 Nov 2021 10:25:54 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A833C061764
        for <linux-m68k@lists.linux-m68k.org>; Mon,  1 Nov 2021 07:23:20 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 205so29628064ljf.9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 Nov 2021 07:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lDzQzAKmrO4cE12pbgUF6sOtfYcuXG+MDS8ZFstUnZs=;
        b=A8I+yiJOK6RGvfYlNHU859Gr6ZKPAJIavCw93TUSQA/psdn1XnKFa1ouGoJ1WSawOt
         NEuLktnHURzeQafTm4cn87bl3HoJNfpJLwCLS24aCcQZjSrTxkBHaNWKZHiO5xdKdcsq
         KPBzvs7/MVNl4Z4Z60n5M05PRhYHlxin56Fy6vW5SpUkSRVQ1RnCEVByU+HoxkVPakMk
         TEEhAJLE/PPgLTo0i7NaL43ZZlXwjggucMSw5pFgLHfsU7wnm7FsELBd4EiStLZ0d8/e
         EbtjN+COC37/C75r4Tfl2mTJAUgvE3fDGomiZAU8gkiCm6eNg94FYN8I/I4DSPRQDC2q
         zOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lDzQzAKmrO4cE12pbgUF6sOtfYcuXG+MDS8ZFstUnZs=;
        b=Qt9nwv39DXECG7B1DhQ/D3zGgTA3TtRPZaWbTkJPJoH7wlkJ03+ocXxd/Df2xX6oZG
         W374lrjcAlHn74iJYbM0jLfQeTaUqWXMpVQ2YaYqOaRui7rdIugWkZFY+yg/fbmguiii
         ZCYiAyDkmFXAnE7VeANBRt7lu0Yw126GHHip+yd9dFqjojnUD6YqqUMdld5vksO7M/Wh
         lRJsSWCaNwDw5KWj2p9mMrLr01mXQHerR4ez4ir59O+x6bOmC1MLGWa5qTHLFN+Y915z
         X+zUpydbGfLLyEPkozRVcfhJwR2IqpCnaZsnb1PB6Rt02jrAJebqyWGYhFI0NMSTnkIX
         wSRA==
X-Gm-Message-State: AOAM530AC3KhYSPS2zJDi9RqnfdWyvOKTMaulCkBrF78bDRmDoBsx5jl
        eeEMxLWDU8OByibdGa/wgJjoIFZTe3xmzvsl6hcxlA==
X-Google-Smtp-Source: ABdhPJw2SDdjdrCAgvF2ObKwyMwAY8ht9SsxgV39b77Et+zkpNgad6QMEQngm1Q75lk8lMfydQmMHUB46JiVHGbLEAA=
X-Received: by 2002:a05:651c:104b:: with SMTP id x11mr28045714ljm.422.1635776598895;
 Mon, 01 Nov 2021 07:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211026173822.502506-1-pasha.tatashin@soleen.com>
 <20211026173822.502506-4-pasha.tatashin@soleen.com> <7b131cb1-68d8-6746-f9c1-2b01d4838869@nvidia.com>
 <CA+CK2bD6x01PevPqshzYqkO3aokjP2jBbt_4e5H5U3DVEdcJ5Q@mail.gmail.com>
 <b346cafd-d8b8-57a4-c7b9-6574b256a400@nvidia.com> <CA+CK2bBiomTe-vOuxM_R+0CMAippyrfZ6AgpXQGqps3ZFQCtRA@mail.gmail.com>
 <19d16b40-355f-3f79-dcba-e1d8d2216d33@nvidia.com>
In-Reply-To: <19d16b40-355f-3f79-dcba-e1d8d2216d33@nvidia.com>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Mon, 1 Nov 2021 10:22:43 -0400
Message-ID: <CA+CK2bBn81pz5NqCvS9jz+DvXbGG6d52Q=xTySJvJuqNRmFkkg@mail.gmail.com>
Subject: Re: [RFC 3/8] mm: Avoid using set_page_count() in set_page_recounted()
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        linux-m68k@lists.linux-m68k.org,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Matthew Wilcox <willy@infradead.org>,
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

> >> Yes, you are just repeating what the diffs say.
> >>
> >> But it's still not good to have this function name doing something completely
> >> different than its name indicates.
> >
> > I see, I can rename it to: 'set_page_recounted/get_page_recounted' ?
> >
>
> What? No, that's not where I was going at all. The function is already
> named set_page_refcounted(), and one of the problems I see is that your
> changes turn it into something that most certainly does not
> set_page_refounted(). Instead, this patch *increments* the refcount.
> That is not the same thing.
>
> And then it uses a .config-sensitive assertion to "prevent" problems.
> And by that I mean, the wording throughout this series seems to equate
> VM_BUG_ON_PAGE() assertions with real assertions. They are only active,
> however, in CONFIG_DEBUG_VM configurations, and provide no protection at
> all for normal (most distros) users. That's something that the wording,
> comments, and even design should be tweaked to account for.

VM_BUG_ON and BUG_ON should be treated the same. Yes, they are config
sensitive, but in both cases *BUG_ON() means that there is an
unrecoverable problem that occured. The only difference between the
two is that VM_BUG_ON() is not enabled when distros decide to reduce
the size of their kernel and improve runtime performance by skipping
some extra checking.

There is no logical separation between VM_BUG_ON and BUG_ON, there is
been a lengthy discussion about this:

https://lore.kernel.org/lkml/CA+55aFy6a8BVWtqgeJKZuhU-CZFVZ3X90SdQ5z+NTDDsEOnpJA@mail.gmail.com/
"so *no*. VM_BUG_ON() is no less deadly than a regular BUG_ON(). It
just allows some people to build smaller kernels, but apparently
distro people would rather have debugging than save a few kB of RAM."

Losing control of ref_count is an unrecoverable problem because it
leads to security sensitive memory corruptions. It is better to crash
the kernel when that happens instead of ending up with some pages
mapped into the wrong address space.

The races are tricky to spot, but set_page_count() is inherently
dangerous, so I am removing it entirely and replacing it with safer
operations which do the same thing.

One example is this:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=7118fc29

> >>>> I understand where this patchset is going, but this intermediate step is
> >>>> not a good move.
> >>>>
> >>>> Also, for the overall series, if you want to change from
> >>>> "set_page_count()" to "inc_and_verify_val_equals_one()", then the way to
> >>>> do that is *not* to depend solely on VM_BUG*() to verify. Instead,
> >>>> return something like -EBUSY if incrementing the value results in a
> >>>> surprise, and let the caller decide how to handle it.

In set_page_refcounted() we already have:

VM_BUG_ON_PAGE(page_ref_count(page), page);
set_page_count(page, 1);

I am pointing out that above code is racy:

Between the check VM_BUG_ON_PAGE() check and unconditional set to 1
the value of page->_refcount can change.

I am replacing it with an identical version of code that is not racy.
There is no need to complicate the code by introducing new -EBUSY
returns here, as it would reduce the fragility of this could even
farther.

> >>> Actually, -EBUSY would be OK if the problems were because we failed to

I am not sure -EBUSY would be OK here, it means we had a race which we
were not aware about, and which could have led to memory corruptions.

> >>> modify refcount for some reason, but if we modified refcount and got
> >>> an unexpected value (i.e underflow/overflow) we better report it right
> >>> away instead of waiting for memory corruption to happen.
> >>>
> >>
> >> Having the caller do the BUG() or VM_BUG*() is not a significant delay.

I agree, however, helper functions exist to remove code duplications.
If we must verify the assumption of set_page_refcounted() that non
counted page is turned into a counted page, it is better to do it in
one place than at every call site. We do it today in thus helper
function, I do not see why we would change that.
