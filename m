Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BACE1DFFD
	for <linux-m68k@lists.linux-m68k.org>; Sun, 24 May 2026 13:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779627906; cv=none; b=T8lGw/3H5Qad2UTFtcuft3a5DMXI51bIzNKOz/N/vtAKnJQy/uWKioMz4DTEZhOGGvu/Vs4nnVdgzaWkIsCf2w5ItGK3K5XX/T8uk9Fq7/ikVn9vKYvlbxqnDNEF8fCcuWO4BoxioRj7PvzLsLx8026F3iCzke7Gat+urJB5fxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779627906; c=relaxed/simple;
	bh=xkO41iCDOq5XaG7gHyHH2GoIfdQxlth2iV1Os4EXEGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=umo1wuPI4OPb7JScug9j31UA/BjWrqkXGxVr4wEOk6IxJFTvOeII6fWrSK6YGzXiR0F7yrECfjN3cX1NySLUDtY3Z6NxyqzwXbXtBac2msmKzS+UAXJ+ikETdKZKz+fgRir+cOAx4Ezrrz3NsHnmRONTkwYdeNqg0HmzL/9tmFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=jGCWfRA7; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="jGCWfRA7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1779627903;
	bh=xkO41iCDOq5XaG7gHyHH2GoIfdQxlth2iV1Os4EXEGg=;
	h=From:Date:Subject:To:Cc:From;
	b=jGCWfRA7D7iAnNbg/eTdVnXMHUizNAqlelRqEbHm358DVe3/9kOQwXnY8kaDzs83F
	 16/BGR6ApOsMfQW6dV9CTcIsZ+yMnoc7D5z3ZNkzKXO6jUlbc+tSAcsv9BZWdGeMp7
	 U4sa6PW4/XyFDCCnecLajgRYIixYJVmrF6Cyiuck=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 24 May 2026 15:04:59 +0200
Subject: [PATCH] m68k: Avoid -Wunused-but-set-parameter in
 clear_user_page()
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260524-m68k-clear_user_page-v1-1-4c950668842e@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2N2wqDMBBEf0X2uYE00qD9FSkS003dXrxsjBTEf
 +9qhXk5cGZmgYhMGOGaLcA4U6S+EzifMvCt6x6o6C4MRhurLyZXH1u8lH+j4zpJtx6cOE0otM0
 lodQg1YEx0HefrW5/jql5op+2rcNgHJP8TYe2rj9uZB/FjQAAAA==
X-Change-ID: 20260523-m68k-clear_user_page-bf8063063f90
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 "David Hildenbrand (Red Hat)" <david@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779627903; l=1953;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=xkO41iCDOq5XaG7gHyHH2GoIfdQxlth2iV1Os4EXEGg=;
 b=C3YP51o38YQmlUnWS/9YRYVPdaGO/dvEQ1yCkMlV4ZdD035GZljVM+bYTJopqebOjcyptHjrn
 AOJ0njghem8AmRoxRobf7OVHzWPx2cxRXC4PSygZRO0e09EHRLL+HxX
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The loop in clear_user_pages() iterates over all pages and calls
clear_user_page() for each of them. During the loop "vaddr" is modified.
However on m68k clear_user() is a macro which does not use "vaddr".
The compiler sees a variable which is modified but never used and emits
a warning for that:

include/linux/highmem.h: In function 'clear_user_pages':
include/linux/highmem.h:234:63: warning: parameter 'vaddr' set but not used [-Wunused-but-set-parameter=]
    static inline void clear_user_pages(void *addr, unsigned long vaddr,

Other architectures use an inline function for clear_user_page() which
avoids the warning. This is not possible on m68k, as dlush_dcache_page()
is another macro which is not yet defined where clear_user_page() is
defined. Including cacheflush_mm.h will trigger recursive and lots of
other issues.

So hide the warning with a cast to (void) instead.

While we are here, do the same for copy_user_page().

Fixes: 62a9f5a85b98 ("mm: introduce clear_pages() and clear_user_pages()")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/m68k/include/asm/page_mm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index ed782609ca41..67c82c746f7a 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -55,10 +55,12 @@ static inline void clear_page(void *page)
 #define clear_user_page(addr, vaddr, page)	\
 	do {	clear_page(addr);		\
 		flush_dcache_page(page);	\
+		(void)vaddr;			\
 	} while (0)
 #define copy_user_page(to, from, vaddr, page)	\
 	do {	copy_page(to, from);		\
 		flush_dcache_page(page);	\
+		(void)vaddr;			\
 	} while (0)
 
 extern unsigned long m68k_memoffset;

---
base-commit: eed108edc1170404bbef9e7d0189d18a3cc354f5
change-id: 20260523-m68k-clear_user_page-bf8063063f90

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

