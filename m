Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1993E2AAE
	for <linux-m68k@lists.linux-m68k.org>; Mon, 25 May 2026 08:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698038; cv=none; b=cLreQZRlFoJYcZBclguKpDo2uLcN0MCGYwM1HBWdKmll519NDVnRbsG2pEOBbm4nlDLrixCg5w0s2Zg/BdM5u4Z3o6UZj0MahE+uOhhNDcXr9ujsLfgsM9EhghNa213tpIgiRFdA8oFCAQH3En63P3LpUPr2fJ6AK8MkZDogXIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698038; c=relaxed/simple;
	bh=bzHbOMuipgyodW2udWwz1o3AzW1vdViW7ihguiilwA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cZaXqTSyShkyXitjQ6keUuNEoiJbHwnvH1FrtfIx5n7cQ0skHpzwTP6sXmC6TrMwJhkQwrTz6kkwkxWJElao8UMz8sh4HWheu2IF3ZfGitwudiMVo3oDi02H15NRbnAQD2P3IViIifRHYz4qx5CkBXdlGV/ykONRJLtLgSvnzEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=YllGPz+V; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="YllGPz+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1779698033;
	bh=bzHbOMuipgyodW2udWwz1o3AzW1vdViW7ihguiilwA8=;
	h=From:Date:Subject:To:Cc:From;
	b=YllGPz+VgUYVKnZZ9jhF1K1OmSPkJaSTBDJrVBU34LlP1qc/wwcEWTTSVON4tCeB0
	 5jcjiCcsWratPEsptjPD3PcSARqp690rZ3bzwmzD9ycbtZAbPlzBUAkRosGw56tnKx
	 wCDokuNxFgtGFHpAHiXLaiJ2dd8jr5Y4mdpCIUPw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 25 May 2026 10:33:52 +0200
Subject: [PATCH v2] m68k: Avoid -Wunused-but-set-parameter in
 clear_user_page()
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260525-m68k-clear_user_page-v2-1-0c8981c6eca1@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OSw6CMBCGr0K6tqYUaIor72EIgTrYqjzstKgh3
 N2CGjcms/km/2siCNYAkl00EQujQdN3AfgmIkpX3QmoOQYmnHHBMp7QVsgLVVeobOmDtxyqoKk
 byUQSrskZCdbBQmMea+yheDP6+gzKLVkfhYWbD33uJ9MGXW+f65gxXr7f3vR/7xjTmKYqz5gQU
 qYc9ncwiKi019sOHCnmeX4B8SvRKuQAAAA=
X-Change-ID: 20260523-m68k-clear_user_page-bf8063063f90
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 "David Hildenbrand (Red Hat)" <david@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 Andreas Schwab <schwab@linux-m68k.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779698032; l=2109;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=bzHbOMuipgyodW2udWwz1o3AzW1vdViW7ihguiilwA8=;
 b=m1oaqwHrlXLCfaytkgEp8ZvkM26fhfp1+wjB7gjBYlnJ/wE5g4m9epTCmD4/l9XCMOUnPXdOY
 K4zRgd/jG7/CGS9XKvpXrGBD2c/3JfA2EeeT+9sld/U5QzFFBAAYk1C
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
Changes in v2:
- Put parens around vaddr.
- Link to v1: https://patch.msgid.link/20260524-m68k-clear_user_page-v1-1-4c950668842e@weissschuh.net
---
 arch/m68k/include/asm/page_mm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index ed782609ca41..0971a0651d49 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -55,10 +55,12 @@ static inline void clear_page(void *page)
 #define clear_user_page(addr, vaddr, page)	\
 	do {	clear_page(addr);		\
 		flush_dcache_page(page);	\
+		(void)(vaddr);			\
 	} while (0)
 #define copy_user_page(to, from, vaddr, page)	\
 	do {	copy_page(to, from);		\
 		flush_dcache_page(page);	\
+		(void)(vaddr);			\
 	} while (0)
 
 extern unsigned long m68k_memoffset;

---
base-commit: eed108edc1170404bbef9e7d0189d18a3cc354f5
change-id: 20260523-m68k-clear_user_page-bf8063063f90

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

