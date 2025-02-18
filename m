Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D31F1ABEA5
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 12:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883174; cv=none; b=MywDsVY9rdNhfdGkT8lGkk01dmdfa0midIXVIkTJpvzLLFgcGYcaPihffHWuviRE7a74odcb6QBoIpL5gs3m5Y0zGYeURyAvfq5t0WyQODdp4UhETzm5xqhZurmGvnHmrUEV9qNs9pwKOYXY4UlK5E1gYttGaGAvSVnuknhTkEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883174; c=relaxed/simple;
	bh=lDs1VpEiPoF+oz7pHNLRgsUc8xW4v/wxzZHAilyS0A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KikKgmubERSSDDfN36Qt9iEKLqyy/5r+Cd/zUTwuWMO2nvv/51mPoVOA1ZNoGeEZ2swqgkLPhdUaFSN3g9TONl2CuDtwKlpZN7UJDE+Bky9Ln5mAFFZhGBBAN857Nngzco7MzMzOTFRX5Z8tOI6Rk05IsfcBhSfM16+kn8P3EQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 95EB8A40488;
	Tue, 18 Feb 2025 12:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D556C4CEE6;
	Tue, 18 Feb 2025 12:52:51 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 04/13] m68k: coldfire: enable common clock framework
Date: Tue, 18 Feb 2025 22:46:24 +1000
Message-ID: <20250218125124.2692982-5-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218125124.2692982-1-gerg@linux-m68k.org>
References: <20250218125124.2692982-1-gerg@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the ColdFire clock driver code to use the common clock framework.
This is not an actual conversion of the code proper. It is a work around
to allow defining clock bindings in a devicetree for ColdFire targets.
It is enough to allow the use of "fixed" clocks, which for many ColdFire
targets is enough for a simple devicetree setup.

A full conversion to the common clock framework and use of the generic
clk struct is still needed to complete this work.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/Kconfig.cpu    | 2 +-
 arch/m68k/coldfire/clk.c | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index c9a7e602d8a4..50ecb16d0a1f 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -30,7 +30,7 @@ config COLDFIRE
 	select CPU_HAS_NO_MULDIV64
 	select GENERIC_CSUM
 	select GPIOLIB
-	select HAVE_LEGACY_CLK
+	select COMMON_CLK
 	select HAVE_PAGE_SIZE_8KB if !MMU
 
 config SUN3
diff --git a/arch/m68k/coldfire/clk.c b/arch/m68k/coldfire/clk.c
index d03b6c4aa86b..bb4c0a2a8a61 100644
--- a/arch/m68k/coldfire/clk.c
+++ b/arch/m68k/coldfire/clk.c
@@ -20,8 +20,6 @@
 #include <asm/mcfsim.h>
 #include <asm/mcfclk.h>
 
-static DEFINE_SPINLOCK(clk_lock);
-
 #ifdef MCFPM_PPMCR0
 /*
  *	For more advanced ColdFire parts that have clocks that can be enabled
@@ -73,6 +71,10 @@ struct clk_ops clk_ops1 = {
 #endif /* MCFPM_PPMCR1 */
 #endif /* MCFPM_PPMCR0 */
 
+#ifndef CONFIG_COMMON_CLK
+
+static DEFINE_SPINLOCK(clk_lock);
+
 int clk_enable(struct clk *clk)
 {
 	unsigned long flags;
@@ -141,4 +143,6 @@ struct clk *clk_get_parent(struct clk *clk)
 }
 EXPORT_SYMBOL(clk_get_parent);
 
+#endif /* !CONFIG_COMMON_CLK */
+
 /***************************************************************************/
-- 
2.43.0

