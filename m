Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FDD2853F8
	for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Apr 2026 21:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777240098; cv=none; b=LLbcsN7npH2/0fy8/+Kyo0Mi65RqnVKbDL0vZOTnsufaRAUDgM2ZllwTlb7rDSAIVngseViWy5LmmM9J/1OGspAMwtgBwButW34pZ4Etd9LHnvfXLvbqqNyP4jnYu6ARQkM64wHNk21JHBpLxLkCqFd/w/t+ULwKOf6AciO7aTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777240098; c=relaxed/simple;
	bh=o+vhOTjLhvS47fv9tom+Yt3TM9vgXV0mo+tAnh6qa+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=HztdIUkW9ZkRbJMwtG93lkqf/3O0MhyROkbxzLVY3/UdfwQtSVLXKpI5lis8sOO8pJOitmWul6rKCbpaqTPvnkQ3K0BL9ib2PhU5p31bGiS/KawRe3sHm8lbK0xE5AyCwAqht668lHLRrHO76neOFxRgbipJZrd1PHDbTHO6CM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TgPxFQY1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TgPxFQY1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777240096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KxxPeFo8b5YQQgq6okT6k4ODeRwXIuGSW0SUh4EUnR0=;
	b=TgPxFQY1VvQDzV5yyrlydLtRzB0pW9KQSYCoi3c5I3q9+mjOTnqUGV7Sbo290w9wNb7En0
	wOvmRbdDw3eyQISgm7xbK020jiC8xXzTWp8XLzJQHSviJU0d9pPwYaHrmI7BIw4MBer5Ot
	kMWo/hjB8cpOBkH+uh0qztTA1ro2xWc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-Sk8TUXiTMuigTbjAokeSiA-1; Sun, 26 Apr 2026 17:48:14 -0400
X-MC-Unique: Sk8TUXiTMuigTbjAokeSiA-1
X-Mimecast-MFC-AGG-ID: Sk8TUXiTMuigTbjAokeSiA_1777240093
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4837b6f6b93so102942255e9.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Apr 2026 14:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777240093; x=1777844893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxxPeFo8b5YQQgq6okT6k4ODeRwXIuGSW0SUh4EUnR0=;
        b=NroA8drnj2O37jYIRyvfSf0mn+MaTCbiu+5Yw9uyw0cd0+DLC0DBoZUKVKBDc//OHU
         8cESo5BmxgT1B5ximKgokhMsbVxEjGVpmaZgIMTtLeDhQBIY03GGM6QgpUQs1nsVw+Vd
         LzaiVsayTP4UiX5I1j9O6jOfJVmHoBQkHfWjaWR+Q0q+1TBZJSlmuoXGaukmZ7Iviaku
         BN6Rc+KsnGgByZhLdFts7Uur34i3Opc6/kpXtkcNtkzaPD40hJBIxaJCAO9tFMf7YUbE
         Ez/O0HdEPCZsrdUw89xOg0wTTp+zrq1Ta9m+vqiRN1fMfFjpzkn/R0kJgcOXuOwhHZpc
         clMw==
X-Forwarded-Encrypted: i=1; AFNElJ8ZoRMVa/+y6vHqytxb2JPeYWT/fzCmcVbzWF/ZCxBmpuqMG4L3WmfBPNp5K0LJaqY2e7FgjRhJGBNy@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzGRwpJH2WoiyDj3/q3U38z2hAVpvGvr8V73cUS9m4pBQZcmIx5
	o9hzUARCHlR1zGMe3bykezPw7c+9zRvD4orMtPNjvpl0pUu/avist7AVRakgu4EGVgVsYqypfqY
	Is96SDvxs5eYlO34pCRRppSd0nnjzBoDC7yDVXeqfWrMuRxPCgR8Vn8/9hdgTHBM16NCa7Q==
X-Gm-Gg: AeBDietQEojpUtdjU11otHjNeJ87XS/b+7ruLmVoRp4aCb+2AUGkNGzDGPhTlpKBaN3
	B3eVZS9TDtT7zN6Vg5PmFRhbbxEF+lH84IxC1MzNC4/uox4qgkTCdBQRQxyzcN4jedfuzhTVQqB
	2s/N4VOtl+vxmYYHYsLhIWTI87jQfEdykdoZFg5MxB6Oro3G4JElA4Zm1z5r7dB7g1qcAFk+BYV
	Q8Kx4W250SYfzVE/P/o0S5cTjhgxADe8087vXOz1mulI60yD3diCkxRDz3U/bXBwg4XlKkA5vYM
	tKVY4ulDkVhb+11yH+evr5WkSfeDa9aaKlJdxKZO57fVvXYGnIfwLzyrB3R0/xU53Pg6JL9ouZr
	rUmFLdoae57TMJVBfHecHCEt0OwWsDu/W2uxe+CHi3SyqshA70n8+Id4i
X-Received: by 2002:a05:600c:6296:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-488fb73d764mr551942885e9.1.1777240093416;
        Sun, 26 Apr 2026 14:48:13 -0700 (PDT)
X-Received: by 2002:a05:600c:6296:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-488fb73d764mr551942475e9.1.1777240092952;
        Sun, 26 Apr 2026 14:48:12 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-47-179.inter.net.il. [80.230.47.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489fec8f7cbsm454414365e9.11.2026.04.26.14.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 14:48:12 -0700 (PDT)
Date: Sun, 26 Apr 2026 17:48:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Jason Wang <jasowang@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Gregory Price <gourry@gourry.net>, linux-mm@kvack.org,
	virtualization@lists.linux.dev, Magnus Lindholm <linmag7@gmail.com>,
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
Subject: [PATCH RFC v4 12/22] mm: remove arch vma_alloc_zeroed_movable_folio
 overrides
Message-ID: <424f14373b3339c93cab7a080614b7e0dbe7596f.1777223007.git.mst@redhat.com>
References: <cover.1777223007.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1777223007.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xOKVzHScJezQiA4D5Iov0asMdL7EjVel-GB8IL3EzD4_1777240093
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
index f339258135f7..04020a19a5cf 100644
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

