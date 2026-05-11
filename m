Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FF13C8737
	for <linux-m68k@lists.linux-m68k.org>; Mon, 11 May 2026 08:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489623; cv=none; b=POtpJi/wWb6RwOV0vk/Dx3Ec6e7cp7Qmpy2/AOnEYtQzwWxgVcgelsA3mNnaxrvI01pVwpLYhfivzh8u4YUg4Pa/WVwx6ktb5Q0POKQKLdEzhocRca+935PGe85PFSgqlleCtIylpa56h1eHCSbdzHx3WheYX7gcMh2QB3CRYwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489623; c=relaxed/simple;
	bh=xVZpENOTPSkcCw9H72WToBvwV1ZsJAWZkigdtcUbLLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=u/4CzZNJLzIBboYHHLrX4WswKTwyWNmwXFdVSLoDIIRfGOrdJb4ydzl44xKWcGJysmi08ctU9YoYxrL/V56xBBnX2KmcFQuP3+mudxnIqPqewup3DYovJDg6O/CGquei924dqGTqrmUuwISeczXc6ckMm9Dan0I5m3WlaJTOUeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A1WLy1Gm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A1WLy1Gm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778489621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+4kzhpMcne9QL/iUfytpcOnuwyhDfw3DKjMmXnNjefM=;
	b=A1WLy1Gm4uOGSnlQQfkF4sK0i3leHS/GqRM9UVKBjQPHb9SDfCK1GuRePrzn82w/D1qSeH
	pQqaW8i3+EZX0JNIPi/qXN4XLP+/tmkX5dDqenxW2ODhw1E5SINHBA8KmG04xEkr35AOFi
	Lz/X6maqphm0LegV2CSJGPbIHRQyk7c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-MtFvxyo9MqS3KSaDzLEhGw-1; Mon, 11 May 2026 04:53:37 -0400
X-MC-Unique: MtFvxyo9MqS3KSaDzLEhGw-1
X-Mimecast-MFC-AGG-ID: MtFvxyo9MqS3KSaDzLEhGw_1778489616
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-488c2aa6becso33953115e9.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 May 2026 01:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489616; x=1779094416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4kzhpMcne9QL/iUfytpcOnuwyhDfw3DKjMmXnNjefM=;
        b=UrdhkHj5UYQV5bH94iljJL5GdbPlar4PhtCqov/dokLlZig/qMYFIftXaPpar1fqpq
         HR5FSfiPLect6hruL32cS0BZg4LOU/YaBjF9TtG5gsvepvN3QvbuFeNjk+eRVfAhmiUD
         5ByoNg4uz2trMski5+mfIzhVdQJ5HfPuTV0CNJfD/daMPnlyJi2QI3Cvn8ROw3YUaeU+
         PBZvKCID2yoeVL0e89vKQr9P9ZR09aWhE0OPFV6+PuPqcOv5qtKG8HpxskO8fQoIh6F8
         4IFtWbfvlaUZILdKlEfoYLLGl+LkP6AbwJ7ayPedU8OWah45HGoLJmO6Puq0hXkB6Kh6
         vCzg==
X-Forwarded-Encrypted: i=1; AFNElJ9V1vYVFJKKalQQJBxRAVP5cQQZY0wj4Mx8hSMPAjiKtJlNOp1I/n5bvybk4Sk/oK9Pzrq/qCgs+iA+@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzXn8iIXuaeOqwJLYWSpGWF0QK7k42C1xgjNb9NokwcpsD6ISgt
	Zo2en/ZRqpJDBfF9OlSW4U9pcxHaPwd04E1HagHsP7T+dQTDNBPSNnVGAfEhU0O7KMj8mQRNowA
	0/G4fzLs3xlZLcGryzrRW86r4ML2RHioS3ECZ4/UYVgLC7LPHwq9j6cw1uiPo/+QqDsbr+w==
X-Gm-Gg: Acq92OHdbQLkne8aquPgXQ5N0IuA+yLAzw625eDf+3DfmfBC311eOwQK0v+2yO0t4f1
	ZGfcM+0kqthmjmsFdFYcplMlrX6udmMFEaREMRH2KkvDejEb3sW/na6od4V+5Rpn9qI1a5+ukQC
	ekfUTO3lW3ONreaz0FE+3ubOCfzK5kxuNRNQvT3CF8CbMM3d6zohtcKxpD0Yr6KsurgnQYPMLrn
	edtknUgZhtjZB2S9q3CLwho8KTHMzpaAPNIea8I3fnowIt+KcgO/5UV08M3L5bQ0qqNRzGVxIM2
	ZhcGy8k/HNT3YDi4M9eKXvns9k2cI9yxdj5mCo6URpru4oiHXuAQgSEet1L9c6oFA5AsTn6eR+4
	kXBZDmABNdYHzShXS9Q1pC9jneyS8Jev/A4x3QRNP
X-Received: by 2002:a05:600c:3b96:b0:48a:66a8:9981 with SMTP id 5b1f17b1804b1-48e51f55272mr385229455e9.27.1778489616144;
        Mon, 11 May 2026 01:53:36 -0700 (PDT)
X-Received: by 2002:a05:600c:3b96:b0:48a:66a8:9981 with SMTP id 5b1f17b1804b1-48e51f55272mr385228675e9.27.1778489615481;
        Mon, 11 May 2026 01:53:35 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7041c4e8sm166061275e9.14.2026.05.11.01.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:53:34 -0700 (PDT)
Date: Mon, 11 May 2026 04:53:29 -0400
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
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
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
Subject: [PATCH v6 08/30] mm: remove arch vma_alloc_zeroed_movable_folio
 overrides
Message-ID: <24a1b25f4f1cf31fc5bc053e475958ed5e1bf8bd.1778488966.git.mst@redhat.com>
References: <cover.1778488966.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1778488966.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ERkvjuNr9fbBqqnpAo473LydJ6iyjGGuPZLQyaVK-2Y_1778489616
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

