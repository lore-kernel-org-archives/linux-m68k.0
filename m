Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C733976BB
	for <linux-m68k@lists.linux-m68k.org>; Thu,  7 May 2026 22:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778192595; cv=none; b=Jad8iBKCuk2ZXRNqaIajO6LaqzdDJWS0tPGz0393XJmmG9PiH9thIcwUNeTj2ZDr+N/7G2J00lpPlLHRRlux4cn21l9kvahd164qVJP79tNF2jI0fhlvMgwEyYWG9CY44oRaqN4ED3yumyUwOLxRRX3Za2I/1j925WhsQunplcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778192595; c=relaxed/simple;
	bh=o+vhOTjLhvS47fv9tom+Yt3TM9vgXV0mo+tAnh6qa+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=tw+EmEdzQb/3A2X6h/oeNPx1+WiBDi5ckPxKzIXazK7+vF+U3XddmpuYrCQ24S/6dMTOBnDYABh6cLpPeQYH7Uwjwd5bknMR0lob/00nQ+YgR9gfcY/ZpbF936cfHj7R5byr3WViF0Dbi3a0oZJ/VTlkhl0FwScZitcQJWDc6t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fMPxiWFF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fMPxiWFF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778192592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KxxPeFo8b5YQQgq6okT6k4ODeRwXIuGSW0SUh4EUnR0=;
	b=fMPxiWFFKO7CDfP+E0sQ1M2fWieK5xj46zWVZCKNrCzlBdDvFHfFracoloroagNAoA6hXE
	a9b184/W6SBkUH3tvdKMfVw6iaP6u0JcPJyrV20F/Panm3DP1vJbdPCSPb5ngvICqphMmK
	skd9ctBVt0/qsMrIVphmMAyXfmOLvQ8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-65t169jaN5OtMsN_nF-zkw-1; Thu, 07 May 2026 18:23:08 -0400
X-MC-Unique: 65t169jaN5OtMsN_nF-zkw-1
X-Mimecast-MFC-AGG-ID: 65t169jaN5OtMsN_nF-zkw_1778192587
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48a7994e8ddso8976235e9.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 07 May 2026 15:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778192587; x=1778797387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxxPeFo8b5YQQgq6okT6k4ODeRwXIuGSW0SUh4EUnR0=;
        b=J7ryrbvh0qUYGptQjlzMMcNTvK0ZN1bjVyWqrai1ERVIik6oh/gTe0yt9sL/650CA4
         rjJckew2P/WQ2tu3obv6B0sddBfIGuQ1RaZDyvPt0h4VI2XPs2LQNKepLS/N+FjORKaN
         W6112/GQZ4T8Vq9NU8Hl39epPFuNXkTD/xtTSzZLJBQ2/PzvHBu9bmfs2eeVC40Sa6gK
         96rg9qvY7c6ql2vRKyxverCZK7Ds+7HsOZZNF6y5p6ixjM0+zvFxJobj9v7vNu2G1cfL
         H3d7Ae2vn3imZVLH9/Vd/wq4E5Hw4yzTnCyMHRFKwUXQa47ehf+qg1MyWJIxSUM58X//
         j/TA==
X-Forwarded-Encrypted: i=1; AFNElJ9LT2ZhXeNwo5Btf8eUnweY1brmb4W0MnLeqU0nrjnXmRCzJOx2bA7AOxJL1om1reExkU2DBy0jUSGn@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz8eJmnYYLBtJ240nxKM+tanYk9DuqyJi9cYKLN/RNHO3Ft1woy
	NIdgnZMlU/eJzynt14eYG1mvWPIWccYGQh/iQkx+0AsknhqZA4jdyElhzBugBE91perm7MUdhSX
	nQ3ZN1Fup8XHEZ29l+FK+hgjXgNsONxyqN6frHvGzLsy1Qrmi8EfEspDu/dtaW/7r2jCqHA==
X-Gm-Gg: AeBDietGd2hlphNhZ3FhQh5VHqPFvo9pBgwYFxPN1mgCGQzG9HLlYuxiiQ2iixl8YS8
	ZXUKgFxRxWnoqrfCJFNdhQmh3/Nv29T2F/TSx+yg9ScW1isxJaCGYZnn2swrRakKJKlLsDiHPlQ
	Rx98wKnIUaW1skC0uBuWwC6sN73NckTY40rH0Gj5bCW+FCL/9W9pFIa7luC5GWvFkCBJCTm+30N
	PJLNbd8T5QBzFISwyhuVsjYuQoP0EwdEbzcGijGvXkhiFpybxztu10Q0IoRILfmjFzOXkXQKvgT
	Tvy1llJlOj2lS+P/rU3JwovKKdYtGsHK8RXrVx8Aim534W93rxF2E6Xz+cANhRAXwiTrBZhPLVn
	x9CgqB5zpj/BmEgMXI2FwlX3blngSmG0r7m53Pz8u
X-Received: by 2002:a05:600c:1c0f:b0:48a:5342:36b5 with SMTP id 5b1f17b1804b1-48e51f3deddmr177389105e9.21.1778192586769;
        Thu, 07 May 2026 15:23:06 -0700 (PDT)
X-Received: by 2002:a05:600c:1c0f:b0:48a:5342:36b5 with SMTP id 5b1f17b1804b1-48e51f3deddmr177388435e9.21.1778192586184;
        Thu, 07 May 2026 15:23:06 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45412820303sm2289369f8f.4.2026.05.07.15.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:23:05 -0700 (PDT)
Date: Thu, 7 May 2026 18:23:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@kernel.org>,
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
Subject: [PATCH v5 13/28] mm: remove arch vma_alloc_zeroed_movable_folio
 overrides
Message-ID: <44d46ba982b39e53a2b5f978dd7239836e535196.1778192416.git.mst@redhat.com>
References: <cover.1778192416.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1778192416.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UYKoIsv8nm15BwQAUAYx7FAsggVMz5WoZc06srmXsyQ_1778192587
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

