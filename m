Received: from coreboot.org (mail.coreboot.org [78.46.105.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DB7302779
	for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jan 2026 06:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=78.46.105.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767852392; cv=pass; b=QazPlsgJqe00E8pKM5skj0KDEo/s+KQ8iO6SWKGWYiaXxOKg1EbPgeUDGcd0g2erP1zZAvmJZnoThF/qxp7QqSpOS1jWRSV74QGZH2LEY6oF5iax2m+SIlKjp+Si3P2dALQt31V7A/C25lwrHo3aBEyn70/SW63Oca3Y8TDkh7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767852392; c=relaxed/simple;
	bh=iJbswFCmX1tUnPyngGgygrtiFMO6DdOdlVMxpFLC4UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ROs2jG3jlrJEFUDL3Y2xfMSKQwRJiMfv4JqpPLmP4gsfvlJ4n0xymj/ZZ004bJyeAmNM7ErjiHr3K5Hr05CUdmRogjDtY5UMem7hmGnm6IDQHbTLVDzP1lBwo9wxY9K+5YehF3FLfsXRtOirm1YTsBZkEpLiQCN5gsTHzxOqThI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=coreboot.org; spf=pass smtp.mailfrom=coreboot.org; dkim=pass (1024-bit key) header.d=coreboot.org header.i=@coreboot.org header.b=ccG+lnAU; arc=pass smtp.client-ip=78.46.105.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=coreboot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coreboot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coreboot.org header.i=@coreboot.org header.b="ccG+lnAU"
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by coreboot.org (Postfix) with ESMTPA id AD9368179C;
	Thu,  8 Jan 2026 06:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=coreboot.org;
	s=dkim; t=1767852388; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hhm26o58xWCpEw5odhvK/g59kQFs6bFeGf5c+V7y1xs=;
	b=ccG+lnAUscWfWVojERPw3g8tmfcPSMCo3g7YQfQkKVappe6xivcyoCfrBTEJ9nze/KegR6
	w5JnVRDv+KcX+KUfLjwokhSclO5bMBTz+28GdLbc5THduNW5HGp/MpxcLCfxWwO6W1ALQt
	sEMf4Okr3H3OqhHrHNG11riQxuFooZQ=
From: Stefan <stefan.reinauer@coreboot.org>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	Stefan <stefan.reinauer@coreboot.org>
Subject: [PATCH 3/5] m68k/mac: Hook VIA timer into vDSO for userspace clock_gettime()
Date: Wed,  7 Jan 2026 22:05:31 -0800
Message-ID: <20260108060533.3891380-4-stefan.reinauer@coreboot.org>
In-Reply-To: <20260108060533.3891380-1-stefan.reinauer@coreboot.org>
References: <20260108060533.3891380-1-stefan.reinauer@coreboot.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=coreboot.org;
	s=dkim; t=1767852388; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hhm26o58xWCpEw5odhvK/g59kQFs6bFeGf5c+V7y1xs=;
	b=igBW9+cPYuC12RdNFnCQLkKGQeSF0MEFHzpUOuZluA81ba/Gwy5j4QzrAVnO4Bg2/HBwAB
	TSLZJVSR1ggtMX2/RBvz2SPGhY5AbcKKucOyt2gPT1GN5s9HtchpyH/Q/JrDdGJxHMxhj3
	iZMUVCboICbemqUeNZCuXCAYRtTMf2o=
ARC-Seal: i=1; s=dkim; d=coreboot.org; t=1767852388; a=rsa-sha256;
	cv=none;
	b=bAQumNf5p7tZZzewdNvg17ELu0amkKlQZzLTXTKM9XkraqaBbl2SgWARz+D33eVY1xwd05uMgQRQvMeupvf6YaP2YeYiE8C77yXOVekTGepwLsJ0Sq/EW5hSgsvo/yDm/Fkwf3XJOctA+QERFTzHr7qSIPij7VQMbVkaIanNl3c=
ARC-Authentication-Results: i=1; coreboot.org;
	auth=pass smtp.auth=stepan@coreboot.org smtp.mailfrom=stefan.reinauer@coreboot.org
Authentication-Results: coreboot.org;
	auth=pass smtp.auth=stepan@coreboot.org smtp.mailfrom=stefan.reinauer@coreboot.org
X-Spamd-Bar: /

Integrate the Mac VIA timer with the vDSO clock_gettime() infrastructure
to enable fast userspace time queries without syscall overhead.

The implementation:

 - Wraps timer state updates (clk_total, clk_offset) with vDSO sequence
   lock protection to ensure consistent reads from userspace

 - Maps the VIA1 timer register page for direct userspace access,
   allowing the vDSO to read the hardware counter

 - Initializes the vDSO with clocksource parameters (mult/shift) for
   converting raw timer ticks to nanoseconds. For VIA_CLOCK_FREQ of
   783360 Hz, this uses shift=20 and mult=1338514109

 - Updates vDSO data both in the regular timer interrupt path and
   when detecting timer overflow in mac_read_clk() to maintain
   consistency between kernel and userspace time views

This builds on the vDSO clock_gettime() infrastructure added in the
previous commit to provide a complete fast path for CLOCK_MONOTONIC
and CLOCK_REALTIME on Mac m68k systems.

Signed-off-by: Stefan Reinauer <stefan.reinauer@coreboot.org>
---
 arch/m68k/mac/via.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
index 9cb813eda..7db2db2ab 100644
--- a/arch/m68k/mac/via.c
+++ b/arch/m68k/mac/via.c
@@ -37,6 +37,7 @@
 #include <asm/mac_via.h>
 #include <asm/mac_psc.h>
 #include <asm/mac_oss.h>
+#include <asm/vdso.h>
 
 #include "mac.h"
 
@@ -585,8 +586,17 @@ static u32 clk_total, clk_offset;
 
 static irqreturn_t via_timer_handler(int irq, void *dev_id)
 {
+	/* Update clock state with vDSO seq protection */
+	m68k_vdso_write_begin();
+
 	clk_total += VIA_TIMER_CYCLES;
 	clk_offset = 0;
+
+	/* Update vDSO data page for userspace clock_gettime */
+	m68k_vdso_update_clock(clk_total, clk_offset);
+
+	m68k_vdso_write_end();
+
 	legacy_timer_tick(1);
 
 	return IRQ_HANDLED;
@@ -594,6 +604,17 @@ static irqreturn_t via_timer_handler(int irq, void *dev_id)
 
 void __init via_init_clock(void)
 {
+	/*
+	 * Clocksource mult/shift for converting ticks to nanoseconds:
+	 *   ns = (ticks * mult) >> shift
+	 *
+	 * For VIA_CLOCK_FREQ = 783360 Hz:
+	 *   1 tick = 1e9 / 783360 = 1276.595 ns
+	 *   shift = 20, mult = 1276.595 * 2^20 = 1338514109
+	 */
+#define VIA_CS_SHIFT	20
+#define VIA_CS_MULT	1338514109
+
 	if (request_irq(IRQ_MAC_TIMER_1, via_timer_handler, IRQF_TIMER, "timer",
 			NULL)) {
 		pr_err("Couldn't register %s interrupt\n", "timer");
@@ -605,6 +626,15 @@ void __init via_init_clock(void)
 	via1[vACR] |= 0x40;
 
 	clocksource_register_hz(&mac_clk, VIA_CLOCK_FREQ);
+
+	/*
+	 * Initialize vDSO clock support.
+	 * Map the VIA1 timer register page for userspace access.
+	 * VIA1_BASE is 0x50F00000, vT1CH is at offset 0x0a00.
+	 */
+	m68k_vdso_set_timer_addr(VIA1_BASE, PAGE_SIZE * 2);
+	m68k_vdso_init_clock(M68K_TIMER_VIA, VIA_TIMER_CYCLES,
+			     VIA_CLOCK_FREQ, VIA_CS_MULT, VIA_CS_SHIFT);
 }
 
 static u64 mac_read_clk(struct clocksource *cs)
@@ -643,8 +673,13 @@ static u64 mac_read_clk(struct clocksource *cs)
 	count_high = via1[vT1CH];
 	if (count_high == 0xFF)
 		count_high = 0;
-	if (count_high > 0 && (via1[vIFR] & VIA_TIMER_1_INT))
+	if (count_high > 0 && (via1[vIFR] & VIA_TIMER_1_INT)) {
 		clk_offset = VIA_TIMER_CYCLES;
+		/* Also update vDSO data for userspace consistency */
+		m68k_vdso_write_begin();
+		m68k_vdso_update_clock(clk_total, clk_offset);
+		m68k_vdso_write_end();
+	}
 	count = count_high << 8;
 	ticks = VIA_TIMER_CYCLES - count;
 	ticks += clk_offset + clk_total;
-- 
2.51.0

