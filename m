Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB1A3CFF7F
	for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Apr 2026 12:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775823683; cv=none; b=NQKI+aMMXhcUSvDz432GClDQ5knvb0OT/7wkH3xvKSYaVZIKCL7to/f5DAljOaPog2ksGv55zIHEUDgWFrPBeYMAeHF78jP6Iid/D4VleHf/3eupgu3kCY3F+47OAvYtqaNQcpEeN3qvXqmsnHeQAt58JJeKRQ/UkcjLeJtsQrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775823683; c=relaxed/simple;
	bh=OPcZi/R5r87GvmWT5SIJxVBbPPoFFtvzuT/73U4xw6M=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=VL+26sMeaMYcU2BLi1Hq4hMGONtuw67lQDzMDg/RsvKW5vZxNzXtRnzGcqqt8+HFYGLivE2RG8IloLerXyF2Mfv5cSqLT8S7VrYKj3XQQkS+Us6GOPl1U4m4HLubBse6SxU9CGbOfGhA65Xw+dfKI+UAPfmZ2yS/63GN63ak/ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXK4IjII; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXK4IjII"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0543642A47;
	Fri, 10 Apr 2026 12:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC20C2BCAF;
	Fri, 10 Apr 2026 12:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823681;
	bh=OPcZi/R5r87GvmWT5SIJxVBbPPoFFtvzuT/73U4xw6M=;
	h=Date:From:To:Cc:Subject:References:From;
	b=nXK4IjIIYC4xFxjX1itXAh56E7vQfZ/FFg1BbCs9BTXZuysjAps9x9bTN1xwZq3nZ
	 nGcIQtUczMHcNVAOXl3hUPdL+RNfqdz89/sEUMpghyMK10SkqIQqjoKkLYlZIDgGQg
	 6k/60XarMgLYO/edAAklc4cY8bckLykp1FNwUtHWQrXz6RHvG4M2KbuAE5KrJ4anwq
	 KM/F3nJU8E8F/VqEi0tPDyEpicMuyuDi9K4xS5dK75o3zu+aRbSw7hWtA0AaEaHPPT
	 N9wVjGhL4hXB+rfUE/x4Qggo67acuAQqBh4RtUYL+MOxGvNcfvlrnmgwbgp5vSVReB
	 QZ733oHdFO0vw==
Date: Fri, 10 Apr 2026 14:21:19 +0200
Message-ID: <20260410120319.924028412@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 x86@kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>,
 iommu@lists.linux.dev,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org,
 Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org,
 David Woodhouse <dwmw2@infradead.org>,
 Bernie Thompson <bernie@plugable.com>,
 linux-fbdev@vger.kernel.org,
 "Theodore Tso" <tytso@mit.edu>,
 linux-ext4@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev@googlegroups.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>,
 linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 linux-openrisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
Subject: [patch 35/38] s390: Select ARCH_HAS_RANDOM_ENTROPY
References: <20260410120044.031381086@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

The only remaining non-architecture usage of get_cycles() is to provide
random_get_entropy().

Switch s390 over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
providing random_get_entropy() in asm/random.h.

Add 'asm/timex.h' includes to the relevant files, so the global include can
be removed once all architectures are converted over.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: linux-s390@vger.kernel.org
---
 arch/s390/Kconfig              |    1 +
 arch/s390/include/asm/random.h |   12 ++++++++++++
 arch/s390/include/asm/timex.h  |    6 ------
 arch/s390/kernel/time.c        |    1 +
 arch/s390/kernel/vtime.c       |    1 +
 5 files changed, 15 insertions(+), 6 deletions(-)

--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -108,6 +108,7 @@ config S390
 	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PTDUMP
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_RANDOM_ENTROPY
 	select ARCH_HAS_SCALED_CPUTIME
 	select ARCH_HAS_SET_DIRECT_MAP
 	select ARCH_HAS_SET_MEMORY
--- /dev/null
+++ b/arch/s390/include/asm/random.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_S390_RANDOM_H
+#define _ASM_S390_RANDOM_H
+
+#include <asm/timex.h>
+
+static inline unsigned long random_get_entropy(void)
+{
+	return (unsigned long)get_tod_clock_monotonic() >> 2;
+}
+
+#endif
--- a/arch/s390/include/asm/timex.h
+++ b/arch/s390/include/asm/timex.h
@@ -219,12 +219,6 @@ static inline unsigned long get_tod_cloc
 	return tod;
 }
 
-static inline cycles_t get_cycles(void)
-{
-	return (cycles_t)get_tod_clock_monotonic() >> 2;
-}
-#define get_cycles get_cycles
-
 /**
  * tod_to_ns - convert a TOD format value to nanoseconds
  * @todval: to be converted TOD format value
--- a/arch/s390/kernel/time.c
+++ b/arch/s390/kernel/time.c
@@ -50,6 +50,7 @@
 #include <asm/irq_regs.h>
 #include <asm/vtimer.h>
 #include <asm/stp.h>
+#include <asm/timex.h>
 #include <asm/cio.h>
 #include "entry.h"
 
--- a/arch/s390/kernel/vtime.c
+++ b/arch/s390/kernel/vtime.c
@@ -14,6 +14,7 @@
 #include <linux/time.h>
 #include <asm/alternative.h>
 #include <asm/cputime.h>
+#include <asm/timex.h>
 #include <asm/vtimer.h>
 #include <asm/vtime.h>
 #include <asm/cpu_mf.h>

