Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF5A3264E7
	for <linux-m68k@lists.linux-m68k.org>; Wed, 20 May 2026 22:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779315713; cv=none; b=qOZGxt4lxQzeTlQ14OZWoQAf3LMDBpOkS8RdZnqPZ6pNybutgUArUWKkt8EM9NKuI80vv27S0r1G96pAQSFJwswm85DUQcXXAbNeKw9WRGOgDSbQvPjiweVR1YVR3K0A4ZlHbozixxWIEJ91sidSyLyaDjGWbGOGRGQvG59+YSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779315713; c=relaxed/simple;
	bh=+lLqKB25GJ8Nk/N/QA5/TP30kbyhPVpqAySiqciCa4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LlmpYRq7hJS1Y+xMAAWtu72ce+3oDAelm3n9zEXcyrmIuoiSI4JNebWfEAMTiSuhdJIKMQV9ox6zhjc0ZLXaUqDOzHIXCN4oP8bKuRJZ2xVVOJ/atrkFVKJ5oKI3x0uxVGBh+I56cGfOGCLbuT3Bk7f99wK6oIISg5axLuo+rVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H8s/niaU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H8s/niaU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779315710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yTMC7Vi3qz2eQrpu1XXxCoOuK0TKvwPfinMf53HH2Ps=;
	b=H8s/niaUSlwgCXb8cNTwCx40TANcIJzhBG9I7bKwRkv+ryP1TSsoivQJEh2sfPC8xIpvRq
	xWvVcHstXqbsmrTk/27E2eEEKLVMrcpROzGUDZ4mVu5EA2kzlJBBI0oFnNBAS9jX+Cxz9I
	uCsOOwsq0Eh2DT8P6RR90u1fkVoFU24=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-8EhLixasO4OWetbjnXuYWQ-1; Wed, 20 May 2026 18:21:47 -0400
X-MC-Unique: 8EhLixasO4OWetbjnXuYWQ-1
X-Mimecast-MFC-AGG-ID: 8EhLixasO4OWetbjnXuYWQ_1779315706
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-488d3eec9bcso37126925e9.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 May 2026 15:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779315706; x=1779920506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTMC7Vi3qz2eQrpu1XXxCoOuK0TKvwPfinMf53HH2Ps=;
        b=HuXYXLnlrl8Vn8yOUWFFQvH3GagTmiqnlRGpRv8llmeYXCzl5tM26QdyM3XD+U8dGT
         +OkfeeJNq63DiN2diLqDPL3tA91CHVM+9IoPw8km7u770LZjuzpYNXY4Run6AEQitSUM
         aBgC8UtVBZQ9BpSwPrJlZ7DJGQ2+orgHAAHy0jCeGTSrsJWMV6jfle5bH869Dowgc5/p
         HCmAE7YMH5ySe8eiEpCe+mjCwGaE4rAaENpf3imRHxmb20SI4ePQ0gRdaZNDQEXubDuL
         2Y6tdFZBZP1KsdPTVnvVrUgNEvjBXyevZjJHiU8TF/bGrPQPkNnIWWMjHYCKLdm5sw6G
         957g==
X-Forwarded-Encrypted: i=1; AFNElJ+ydbwqIbtRGOuSY9eF6J/rWL3PaK7ugP0CcK+ehxE6h78kM0797r3y6LYnYgra6EPpJJy25+GIBwey@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzUZlNRmHbQDSj5l561ix0oVjv8ygaUToNHO8TJKsbixIwBZVIp
	jbioUNbL60HzaL+vKtUBMFcjhcuBTa5sxoqjkA3nyw3tny4gXLc5XASWeCI6j34hm41B7cUyxZk
	SD8Pmp4NNONfLdzykFaliBYqgjbtfkmDBYCwcvENyfYxpephv91pf9TnCMuqB5m5aqbuefg==
X-Gm-Gg: Acq92OFTegMjsD02hewywlMD7dbHjWrHcbEg/z7wCnv13/vsNbOyPCPX59NB8BMtKW+
	T0tuLz0Aq8lUq/hvP+ru8J8RrW40ysLSLfveWWGHexIRpzJZLaX4v6NHXrGCfOm2BiX86Ld8MWs
	kGsJV6CN2Molb98Nehiviu+HA1ZgWb91AnXJnS5FN6AeRP7Vz448/bRoR2NR2dypJLIc+X1KpAf
	S+6pKLhJGOQc5r0+BXhTMLVirI0XKsiBkw3pRueCiJ8ufj7ygjp4o/DJKZPZvneotKtCI0mhMdl
	EZEzjGLrXhlKKj88ymMm1dtz4tWGBvZDmiUi72oVRJT9qu1VRFddi4GHiU5c5h2CwIO88bhotN8
	zQowzQj5xErYnri64TbzRdy2e6nvBG2ZY1Q+D/78QuAefE6htpiHcKQ==
X-Received: by 2002:a05:600c:492f:b0:48f:dfe3:dae3 with SMTP id 5b1f17b1804b1-490360af200mr1566955e9.17.1779315706112;
        Wed, 20 May 2026 15:21:46 -0700 (PDT)
