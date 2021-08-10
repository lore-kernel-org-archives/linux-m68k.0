Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB8EC4338F
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Aug 2021 19:15:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AFDD60EBB
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Aug 2021 19:15:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232243AbhHJTQJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 10 Aug 2021 15:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbhHJTQI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 10 Aug 2021 15:16:08 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A8DCC0613C1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 10 Aug 2021 12:15:46 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id l34-20020a05600c1d22b02902573c214807so2694953wms.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 10 Aug 2021 12:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TIh0iMs8nw7ZRS40sjBbyQljsrkzHDlv/+9/rQIQFf0=;
        b=EmA6euqSfBkGEjwppT7Ij8g6e6NOctGs71YHBHP9Uzscuhn9o55a7NjtvchERi8eM4
         4gRI8ZcBVxj01mQKgHOj+efAFVYDoHx4N6FdJRpm1jpy4tVkcyIy7JGjB2qIbc2kvh8+
         9US2/gZVtlw7VvxuOIM5XOD6vmjgeLAE8rZTt2iWetvud7DnoyVts2kAeqosRZ3kN0vW
         WthS4EhKX7PdbY0EhNM96ymvp809ZbgTaiO5LnK1o+uWkC4RLUgbCLzgpmrQkui4prKd
         5kepz+3SQVxCXxkATbwVvjwdjcMmugQwQ8ES8mVaWJnHZkhIqvbq0ZRYqc3CwJ6C9+DQ
         mlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TIh0iMs8nw7ZRS40sjBbyQljsrkzHDlv/+9/rQIQFf0=;
        b=B00qwv0j5yM2hlc4ZS02e8ICs55TSvKEwZNtT9ltqN9r4K54LraijQZ7Pzkh1Pswoj
         LdKnKrQBPeI6jKQIXi6gUbJnjsucg/1QOWPvWXktFQZ6bXdPlDwREAZmQ19k/xcxnkdn
         q7yUTEDS6sGqbSLWNOCQrXUORfELEhLApovEG+jM3z09XbYnEXlu/imQfL3qCIF9vO4i
         eyqE1EELhlmWQJfkX3RoJommj7EKWmWUvwBy90SQWOqDn6DCzCYwEsPJLm0WgdM/AUGb
         UWElU7xgkGfd5K6n2QrQH6mL9pGp5DPjamWSlLAsQmwKBtob1dt+/ewLKfFXbakfYXhi
         ujXg==
X-Gm-Message-State: AOAM532Xz/21LzBlez5Hggdj8aZTUQo2XJLSmYaVP+HiLWwqRsPqzKs7
        G6GQDLzFxYLW2MK4O5Fgahw=
X-Google-Smtp-Source: ABdhPJxzpJRdz6/LpV+u3j0cUTiQB/GXqS09VRw4e4KgPFyUNWmpK2uhrcpRWxqyH0qo9AKo3HGdvg==
X-Received: by 2002:a1c:4487:: with SMTP id r129mr5988337wma.62.1628622944840;
        Tue, 10 Aug 2021 12:15:44 -0700 (PDT)
Received: from gmail.com (aftr-62-216-202-192.dynamic.mnet-online.de. [62.216.202.192])
        by smtp.gmail.com with ESMTPSA id s13sm3703005wmc.47.2021.08.10.12.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 12:15:44 -0700 (PDT)
Date:   Tue, 10 Aug 2021 21:15:39 +0200
From:   Mete Polat <metepolat2000@gmail.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Michel Lespinasse <michel@lespinasse.org>,
        Davidlohr Bueso <dbueso@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Jesper Nilsson <jesper@jni.nu>, Arnd Bergmann <arnd@arndb.de>,
        David Woodhouse <dwmw2@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH v2] rbtree: remove unneeded explicit alignment in struct
 rb_node
Message-ID: <YRLQW1JAlh0GqPVA@gmail.com>
References: <YQ1ToK8EMdAO4CyH@precision>
 <20210806174457.GA2184@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210806174457.GA2184@worktop.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Aug 06, 2021 at 07:44:57PM +0200, Peter Zijlstra wrote:
> On Fri, Aug 06, 2021 at 05:22:08PM +0200, Mete Polat wrote:
> > Commit e977145aeaad ("[RBTREE] Add explicit alignment to sizeof(long) for
> > struct rb_node.") adds an explicit alignment to the struct rb_node due to
> > some speciality of the CRIS architecture.
> > 
> > The support for the CRIS architecture was removed with commit c690eddc2f3b
> > ("CRIS: Drop support for the CRIS port")
> > 
> > So, remove this now unneeded explicit alignment in struct rb_node as well.
> > 
> > This basically reverts commit e977145aeaad ("[RBTREE] Add explicit
> > alignment to sizeof(long) for struct rb_node.").
> > 
> > The rbtree node color is stored in the LSB of '__rb_parent_color'.
> > Only mask the first bit in '__rb_parent()', otherwise it modifies the
> > node's parent address on m68k.
> 
> I still don't believe for a second this will actually work. We rely on
> rcu_assign_pointer() and rcu_dereference() to work on the
> rb_{left,right} members, and I don't think any architecture can provide
> single copy atomic loads and stores that are not naturally aligned (eg.
> when they straddle a cache or page boundary).
> 

I guess I am misunderstanding something here, but isn't that then a
problem that all rcu pointers in any struct would face, independent of
an 'aligned' struct attribute? As long as allocators do not place a
small struct as rb_node over page boundaries and the rcu pointers itself
are aligned we should be fine, aren't we? I am not sure if any of the
SL*B allocators is doing that though.
