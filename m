Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C58E3DD86F
	for <linux-m68k@lists.linux-m68k.org>; Thu,  4 Jun 2026 07:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559681; cv=none; b=p7ruJ4YtWgG8MDnS4pC9edsObbtkb8Ko3iwnoP1btxSNKS33NqZ/WdMllqELnk7Ude5lIdisQCBcspkBpIeeddZWeV3uzDdwamzt3Hnmtp5HIX/V1U8oTgiyHhYcT/PjIOGz2cTwbcqLqOhbGov1RNGG/mX/0yVoSJ2kOZh/rL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559681; c=relaxed/simple;
	bh=vzfJ0HkMnzphBA/Q+krZgViH67qneR/YM3XK3ioMtg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KVPCRIBtlbFaETRg75zz0YdClx79rIdHh4tXwydgvaOZ+R+bojQivy+STOKUBia/SyJNcWKg4DjrEmf9IvmGU3HOrOAe0jHTE/CrnTqltJeeMOp1I70ZRs1V9p7AdxEyJDnKkAKGGzI55JTBeaBqQ/onxrFO64R1WDVcnLyPOzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AF74C6014B;
	Thu,  4 Jun 2026 07:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5381F00898;
	Thu,  4 Jun 2026 07:54:37 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Greg Ungerer <gerg@linux-m68k.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] m68k: hash: Use lower_16_bits() helper
Date: Thu,  4 Jun 2026 09:54:23 +0200
Message-ID: <b55e9bd0532c0cad519809c86e0a8400060d75a1.1780559561.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building for m68k with CONFIG_M68000=y and C=1:

    drivers/clk/rockchip/clk-rk3528.c: note: in included file (through include/linux/hash.h, include/linux/slab.h):
    arch/m68k/include/asm/hash.h:57:24: warning: cast truncates bits from constant value (18720 becomes 8720)
    arch/m68k/include/asm/hash.h:57:24: warning: cast truncates bits from constant value (1e8e8 becomes e8e8)

Sparse does not realize the truncation is intentional.
Make this explicit by using the lower_16_bits() helper instead, which
also masks the unwanted bits.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605191434.PQkj2Rki-lkp@intel.com/
Reported-by: Heiko Stuebner <heiko@sntech.de>
Closes: https://lore.kernel.org/20260603213726.1025094-1-heiko@sntech.de/
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
No change in generated code.

 arch/m68k/include/asm/hash.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/hash.h b/arch/m68k/include/asm/hash.h
index 6d0d0c893f16dd49..6dadf493706632f5 100644
--- a/arch/m68k/include/asm/hash.h
+++ b/arch/m68k/include/asm/hash.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_HASH_H
 #define _ASM_HASH_H
 
+#include <linux/wordpart.h>
+
 /*
  * If CONFIG_M68000=y (original mc68000/010), this file is #included
  * to work around the lack of a MULU.L instruction.
@@ -54,7 +56,7 @@ static inline u32 __attribute_const__ __hash_32(u32 x)
 	: "=&d,d" (a), "=&r,r" (b)
 	: "r,roi?" (x));	/* a+b = x*0x8647 */
 
-	return ((u16)(x*0x61c8) << 16) + a + b;
+	return (lower_16_bits(x * 0x61c8) << 16) + a + b;
 }
 
 #endif	/* _ASM_HASH_H */
-- 
2.43.0

