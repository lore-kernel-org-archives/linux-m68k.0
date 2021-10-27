Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC82C433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 18:22:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 955D160F38
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 18:22:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243500AbhJ0SZO (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 27 Oct 2021 14:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243491AbhJ0SZO (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 27 Oct 2021 14:25:14 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B68C061745
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 11:22:47 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id h11so6237139ljk.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Oct 2021 11:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2PjuNeHqkEC+TnHGw+HkK8UIEzWJEETPPBQlrocuPTU=;
        b=lLMbuFSOE+jF05Bi6R4jcYzGGMqVatV0odlAiYllsUoS+qAXv+ZpDMJuO5RzvOZQdR
         D5tjHrdYUtdnoQJ2rdnv/Enk+JCyKcnZYsLwSvVUd2I146BN/2hQLFX930ofc0g8kChC
         LJLBtzwRRmFlnqrm6RLIGt7FmuYCoS3sn+evJa3IP7AyvkYRDCV58BO4FURlVuUuyFZD
         3WHotNhKoHU90flIseiCDMZliZTbAy9pi6BHt0mF+npdL26WjVvhqge51TReCgfRK65U
         YtNs40Mn+uDoVgm3W0QrcKs/y6Ne4Cg7ShmPQayK69U5W0XAoyiwEvLGrevriNMj3FH1
         pOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2PjuNeHqkEC+TnHGw+HkK8UIEzWJEETPPBQlrocuPTU=;
        b=lTpP49Y/sUFofmYbNZTAOSYKxdCyuS5qGwhiDE8LUNk44cKHVsQI4tjhHpYbbFO55A
         girs88tpvnisf6krCU2NDvFCJsaIFvjZrCxl9W9VUD754kuxka9rZn6x5S2DhGlaAbd/
         uPVMUVpCtfzyoi89tgV1hDo8PjzVDLNe3OeeSoxPk4RCD5h6Fu3FYtCBuY22grCP/lW8
         hFKsXnnnTiAu1haYl1/EhGhVGz2YZNu3miLMJTU5AkXxmshhjUslQYKa46X8cq+fk59H
         VpTzeYLfhXA+8Yskqy3j8c+tc3ar+BsDUbOuKGy9Ct4DV1YZE3iqq3ZRZGXF2Juyr67D
         inZg==
X-Gm-Message-State: AOAM532QdDWGAiBYFLv60dpMnYcqeFYOTPXoeTdGhE7ZRfUwqAZVnbFT
        Jom07zOc82KOkkHXzZ4kP4GNflk1Yjs+HwZRfaqH0g==
X-Google-Smtp-Source: ABdhPJzTT0dOmYBCYBy1pf627CzSQYcktFnt+YBoCzZGxCnrzYDdLm3N9GGUHg1utxfan0QOSwZl3MzUHr4ArxOXuMA=
X-Received: by 2002:a05:651c:c3:: with SMTP id 3mr4927747ljr.355.1635358966211;
 Wed, 27 Oct 2021 11:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211026173822.502506-1-pasha.tatashin@soleen.com>
 <20211026173822.502506-2-pasha.tatashin@soleen.com> <CAMZfGtVS2ZRAsd9HLODoLa1vVp0XCcBOTXjsmpoWwDcdGaADvQ@mail.gmail.com>
In-Reply-To: <CAMZfGtVS2ZRAsd9HLODoLa1vVp0XCcBOTXjsmpoWwDcdGaADvQ@mail.gmail.com>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Wed, 27 Oct 2021 14:22:08 -0400
Message-ID: <CA+CK2bA1mj3B8Y47r8KG7oYCNn63WsjUZeyAdOkThjixxqxGPQ@mail.gmail.com>
Subject: Re: [RFC 1/8] mm: add overflow and underflow checks for page->_refcount
To:     Muchun Song <songmuchun@bytedance.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
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
        Roman Gushchin <guro@fb.com>, weixugc@google.com,
        Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

> I found some atomic_add/dec are replaced with atomic_add/dec_return,

I am going to replace -return variants with -fetch variants, potentially -fetch

> those helpers with return value imply a full memory barrier around it, but
> others without return value do not. Do you have any numbers to show
> the impact? Maybe atomic_add/dec_return_relaxed can help this.

The generic variant uses  arch_cmpxchg() for all atomic variants
without any extra barriers. Therefore, on platforms that use generic
implementations there won't be performance differences except for an
extra branch that checks results when VM_BUG_ON is enabled.

On x86 the difference between the two is the following

atomic_add:
   lock add %eax,(%rsi)

atomic_fetch_add:
   lock xadd %eax,(%rsi)

atomic_fetch_add_relaxed:
   lock xadd %eax,(%rsi)

No differences between relaxed and non relaxed variants. However, we
used lock xadd instead of lock add. I am not sure if the performance
difference is going to be different.

Pasha
