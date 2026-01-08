Received: from coreboot.org (mail.coreboot.org [78.46.105.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4207301002
	for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jan 2026 06:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=78.46.105.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767852396; cv=pass; b=mg27OuHT+vPa2Oedj4FwHMDZU9rqmxIfGksqDtxJwQFuUhxnVXUnKlu08Xzqs2EP+Jh/EbMF2WD0AU494CoFS+0lGpmhEtGnEIXrufgIPNvpeQ/EQljGu+DJKkFyBiylCrwrNT9tC7OVkHxEj7IFYYRsEqQEXlGIgjUGQPkjLVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767852396; c=relaxed/simple;
	bh=wD+LcZWOENVzxkep+467FvjsMbrnWmVaTpG7enDMahY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKKUpmRe5aqWvLFmb5j+PLXY9NzDpOvEnjd1TFne2Jt7jbBgyYjnLx3z+2uIpIrzaF2P/JxXlpo8HM/p9LS4WXZl2O1rXzG7MclBmuJaCE+sgqjXntHAmqRhYxvhtcdtWkDr5vvl99lQErMyjXrcCOha5lz+FYzezlRdRPcf5dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=coreboot.org; spf=pass smtp.mailfrom=coreboot.org; dkim=pass (1024-bit key) header.d=coreboot.org header.i=@coreboot.org header.b=YH332a3B; arc=pass smtp.client-ip=78.46.105.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=coreboot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coreboot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coreboot.org header.i=@coreboot.org header.b="YH332a3B"
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by coreboot.org (Postfix) with ESMTPA id 23C1681792;
	Thu,  8 Jan 2026 06:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=coreboot.org;
	s=dkim; t=1767852393; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YjrGW+ytTzd6q5g60co1Lo2jbatoqRYaq66kVCONFW4=;
	b=YH332a3Baqk9iWRaQhbhTh4NtaExT8wZnfyc9BuB8pODvwfteAAC1nCGaJYvpUUowf1ZPZ
	Vjm0ZeIVXjGkxsPaaGj6HpJNYNEqJoagKKqiDnNnxs7m8y8N/qJNZqpR/pVbe+IFWrpq7h
	dlXHCNKBjCTRax78+DcvO9ycE8YoDrc=
From: Stefan <stefan.reinauer@coreboot.org>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	Stefan <stefan.reinauer@coreboot.org>
Subject: [PATCH 5/5] m68k/amiga: Hook CIA timer into vDSO for userspace clock_gettime()
Date: Wed,  7 Jan 2026 22:05:33 -0800
Message-ID: <20260108060533.3891380-6-stefan.reinauer@coreboot.org>
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
	s=dkim; t=1767852393; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YjrGW+ytTzd6q5g60co1Lo2jbatoqRYaq66kVCONFW4=;
	b=w0p9FDEy6xwWsenNNzDNCMUHC1a+5sy08Uu0y9G+4YaS5kV9nBM7Qa9YFwOf9u1vBAYHkm
	+PktnFWdl1oNPrYAS0M8cu831ja9eVPheQIu2aZK5hImxyU9ofdJkHrabuiRXakt/EWlPP
	4xMXLfNK1gBYT7jRo8YRPCXMdTs5Dqg=
ARC-Seal: i=1; s=dkim; d=coreboot.org; t=1767852393; a=rsa-sha256;
	cv=none;
	b=OYgK6q3hwG7Pa9rpCtW0MJFuOBXJKUOewTkO+r4E847lLzO99cM0oq+qfN7S71GR8BXhfNWQH9nprHCPOKVLGEFrMbwqWPF+QemYNYf/2PBhvPeiBmlVmTYY/uLmsFcR3JkBZ+/gYyhDYn1lChkZsZiCsEXo7u3y9ebU5LE/QlI=
ARC-Authentication-Results: i=1; coreboot.org;
	auth=pass smtp.auth=stepan@coreboot.org smtp.mailfrom=stefan.reinauer@coreboot.org
Authentication-Results: coreboot.org;
	auth=pass smtp.auth=stepan@coreboot.org smtp.mailfrom=stefan.reinauer@coreboot.org
X-Spamd-Bar: /

Add vDSO support for the Amiga's CIA 8520 Timer A, enabling fast
userspace clock_gettime() without syscall overhead.

The implementation:
- Initializes vDSO clock parameters during amiga_sched_init() using
  the CIAB Timer A at physical address 0xBFD000
- Updates vDSO clock state in ciab_timer_handler() with sequence
  counter protection for safe lockless reads
- Maintains vDSO consistency when detecting pending interrupts in
  amiga_read_clk()
- Adds cia_read_timer() to the vDSO userspace code, handling the
  CIA's split hi/lo register reads with re-read logic to ensure
  atomicity

The CIA timer uses shift=20 for the clocksource multiplier
calculation, providing good precision for the ~709 kHz E-clock.

Signed-off-by: Stefan Reinauer <stefan.reinauer@coreboot.org>
---
 arch/m68k/amiga/config.c           | 42 ++++++++++++++++++++++++++++--
 arch/m68k/kernel/vdso/vdso-clock.c | 35 ++++++++++++++++++++++++-
 2 files changed, 74 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
index 242d18e75..715e0fddf 100644
--- a/arch/m68k/amiga/config.c
+++ b/arch/m68k/amiga/config.c
@@ -17,6 +17,7 @@
 #include <linux/mm.h>
 #include <linux/seq_file.h>
 #include <linux/clocksource.h>
+#include <linux/math64.h>
 #include <linux/console.h>
 #include <linux/rtc.h>
 #include <linux/init.h>
@@ -36,6 +37,7 @@
 #include <asm/machdep.h>
 #include <asm/io.h>
 #include <asm/config.h>
+#include <asm/vdso.h>
 
 #include "amiga.h"
 
@@ -475,19 +477,35 @@ static u32 clk_total, clk_offset;
 
 static irqreturn_t ciab_timer_handler(int irq, void *dev_id)
 {
+	/* Update vDSO clock state with seq protection */
+	m68k_vdso_write_begin();
+
 	clk_total += jiffy_ticks;
 	clk_offset = 0;
+
+	m68k_vdso_update_clock(clk_total, clk_offset);
+	m68k_vdso_write_end();
+
 	legacy_timer_tick(1);
 	timer_heartbeat();
 
 	return IRQ_HANDLED;
 }
 
+/*
+ * vDSO clocksource parameters for CIA timer.
+ * We use shift=20 which gives good precision for the ~709 kHz E-clock.
+ * mult = (10^9 << shift) / freq = (1000000000 << 20) / 709379 = 1478395
+ */
+#define CIA_CS_SHIFT	20
+
 static void __init amiga_sched_init(void)
 {
 	static struct resource sched_res = {
 		.name = "timer", .start = 0x00bfd400, .end = 0x00bfd5ff,
 	};
+	u32 cs_mult;
+
 	jiffy_ticks = DIV_ROUND_CLOSEST(amiga_eclock, HZ);
 
 	if (request_resource(&mb_resources._ciab, &sched_res))
@@ -508,6 +526,20 @@ static void __init amiga_sched_init(void)
 	ciab.cra |= 0x11;
 
 	clocksource_register_hz(&amiga_clk, amiga_eclock);
+
+	/*
+	 * Initialize vDSO for CIA timer access.
+	 * CIAB is at physical address 0xBFD000.
+	 * Timer A registers: talo at +0x400, tahi at +0x500.
+	 */
+	m68k_vdso_set_timer_addr(CIAB_PHYSADDR, 0x600);
+
+	/* Calculate clocksource multiplier: mult = (10^9 << shift) / freq */
+	cs_mult = div_u64((1000000000ULL << CIA_CS_SHIFT) + amiga_eclock / 2,
+			  amiga_eclock);
+
+	m68k_vdso_init_clock(M68K_TIMER_CIA, jiffy_ticks, amiga_eclock,
+			     cs_mult, CIA_CS_SHIFT);
 }
 
 static u64 amiga_read_clk(struct clocksource *cs)
@@ -530,10 +562,16 @@ static u64 amiga_read_clk(struct clocksource *cs)
 
 	ticks = hi << 8 | lo;
 
-	if (ticks > jiffy_ticks / 2)
+	if (ticks > jiffy_ticks / 2) {
 		/* check for pending interrupt */
-		if (cia_set_irq(&ciab_base, 0) & CIA_ICR_TA)
+		if (cia_set_irq(&ciab_base, 0) & CIA_ICR_TA) {
 			clk_offset = jiffy_ticks;
+			/* Update vDSO so userspace sees consistent offset */
+			m68k_vdso_write_begin();
+			m68k_vdso_update_clock(clk_total, clk_offset);
+			m68k_vdso_write_end();
+		}
+	}
 
 	ticks = jiffy_ticks - ticks;
 	ticks += clk_offset + clk_total;
diff --git a/arch/m68k/kernel/vdso/vdso-clock.c b/arch/m68k/kernel/vdso/vdso-clock.c
index a65a55199..423dc3301 100644
--- a/arch/m68k/kernel/vdso/vdso-clock.c
+++ b/arch/m68k/kernel/vdso/vdso-clock.c
@@ -162,6 +162,14 @@ struct vdso_timespec {
 #define VIA_T1CL_OFFSET	0x0800	/* Timer 1 counter low byte */
 #define VIA_T1CH_OFFSET	0x0a00	/* Timer 1 counter high byte */
 
+/*
+ * CIA timer A register offsets within timer page.
+ * CIAB is at 0xBFD000, timer A regs at 0xBFD400/0xBFD500.
+ * Within the mapped page (starting at 0xBFD000), offsets are:
+ */
+#define CIA_TALO_OFFSET	0x0400	/* Timer A low byte */
+#define CIA_TAHI_OFFSET	0x0500	/* Timer A high byte */
+
 /* Get pointer to vvar page using PC-relative addressing */
 static inline struct m68k_vdso_data *get_vvar(void)
 {
@@ -213,6 +221,29 @@ static inline __u32 via_read_timer(volatile __u8 *timer_page)
 	return ((__u32)hi << 8) | lo;
 }
 
+/*
+ * Read CIA Timer A (both high and low bytes).
+ * The CIA 8520 timer can be read atomically by reading hi, lo, hi again.
+ * If hi changed, re-read lo to get a consistent value.
+ * Returns the full 16-bit counter value.
+ */
+static inline __u32 cia_read_timer(volatile __u8 *timer_page)
+{
+	__u8 hi, lo, hi2;
+
+	hi  = timer_page[CIA_TAHI_OFFSET];
+	lo  = timer_page[CIA_TALO_OFFSET];
+	hi2 = timer_page[CIA_TAHI_OFFSET];
+
+	/* If hi changed during read, lo may be stale - re-read it */
+	if (hi != hi2) {
+		lo = timer_page[CIA_TALO_OFFSET];
+		hi = hi2;
+	}
+
+	return ((__u32)hi << 8) | lo;
+}
+
 /*
  * Fallback to syscall for unsupported clocks or when vDSO data is invalid.
  */
@@ -290,9 +321,11 @@ int __vdso_clock_gettime64(int clk_id, struct vdso_timespec *ts)
 		cs_mult = vd->cs_mult;
 		cs_shift = vd->cs_shift;
 
-		/* Read hardware timer */
+		/* Read hardware timer based on type */
 		if (vd->timer_type == M68K_TIMER_VIA) {
 			timer_count = via_read_timer(timer_page);
+		} else if (vd->timer_type == M68K_TIMER_CIA) {
+			timer_count = cia_read_timer(timer_page);
 		} else {
 			/* Unknown timer type - fallback */
 			return clock_gettime_fallback(clk_id, ts);
-- 
2.51.0

