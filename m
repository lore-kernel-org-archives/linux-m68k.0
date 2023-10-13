Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930B1CDB47E
	for <linux-m68k@archiver.kernel.org>; Fri, 13 Oct 2023 21:03:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbjJMVDX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 13 Oct 2023 17:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjJMVDW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 13 Oct 2023 17:03:22 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A5DBB
        for <linux-m68k@lists.linux-m68k.org>; Fri, 13 Oct 2023 14:03:21 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d84f18e908aso2723070276.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 13 Oct 2023 14:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697231000; x=1697835800; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtiOVCn2uSsz0FoSYRDQt6Ad/oEEDkzUyvmWznVzlSA=;
        b=kO2+l848yxeZMQUYgARUbffjdSaJkDS8tOk6peJKx7vjuHq0/MPT0Lpu0ldUBO68lP
         DzzQVeDwcZ2KBAY2KD+rih2kuZYXfC9wME5B5o8/hy5n1VcKdsnqKVw2ovXgZpCIBV69
         t0XTR5hR9+nwhbEWG4PvBouTfvaw8kZeAgLEcE8kURQmrTuH9t2Q1NuI4xq4lXr9xK4X
         6p1IPuqfWmLw+d+32M+e0wxEXfNycKWhMYFgV090NwaPMJYZI2EYIIEDErJOp30RDI0H
         49x6v8q55rIbPvME6YWhY1LJ9GcRm/J5Idg/suONCbh1L1FNnPzLb1k9qIFoJ5FIxxQm
         TRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697231000; x=1697835800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtiOVCn2uSsz0FoSYRDQt6Ad/oEEDkzUyvmWznVzlSA=;
        b=dlm/uxAOJ1TtQedW6jbgIBKTMBMCf1sbOKs1cNw93PChVJ45LZ2M6buZng03hgZHxF
         GH/yLinRzMWAErADEnO9+4oMpHS/q/uMj9Xh3JRWIZ/+YlcGCpugwFGjPeWOBarFUUEd
         gR13ZUnjp9EAJVRv9goSpaYFT00SMQXqpIe8NixF5H/37AigWHSSv/AHpB8qarCJKBd9
         Pf6xr49ILE3L05rk2wQSiDREsHXXqs6smlO3HHv470q17MTlJSMKs9QhvLwunimN+Ifk
         +hGsV0BzHtzbu32pBPYjp0NjFS0OxHun4YGHASa2Sq/Z6KLdDcOd5vEM7wE57pztUQH6
         CKDw==
X-Gm-Message-State: AOJu0YxXx+c9HvlrDFU6QqW9b5dOPO0n7llp2EUYU6ijBk/lihesK94K
        UxgIUteSGHTWpedHXXF43R3LRPrDc92d+S7rM3o=
X-Google-Smtp-Source: AGHT+IHWHj9ILTPWExZ8ekeA0/ryyRW0ZV6k5VhEVnOo+k5EpZsvEbKt/nom23K7vTTS2zHZvjjk2tEmm58T8MLLm1U=
X-Received: by 2002:a5b:64d:0:b0:d9b:3b3e:5a07 with SMTP id
 o13-20020a5b064d000000b00d9b3b3e5a07mr2004058ybq.5.1697230999223; Fri, 13 Oct
 2023 14:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230807230513.102486-1-vishal.moola@gmail.com>
 <20230807230513.102486-15-vishal.moola@gmail.com> <20231012072505.6160-A-hca@linux.ibm.com>
In-Reply-To: <20231012072505.6160-A-hca@linux.ibm.com>
From:   Vishal Moola <vishal.moola@gmail.com>
Date:   Fri, 13 Oct 2023 14:03:08 -0700
Message-ID: <CAOzc2px-SFSnmjcPriiB3cm1fNj3+YC8S0VSp4t1QvDR0f4E2A@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v9 14/31] s390: Convert various pgalloc
 functions to use ptdescs
To:     Heiko Carstens <hca@linux.ibm.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
        Hugh Dickins <hughd@google.com>,
        David Hildenbrand <david@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Oct 12, 2023 at 12:25=E2=80=AFAM Heiko Carstens <hca@linux.ibm.com>=
 wrote:
>
> On Mon, Aug 07, 2023 at 04:04:56PM -0700, Vishal Moola (Oracle) wrote:
> > As part of the conversions to replace pgtable constructor/destructors w=
ith
> > ptdesc equivalents, convert various page table functions to use ptdescs=
.
> >
> > Some of the functions use the *get*page*() helper functions. Convert
> > these to use pagetable_alloc() and ptdesc_address() instead to help
> > standardize page tables further.
> >
> > Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >  arch/s390/include/asm/pgalloc.h |   4 +-
> >  arch/s390/include/asm/tlb.h     |   4 +-
> >  arch/s390/mm/pgalloc.c          | 128 ++++++++++++++++----------------
> >  3 files changed, 69 insertions(+), 67 deletions(-)
> ...
> > diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
> > index d7374add7820..07fc660a24aa 100644
> > --- a/arch/s390/mm/pgalloc.c
> > +++ b/arch/s390/mm/pgalloc.c
> ...
> > @@ -488,16 +486,20 @@ static void base_pgt_free(unsigned long *table)
> >  static unsigned long *base_crst_alloc(unsigned long val)
> >  {
> >       unsigned long *table;
> > +     struct ptdesc *ptdesc;
> >
> > -     table =3D (unsigned long *)__get_free_pages(GFP_KERNEL, CRST_ALLO=
C_ORDER);
> > -     if (table)
> > -             crst_table_init(table, val);
> > +     ptdesc =3D pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, CRST_ALLO=
C_ORDER);
>
> I guess I must miss something, but what is the reason to mask out
> __GFP_HIGHMEM here? It is not part of GFP_KERNEL, nor does s390 support
> HIGHMEM.

You're not missing anything.

This was replacing __get_free_pages() which also doesn't support HIGHMEM,
so I had that in to ensure a non-HIGHMEM allocation in case a
passed-in gfp_flags
had it set. In hindsight since we're just passing in the GFP flags
directly here, we don't
actually need to mask out GFP_HIGHMEM.