X-Received: by 2002:a05:600c:492f:b0:48f:dfe3:dae3 with SMTP id 5b1f17b1804b1-490360af200mr1566725e9.17.1779315705516;
        Wed, 20 May 2026 15:21:45 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-45.inter.net.il. [80.230.25.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d8e24bsm20846035e9.10.2026.05.20.15.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 15:21:44 -0700 (PDT)
Date: Wed, 20 May 2026 18:21:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Harry Yoo <harry.yoo@oracle.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
	virtualization@lists.linux.dev, linux-mm@kvack.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-alpha@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org
Subject: [PATCH v8 14/37] mm: remove arch vma_alloc_zeroed_movable_folio
 overrides
Message-ID: <9c2ac9d2fc159822b9fd6cb1304bf222324d70a3.1779315441.git.mst@redhat.com>
References: <cover.1779315441.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1779315441.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w8rPF1d6o7--isTarpPtyZYcoWv4rX5DGF8U76MuOz8_1779315706
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Now that the generic vma_alloc_zeroed_movable_folio() uses
__GFP_ZERO, the arch-specific macros on alpha, m68k, s390, and
x86 that did the same thing are redundant.  Remove them.

arm64 is not affected: it has a real function override that
handles MTE tag zeroing, not just __GFP_ZERO.

Suggested-by: David Hildenbrand <david@kernel.org>
Acked-by: Magnus Lindholm <linmag7@gmail.com>
Acked-by: Greg Ungerer <gerg@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Assisted-by: Claude:claude-opus-4-6
Reviewed-by: Gregory Price <gourry@gourry.net>
---
 arch/alpha/include/asm/page.h   | 3 ---
 arch/m68k/include/asm/page_no.h | 3 ---
 arch/s390/include/asm/page.h    | 3 ---
 arch/x86/include/asm/page.h     | 3 ---
 include/linux/highmem.h         | 8 +++++---
 5 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.h
index 59d01f9b77f6..4327029cd660 100644
--- a/arch/alpha/include/asm/page.h
+++ b/arch/alpha/include/asm/page.h
@@ -12,9 +12,6 @@
 
 extern void clear_page(void *page);
 
-#define vma_alloc_zeroed_movable_folio(vma, vaddr) \
-	vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma, vaddr)
-
 extern void copy_page(void * _to, void * _from);
 #define copy_user_page(to, from, vaddr, pg)	copy_page(to, from)
 
diff --git a/arch/m68k/include/asm/page_no.h b/arch/m68k/include/asm/page_no.h
index d2532bc407ef..f511b763a235 100644
--- a/arch/m68k/include/asm/page_no.h
+++ b/arch/m68k/include/asm/page_no.h
@@ -12,9 +12,6 @@ extern unsigned long memory_end;
 
 #define copy_user_page(to, from, vaddr, pg)	copy_page(to, from)
 
-#define vma_alloc_zeroed_movable_folio(vma, vaddr) \
-	vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma, vaddr)
-
 #define __pa(vaddr)		((unsigned long)(vaddr))
 #define __va(paddr)		((void *)((unsigned long)(paddr)))
 
diff --git a/arch/s390/include/asm/page.h b/arch/s390/include/asm/page.h
index 56da819a79e6..e995d2a413f9 100644
--- a/arch/s390/include/asm/page.h
+++ b/arch/s390/include/asm/page.h
@@ -67,9 +67,6 @@ static inline void copy_page(void *to, void *from)
 
 #define copy_user_page(to, from, vaddr, pg)	copy_page(to, from)
 
-#define vma_alloc_zeroed_movable_folio(vma, vaddr) \
-	vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma, vaddr)
-
 #ifdef CONFIG_STRICT_MM_TYPECHECKS
 #define STRICT_MM_TYPECHECKS
 #endif
diff --git a/arch/x86/include/asm/page.h b/arch/x86/include/asm/page.h
index 416dc88e35c1..92fa975b46f3 100644
--- a/arch/x86/include/asm/page.h
+++ b/arch/x86/include/asm/page.h
@@ -28,9 +28,6 @@ static inline void copy_user_page(void *to, void *from, unsigned long vaddr,
 	copy_page(to, from);
 }
 
-#define vma_alloc_zeroed_movable_folio(vma, vaddr) \
-	vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma, vaddr)
-
 #ifndef __pa
 #define __pa(x)		__phys_addr((unsigned long)(x))
 #endif
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index ffa683f64f1d..7b5955bf9336 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -303,7 +303,6 @@ static inline void clear_user_highpages(struct page *page, unsigned long vaddr,
 #endif
 }
 
-#ifndef vma_alloc_zeroed_movable_folio
 /**
  * vma_alloc_zeroed_movable_folio - Allocate a zeroed page for a VMA.
  * @vma: The VMA the page is to be allocated for.
@@ -317,12 +316,15 @@ static inline void clear_user_highpages(struct page *page, unsigned long vaddr,
  * we are out of memory.
  */
 static inline
-struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
+struct folio *vma_alloc_zeroed_movable_folio_noprof(struct vm_area_struct *vma,
 				   unsigned long vaddr)
 {
-	return vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO,
+	return vma_alloc_folio_noprof(GFP_HIGHUSER_MOVABLE | __GFP_ZERO,
 			      0, vma, vaddr);
 }
+#ifndef vma_alloc_zeroed_movable_folio
+#define vma_alloc_zeroed_movable_folio(...) \
+	alloc_hooks(vma_alloc_zeroed_movable_folio_noprof(__VA_ARGS__))
 #endif
 
 static inline void clear_highpage(struct page *page)
-- 
MST

