Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA85639A052
	for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Apr 2026 10:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777287500; cv=none; b=VIlxzKH2sQs6I0zbJ0p+AoeYO4O02TMr8jZq3zxfA6lSNOX5kObLrsNTZ8r64JM9AOD3vCE9pYJ/Zl96kWbfSAfDEEh80YjKd201Ne/ZoYC7DD15PuIbSgbRR9npuV7PV2gFbEnBzsJ/ZQxj6popv3E93r7CnyfV1gnWzhYEhFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777287500; c=relaxed/simple;
	bh=dyPAr09lWlR/RQ4fkkDMb+zOF+584aQzExR/1zdUeaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=QGuxbPwGCqu3v1yMDPMogmN1BFEiNnjKsdfapBI3bqyfgpQaEau2kQmTWdHtT8IGKnUbplVJrCLiMfcMccTfNDW6P5HvLQbbFNYc0X9UnUr3V0kcuBDUiTINM4QuT8Jq6rzr+NxOf9BckTqIi0IUAvrNfvudrjIZ7Q5TTBlnAxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=epul+09A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="epul+09A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777287497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wclsbCz45VsM77RlQTKKMaoJPnWAhWJRZZhkjEMod8Q=;
	b=epul+09A3xs1eIlbUsDc6gqzbnCq411+TPKrycRcd4l70QRbkTz7lFuZYz5H7VQ3IN688u
	UwO4weV5Pl5nNTwNPTSJ+YSLD0zBEJW3kSv8AUiBwnzhfZN10I2/aBHUFt8laru+QyhxXh
	m2rtc7XEWe8VfV4KHwqNyFzamxejj70=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-0Boxj8COMueXVLucSytcRA-1; Mon, 27 Apr 2026 06:58:16 -0400
X-MC-Unique: 0Boxj8COMueXVLucSytcRA-1
X-Mimecast-MFC-AGG-ID: 0Boxj8COMueXVLucSytcRA_1777287496
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e136aff17so184330241cf.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Apr 2026 03:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777287496; x=1777892296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wclsbCz45VsM77RlQTKKMaoJPnWAhWJRZZhkjEMod8Q=;
        b=Y1aBtuNDew9BgWR8zOXCgKr6qksjKMaVIEJE2vPYbPYEFMEnatF8xQlBJDVClya0Lb
         3aMVuxUTFLitVzhWORw0t4X0GI0apjIabIiWeF5m4Gi2aBXkftygrTb/cK56WSXv1pLo
         ypXH4B9KChzdlakzPLPfQNR0K9oRnXW0SPX0e0IMcQeAPXmiolHRKKpDqoavMr1tMLAw
         Q+w4QisDlLoSfkwH8gV2BWEhb4fDxosP9xclnU3etn9NKDifKD19HTAZWbQYcHWkKHlK
         R+8fDFMFwCDPEz/6Tm2Ir+34Lz3we9VoXQf5Llw9yqnQAh92R5gtVNcHyqAZU2u7hVBu
         IoTg==
X-Forwarded-Encrypted: i=1; AFNElJ+pbgpdgMX4+86UjKBQ1Cg1qoutGRkznLDQXt1w5KRT2uRxmT6lmaSUF+o3R+rd0YZYDantdVxEx0Q9@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Ywr6eN0wqPRjUsDzJFx4ZxKaTM+PVUa7DYuOYxpeqZBRXU4vpHB
	GND0huP77reNPr3ss0lWlp71jlg63JkCipMNWYVc6P151XAmBw83T8iLytqqRo2kzvjmmCT4Cbb
	nZ8SNE0Krqw1e5llixbTULKqj0bTZGqWP17JqdKfwOK0pT0jZzNXAxqIebqkeAqpM1TYLQQ==
X-Gm-Gg: AeBDiet4EgrNaWMqA5cDbHGHgQsZq7n6UsipfhbSN0Mey7g2IRPlTF0fL4aoZax/7gc
	01taZLGW+fF6CZ7uZ9nS2ubGejDyvJ3dC0zck4xOutdXbw6BbZL+vTn/IyoF0eyVskD9mvQ25LM
	lG4Cd7vh+xNp3KEiooZRxbfRE68ELG1wG1DAYS3PyCwvBJ5PkbfEPzdsAMbmS6MIdor9a18P5N9
	fZKBpmLO3Xf7SUeSQ9xMK2W9JRqZmd6yBVoaTlGe9uLmL6y0I9FhboylZijV/aHxlaRGM+wYkz9
	m7v/bCN6+0LSuV1k2d+Syzc4c+DhzB80wnYJ+PZMwayU+90+8+jpsCBLBvYf23I8uPO4S+KvPdu
	rEUln9xDJTJvcoBYHEN1OCbOQuUMryj+3CoVZNjysXrK9auK/k2/d1VbE/NRyvHWHXIcwR7kFS5
	15EdL5G61CDvsfH0kpZncWNzigZXQ50KfkXGM=
