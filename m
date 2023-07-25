Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B43C04A94
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Jul 2023 04:21:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbjGYEVU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Jul 2023 00:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjGYEVM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Jul 2023 00:21:12 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694C8E69
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 21:21:07 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d0e55215aebso2221425276.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 21:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258866; x=1690863666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TyJK1FcnJgXFfZtNrnEiwbnRrWFFZ4hxtDemQIw/+70=;
        b=IWbM/8TKnsrsFnwfAtrtbT7DO2Dq3vbt1JDGjncQR1/QHrfo4QUSkIiEQN1x/WCeen
         Wq+1xfZOSXiXa3ftlSpFueFEFpvRBK3/RSrU5gjulTAyP6CHn+1+IFvHFglXW6v8keEi
         8OQyuFtLfuzytADBe5cFOUdQJ/Hdq1bfJlON7Nb+Mx5/ezSX5vpuq992erh0MteP8eY0
         ca2RegvmV6aTmEkiWQSzVkeiWkjDFWU6BxECXoDX15tgD4oeetn4XjwJQHkKr/UZi4jn
         M2rzWVhqQ0uUKv1+kbt9dezvn9EL8NwkaBEBxeHbR53ElScFeaGw8CT+ZDStPX5ya8Y8
         SH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258866; x=1690863666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TyJK1FcnJgXFfZtNrnEiwbnRrWFFZ4hxtDemQIw/+70=;
        b=kswqHCU0MvoBh5rU7VpdkFDgyGiS+j1SFeMGYpBwZga9jiwBrE+m3NDMhg9FW1p0dx
         Pu1YppIjdfNbVwDjSsAnu/8/9QKCswUFhK9ixJnbifYSXmCQeQGFT9Shw1pSQV3BJCJG
         MDaVH759UmQCeYEsCD6cb+977/YIXzxtaBDdFqoMUPp+qeY7hS/I+p07DTOQOzLGtA5m
         uGrgvW+I2F947x2e1EHvDw8ZjOIhJCy6OYP69ytDStV4HOSIDv2n+imSKabR+IUzntQe
         dfi97fMDIw4tJDLZ1k/cg0nKj6BGs/qFUAUzm3sGb0vvbFGwuy6ntarigASfqoRANtGu
         8FTA==
X-Gm-Message-State: ABy/qLYwf2OiihPS5d4kl0Fe9u22DWd/JvGst7CZUeUYJWbNym/oaTUn
        LBYV/XmiIRMLAVSrC7daMuY=
X-Google-Smtp-Source: APBJJlGpggWKl9mhx1f6cNzYJrVg2oqym/Xg0n0t+vhY+yg/UIrQUebANCL8UUu/vWaCrzFFriLNMw==
X-Received: by 2002:a25:844f:0:b0:cf0:b977:2794 with SMTP id r15-20020a25844f000000b00cf0b9772794mr10487441ybm.30.1690258866444;
        Mon, 24 Jul 2023 21:21:06 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:21:05 -0700 (PDT)
From:   "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>
Cc:     linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, xen-devel@lists.xenproject.org,
        kvm@vger.kernel.org, Hugh Dickins <hughd@google.com>,
        "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Jonas Bonn <jonas@southpole.se>,
        David Hildenbrand <david@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "David S. Miller" <davem@davemloft.net>,
        Richard Weinberger <richard@nod.at>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH mm-unstable v7 00/31] Split ptdesc from struct page
Date:   Mon, 24 Jul 2023 21:20:20 -0700
Message-Id: <20230725042051.36691-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The MM subsystem is trying to shrink struct page. This patchset
introduces a memory descriptor for page table tracking - struct ptdesc.

This patchset introduces ptdesc, splits ptdesc from struct page, and
converts many callers of page table constructor/destructors to use ptdescs.

Ptdesc is a foundation to further standardize page tables, and eventually
allow for dynamic allocation of page tables independent of struct page.
However, the use of pages for page table tracking is quite deeply
ingrained and varied across archictectures, so there is still a lot of
work to be done before that can happen.

This is rebased on mm-unstable.

v7:
  Drop s390 gmap ptdesc conversions - gmap is unecessary complication
    that can be dealt with later
  Be more thorough with ptdesc struct sanity checks and comments
  Rebase onto mm-unstable

