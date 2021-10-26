Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17987C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 18:14:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA5576103C
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 18:14:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238134AbhJZSRQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Oct 2021 14:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238088AbhJZSRP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Oct 2021 14:17:15 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97D7CC061767
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 11:14:51 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bp15so663564lfb.4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 11:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p2lOeA7/RxLsbo2rdtPzVESfOskfSj305P2TengOudc=;
        b=d55UTjhU+PsDgm6kvnNDVcJxLCf/72fvHicwBgCcDx1Pgt5C5b4nyn8ZUnjWGM7IwA
         UyfIXa6HoMVlmeIkE3wzkTgFdlCIDv7keYqJggh8XgLx3EuQt+nX/HLHR0a/aQCkHBNE
         PGqOsLGab/MBJ5YMyEhT4DyPwaEFIKJt8WU+VHS3O21KZEGOWShC+Wrtaaxv0DNYSE9m
         e2z4qPJJnjg0eR5R7WUMzi8h9WEzf0U2svRPBTY+J/mPm5U+JrmzTjXYhJmEEEPCbISM
         CCpDTfQ9u8JqgmuIcMOBawVGZBB/jBy6eexMN6R19NhUxB1q7i4sAKQT45jRisy5i6JS
         FDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p2lOeA7/RxLsbo2rdtPzVESfOskfSj305P2TengOudc=;
        b=OzsFqEM6cAansFaGFintx0dihAuRMpYtIKVIURuHCxPcQaff7J3jqbM09uwJMUMSMl
         ejcsR/WxKOeKfj5QuHpjUVmv0ZybEtql1qyumBHgAjT+j38gkdRmozXDCxQd9jVKai2k
         7hcjZHuLA3R4Wi0x6HFTSJPUTDUDWDsqNPbRX+q5o5HNtCyKxfd0tYgMzAYrbGC5K3tc
         c7uIiD0Hdg81tjwq/RmAdRru5G59WcYZazdoY4hyKq0BzrZgWuzG+SpUoG/qdqsCdoYm
         AUEog2uiqdTJjQ6Eq6E+C9lb+jLYFJ0cvlcEkWMx+BqeOPAh2YTeyHMKAveC644Q9Wsg
         G5Pw==
X-Gm-Message-State: AOAM532tPM5a9kKDrwoiVlokwzujUFqgr583lHQBAWBu1+Yp+jzFXfgW
        1aKQcOBYMXr/Qj0Ec7XRn/IJ4CY0zkniGOlsaSOMXQ==
X-Google-Smtp-Source: ABdhPJyiyOBo/ytN9+Sa8DZ5JER5HQbjKh9Bs1koT4EPqFitkfI0Px75l7GY0aqWq8wOEUG4TTgCK/2G+t0rgiErEj8=
X-Received: by 2002:a05:6512:22c1:: with SMTP id g1mr9956819lfu.404.1635272089712;
 Tue, 26 Oct 2021 11:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211026173822.502506-1-pasha.tatashin@soleen.com>
 <20211026173822.502506-4-pasha.tatashin@soleen.com> <7b131cb1-68d8-6746-f9c1-2b01d4838869@nvidia.com>
 <cbd20bc4-84ee-fd39-875b-75426bc61219@nvidia.com>
In-Reply-To: <cbd20bc4-84ee-fd39-875b-75426bc61219@nvidia.com>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Tue, 26 Oct 2021 14:14:13 -0400
Message-ID: <CA+CK2bCC_NXkabsR5kCWnEMAmwjxerWD1s4E7DMqcsf4dg3qoA@mail.gmail.com>
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

> > Hi Pavel,
>
> ohhh, s/Pavel/Pasha/ !
>
> Huge apologies for the name mixup, I had just seen another email...
> very sorry about that mistake.

Hi John,

Do not need to be sorry, Pavel == Pasha :) In Russian it is the same
name; I've been trying to reduce the confusion, by converting
everything to Pasha.

Pasha
