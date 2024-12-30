Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073CE1A23A4
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 09:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735549735; cv=none; b=i8zqdzQ4k0k6iZGyadXe3GWlTHZOMOZQ2ynEZQqSgOzYmr33QzS9K2OUtHvGKnGojSM7sNL7BnFzHznH3jisgaoeZ3zw9pQyVMyFw4SUsArDQpxAkQRKusXI1knrxCl6gVhF9h3daVm4kaCB6j31zOnNIwlUgZ8zW7e+BV9urWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735549735; c=relaxed/simple;
	bh=eSQ1cqjI0k4SQFzb/dlIm3hCd3v5CZjZJpupq9IDdtI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BirTv9mo3jEo/8EaQ7Wkvj7bpb90Pq5VsvoKov+9SVZ03t75YpvJflkJ4CPoawt/lJJgnpXeGxGAuiEmVFhhOKwpCgnInSqRnwr0WqRM0IbNfXpbwmskkG6hoK5bWjd2P0F1k2qk6joEyt1mcGg7Gk0OPlP7EuiQgNgTkFWaiRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jSaIbQNk; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jSaIbQNk"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21631789fcdso87865065ad.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 01:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549732; x=1736154532; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyzxI6H4ZAISLyWZ1lhQ49SW3wSD1SDR6GIh5AHA3wQ=;
        b=jSaIbQNkSRcdUCH+xYQsPlErDNayjkYutisLIijCiT6n6g39Nh8oU6Fp0/J6L/091Q
         WH7XcclMuyN12S8uoRDXMkkWbMGAdmkBlTudLROJxrKcyIrJae/+Y7Qea7JlZP0nJT8P
         cjHEw1kFG4ExYZlzQxRCfjEN9uY8oiz/AtRWKM3jzNNZTdRRqi32jpWhfcLHq//UFaNf
         0jnF2vp82EFLhvH109v7nMhmdsvcvJuIx9vq2oVAj9QVZewgUhbM5brm1nxheDKPVlAO
         O+ITu0JV7pFqmZhFZIWw1MI3jeAENHk/EFVrvRuDIs+2mPZjFyFjfi/wizcY3KXu3ovU
         SHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549732; x=1736154532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyzxI6H4ZAISLyWZ1lhQ49SW3wSD1SDR6GIh5AHA3wQ=;
        b=QwhpYBJQbDOXLXbJgzcRvaA+0ic2xWGoSqc5r66IOHdvCd9W++HbOFCpcSZXbEvYWx
         Ji1KSJ7wniU9z/CCg4dAN/Cgx9nNevXC8aG3Leb+Ep5I7K/Yjrcd3Sv+AAUD11ew+xcb
         GAEAXPUEh8UkArh/tpS3puht+NK0vfrb1d2tZJPT3uXi6anrmMlXFXFf8kuom7xNX0PI
         hqHXSWZ5ggn8cPL6MsYF/r4jEFR3w2WAYNzJCd6y65cV1j02K20dVgZV4dFNhuHppZMy
         Pekwuqd5yF02pxsgOplMktkkFD1WnLT+QexsBoWCc3kguwnGHvm4ImTTPOjQcTsFWGeM
         LyCA==
X-Forwarded-Encrypted: i=1; AJvYcCXw/HBBq5R6/bZ5YJaJJ3zOTqY5k4EouJHUj2KFxJlNVPhkXUasOV5tBUQyFwf4sTE00KklRIWNMBZI@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz8Jkq8o/xDZaLUhcvjrmQ3Ec0IHOzh10ZLtZMsdoCb3Y3kqI3r
	bUUuYOUxMZWp3Nlu9VlxIsEfejH3jQaFY1CNo23SpFqIP/HxgbbtP0tsXmuYLng=
