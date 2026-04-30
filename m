Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0312C2349
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 05:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777526599; cv=none; b=WCvq/nanHse7dIVK4vot+v6PCDuvYa+gPptQ5SPkix6Vh7pU8cGMTJlRaGOvCCWIE09e91moUKnpzI9e97y/vYWFp42jDLXJTETfOm0nbAnvLIbdmPOEPX4ZeWEVcl9fNG0rlnfJ5EVyh4t2a7CseaecQYXg9inh09MS6zvfF1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777526599; c=relaxed/simple;
	bh=aIvX8dwR16aBRZte3c3dMTqWfNZu7f4HPnRlBNlBxEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u1YRwSUTzNN9mCCiEyOnty6+7CZETPHFRKBCC/ESJjFO8ulh5V+ttkZSkFBXSGzz3JrkntEtz8vBXjVnxsYKDzXTwNjgb2Yus/QU2ohYeiNFrRS76KB1F+IRAgh6gd9HH3apWb2x/xJpPc5WaKj2AKdg0cH2Qzd9iZNUhZpAZEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF0D042E2E;
	Thu, 30 Apr 2026 05:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A639BC2BCB8;
	Thu, 30 Apr 2026 05:23:16 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: arnd@kernel.org,
	Greg Ungerer <gerg@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 2/7] m68k: coldfire: use ColdFire specific IO access in headers
Date: Thu, 30 Apr 2026 15:19:18 +1000
Message-ID: <20260430052047.1827575-3-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430052047.1827575-1-gerg@linux-m68k.org>
References: <20260430052047.1827575-1-gerg@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Greg Ungerer <gerg@kernel.org>

Convert all m68k/coldfire specific header file code to only use the
newly created internal register access methods. This is replacing the
mixed and inconsistent use of readx/writex and __raw_readx/__raw_writex
for internal SoC registers.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/include/asm/mcfgpio.h | 12 ++++++------
 arch/m68k/include/asm/nettel.h  |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/include/asm/mcfgpio.h b/arch/m68k/include/asm/mcfgpio.h
index 9c91ecdafc45..7103cfa4edb6 100644
--- a/arch/m68k/include/asm/mcfgpio.h
+++ b/arch/m68k/include/asm/mcfgpio.h
@@ -95,8 +95,8 @@ static inline void gpio_free(unsigned gpio)
 
 #define MCFGPIO_PORTTYPE		u8
 #define MCFGPIO_PORTSIZE		8
-#define mcfgpio_read(port)		__raw_readb(port)
-#define mcfgpio_write(data, port)	__raw_writeb(data, port)
+#define mcfgpio_read(port)		mcf_read8(port)
+#define mcfgpio_write(data, port)	mcf_write8(data, port)
 
 #elif defined(CONFIG_M5307) || defined(CONFIG_M5407) || defined(CONFIG_M5272)
 
@@ -104,8 +104,8 @@ static inline void gpio_free(unsigned gpio)
 
 #define MCFGPIO_PORTTYPE		u16
 #define MCFGPIO_PORTSIZE		16
-#define mcfgpio_read(port)		__raw_readw(port)
-#define mcfgpio_write(data, port)	__raw_writew(data, port)
+#define mcfgpio_read(port)		mcf_read16(port)
+#define mcfgpio_write(data, port)	mcf_write16(data, port)
 
 #elif defined(CONFIG_M5249) || defined(CONFIG_M525x)
 
@@ -113,8 +113,8 @@ static inline void gpio_free(unsigned gpio)
 
 #define MCFGPIO_PORTTYPE		u32
 #define MCFGPIO_PORTSIZE		32
-#define mcfgpio_read(port)		__raw_readl(port)
-#define mcfgpio_write(data, port)	__raw_writel(data, port)
+#define mcfgpio_read(port)		mcf_read32(port)
+#define mcfgpio_write(data, port)	mcf_write32(data, port)
 
 #endif
 
diff --git a/arch/m68k/include/asm/nettel.h b/arch/m68k/include/asm/nettel.h
index 9bf55cef119e..30bc915c3d97 100644
--- a/arch/m68k/include/asm/nettel.h
+++ b/arch/m68k/include/asm/nettel.h
@@ -87,12 +87,12 @@ static __inline__ void mcf_setppdata(unsigned int mask, unsigned int bits)
  */
 static __inline__ unsigned int mcf_getppdata(void)
 {
-	return readw(MCFSIM_PBDAT);
+	return mcf_read16(MCFSIM_PBDAT);
 }
 
 static __inline__ void mcf_setppdata(unsigned int mask, unsigned int bits)
 {
-	writew((readw(MCFSIM_PBDAT) & ~mask) | bits, MCFSIM_PBDAT);
+	mcf_write16((mcf_read16(MCFSIM_PBDAT) & ~mask) | bits, MCFSIM_PBDAT);
 }
 #endif
 
-- 
2.54.0

