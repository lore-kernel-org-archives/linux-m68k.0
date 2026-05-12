Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E133C4555
	for <linux-m68k@lists.linux-m68k.org>; Tue, 12 May 2026 21:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778619977; cv=none; b=Qsh6FA2aHDUM2zR8WQaduFnSGnO9m5CZPczSqOGS3TsEuUaZLR5m4aLldoyRar47AEuQoWjMOuIx+E9gpx8wqtwFbXBIOSiiW9DK9c3pNXy0auQd92IAWUh5hn1wDwh4ukTGLBYeHwZoEHLLgzQ1ZIPFuVJS/bMTTCy/tw+nTS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778619977; c=relaxed/simple;
	bh=xVZpENOTPSkcCw9H72WToBvwV1ZsJAWZkigdtcUbLLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=g0w46DQ3hBeB7twXgrVjRSNjXm6gioPpRTnrcAFmKh9+SfOZs0RsfSrHYHifyCWerz5L74BGwV3bcRleoyB1Q9ga3wYZUvngvVcqRAClarQf9IF8KSngiuVdDHrlDmdqFLkvQr6Jx2+9HxRr07/cp2WlsdeJBGnS1XVhImhgDgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=izoxYKXl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="izoxYKXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778619974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+4kzhpMcne9QL/iUfytpcOnuwyhDfw3DKjMmXnNjefM=;
	b=izoxYKXlLv3ukMyoF2ZCqzDJ4Y6Jz9tu2NDqdEbxrj6xZQbs9JrY524rfmYKwZ1v/hGILO
	bSNUFX1j20Ex/RhKsKZSnaOup6LJO/S3/gk+xdZ0552Qe0EkmYq2Cgn1qYFxK09qqZibos
	J1HawoAmm3bioUu7sj1mwyXsiSzLFpM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-JjtiFZDpO82UyXqFHsftRw-1; Tue, 12 May 2026 17:06:13 -0400
X-MC-Unique: JjtiFZDpO82UyXqFHsftRw-1
X-Mimecast-MFC-AGG-ID: JjtiFZDpO82UyXqFHsftRw_1778619972
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-488c0120047so34768975e9.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 May 2026 14:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778619972; x=1779224772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4kzhpMcne9QL/iUfytpcOnuwyhDfw3DKjMmXnNjefM=;
        b=PFAtBUATKZSXsHSCheyd/XiiRODUbVrQ5d62YshSFWtgW5pYLnXActeIoQZQkOuQK4
         0gGny9YSOOnIdbssJ6bNsiR8gKcSDLXmzUFrL2Tz1O3X6jrAWVpR3JDCgxmHm9u4x7Ry
         p5mfGeftm2n2ck9Xi0CwQnQVYjWLqbpR1SxRsQh5aTThi95oWYkosJFXFvsUt5AkCiwI
         rEP5uROiGXdJbf7IZ+4pCDvXsQ1Nn3J3+M6nWTf+Rx+aAcxxTAM2o5+owRyNsCPP7/9V
         EhtVgpA0mHg9FaE/R0yMkT6wCQfavmQ3nyFFlp2MA9pzBGYE5Nc5xUHmKWTXm6bR5liC
         P7yQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4EpmsqhQAl5j52jcSHy9u7ty6BZ9WeguMw6ijIZ0L+W+H61YP4O7vu02YZaluL7un8D5USWvpk9OX@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz3j27L010W21GI3dRP3sfvYTVfC1pOak3I2BfoO03a25PJ16gH
	CRDPBoaph/wdhuTVmQuhYrkekzm22n6bQTl93AepukMo6rs4k1uWGFxuqbJ0LGmY+p45QpmoWDe
	IQybs33eSUr4k1jYCyU7XMdVGhQIip8IbvoQlwmHjVOP3/TlD4SluTEWmYWHwA6cBq70Jsw==
X-Gm-Gg: Acq92OF6wZvLWU8NXQk+Y3ge5kHboWYpBeT/9WO6c5sDHzxd005nlU1yoTG5TOE8riY
	+q8dNyu7qfljUDKhos4p4tthshMknR1cK4p9JUlGvDFTCjNjrBz36ZoYt8LuxNPONsk9jxSmJ4p
	ZRNFXYsdn4F4+TwY/6bsbEsBeZ+aH8i5n9EEnBLBA8hXLTBPKrNzw3cb0++ain4OrOX0agROSgh
	KBmynOzCL6iQevK7VxURNo1OYE31MxCKfy9hcvcRH+klqlwATxh/6aGHVrC/lyurtEG6JkSexes
	JDPHkFuosvl8rUV+yyc8mZQN8y9jxeCEFppdIb0nJbUFFK66tT2iV/DnWqUqu0WwvFm4KFyd/Vl
	s76NCWie92Emt9Zt1R3Y+76kbiXpZNph2DcwCABmO
X-Received: by 2002:a05:600c:3f1b:b0:48a:6fd4:d3d4 with SMTP id 5b1f17b1804b1-48fc9a50d32mr5863045e9.29.1778619971834;
        Tue, 12 May 2026 14:06:11 -0700 (PDT)
X-Received: by 2002:a05:600c:3f1b:b0:48a:6fd4:d3d4 with SMTP id 5b1f17b1804b1-48fc9a50d32mr5862425e9.29.1778619971141;
        Tue, 12 May 2026 14:06:11 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6c221sm36066581f8f.13.2026.05.12.14.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 14:06:10 -0700 (PDT)
Date: Tue, 12 May 2026 17:06:04 -0400
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
Subject: [PATCH v7 11/31] mm: remove arch vma_alloc_zeroed_movable_folio
 overrides
Message-ID: <7d637bcac4bb5705388136a75f0fdfe2881e5f20.1778616612.git.mst@redhat.com>
References: <cover.1778616612.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1778616612.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RINErZfloMOxBw6Qos1Izy4eJD2SwAZRr9ORBJ-rS3k_1778619972
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
---
 arch/alpha/include/asm/page.h   | 3 ---
 arch/m68k/include/asm/page_no.h | 3 ---
 arch/s390/include/asm/page.h    | 3 ---
 arch/x86/include/asm/page.h     | 3 ---
 4 files changed, 12 deletions(-)

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
-- 
MST

