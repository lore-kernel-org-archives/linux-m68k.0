Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52163E2761
	for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Apr 2026 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775823673; cv=none; b=q11jgTNhS8xe2MuXjz8HnHy5in6yAGor2Ve2O1FX7/YeKNBLcK9WIJFGkuudA/ACi2jkUjm38x6uH6cvjxJLWSTx7yJG/lDCRmss74Mz7jaOJG9jw3+YxHoDmOtCRx53rIsLfMg/hgTSVbfJBgE7Nj1dLXsBfzPY2KopCRJFtYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775823673; c=relaxed/simple;
	bh=tpcbJjrROej8+Ep0S4yh9w/0viNOJRSIBsQtj9nrduE=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=OSe5lxjZEkqwrORILGnXO/0jjzUB80OCf5ulu9r1hE85Vb8Ilzk5lnJ6oIDEtlC1o/3Ynbw/ALQg5q5lHzFkfINJ9qtleQr/QNjrosUm5LwzxwRFSV/i+M2dabGt0i9yGwTQ6/wvZAMpGFZfuiF8HCxJHR0Yz4Opk7VyBPI6sTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+6BdojJ; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+6BdojJ"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E75043A9E;
	Fri, 10 Apr 2026 12:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4B2C2BC87;
	Fri, 10 Apr 2026 12:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823672;
	bh=tpcbJjrROej8+Ep0S4yh9w/0viNOJRSIBsQtj9nrduE=;
	h=Date:From:To:Cc:Subject:References:From;
	b=t+6BdojJde/UDdVdrSTxElEId1Y48xNZSVlMYQlGTL0WHNGFs3HWPQxpINyMlW0Tp
	 I6cN87TfGyJy1fhgMX3eHxGWXyIRGEfK+oj+v7ZqgSkuHT9TIqDSO48kfeefrr2R+6
	 RZvls6BOQPsjm5E39PGBUAxS3ybrYUwTjTmhDryNFYGgOGgmcHGql9J5M/vSFS9Dpm
	 Ps3dk0/gjV2/aMyaPlsNujNJN/7qos+7ycvHmAQEpnPn1tOePEJ6rKipC5ku3IQ4UE
	 ud6vC+9M6N71X0VBW7hJfjso4CmI7VrrHXujC0k5eBTPHkHx5czFPyyVnepx/5Zgc1
	 GRj7R63OiiEsA==
Date: Fri, 10 Apr 2026 14:21:09 +0200
Message-ID: <20260410120319.789114053@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org,
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
 Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
Subject: [patch 33/38] powerpc: Select ARCH_HAS_RANDOM_ENTROPY
References: <20260410120044.031381086@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

The only remaining usage of get_cycles() is to provide random_get_entropy().

Switch powerpc over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY
and providing random_get_entropy() in asm/random.h.

Remove asm/timex.h as it has no functionality anymore.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/Kconfig              |    1 +
 arch/powerpc/include/asm/random.h |   13 +++++++++++++
 arch/powerpc/include/asm/timex.h  |   21 ---------------------
 3 files changed, 14 insertions(+), 21 deletions(-)

--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -150,6 +150,7 @@ config PPC
 	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PTDUMP
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_RANDOM_ENTROPY
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX	if (PPC_BOOK3S || PPC_8xx) && !HIBERNATION
--- /dev/null
+++ b/arch/powerpc/include/asm/random.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_RANDOM_H
+#define _ASM_POWERPC_RANDOM_H
+
+#include <asm/cputable.h>
+#include <asm/vdso/timebase.h>
+
+static inline unsigned long random_get_entropy(void)
+{
+	return mftb();
+}
+
+#endif	/* _ASM_POWERPC_RANDOM_H */
--- a/arch/powerpc/include/asm/timex.h
+++ b/arch/powerpc/include/asm/timex.h
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_TIMEX_H
-#define _ASM_POWERPC_TIMEX_H
-
-#ifdef __KERNEL__
-
-/*
- * PowerPC architecture timex specifications
- */
-
-#include <asm/cputable.h>
-#include <asm/vdso/timebase.h>
-
-ostatic inline cycles_t get_cycles(void)
-{
-	return mftb();
-}
-#define get_cycles get_cycles
-
-#endif	/* __KERNEL__ */
-#endif	/* _ASM_POWERPC_TIMEX_H */

