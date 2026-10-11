Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2051372EEE
	for <linux-m68k@lists.linux-m68k.org>; Sun, 11 Oct 2026 23:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791761566; cv=none; b=rM8AuuxqH/ehRKiADbpC1jMMxjoNVb/FnuZLa9zQeeW6wO2mcqOTGQnEX/N9KrxsltpYtLg43noJy94KER3vWaQTwPVipMgaOTmTx9HWTWveh9G7QEEoIhbqwwRmnugADic3ccv4fyIjtCZdTEpl7KTsF0vs38f48o8zMvSCAuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791761566; c=relaxed/simple;
	bh=R5AynVwrupXV4UGlXf2y5bP7fRceiTjiIYsEsLPPscw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UlYuLuWRwOoCvidqPDCFqn/uzwaMf7KUqRe+czsRLHzuUarLoUDibGug3Dcyam5jZnBXqBmEKayKogAJh3+o78YT25AA/BT/14xDB3GaoA11sgY09Xuq/AXQVGnWxfu36Rdq0dxXyeD9XKCbSAefYVwqks3K+cOCy9ccr/SgAMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PbFxr6Dy; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PbFxr6Dy"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F8814041E;
	Sun, 11 Oct 2026 23:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACFF21F0089B;
	Sun, 11 Oct 2026 23:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791761564;
	bh=pz5tkYoZVsnEC3QezhFsl9PNqzfrmJqvwm5S0Pgeyig=;
	h=From:To:Cc:Subject:Date;
	b=PbFxr6DyuOE/ntLg6D1tdGBWHV/fSdhC9WZczwiv7apZjuOPWcXzNvnPdPRhBPp+0
	 4LqbUEaqyTR5iq//wDvWbN3icaRBW8CCD8RIr4u7gDrnO2Ns2/4Ja+0yhMHA8iiel5
	 KaDtaruN3/QYWW9qaUKTJv28bFwTbeMPZeZwnq6zpbRk7V3uSFbqVIVzMHhlCRzOfl
	 1RmBGj7pCYijfg+ck/Asap81hT9QyTwJi0lkaIsTM6UFDpgIsRDe3QIGThzaOTeepX
	 ZEJq1I13dUJLRJ5gl1lyOaXT5bRhJZashJ9EjrUimSBg7osvCJc9iSX6Y3A4TxiiCc
	 OD1LhgZQGj6Jw==
From: Greg Ungerer <gerg@kernel.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68knommu: coldfire: allow RAMBAR disable
Date: Mon, 12 Oct 2026 09:32:25 +1000
Message-ID: <20261011233225.1300832-1-gerg@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Greg Ungerer <gerg@linux-m68k.org>

Most ColdFire SoC parts have a small SRAM hardware block. Linux does not
use this in any way currently. Unfortunately some boot ROMs enable and
map this SRAM block in their startup code - and leave it enabled when
passing control to loaded code - such as the linux kernel. Typically this
is not a problem and the SRAM block is mapped into the 32bit address
space at a harmless location. But this is not always the case.

Create a Kconfig option and supporting code that allows the kernel
startup to disable the SRAM block completely. In practice some ColdFire
boards have boot ROMs that are not easily upgraded or changed, so this
option will allow running mainline built kernels without hacking code
in on top.

The most commonly observed issue to date has been on MMU enabled
ColdFire parts where the SRAM block is mapped into the usual application
address space range. The SRAM block hardware has the highest priority
address decode and will supply its contents over that of virtually
mapped RAM.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/Kconfig.cpu     | 12 ++++++++++++
 arch/m68k/coldfire/head.S |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 5a58cc13229e..37669c91933e 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -553,6 +553,18 @@ config NR_CPUS
 	int
 	default "1"
 
+config RAMBAR_DISABLE
+	bool "Disable the SRAM block at startup"
+	depends on COLDFIRE
+	help
+	  Most ColdFire SoC parts have a small SRAM block that can be mapped
+	  into the 32bit processor address space. Linux does not generally
+	  use this. But some board boot ROMs enable it, and often map it at
+	  odd address locations. It can cause boot up problems due to it being
+	  enabled and clashing with DRAM, or more often with enabled and
+	  mapped virtual memory space. Select this option for the kernel
+	  to disable it during system startup.
+
 # Coldfire cores that do not have a data cache configured can do coherent DMA.
 config COLDFIRE_COHERENT_DMA
 	bool
diff --git a/arch/m68k/coldfire/head.S b/arch/m68k/coldfire/head.S
index c6d7fd28c602..2a53e087f57b 100644
--- a/arch/m68k/coldfire/head.S
+++ b/arch/m68k/coldfire/head.S
@@ -186,6 +186,11 @@ _start:
 	addl	%a7,%d0
 	movel	%d0,_ramend			/* set end ram addr */
 
+#ifdef CONFIG_RAMBAR_DISABLE
+	movel	#0,%d0				/* Disable SRAM region */
+	movec	%d0,%RAMBAR
+#endif
+
 	/*
 	 *	Now that we know what the memory is, lets enable cache
 	 *	and get things moving. This is Coldfire CPU specific. Not
-- 
2.55.0

