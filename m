Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6691FF1B5
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 05:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777526604; cv=none; b=W1JLtqrVtH9uqWtoVB4p+nTotmyd7nqkctLWyxC52AfUVOyU9i5mfYch02vwT+NScpjiAJuYk7Pq6bz+zp/b3skZtX2rWbsdmOyBRTkPgiulomg2xMOo256NOoX6K6yB1o6pzGaP9qq3uIrNI4gKQoOFOKkrJzLq/OJjR8Fe+Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777526604; c=relaxed/simple;
	bh=JEzEKQRl4wtMrCF9aJLZomprFFV7g+7q0Ho1JSRyfGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0btMjYr1RZRQrYb4+S2ZwZs8V4YKSwY/+pbq7iCmZUVw5USfdImAsRych36nkH9XX4HQ4ytEZ7YXGsSTtiKnUwYpN1K+s74y/zF2xOlGzJ+F1vLe/k7E55cvpJomxJ367lRWdL+ORngzQ/uy1n8hoDYYJpWAhTaDbCv8W/cyEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ABFB044438;
	Thu, 30 Apr 2026 05:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AAFC2BCC4;
	Thu, 30 Apr 2026 05:23:21 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: arnd@kernel.org,
	Greg Ungerer <gerg@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 5/7] m68k: coldfire: rename timer register access defines
Date: Thu, 30 Apr 2026 15:19:21 +1000
Message-ID: <20260430052047.1827575-6-gerg@linux-m68k.org>
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

With the basic ColdFire IO register functions now consistently named
with a "mcf_read"/"mcf_write" prefix it makes sense to name the timers
internal access defines the same way. Convert the local __raw_readtrr
and __raw_writetrr defines to use the consistent prefixes too. Thus
the change is:

    __raw_readtrr  --> mcf_readtrr
    __raw_writetrr --> mcf_writetrr

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/timers.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/coldfire/timers.c b/arch/m68k/coldfire/timers.c
index 9a6b7d30e4d6..9db8e7e6d797 100644
--- a/arch/m68k/coldfire/timers.c
+++ b/arch/m68k/coldfire/timers.c
@@ -38,11 +38,11 @@
 void coldfire_profile_init(void);
 
 #if defined(CONFIG_M53xx) || defined(CONFIG_M5441x)
-#define	__raw_readtrr	mcf_read32
-#define	__raw_writetrr	mcf_write32
+#define	mcf_readtrr	mcf_read32
+#define	mcf_writetrr	mcf_write32
 #else
-#define	__raw_readtrr	mcf_read16
-#define	__raw_writetrr	mcf_write16
+#define	mcf_readtrr	mcf_read16
+#define	mcf_writetrr	mcf_write16
 #endif
 
 static u32 mcftmr_cycles_per_jiffy;
@@ -119,7 +119,7 @@ void hw_timer_init(void)
 	 *	for 1 tick, not TRR.  So if you want n cycles,
 	 *	initialize TRR with n - 1.
 	 */
-	__raw_writetrr(mcftmr_cycles_per_jiffy - 1, TA(MCFTIMER_TRR));
+	mcf_writetrr(mcftmr_cycles_per_jiffy - 1, TA(MCFTIMER_TRR));
 	mcf_write16(MCFTIMER_TMR_ENORI | MCFTIMER_TMR_CLK16 |
 		MCFTIMER_TMR_RESTART | MCFTIMER_TMR_ENABLE, TA(MCFTIMER_TMR));
 
@@ -176,7 +176,7 @@ void coldfire_profile_init(void)
 	/* Set up TIMER 2 as high speed profile clock */
 	mcf_write16(MCFTIMER_TMR_DISABLE, PA(MCFTIMER_TMR));
 
-	__raw_writetrr(((MCF_BUSCLK / 16) / PROFILEHZ), PA(MCFTIMER_TRR));
+	mcf_writetrr(((MCF_BUSCLK / 16) / PROFILEHZ), PA(MCFTIMER_TRR));
 	mcf_write16(MCFTIMER_TMR_ENORI | MCFTIMER_TMR_CLK16 |
 		MCFTIMER_TMR_RESTART | MCFTIMER_TMR_ENABLE, PA(MCFTIMER_TMR));
 
-- 
2.54.0

