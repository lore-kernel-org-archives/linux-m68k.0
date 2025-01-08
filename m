Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972F620100E
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Jan 2025 17:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736357456; cv=none; b=hnOJcuaw+HFg+6Y4hMzoV0Njmvz1y/VzWdngDNSZnVeuuviAhuto26NwfXY4IlMzBqiCc+QvZnx0MUJgiUDIWT/zK+itFAt8UkcrSKvJWMoIA+jGR7MWldNFTQfyboOILm5zHGzzeinB24iGSSJU3TjEdoR5lUvqK81t3v+TUYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736357456; c=relaxed/simple;
	bh=ZPp8uUNauXJUjWAZygZIv/4grCqKvflFKgL30dDkoZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o0wKSqd9b4PDUEiTc5nStmXj+ROtdtGjkyhVWhzoByjecG+jaRMo1o+YYiTiqIscBX/hI8VIlld1SNweAW+XE9WKMDPl31tP46VfSdHIYL4xWutqNoRMC84ASp5OKJyf4wkhTP/LlNOTCgid3EeqhR9REruDZzjEVbH1rws0QhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4YSvqQ6tl1z4xf5k
	for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Jan 2025 18:22:10 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:36eb:83e8:32a9:43e2])
	by michel.telenet-ops.be with cmsmtp
	id yhN12D00A4LMxBm06hN1lk; Wed, 08 Jan 2025 18:22:01 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tVZkj-00000009McN-1gOk;
	Wed, 08 Jan 2025 18:22:01 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tVZkm-00000009yHU-3nDE;
	Wed, 08 Jan 2025 18:22:00 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] m68k: libgcc: Fix lvalue abuse in umul_ppmm()
Date: Wed,  8 Jan 2025 18:22:00 +0100
Message-ID: <c408cfb85bfde8929dcaa4ebea29ade4e1452d8e.1736356696.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    lib/muldi3.c:53:28: warning: asm output is not an lvalue
    lib/muldi3.c:53:28: warning: asm output is not an lvalue
    lib/muldi3.c:53:28: error: not addressable
    lib/muldi3.c:53:28: warning: generating address of non-lvalue (11)
    lib/muldi3.c:53:28: warning: generating address of non-lvalue (11)

Fix the lvalue warnings by replacing the casts on the output operands by
intermediate variables of the right type.

Fix the "not addressable" error by replacing the cast on the second
input operand by an intermediate variable, too.  Treat the other input
operand the same for consistency.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501030516.uZrwnuQQ-lkp@intel.com/
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be queued in the m68k for-v6.14 branch.
Not folding into commit e96424b86d5098f4 ("m68k: Use kernel's generic
muldi3 libgcc function"), as the issue was pre-existing.
---
 arch/m68k/include/asm/libgcc.h | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/include/asm/libgcc.h b/arch/m68k/include/asm/libgcc.h
index 1cce6d130d805368..27e17195bd7be41c 100644
--- a/arch/m68k/include/asm/libgcc.h
+++ b/arch/m68k/include/asm/libgcc.h
@@ -10,11 +10,18 @@
  * will fallback to using the C-coded version of umul_ppmm().
  */
 #define umul_ppmm(w1, w0, u, v)				\
-	__asm__ ("mulu%.l %3,%1:%0"			\
-		 : "=d" ((unsigned long)(w0)),		\
-		   "=d" ((unsigned long)(w1))		\
-		 : "%0" ((unsigned long)(u)),		\
-		   "dmi" ((unsigned long)(v)))
+	do {						\
+		unsigned long __u = (u), __v = (v);	\
+		unsigned long __w0, __w1;		\
+							\
+		__asm__ ("mulu%.l %3,%1:%0"		\
+			 : "=d" (__w0),			\
+			   "=d" (__w1)			\
+			 : "%0" (__u),			\
+			   "dmi" (__v));		\
+							\
+		(w0) = __w0; (w1) = __w1;		\
+	} while (0)
 #endif /* !CONFIG_CPU_HAS_NO_MULDIV64 */
 
 #endif /* __ASM_M68K_LIBGCC_H */
-- 
2.43.0

