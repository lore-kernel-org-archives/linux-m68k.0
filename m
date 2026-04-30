Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950C61FF1B5
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 05:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777526598; cv=none; b=jxCnvBCUV66l8T7QAD7ohtOj194aho+AvljpoQloxK1FUEwQ+MFPf+lbuU8VjzZu1Wkr/DOsRXyxYEY8ceepznBcNGq+iuPKqydUd+9L+Am1WckmZRby4wRnt8vLC1WgvxbBYzu396WbxmqbYGunmq7+pdGPmK43PmxzpH7e1YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777526598; c=relaxed/simple;
	bh=AG5o7RA3gE3UdYLQtzIlyOBck/VP9W8WPXu27Gv5Ok4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNEJqVpwavzZDDICq76Byy5Wfc87vdHEBh64i+iaYJ0Vjsurg1wMQwwctkCR5ov56KMCJvFcry8AUeDIhh562b69hXC9Ny8U+MkFcWHYbZZg51t22s4cp9ZCzob2mEh8wepzOQ8nBSup184cZYRJ/TAdLQ5LyB50tunF6UTuzl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B0D960582
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 05:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A20C2BCB8;
	Thu, 30 Apr 2026 05:23:15 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: arnd@kernel.org,
	Greg Ungerer <gerg@kernel.org>
Subject: [PATCH 1/7] m68k: coldfire: create IO access functions for internal registers
Date: Thu, 30 Apr 2026 15:19:17 +1000
Message-ID: <20260430052047.1827575-2-gerg@linux-m68k.org>
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

The internal peripheral registers contained in all varieties of ColdFire
SoCs require simple big endian access ranging in sizes from 8, 16 and 32
bit. Currently there is a mixture of IO access methods used across the
various CPU support code, some using readx/writex and some using the
simpler __raw_readx/__raw_writew.

The readx/writex use cases are particularly kludgy in that they contain
code to differentiate internal register access and other general attached
peripheral register access - say on a PCI bus. In effect this means that
the readx/writex family for ColdFire is non-standard. This ultimately
ends up causing problems with definitions of other IO access support
functions like ioreadx/ioreadxbe/iowritex/iowritexbe which in the
generic case are defined in terms of readx/writex.

Create a set of internal only register access methods to ultimately
replace all internal register access code. The new access functions
mirror the existing readx/writex family but using the preferred 8/16/32
suffixes.

Signed-off-by: Greg Ungerer <gerg@kernel.org>
---
 arch/m68k/include/asm/io_no.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/m68k/include/asm/io_no.h b/arch/m68k/include/asm/io_no.h
index 516371d5587a..4f0f34b06e37 100644
--- a/arch/m68k/include/asm/io_no.h
+++ b/arch/m68k/include/asm/io_no.h
@@ -107,6 +107,22 @@ static inline void writel(u32 value, volatile void __iomem *addr)
 
 #endif /* IOMEMBASE */
 
+#if defined(CONFIG_COLDFIRE)
+/*
+ * The ColdFire internal peripheral registers are big-endian, so you
+ * cannot use the conventional little-endian readb/readw/readl and
+ * writeb/writew/writel access functions. Define a family of access
+ * functions to give correct endian access that can be used by all
+ * architecture code.
+ */
+#define mcf_read8	__raw_readb
+#define mcf_read16	__raw_readw
+#define mcf_read32	__raw_readl
+#define mcf_write8	__raw_writeb
+#define mcf_write16	__raw_writew
+#define mcf_write32	__raw_writel
+#endif /* CONFIG_COLDFIRE */
+
 #if defined(CONFIG_PCI)
 /*
  * Support for PCI bus access uses the asm-generic access functions.
-- 
2.54.0