X-Gm-Gg: ASbGnctWedCw37kHx73rmWiE4oy53nkzSzkQU+aCDikWdDXLh2fq7Un0oICt7CkblGf
	tDuHZ0XemS1q1rpdyW5NB7XfMGUFrz/pBBAeSL6SGF3aF2O0VP/6NfBbGyTS/58nutiN0gFBIlL
	znneX9X6KF9+BKyO2U7o7K84238qgcOPi9aPFixtFsJ+AQmyJBfVRNm721dWOdLigOcVCpty1Iw
	S9wnO4FT5L/BFMI3TuJrc3e4D6WL51Eg/K3QuPumxh7nC0WFlLcP4paiG1JqrwqnsNcPKirl/Rf
	xrGnZNodk7B37+Fo4X/1Qw==
X-Google-Smtp-Source: AGHT+IEXAwBIqSClrkb4EYoc2OhmhpgilmCz/IsEh6Chc/FsWIzsRB3p/FpLbUSGkXAy0ZMKjVVExg==
X-Received: by 2002:a05:6a20:4320:b0:1e6:50a0:f982 with SMTP id adf61e73a8af0-1e650a0fa30mr7283235637.20.1735549732420;
        Mon, 30 Dec 2024 01:08:52 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:08:51 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v4 01/15] Revert "mm: pgtable: make ptlock be freed by RCU"
Date: Mon, 30 Dec 2024 17:07:36 +0800
Message-Id: <b59adb960b2075822a6e57efc7a52e7eb7780068.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 2f3443770437e49abc39af26962d293851cbab6d.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/mm.h       |  2 +-
 include/linux/mm_types.h |  9 +--------
 mm/memory.c              | 22 ++++++----------------
 3 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d61b9c7a3a7b0..c49bc7b764535 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2925,7 +2925,7 @@ void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
-	return &(ptdesc->ptl->ptl);
+	return ptdesc->ptl;
 }
 #else /* ALLOC_SPLIT_PTLOCKS */
 static inline void ptlock_cache_init(void)
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 90ab8293d714a..6b27db7f94963 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -434,13 +434,6 @@ FOLIO_MATCH(flags, _flags_2a);
 FOLIO_MATCH(compound_head, _head_2a);
 #undef FOLIO_MATCH
 
-#if ALLOC_SPLIT_PTLOCKS
-struct pt_lock {
-	spinlock_t ptl;
-	struct rcu_head rcu;
-};
-#endif
-
 /**
  * struct ptdesc -    Memory descriptor for page tables.
  * @__page_flags:     Same as page flags. Powerpc only.
@@ -489,7 +482,7 @@ struct ptdesc {
 	union {
 		unsigned long _pt_pad_2;
 #if ALLOC_SPLIT_PTLOCKS
-		struct pt_lock *ptl;
+		spinlock_t *ptl;
 #else
 		spinlock_t ptl;
 #endif
diff --git a/mm/memory.c b/mm/memory.c
index b9b05c3f93f11..9423967b24180 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -7034,34 +7034,24 @@ static struct kmem_cache *page_ptl_cachep;
 
 void __init ptlock_cache_init(void)
 {
-	page_ptl_cachep = kmem_cache_create("page->ptl", sizeof(struct pt_lock), 0,
+	page_ptl_cachep = kmem_cache_create("page->ptl", sizeof(spinlock_t), 0,
 			SLAB_PANIC, NULL);
 }
 
 bool ptlock_alloc(struct ptdesc *ptdesc)
 {
-	struct pt_lock *pt_lock;
+	spinlock_t *ptl;
 
-	pt_lock = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
-	if (!pt_lock)
+	ptl = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
+	if (!ptl)
 		return false;
-	ptdesc->ptl = pt_lock;
+	ptdesc->ptl = ptl;
 	return true;
 }
 
-static void ptlock_free_rcu(struct rcu_head *head)
-{
-	struct pt_lock *pt_lock;
-
-	pt_lock = container_of(head, struct pt_lock, rcu);
-	kmem_cache_free(page_ptl_cachep, pt_lock);
-}
-
 void ptlock_free(struct ptdesc *ptdesc)
 {
-	struct pt_lock *pt_lock = ptdesc->ptl;
-
-	call_rcu(&pt_lock->rcu, ptlock_free_rcu);
+	kmem_cache_free(page_ptl_cachep, ptdesc->ptl);
 }
 #endif
 
-- 
2.20.1

