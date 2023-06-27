Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A4DEB64DD
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Jun 2023 17:52:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbjF0RwS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 27 Jun 2023 13:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbjF0RwM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 27 Jun 2023 13:52:12 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA32E122
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Jun 2023 10:52:11 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6b708b97418so4267343a34.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Jun 2023 10:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687888331; x=1690480331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ya0gjT04wvrkPEwxsIo0SrjOZFrw43ACMJ5aI2sBKGs=;
        b=jU0XSQm/UgQNqhqQcjqaxOHJKL3Tu8GM/GwEobHZGDkP+x8DVdgSjRkU85h/Lj/+te
         oZwK4Q1yO37Pzbn1i7oZRsd+yfivOXZX9DLv/iX+OOzSZ/17s4ytR4cUrCKbaq8ScVjb
         y4NBy98BQyt8WGI73+o5s1aq7cUaSdPW95ULfQ6FlPkdUprfA5PQkMvKjJsZAGVBcKqi
         qlieckJVpQyRqbWlQMoi71Q4k95ldkAZz69rpAi1h8kLQ3wxt3idqYMSWF1Mqn3mJooy
         Rs2GGbK0m2G7LUgnIAcus/1X+0dgeX1Usy3dZ/2MF2ihQvsHs5fE8nG3/WrSESAbmo+3
         LPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687888331; x=1690480331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ya0gjT04wvrkPEwxsIo0SrjOZFrw43ACMJ5aI2sBKGs=;
        b=BtxVq4df1AUKpecpgLe3u2t8PiXbswaGs/28DXktnPfXRydC/lprDV9r8Re3RRRSkW
         vmbl2L48IIau1Jw+jkeGqdPWc0EZZ39h9Rl4jz3/pmM0VjllPDk9OhubDt/rnnX5AH0o
         mbDo1Q7LkmFMWyMbyPPRi2HOkItRhBzG80y4zlrk3K29Clvj0r6kObZ2VbDM+NN19VXW
         4nDETo4GymhHRmJff9F17IrY3tSh7zuNcuJjRNlSS4gsIUi+ZJqB7Nco1ghgy9SEAy0k
         keCoKC6KBSAQuuPWJ65QiVtXLu0mgjpV/8nNt6YkpW5+Vu1Eyq5+gy6imynGcB5ZplWg
         ZEIA==
X-Gm-Message-State: AC+VfDzVrYBFKKrFSrHQGSjdzczYXRFAWxAJOu8zk1lfTqBAvx6MkF8F
        tBk71iT2rr36XFeafCLONTB1ia9mdhqhVnnJYlU=
X-Google-Smtp-Source: ACHHUZ60PXVLGXFjCZbPL4+H89P+QaultgII2fPTXJpRhifF/y6voZRlslPkfFetToA56imkT1WhjHNqMU1RYiBUm6M=
X-Received: by 2002:a05:6359:d23:b0:133:a55:7e26 with SMTP id
 gp35-20020a0563590d2300b001330a557e26mr5444430rwb.7.1687888330839; Tue, 27
 Jun 2023 10:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230627031431.29653-1-vishal.moola@gmail.com>
 <20230627031431.29653-4-vishal.moola@gmail.com> <ZJsJT9dLtxaKlxVb@x1n>
In-Reply-To: <ZJsJT9dLtxaKlxVb@x1n>
From:   Vishal Moola <vishal.moola@gmail.com>
Date:   Tue, 27 Jun 2023 10:51:59 -0700
Message-ID: <CAOzc2pw2U2XvMcaEdy18UYe=5=PeCBn_qLR_3ns8_nWvgSSDQw@mail.gmail.com>
Subject: Re: [PATCH v6 03/33] pgtable: Create struct ptdesc
To:     Peter Xu <peterx@redhat.com>
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
        Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jun 27, 2023 at 9:07=E2=80=AFAM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Jun 26, 2023 at 08:14:01PM -0700, Vishal Moola (Oracle) wrote:
> > Currently, page table information is stored within struct page. As part
> > of simplifying struct page, create struct ptdesc for page table
> > information.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> >  include/linux/pgtable.h | 68 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index 5063b482e34f..d46cb709ce08 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -987,6 +987,74 @@ static inline void ptep_modify_prot_commit(struct =
vm_area_struct *vma,
> >  #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
> >  #endif /* CONFIG_MMU */
> >
> > +
> > +/**
> > + * struct ptdesc -    Memory descriptor for page tables.
> > + * @__page_flags:     Same as page flags. Unused for page tables.
> > + * @pt_rcu_head:      For freeing page table pages.
> > + * @pt_list:          List of used page tables. Used for s390 and x86.
> > + * @_pt_pad_1:        Padding that aliases with page's compound head.
> > + * @pmd_huge_pte:     Protected by ptdesc->ptl, used for THPs.
> > + * @_pt_s390_gaddr:   Aliases with page's mapping. Used for s390 gmap =
only.
>
> Should some arch-specific bits (and a few others) always under some
> #ifdefs, so it shouldn't appear on other archs?

Right now this struct completely overlays struct page, so the padding as
well as any arch-specific fields have to stay. Whenever we get ptdescs
independent of struct page we can cleanup any unnecessary fields, as
well as omit unnecessary fields from unrelated architectures.
