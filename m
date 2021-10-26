Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B693AC433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 18:22:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9526561078
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 18:22:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236754AbhJZSY4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Oct 2021 14:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbhJZSY4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Oct 2021 14:24:56 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBAE0C061767
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 11:22:31 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id q16so366966ljg.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 11:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=65K7xPMB5++D+E7Bfsj7avhsV6qayGu5o858lBV5Elw=;
        b=UFCHSPeXcQuOwM5lLBzpQb7MmItFB4AO1roGO3y4q5yr/hBmA5lT1VpaEAmhdJ8z/+
         VYkqEAMbuPAv1Cp8LsRycDDHtNvQeQFx8ipOaDHKl6uW/BQM+UY8gkxeKK1rD6gGr5b5
         UAPtkFa0BJoq6WvAzcEI5zbTFwjaDAQ8x976/sWxF14aJK3ZMtLOU5YZnYmTm2KtHcma
         4yfclS5UycC8vhPriGnuQqwzjvOB6HwPARWPA5QDSSGLIZFoGvvzuROAIiV0JbwyFpH2
         9ePnPpndZLepd6EXRifaI8NVaGxubCB3QnHbqqrjvdu4maqR49+vJ1T4iBJe7KGvwG0v
         ZgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=65K7xPMB5++D+E7Bfsj7avhsV6qayGu5o858lBV5Elw=;
        b=DPcmHaVCKgVy/7X8rHGhjOsI9I9tvuf8QEsoK5Hzo9aNPLqcw1Nianu9Da2YPwu7Tq
         u4YI8g7MF+1m/IrUqPDZiAQKBxzyCx2uYl4VJqwdCjerMO8ifTimB0kEvIQKCvaoGfxn
         sx9H5GBeeLfK6k6VLzSW0SZ07V26YDU0whmhDr8YqM8c55w5woYYfk/M1edct7H/dlsQ
         eyrE7rPRCRxIa8JNOTua3M9e1McPioDNn2x9HcHWRgM+XfWkWUTwjkl+nPLpvbaewyTf
         WuZcAjcm7tOHbbjV6UFdJkeVAe7Lc/5sb049JV3eWMgLj/l1bQiU/4BjGO57jMBwLc1F
         iE2w==
X-Gm-Message-State: AOAM5308Ywdb4z1G7mGuXK9P30rBfS8w5TkWz3zzojl7EOsbwKKyAEVb
        Y7GwNc+29YX3hWzLbfDNa7FL3Ur4VCBvZH6Vi1ECCA==
X-Google-Smtp-Source: ABdhPJx2JuH49fJWhpgoI/t0B9ikgzBgjsyHaYVav9e1A/WZ3jrkA/+aZNOAoOH5hm2JJV0+jzgrKdz/brNyOdRDdIo=
X-Received: by 2002:a2e:b794:: with SMTP id n20mr149553ljo.313.1635272550203;
 Tue, 26 Oct 2021 11:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211026173822.502506-1-pasha.tatashin@soleen.com>
 <20211026173822.502506-4-pasha.tatashin@soleen.com> <7b131cb1-68d8-6746-f9c1-2b01d4838869@nvidia.com>
In-Reply-To: <7b131cb1-68d8-6746-f9c1-2b01d4838869@nvidia.com>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Tue, 26 Oct 2021 14:21:53 -0400
Message-ID: <CA+CK2bD6x01PevPqshzYqkO3aokjP2jBbt_4e5H5U3DVEdcJ5Q@mail.gmail.com>
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
        Roman Gushchin <guro@fb.com>, songmuchun@bytedance.com,
        weixugc@google.com, Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi John,

Thank you for looking at this series.

> >   static inline void set_page_refcounted(struct page *page)
> >   {
> > +     int refcnt;
> > +
> >       VM_BUG_ON_PAGE(PageTail(page), page);
> >       VM_BUG_ON_PAGE(page_ref_count(page), page);
> > -     set_page_count(page, 1);
> > +     refcnt = page_ref_inc_return(page);
> > +     VM_BUG_ON_PAGE(refcnt != 1, page);


> I am acutely uncomfortable with this change, because it changes the
> meaning and behavior of the function to something completely different,
> while leaving the function name unchanged. Furthermore, in relies upon
> debug assertions, rather than a return value (for example) to verify
> that all is well.


It must return the same thing, if it does not we have a bug in our
kernel which may lead to memory corruptions and security holes.

So today we have this:
   VM_BUG_ON_PAGE(page_ref_count(page), page); -> check ref_count is 0
   < What if something modified here? Hmm..>
   set_page_count(page, 1); -> Yet we reset it to 1.

With my proposed change:
   VM_BUG_ON_PAGE(page_ref_count(page), page); -> check ref_count is 0
   refcnt = page_ref_inc_return(page);  -> ref_count better be 1.
   VM_BUG_ON_PAGE(refcnt != 1, page); -> Verify that it is 1.

>
> I understand where this patchset is going, but this intermediate step is
> not a good move.
>
> Also, for the overall series, if you want to change from
> "set_page_count()" to "inc_and_verify_val_equals_one()", then the way to
> do that is *not* to depend solely on VM_BUG*() to verify. Instead,
> return something like -EBUSY if incrementing the value results in a
> surprise, and let the caller decide how to handle it.

Actually, -EBUSY would be OK if the problems were because we failed to
modify refcount for some reason, but if we modified refcount and got
an unexpected value (i.e underflow/overflow) we better report it right
away instead of waiting for memory corruption to happen.

Thanks,
Pasha