X-Received: by 2002:ac8:7d56:0:b0:50e:ca38:e219 with SMTP id d75a77b69052e-50eca390557mr474867711cf.45.1777287495898;
        Mon, 27 Apr 2026 03:58:15 -0700 (PDT)
X-Received: by 2002:ac8:7d56:0:b0:50e:ca38:e219 with SMTP id d75a77b69052e-50eca390557mr474867401cf.45.1777287495453;
        Mon, 27 Apr 2026 03:58:15 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.85.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e39495192sm263471871cf.27.2026.04.27.03.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:58:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-m68k@lists.linux-m68k.org,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] mm_types: remove references to s390 gmap
Date: Mon, 27 Apr 2026 12:58:10 +0200
Message-ID: <20260427105810.23761-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cko70RiaYzOq0ZvK8ak1wuqziP3kscaqQz3rPGF7yXg_1777287496
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

s390 does not anymore use special struct page for its shadow page tables.
The honor of giving a special meaning to pt_index is now m68k's, so
rename the fields and adjust them for the desired type.

Cc: linux-mm@kvack.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: David Hildenbrand (Arm) <david@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
	Compile-tested only.

 arch/m68k/mm/motorola.c  |  2 +-
 include/linux/mm_types.h | 11 +++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index b30aa69a73a6..67e8a2cf4c41 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -105,7 +105,7 @@ static struct list_head ptable_list[3] = {
 
 #define PD_PTABLE(ptdesc) ((ptable_desc *)&(virt_to_ptdesc((void *)(ptdesc))->pt_list))
 #define PD_PTDESC(ptable) (list_entry(ptable, struct ptdesc, pt_list))
-#define PD_MARKBITS(dp) (*(unsigned int *)&PD_PTDESC(dp)->pt_index)
+#define PD_MARKBITS(dp)   (PD_PTDESC(dp)->pt_markbits)
 
 static const int ptable_shift[3] = {
 	7+2, /* PGD */
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index a308e2c23b82..9e4dbcddaf33 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -550,13 +550,12 @@ FOLIO_MATCH(compound_info, _head_3);
  * struct ptdesc -    Memory descriptor for page tables.
  * @pt_flags: enum pt_flags plus zone/node/section.
  * @pt_rcu_head:      For freeing page table pages.
- * @pt_list:          List of used page tables. Used for s390 gmap shadow pages
- *                    (which are not linked into the user page tables) and x86
- *                    pgds.
+ * @pt_list:          List of used page tables. Used by m68k pointer tables
+ *                    and x86 pgds.
  * @_pt_pad_1:        Padding that aliases with page's compound head.
  * @pmd_huge_pte:     Protected by ptdesc->ptl, used for THPs.
  * @__page_mapping:   Aliases with page->mapping. Unused for page tables.
- * @pt_index:         Used for s390 gmap.
+ * @pt_markbits:      Used for m68k pointer tables.
  * @pt_mm:            Used for x86 pgds.
  * @pt_frag_refcount: For fragmented page table tracking. Powerpc only.
  * @pt_share_count:   Used for HugeTLB PMD page table share count.
@@ -583,7 +582,7 @@ struct ptdesc {
 	unsigned long __page_mapping;
 
 	union {
-		pgoff_t pt_index;
+		unsigned int pt_markbits;
 		struct mm_struct *pt_mm;
 		atomic_t pt_frag_refcount;
 #ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
@@ -612,7 +611,7 @@ TABLE_MATCH(flags, pt_flags);
 TABLE_MATCH(compound_info, pt_list);
 TABLE_MATCH(compound_info, _pt_pad_1);
 TABLE_MATCH(mapping, __page_mapping);
-TABLE_MATCH(__folio_index, pt_index);
+TABLE_MATCH(__folio_index, pt_markbits);
 TABLE_MATCH(rcu_head, pt_rcu_head);
 TABLE_MATCH(page_type, __page_type);
 TABLE_MATCH(_refcount, __page_refcount);
-- 
2.53.0

