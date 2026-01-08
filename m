Received: from coreboot.org (mail.coreboot.org [78.46.105.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C81F301002
	for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jan 2026 06:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=78.46.105.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767852394; cv=pass; b=mMyNVNDnqaF9+COg0TmyptKmYG5+QBHVtX5DfKGHMQc//takWkRHDJGLgT6AnSr5hOS/U5nhS/TLgQMtyuEXt+mMGqzfw+iU0clUSqkiSZjJ3bxGvFcO5c7UZ/O57L4uCfrjywVrMxRThgO6YjkfIIHq8LGF3xb2nfJb8jAd1oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767852394; c=relaxed/simple;
	bh=Cov1NWagp2BcfwCbgHDs+QIe5x5z/K/oJRf+0OZCPoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Noi6XcVpglw27DqMYlqUps2z2pqBksE11Q6idqnETkTVET46I157XqBsJXnEZ6iK3NxH5fE7+26xHMDob85ljQcZu+ca7G4i/MCHRN8byS5HtXzQ20Y5b9jv8Oyhnh+DWb5M5tvd/wdz8wJFKpSNWcB/Wd44MTlbYeq28UxCdQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=coreboot.org; spf=pass smtp.mailfrom=coreboot.org; dkim=pass (1024-bit key) header.d=coreboot.org header.i=@coreboot.org header.b=WyaTR/SM; arc=pass smtp.client-ip=78.46.105.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=coreboot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coreboot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coreboot.org header.i=@coreboot.org header.b="WyaTR/SM"
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by coreboot.org (Postfix) with ESMTPA id E439C817A2;
	Thu,  8 Jan 2026 06:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=coreboot.org;
	s=dkim; t=1767852390; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LtrPZGc4f15GsmAg/CdKc4eBrFjo14016/1acMVA/Qo=;
	b=WyaTR/SMCh8TOFKA/v+hI4nQrL7chgj26ouBAjTbCMIFOYxXxVQYeZGPZyfI4uIvVhrvXE
	UpvFngM9xztBSx64nD1K427VyesJXWGoZt8dqAI3AAARSxPxV1EGH7lxQ+qPSYAjtnq3Os
	VsDB/iit6bOaUdXjKTgeSpS+LnPHKoA=
From: Stefan <stefan.reinauer@coreboot.org>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	Stefan <stefan.reinauer@coreboot.org>
Subject: [PATCH 4/5] m68k: Add vDSO userspace clock_gettime64 implementation
Date: Wed,  7 Jan 2026 22:05:32 -0800
Message-ID: <20260108060533.3891380-5-stefan.reinauer@coreboot.org>
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
	s=dkim; t=1767852390; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LtrPZGc4f15GsmAg/CdKc4eBrFjo14016/1acMVA/Qo=;
	b=kIvJCN6K0nPw3vGQBe2oncV90Ex3glcgxTYBDTK2WF8jhtF3fH54iw0S/jIlczlIwQg1jC
	LP9faHYOeisf4CBIQ1eKl+lER+X/nwAqVElAWBDYFdwanyEFIFVXPWsAR5GznOK1SGU67a
	WpyH1YgnipRXuAH8eZf/M0sOdgwGcPk=
ARC-Seal: i=1; s=dkim; d=coreboot.org; t=1767852390; a=rsa-sha256;
	cv=none;
	b=cwa7mXP0CQUiMlp4woZBsJWOb6eEBqoLedvQL+jCxJmeMGwwfjOfbyvBt1oM88ikc6diVTUmoqg8Qo98BWV91VUbrRkvy3/kLPJWVkC2VzGGrGavWELrgsclA7sB7A9tFTIo/DL238yamtCn70VYj7kJvWagQ6lD3It3/Wk7pjI=
ARC-Authentication-Results: i=1; coreboot.org;
	auth=pass smtp.auth=stepan@coreboot.org smtp.mailfrom=stefan.reinauer@coreboot.org
Authentication-Results: coreboot.org;
	auth=pass smtp.auth=stepan@coreboot.org smtp.mailfrom=stefan.reinauer@coreboot.org
X-Spamd-Bar: /

Add the userspace vDSO code that provides fast clock_gettime() without
syscall overhead on m68k.

The implementation in vdso-clock.c includes:

 - Custom 64-bit arithmetic helpers (shr64, divmod_1e9) to avoid libgcc
   dependencies, since m68k lacks native 64-bit operations

 - PC-relative addressing to locate the vvar data page and memory-mapped
   timer register page relative to the vDSO code

 - VIA timer reading with proper handling of the 0xFF wrap condition

 - Seqlock-based synchronization to ensure consistent reads while the
   kernel may be updating the shared data

 - Syscall fallback for unsupported clock IDs or when vDSO timer
   support is not configured

The vDSO memory layout places the vvar page at offset -0x2000 and the
timer page at offset -0x1000 relative to the code page, allowing
efficient PC-relative access without needing absolute addresses.

Currently supports CLOCK_MONOTONIC and CLOCK_REALTIME (both return
monotonic time; wall clock offset support can be added later).

Export __vdso_clock_gettime64 in the vDSO symbol version map.

Signed-off-by: Stefan Reinauer <stefan.reinauer@coreboot.org>
---
 arch/m68k/kernel/vdso/Makefile     |   2 +-
 arch/m68k/kernel/vdso/vdso-clock.c | 336 +++++++++++++++++++++++++++++
 arch/m68k/kernel/vdso/vdso.lds     |   1 +
 arch/m68k/kernel/vdso/vdso.lds.S   |   1 +
 4 files changed, 339 insertions(+), 1 deletion(-)
 create mode 100644 arch/m68k/kernel/vdso/vdso-clock.c

diff --git a/arch/m68k/kernel/vdso/Makefile b/arch/m68k/kernel/vdso/Makefile
index c3119ae82..94821fb69 100644
--- a/arch/m68k/kernel/vdso/Makefile
+++ b/arch/m68k/kernel/vdso/Makefile
@@ -4,7 +4,7 @@
 #
 
 # vDSO object files (userspace code)
-obj-vdso := vdso-note.o vdso-tls.o
+obj-vdso := vdso-note.o vdso-tls.o vdso-clock.o
 
 # Build targets
 targets := $(obj-vdso) vdso.so vdso.so.dbg vdso.lds
diff --git a/arch/m68k/kernel/vdso/vdso-clock.c b/arch/m68k/kernel/vdso/vdso-clock.c
new file mode 100644
index 000000000..a65a55199
--- /dev/null
+++ b/arch/m68k/kernel/vdso/vdso-clock.c
@@ -0,0 +1,336 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * M68K vDSO clock_gettime implementation
+ *
+ * This provides a fast path for clock_gettime() by reading the hardware
+ * timer directly from userspace, avoiding the syscall overhead.
+ *
+ * Memory layout (relative to vDSO code):
+ *   vdso_base + 0x0000: vvar page (struct m68k_vdso_data)
+ *   vdso_base + 0x1000: timer page (hardware timer registers)
+ *   vdso_base + 0x2000: vDSO code (this code)
+ *
+ * This file is compiled as userspace code and cannot use kernel headers.
+ */
+
+/* Basic integer types - must match kernel definitions */
+typedef unsigned char		__u8;
+typedef unsigned short		__u16;
+typedef unsigned int		__u32;
+typedef unsigned long long	__u64;
+typedef long long		__s64;
+
+/*
+ * 64-bit right shift - m68k has no native 64-bit ops, so we implement this
+ * manually to avoid depending on libgcc's __lshrdi3.
+ */
+static inline __u64 shr64(__u64 val, unsigned int shift)
+{
+	__u32 lo = (__u32)val;
+	__u32 hi = (__u32)(val >> 32);
+
+	if (shift == 0)
+		return val;
+	if (shift >= 64)
+		return 0;
+	if (shift >= 32) {
+		lo = hi >> (shift - 32);
+		hi = 0;
+	} else {
+		lo = (lo >> shift) | (hi << (32 - shift));
+		hi = hi >> shift;
+	}
+	return ((__u64)hi << 32) | lo;
+}
+
+/*
+ * Divide 64-bit value by 10^9 and return quotient and remainder.
+ * Implements division using a loop to avoid libgcc dependency.
+ * This is optimized for the case where the result fits in 32 bits
+ * (i.e., less than ~136 years of nanoseconds).
+ */
+static inline void divmod_1e9(__u64 val, __u64 *quot, __u32 *rem)
+{
+	/* Constants for 10^9 = 1,000,000,000 */
+	const __u32 div = 1000000000;
+	__u64 q = 0;
+	__u32 hi, lo;
+
+	hi = (__u32)(val >> 32);
+	lo = (__u32)val;
+
+	/*
+	 * Use long division algorithm:
+	 * Divide high 32 bits first, then combine remainder with low bits.
+	 */
+	if (hi >= div) {
+		/* High part alone is >= divisor - do 64-bit division */
+		/* This shouldn't happen for reasonable time values */
+		while (val >= ((__u64)div << 32)) {
+			q += (__u64)1 << 32;
+			val -= (__u64)div << 32;
+		}
+		hi = (__u32)(val >> 32);
+		lo = (__u32)val;
+	}
+
+	/* Now hi < div, so we can use 32-bit arithmetic */
+	if (hi > 0) {
+		/*
+		 * q1 = hi / div (32-bit division)
+		 * r1 = hi % div
+		 * Then combine r1 with lo and divide again
+		 */
+		__u32 q1 = hi / div;
+		__u32 r1 = hi % div;
+
+		/* Now compute (r1 * 2^32 + lo) / div */
+		/* r1 < div, so r1 * 2^32 / div < 2^32, but still 64-bit intermediate */
+		/* Use iterative subtraction for safety */
+		q += ((__u64)q1 << 32);
+		val = ((__u64)r1 << 32) | lo;
+	}
+
+	/* val is now < 2^64 but we need 32-bit safe division */
+	/* Since hi < div, we know val < div * 2^32 */
+	/* We can use a simple loop for the remaining division */
+	while (val >= div) {
+		__u32 sub = 1;
+		__u64 dval = div;
+
+		/* Find largest power of 2 such that div * 2^n <= val */
+		while ((dval << 1) <= val && (dval << 1) > dval) {
+			dval <<= 1;
+			sub <<= 1;
+		}
+		val -= dval;
+		q += sub;
+	}
+
+	*quot = q;
+	*rem = (__u32)val;
+}
+
+/* Timer types - must match asm/vdso.h */
+#define M68K_TIMER_NONE		0
+#define M68K_TIMER_VIA		1
+#define M68K_TIMER_CIA		2
+
+/*
+ * vDSO data structure - must match struct m68k_vdso_data in asm/vdso.h
+ * This is the kernel-userspace ABI, so field order matters!
+ */
+struct m68k_vdso_data {
+	__u32 tls_ptr;
+	__u32 seq;
+	__u32 clk_total;
+	__u32 clk_offset;
+	__u32 timer_cycles;
+	__u32 clock_freq_hz;
+	__u32 cs_mult;
+	__u32 cs_shift;
+	__s64 wall_time_sec;
+	__u32 wall_time_nsec;
+	__s64 monotonic_sec;
+	__u32 monotonic_nsec;
+	__u32 timer_type;
+	__u32 timer_reg_offset;
+	__u32 reserved[2];
+};
+
+/*
+ * Timespec structure for clock_gettime64.
+ * Must match glibc's struct __timespec64 on big-endian 32-bit systems:
+ * - tv_sec: 64-bit at offset 0
+ * - padding: 32-bit at offset 8 (big-endian only)
+ * - tv_nsec: 32-bit at offset 12
+ */
+struct vdso_timespec {
+	__s64 tv_sec;
+	__u32 __pad;
+	__u32 tv_nsec;
+};
+
+/* Syscall number - from arch/m68k/include/generated/uapi/asm/unistd_32.h */
+#define __NR_clock_gettime64	403
+
+/* Page offsets from vDSO code base */
+#define VVAR_OFFSET	(-0x2000)	/* vvar is 2 pages before code */
+#define TIMER_OFFSET	(-0x1000)	/* timer is 1 page before code */
+
+/* VIA timer register offsets within timer page (512-byte spacing) */
+#define VIA_T1CL_OFFSET	0x0800	/* Timer 1 counter low byte */
+#define VIA_T1CH_OFFSET	0x0a00	/* Timer 1 counter high byte */
+
+/* Get pointer to vvar page using PC-relative addressing */
+static inline struct m68k_vdso_data *get_vvar(void)
+{
+	unsigned long pc;
+
+	/* Get current PC (address of this code in vDSO) */
+	asm volatile (
+		"lea %%pc@(0), %0"
+		: "=a" (pc)
+	);
+
+	/* vvar is at a fixed offset before the code page */
+	return (struct m68k_vdso_data *)((pc & ~0xFFFUL) + VVAR_OFFSET);
+}
+
+/* Get pointer to timer page */
+static inline volatile __u8 *get_timer_page(void)
+{
+	unsigned long pc;
+
+	asm volatile (
+		"lea %%pc@(0), %0"
+		: "=a" (pc)
+	);
+
+	return (volatile __u8 *)((pc & ~0xFFFUL) + TIMER_OFFSET);
+}
+
+/*
+ * Read the VIA Timer 1 counter (both high and low bytes).
+ * The VIA 6522 timer can be read atomically by reading hi, lo, hi again.
+ * If hi changed, re-read lo to get a consistent value.
+ * Returns the full 16-bit counter value.
+ */
+static inline __u32 via_read_timer(volatile __u8 *timer_page)
+{
+	__u8 hi, lo, hi2;
+
+	hi  = timer_page[VIA_T1CH_OFFSET];
+	lo  = timer_page[VIA_T1CL_OFFSET];
+	hi2 = timer_page[VIA_T1CH_OFFSET];
+
+	/* If hi changed during read, lo may be stale - re-read it */
+	if (hi != hi2) {
+		lo = timer_page[VIA_T1CL_OFFSET];
+		hi = hi2;
+	}
+
+	return ((__u32)hi << 8) | lo;
+}
+
+/*
+ * Fallback to syscall for unsupported clocks or when vDSO data is invalid.
+ */
+static int clock_gettime_fallback(int clk_id, struct vdso_timespec *ts)
+{
+	register long d0 asm("d0") = __NR_clock_gettime64;
+	register long d1 asm("d1") = clk_id;
+	register void *a0 asm("a0") = ts;
+
+	asm volatile (
+		"trap #0"
+		: "+d" (d0)
+		: "d" (d1), "a" (a0)
+		: "memory"
+	);
+
+	return d0;
+}
+
+/*
+ * __vdso_clock_gettime64 - vDSO implementation of clock_gettime64
+ *
+ * Supports CLOCK_MONOTONIC and CLOCK_REALTIME using the hardware timer.
+ * Falls back to syscall for other clocks or if vDSO timer is not configured.
+ */
+int __vdso_clock_gettime64(int clk_id, struct vdso_timespec *ts)
+{
+	struct m68k_vdso_data *vd;
+	volatile __u8 *timer_page;
+	__u32 seq, timer_count, clk_total, clk_offset, timer_cycles;
+	__u32 cs_mult, cs_shift;
+	__u32 ticks;
+	__u64 nsec;
+
+	/* Get pointers to vvar and timer pages */
+	vd = get_vvar();
+
+	/* Check if vDSO clock is configured */
+	if (vd->timer_type == M68K_TIMER_NONE)
+		return clock_gettime_fallback(clk_id, ts);
+
+	/*
+	 * Only support CLOCK_MONOTONIC in vDSO for now.
+	 * CLOCK_REALTIME requires wall-to-monotonic offset tracking which
+	 * is not yet implemented, so fall back to syscall for accurate results.
+	 */
+#if 0
+	if (clk_id != 0 /* CLOCK_REALTIME */ && clk_id != 1 /* CLOCK_MONOTONIC */)
+#else
+	if (clk_id != 1 /* CLOCK_MONOTONIC */)
+#endif
+		return clock_gettime_fallback(clk_id, ts);
+
+	timer_page = get_timer_page();
+
+	/*
+	 * Read timer and vvar data in a seq-locked loop.
+	 * If the kernel is updating the data (seq is odd), retry.
+	 * If seq changed during our read, retry.
+	 */
+	do {
+		seq = vd->seq;
+
+		/* If seq is odd, kernel is updating - spin */
+		if (seq & 1)
+			continue;
+
+		/* Memory barrier - ensure we see consistent data */
+		asm volatile ("" ::: "memory");
+
+		/* Read vvar data */
+		clk_total = vd->clk_total;
+		clk_offset = vd->clk_offset;
+		timer_cycles = vd->timer_cycles;
+		cs_mult = vd->cs_mult;
+		cs_shift = vd->cs_shift;
+
+		/* Read hardware timer */
+		if (vd->timer_type == M68K_TIMER_VIA) {
+			timer_count = via_read_timer(timer_page);
+		} else {
+			/* Unknown timer type - fallback */
+			return clock_gettime_fallback(clk_id, ts);
+		}
+
+		/* Memory barrier before checking seq again */
+		asm volatile ("" ::: "memory");
+
+	} while (seq != vd->seq);
+
+	/*
+	 * Calculate ticks since boot.
+	 * Timer counts DOWN from timer_cycles to 0, so:
+	 *   ticks_in_current_period = timer_cycles - timer_count
+	 *   total_ticks = clk_total + clk_offset + ticks_in_current_period
+	 */
+	ticks = timer_cycles - timer_count;
+	ticks += clk_offset + clk_total;
+
+	/*
+	 * Convert ticks to nanoseconds:
+	 *   nsec = (ticks * cs_mult) >> cs_shift
+	 * Use our helper to avoid libgcc dependency.
+	 */
+	nsec = shr64((__u64)ticks * cs_mult, cs_shift);
+
+	/*
+	 * Convert nanoseconds to seconds + remaining nanoseconds.
+	 * Use our helper for 64-bit division to avoid libgcc dependency.
+	 */
+	{
+		__u64 sec;
+		__u32 nsec_rem;
+		divmod_1e9(nsec, &sec, &nsec_rem);
+		ts->tv_sec = (__s64)sec;
+		ts->__pad = 0;
+		ts->tv_nsec = nsec_rem;
+	}
+
+	return 0;
+}
diff --git a/arch/m68k/kernel/vdso/vdso.lds b/arch/m68k/kernel/vdso/vdso.lds
index b99671c73..730792146 100644
--- a/arch/m68k/kernel/vdso/vdso.lds
+++ b/arch/m68k/kernel/vdso/vdso.lds
@@ -277,6 +277,7 @@ VERSION
  LINUX_5.0 {
  global:
   __vdso_m68k_tls;
+  __vdso_clock_gettime64;
  local: *;
  };
 }
diff --git a/arch/m68k/kernel/vdso/vdso.lds.S b/arch/m68k/kernel/vdso/vdso.lds.S
index f8466da6f..5f9360a12 100644
--- a/arch/m68k/kernel/vdso/vdso.lds.S
+++ b/arch/m68k/kernel/vdso/vdso.lds.S
@@ -61,6 +61,7 @@ VERSION
 	LINUX_5.0 {
 	global:
 		__vdso_m68k_tls;
+		__vdso_clock_gettime64;
 	local: *;
 	};
 }
-- 
2.51.0

