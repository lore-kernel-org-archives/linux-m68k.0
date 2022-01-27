Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF86C433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 27 Jan 2022 19:39:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbiA0Tjb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 27 Jan 2022 14:39:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245601AbiA0Tja (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 27 Jan 2022 14:39:30 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8B7C06173B
        for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Jan 2022 11:39:30 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id jx6so8363185ejb.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Jan 2022 11:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BFb8NFrlSpLTas5OqZUZmins6ncV7W5Rmo5+3meVR3g=;
        b=Y1M+Bf1wwslphNC9H9x0VpVivB/SCcil9aYfoAVt13yg5Ovnt7H3lIEMuriqtFhlpv
         ekrnPLi/jLCjKpYhcBiKQBI9U8Q2idhM5Y2jnY5rVDWUw1D6PturF4Qp5HxF07TKCc1Z
         hVPZC4maBNEUCfeGSOEebJPeP6XLJ/2fdS8qKWy0JeBADfPYrbrLx2OhCFPxksMVJcQc
         pfFFyD8UgurIoPS2TtPatrHLxpKUCG+aG2YLdtHhjbazAXLDlRPMwy5COPM6VtOcVKhi
         0rl/2OvACuxdK0d4eD5XYawWhm3ABq00YjIyLHYSPCUVqI1G0PbJJKlCvEeYhPk9CmHS
         MKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BFb8NFrlSpLTas5OqZUZmins6ncV7W5Rmo5+3meVR3g=;
        b=q3SDP1nYZtkEamo9n4LC8VSXzUHgqKC9eQ87ZQVdhyq5rQZbbRyx4QSa9FialKCWyh
         NVID2Doy2hu5ckW2R4jFNZa81voAj4GBfBFtGIbRjg/UfrKdXrywAmys+lCKQ1cE4Jt0
         5TR8Rrh44ySwG102FGVeLAYhvYCYxDGt3+e72ZDZY6e2Ylj69wizOS7tAU7Gkx5QYVda
         7BRQr1PREzrBftta2dI81JC0j5Ub4E+lWzvYSbj2bC5oYlwuZ/Fo2YjJM26iDQz5ywdO
         4YuvUf74/84KYAkb0ROWP0VxnEPkAX2u1Tjd0zPW1fj3cwzUFLl+Cz+bKjymLT32nUVO
         JGhg==
X-Gm-Message-State: AOAM530Sh1V4v8U7ys47MzdRri/2/s38zFsESzlRL2qXD4lMcnGVAS0D
        0PikUdccQISLH2lpHeCLvRYJ23g6OWl7JSnfC+103g==
X-Google-Smtp-Source: ABdhPJwuhg8zPBVbIllXAibAi/ysZVpdojXGj11dmGEm1WuhDT5JouZwm0vT8xovbBnIKrNXGk5qaynKQV2BHOOjEus=
X-Received: by 2002:a17:906:dc92:: with SMTP id cs18mr4099175ejc.590.1643312369033;
 Thu, 27 Jan 2022 11:39:29 -0800 (PST)
MIME-Version: 1.0
References: <20220126183429.1840447-1-pasha.tatashin@soleen.com>
 <20220126183429.1840447-2-pasha.tatashin@soleen.com> <YfGZ/0hhkqVeX04p@casper.infradead.org>
 <CA+CK2bDHkOQbTrK=GbsGbojAj_6gaAX_8w3cBCd_LWqXt--yZA@mail.gmail.com> <b7f580cb-84f7-5c78-5f68-7ab8f67b0811@suse.cz>
In-Reply-To: <b7f580cb-84f7-5c78-5f68-7ab8f67b0811@suse.cz>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Thu, 27 Jan 2022 14:38:52 -0500
Message-ID: <CA+CK2bBAXZSX6E0boEoZ=Cake94v9q4LuWzQ-mj0QbWTsQcjOw@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] mm: add overflow and underflow checks for page->_refcount
To:     Vlastimil Babka <vbabka@suse.cz>
Cc:     Matthew Wilcox <willy@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, linux-m68k@lists.linux-m68k.org,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        william.kucharski@oracle.com,
        Mike Kravetz <mike.kravetz@oracle.com>,
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

> > This is not only about chasing a bug. This also about preventing
> > memory corruption and information leaking that are caused by ref_count
> > bugs from happening.
>
> So you mean it like a security hardening feature, not just debugging? To me
> it's dubious to put security hardening under CONFIG_DEBUG_VM. I think it's
> just Fedora that uses DEBUG_VM in general production kernels?

In our (Google) internal kernel, I added another macro:
PAGE_REF_BUG(cond, page) to replace VM_BUG_ON_PAGE() in page_ref.h.
The new macro keeps the asserts always enabled.  I was thinking of
adding something like this to the upstream kernel as well, however, I
am worried about performance implications of having extra conditions
in these routines, so I think we would need yet another config which
decouples DEBUG_VM and some security crucial VM asserts. However, to
reduce controversial discussions, I decided not to do this as part of
this series, and perhaps do it as a follow-up work.

Pasha
