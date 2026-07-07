Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE6E3AB480
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Jul 2026 19:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783451171; cv=none; b=u5Xv8yvSvIEv8iuF8o2FOkl2AtPe8lPKAYgQ4R6/s6fE5QQk67Y3IAiWr4Hz4DFcgvBUtG2PZlMI2B+du3SXOkveoDxCVvuIAzwn3NUVQlXWKCGfi86dUEwHZEBC5IbeK0Hjd2VTr7pqaUB13FGUXiR0yVstnGXWhMV1GRcJL7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783451171; c=relaxed/simple;
	bh=qrUDMK+tO0td1M+9uTSBVbuTLyMfyy+qTZirrEP77uU=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=cogOp02aqt2mR3BFU6pJ6mG0aVQ/C/CrsAgLiuA7eedfUAAxrD0AgryRd1eA7OPg9RSbj1rTxyOtxXBtN494uNcQCyHFnINvarzmfI8UngUckEBZZRzpGGGP6ws6YLBP8dbgplCkeCYFz8vWn753BbmXJpSYChKOgfIsOcs3lac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kyf4FHpF; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kyf4FHpF"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A2DD86138A;
	Tue,  7 Jul 2026 19:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836131F00A3A;
	Tue,  7 Jul 2026 19:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783451165;
	bh=On6NfRZNP83GQAwWkJi2QY5gy7RW6c7PPEtomv7P1Dc=;
	h=Date:From:To:Cc:Subject:References;
	b=Kyf4FHpFsIS+Ydmvpd4dDjaw6LA3z5qA3tk9jQCRiEW5qX1inNO9gy7FOgieh3baY
	 hYOJJlHaPUBmLHJ7GT1+snJJu9GDe/I9LBY8DO5JtbHEjuAUTNBhEUGadk4Jt3mT6M
	 jfM460+qa8cBdINqLxhonst5REsB87hmc78d5eqMEOoD5gBYWK0lJNv1XzAl9UsuvK
	 VcyLhfQ5RZnjt+w12lkO4zxWbhBNKXx+std7IviKWtj5txrPrCsYKXUlRXGm9L5b6C
	 x3lWCb9/6igNz1lMUWNia6Ofl2ESSU4en1Tc99OlWes1QnxVBl0HIc9O5ffHHzCd75
	 Lv0AL/D7KjB7Q==
Date: Tue, 07 Jul 2026 21:06:02 +0200
Message-ID: <20260707190253.768842729@kernel.org>
User-Agent: quilt/0.69
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Kees Cook <kees@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 x86@kernel.org,
 Mark Rutland <mark.rutland@arm.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>,
 Andy Lutomirski <luto@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Helge Deller <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Weinberger <richard@nod.at>,
 Chris Zankel <chris@zankel.net>,
 linux-arm-kernel@lists.infradead.org,
 linux-alpha@vger.kernel.org,
 linux-csky@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <vgupta@kernel.org>,
 Will Deacon <will@kernel.org>,
 Brian Cain <bcain@kernel.org>,
 Michal Simek <monstr@monstr.eu>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>,
 linux-snps-arc@lists.infradead.org,
 linux-hexagon@vger.kernel.org,
 linux-openrisc@vger.kernel.org,
 sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: [patch 02/18] randomize_kstack: Provide
 add_random_kstack_offset_irqsoff()
References: <20260707181957.433213175@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

add_random_kstack_offset() uses get/put_cpu_var() which is pointless
overhead when it is invoked from low level entry code with interrupts
disabled.

Provide a irqsoff() variant, which avoids that.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Kees Cook <kees@kernel.org>
---
 include/linux/randomize_kstack.h |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

--- a/include/linux/randomize_kstack.h
+++ b/include/linux/randomize_kstack.h
@@ -77,8 +77,27 @@ static __always_inline u32 get_kstack_of
 	}								\
 } while (0)
 
+/**
+ * add_random_kstack_offset_irqsoff - Increase stack utilization by a random offset.
+ *
+ * This should be used in the syscall entry path after user registers have been
+ * stored to the stack. Interrupts must be still disabled.
+ */
+#define add_random_kstack_offset_irqsoff()					\
+do {										\
+	lockdep_assert_irqs_disabled();						\
+	if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,		\
+				&randomize_kstack_offset)) {			\
+		u32 offset = prandom_u32_state(raw_cpu_ptr(&kstack_rnd_state));	\
+		u8 *ptr = __kstack_alloca(KSTACK_OFFSET_MAX(offset));		\
+		/* Keep allocation even after "ptr" loses scope. */		\
+		asm volatile("" :: "r"(ptr) : "memory");			\
+	}									\
+} while (0)
+
 #else /* CONFIG_RANDOMIZE_KSTACK_OFFSET */
 #define add_random_kstack_offset()		do { } while (0)
+#define add_random_kstack_offset_irqsoff()	do { } while (0)
 #endif /* CONFIG_RANDOMIZE_KSTACK_OFFSET */
 
 #endif

