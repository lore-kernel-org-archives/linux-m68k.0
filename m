Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46152C433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 18:27:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22B2760FC0
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 18:27:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238413AbhJ0SaG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 27 Oct 2021 14:30:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238360AbhJ0SaF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 27 Oct 2021 14:30:05 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9CF0C061745
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 11:27:39 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id k13so6147895ljj.12
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 11:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eTPGGY5lRCDLBi6dC5IO32LUKxcN06wIGk1r7lIVLSo=;
        b=d3wjkgrfbqcygeWm6K/TtNmo32Mpi/IvWJLl5UmypGRAf01wECJBMI5oO6ZlCl7qfg
         kXxZKIMk1Hd3etghlMO0DF8OBeeQDZqxG+A97FEd+MR+G92uCtX7rGbLKD1qhsQW00VE
         hKRgadi2AztZburwCJd4Z1+tzPZJDoqhKJCrDO2EiSdQgweRWRn4fVv5+GX4swPMf7FH
         8iQF+zzjdnwFD2o7TqZRU///noJZNQruC4Z4+YkOpzMF287IW/ePgpl8ewJBYjODSmR0
         pluAlAFLYSCqFcxQsw935K3sqFD7E4hV/QSA5u0DJaCDiLZRcgpwlDdd2ADfdA231iih
         jsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eTPGGY5lRCDLBi6dC5IO32LUKxcN06wIGk1r7lIVLSo=;
        b=knN0YUk8XSdT063wcdwpaLi9SjUdHVh49lrm3BmRymppLVgVnitRDqi59CnWg4FGR8
         rx9b4gLb+tsJX3UEItVjGExRNtra3mipL8ACbjdVKY3YN62Kl2P7K+/LOXNVRaWuyKYA
         kV9Gd8K06rJRWFIdnfxq7NMKo21/+/9WKSHMm+qn3fi/AmPItiuccOEH9Xqaqm0PGm9y
         3poY0Sy/3a216FmTtgqCm/a9PWEDTmVXJsFN1eJos0kSdz9GfuKEaqs6dnjrvIrRupub
         ek7qP7A4Thn/NZiQOFgYdbOOUEfvu67hzTFgPrkev3+++mwPPyJh2DRTjtYaHcksRMfs
         EqVQ==
X-Gm-Message-State: AOAM530GMFLfNq4c1vGkVqlexgJkyzdGn5qADuuiJFf3o6ewJeDzwich
        tGKwSI8Wtrli3GOzwDhZQQQo40dr7bS0zF5u0rTNEA==
X-Google-Smtp-Source: ABdhPJzVrqJVm8ugC/NpTWWt0IMrYAXeu8WHnFF1TrXtg37Te+R3tSJ+rO1eSFGnjAMpx1n4+0JJslJTRNvu3vH6O7E=
X-Received: by 2002:a2e:810c:: with SMTP id d12mr34769148ljg.177.1635359258205;
 Wed, 27 Oct 2021 11:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211026173822.502506-1-pasha.tatashin@soleen.com>
 <20211026173822.502506-4-pasha.tatashin@soleen.com> <7b131cb1-68d8-6746-f9c1-2b01d4838869@nvidia.com>
 <CA+CK2bD6x01PevPqshzYqkO3aokjP2jBbt_4e5H5U3DVEdcJ5Q@mail.gmail.com> <b346cafd-d8b8-57a4-c7b9-6574b256a400@nvidia.com>
In-Reply-To: <b346cafd-d8b8-57a4-c7b9-6574b256a400@nvidia.com>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Wed, 27 Oct 2021 14:27:01 -0400
Message-ID: <CA+CK2bBiomTe-vOuxM_R+0CMAippyrfZ6AgpXQGqps3ZFQCtRA@mail.gmail.com>
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

On Wed, Oct 27, 2021 at 1:12 AM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 10/26/21 11:21, Pasha Tatashin wrote:
> > It must return the same thing, if it does not we have a bug in our
> > kernel which may lead to memory corruptions and security holes.
> >
> > So today we have this:
> >     VM_BUG_ON_PAGE(page_ref_count(page), page); -> check ref_count is 0
> >     < What if something modified here? Hmm..>
> >     set_page_count(page, 1); -> Yet we reset it to 1.
> >
> > With my proposed change:
> >     VM_BUG_ON_PAGE(page_ref_count(page), page); -> check ref_count is 0
> >     refcnt = page_ref_inc_return(page);  -> ref_count better be 1.
> >     VM_BUG_ON_PAGE(refcnt != 1, page); -> Verify that it is 1.
> >
>
> Yes, you are just repeating what the diffs say.
>
> But it's still not good to have this function name doing something completely
> different than its name indicates.

I see, I can rename it to: 'set_page_recounted/get_page_recounted' ?

>
> >>
> >> I understand where this patchset is going, but this intermediate step is
> >> not a good move.
> >>
> >> Also, for the overall series, if you want to change from
> >> "set_page_count()" to "inc_and_verify_val_equals_one()", then the way to
> >> do that is *not* to depend solely on VM_BUG*() to verify. Instead,
> >> return something like -EBUSY if incrementing the value results in a
> >> surprise, and let the caller decide how to handle it.
> >
> > Actually, -EBUSY would be OK if the problems were because we failed to
> > modify refcount for some reason, but if we modified refcount and got
> > an unexpected value (i.e underflow/overflow) we better report it right
> > away instead of waiting for memory corruption to happen.
> >
>
> Having the caller do the BUG() or VM_BUG*() is not a significant delay.

We cannot guarantee that new callers in the future will check return
values, the idea behind this work is to ensure that we are always
protected from refcount underflow/overflow and invalid refcount
modifications by set_refcount.

Pasha
