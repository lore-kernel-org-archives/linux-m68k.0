Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93324C433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 18:23:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7620760F38
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 18:23:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236767AbhJ0S0H (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 27 Oct 2021 14:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236102AbhJ0S0E (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 27 Oct 2021 14:26:04 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E16C0613B9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 11:23:38 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id j9so8022625lfu.7
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 11:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jm/RSf4rCAITEo2BV23aNePeo8qwzmc9rjVyo//Sm2w=;
        b=DE53XnOsp2UZoHcQaGjN87P4NcbSE8qj1rBVRDhKYNzC81Sy+TaGIz6zgbRDa/vuDJ
         KNWTN52x9VpgsgZRqOL49qcoT+nz81r0kHjinwiCaa6y+XsG7oaM0JEJJuqnooFAR5rx
         khuxM+qC3sGdFQGJ0MWfcvEMyCP8aVzIrasBq9RSYVlPsbVMAgYtQJKAQz8niwOYnkmU
         +q7PL8YBOW6lnqyHqFrFjcNLK/ZstGzw28n466sjq53t8f8HTWiQnObvcohU2V9fhCSA
         dvMuInKsZVBJ2FFVNuh2nesWSw4OQtn5G3i6ZPX3fLEMSpntmgamQnPW3jdgETvX10Np
         pNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jm/RSf4rCAITEo2BV23aNePeo8qwzmc9rjVyo//Sm2w=;
        b=FdFh8XY0jE51LD5TthyrbjHHj72qfAv40XUbBo+IUyw4uqwkyce8yjOtnZN4XgpWy3
         fRNCc49Cnt/BV6khUCU7BsEQZp6FRDfIwxeH3FxgLmel36iez9cPm7THgDO0km1k46bu
         +i4shDR2ki8Dz0t7W2qm7XtMcCuv2aowTNBD9zqx0Fx23gwUUd4M6ovP0Cfym1e02f2m
         4JIRzP9CTWaYVIR884HJyEG9IzbZ6EEKZvIbCQaf/yEAX+rbb07uSn9jBL5bOqrzcvYe
         DBpLk2dtoJcMsBSL/2m1xKEjhK04tcuMjLdszlv29VUUTnJUidGiRr+sEetjvQFY5QaG
         YWQg==
X-Gm-Message-State: AOAM530xVm7aENuSr1WTTaNilHB6z4wJIGrGNVBsV3OeZ/A5XPdSHQUp
        z2jFbPA23DbBcyuiOMlGq8/ZXfOFLPcPLXtYXe5xUg==
X-Google-Smtp-Source: ABdhPJzF9GpWULmhvrOQLqZG1vjigpdCyvN06x5InpHqzQbrjC7IEgs8r9nSKwjIi/xqAB5PqByC37tkZTYQpF/rWLE=
X-Received: by 2002:a05:6512:1046:: with SMTP id c6mr12998783lfb.475.1635359016292;
 Wed, 27 Oct 2021 11:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211026173822.502506-1-pasha.tatashin@soleen.com>
 <20211026173822.502506-2-pasha.tatashin@soleen.com> <YXhbq/6OIpIAr7Tx@casper.infradead.org>
 <CA+CK2bCZO5J-NRqavWFKXt+yB1u17dFA9VrW48HLBepiQLJtcA@mail.gmail.com>
 <CA+CK2bBP_XJXN+wM=hmRO3C7x2Fi_SnbT_J0fU9xH0vnxU_Omg@mail.gmail.com> <YXjByyquuaN3ZKRq@casper.infradead.org>
In-Reply-To: <YXjByyquuaN3ZKRq@casper.infradead.org>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Wed, 27 Oct 2021 14:22:58 -0400
Message-ID: <CA+CK2bA3aXXb4j9GwwWakZE+M9Fipet7eZioUsg_Ljx0UuTooA@mail.gmail.com>
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

On Tue, Oct 26, 2021 at 11:05 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Oct 26, 2021 at 09:21:29PM -0400, Pasha Tatashin wrote:
> > I think we can do that by using:
> > atomic_fetch_*() and check for overflow/underflow after operation. I
> > will send the updated series soon.
>
> Please include performance measurements.  You're adding code to some hot
> paths.

I will do boot performance tests to ensure we do not regress
initializing "struct pages" on larger machines. Do you have a
suggestion for another perf test?

Thanks,
Pasha