Vishal Moola (Oracle) (31):
  mm: Add PAGE_TYPE_OP folio functions
  pgtable: Create struct ptdesc
  mm: add utility functions for ptdesc
  mm: Convert pmd_pgtable_page() callers to use pmd_ptdesc()
  mm: Convert ptlock_alloc() to use ptdescs
  mm: Convert ptlock_ptr() to use ptdescs
  mm: Convert pmd_ptlock_init() to use ptdescs
  mm: Convert ptlock_init() to use ptdescs
  mm: Convert pmd_ptlock_free() to use ptdescs
  mm: Convert ptlock_free() to use ptdescs
  mm: Create ptdesc equivalents for pgtable_{pte,pmd}_page_{ctor,dtor}
  powerpc: Convert various functions to use ptdescs
  x86: Convert various functions to use ptdescs
  s390: Convert various pgalloc functions to use ptdescs
  mm: Remove page table members from struct page
  pgalloc: Convert various functions to use ptdescs
  arm: Convert various functions to use ptdescs
  arm64: Convert various functions to use ptdescs
  csky: Convert __pte_free_tlb() to use ptdescs
  hexagon: Convert __pte_free_tlb() to use ptdescs
  loongarch: Convert various functions to use ptdescs
  m68k: Convert various functions to use ptdescs
  mips: Convert various functions to use ptdescs
  nios2: Convert __pte_free_tlb() to use ptdescs
  openrisc: Convert __pte_free_tlb() to use ptdescs
  riscv: Convert alloc_{pmd, pte}_late() to use ptdescs
  sh: Convert pte_free_tlb() to use ptdescs
  sparc64: Convert various functions to use ptdescs
  sparc: Convert pgtable_pte_page_{ctor, dtor}() to ptdesc equivalents
  um: Convert {pmd, pte}_free_tlb() to use ptdescs
  mm: Remove pgtable_{pmd, pte}_page_{ctor, dtor}() wrappers

 Documentation/mm/split_page_table_lock.rst    |  12 +-
 .../zh_CN/mm/split_page_table_lock.rst        |  14 +-
 arch/arm/include/asm/tlb.h                    |  12 +-
 arch/arm/mm/mmu.c                             |   7 +-
 arch/arm64/include/asm/tlb.h                  |  14 +-
 arch/arm64/mm/mmu.c                           |   7 +-
 arch/csky/include/asm/pgalloc.h               |   4 +-
 arch/hexagon/include/asm/pgalloc.h            |   8 +-
 arch/loongarch/include/asm/pgalloc.h          |  27 ++--
 arch/loongarch/mm/pgtable.c                   |   7 +-
 arch/m68k/include/asm/mcf_pgalloc.h           |  47 +++---
 arch/m68k/include/asm/sun3_pgalloc.h          |   8 +-
 arch/m68k/mm/motorola.c                       |   4 +-
 arch/mips/include/asm/pgalloc.h               |  32 ++--
 arch/mips/mm/pgtable.c                        |   8 +-
 arch/nios2/include/asm/pgalloc.h              |   8 +-
 arch/openrisc/include/asm/pgalloc.h           |   8 +-
 arch/powerpc/mm/book3s64/mmu_context.c        |  10 +-
 arch/powerpc/mm/book3s64/pgtable.c            |  32 ++--
 arch/powerpc/mm/pgtable-frag.c                |  56 +++----
 arch/riscv/include/asm/pgalloc.h              |   8 +-
 arch/riscv/mm/init.c                          |  16 +-
 arch/s390/include/asm/pgalloc.h               |   4 +-
 arch/s390/include/asm/tlb.h                   |   4 +-
 arch/s390/mm/pgalloc.c                        | 128 +++++++--------
 arch/sh/include/asm/pgalloc.h                 |   9 +-
 arch/sparc/mm/init_64.c                       |  17 +-
 arch/sparc/mm/srmmu.c                         |   5 +-
 arch/um/include/asm/pgalloc.h                 |  18 +--
 arch/x86/mm/pgtable.c                         |  47 +++---
 arch/x86/xen/mmu_pv.c                         |   2 +-
 include/asm-generic/pgalloc.h                 |  88 +++++-----
 include/asm-generic/tlb.h                     |  11 ++
 include/linux/mm.h                            | 151 +++++++++++++-----
 include/linux/mm_types.h                      |  18 ---
 include/linux/page-flags.h                    |  30 +++-
 include/linux/pgtable.h                       |  80 ++++++++++
 mm/memory.c                                   |   8 +-
 38 files changed, 585 insertions(+), 384 deletions(-)

-- 
2.40.1

