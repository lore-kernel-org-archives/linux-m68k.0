Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5052430CDB
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Jul 2026 19:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783451186; cv=none; b=mXOPezuQlD/Da5mbTHI0NR0GnwzrUuCUCfiLpjXX+27YBc32lvg1U+PQKj+3KKKyxpZorSIZUc/rTgOMWxk5vZQphjQWGBtTlh2PmJvOSaeP1p5n/zU6Gr66nUGuPEEDGElAJkbg948OT1stM6vfqyqtjq+GstYYI8A8u3uCRPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783451186; c=relaxed/simple;
	bh=ysPr6jr6XZIeyODky5nRl6TrszjrF+wONXSVXjJPKpY=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=kFaKW6PqxtyZ13YqDCfIite1QxrK6C1rm0m7em5/iMBQkiT3jSbqDbWHY7m/neOfalFh0ovlvEFWG7PUiCROYy/lsNmamwpoKpJdRvxJyT5a5zbOsv1zQ4drclgddzutMUyujf0DvdouMrInHVpSMcPK03cW0SSy2t/RaBbQVgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmy5NgtN; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmy5NgtN"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5EBE9601ED;
	Tue,  7 Jul 2026 19:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5D11F00A3D;
	Tue,  7 Jul 2026 19:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783451182;
	bh=FSz9R//tXkAkFf727Rcog7SX40mWm3WZD+GcFTZrqNo=;
	h=Date:From:To:Cc:Subject:References;
	b=jmy5NgtN1SD2HqwkVPG0TWkFN54TmdXj7T1HSJ0YKKwFEFYGJZgl0bxw21Z5Zw6gF
	 oLz0li+t91OzAxgXcJufOtcILCljJifd/dtqOAvAWgylV3Gsd2EQ0rLxbGfO01LU0j
	 fGSFcIN5CQo8Eb+XAIcZbFr1t/Rccy9Jg9VrEGxft5Y0XFjAFPmIVc5t+s4ruAoLPe
	 NXUZ3wSbTXF7v2pk2mNXgxKVbV69AzbsU6gyihCw7XUl2EEorcZSB4GwvDUCm+Y5ri
	 rE9qNujpevqvyyh40zbml6ST8aYSMsFvamJntu3IcdBj7uE8fU0k0BtndQzpUpA3fJ
	 QZRGwGblw5h8g==
Date: Tue, 07 Jul 2026 21:06:19 +0200
Message-ID: <20260707190253.974626922@kernel.org>
User-Agent: quilt/0.69
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org,
 Kees Cook <kees@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
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
Subject: [patch 06/18] riscv/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
References: <20260707181957.433213175@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

syscall_enter_from_user_mode_randomize_stack() replaces
syscall_enter_from_user_mode() and the subsequent invocation of
add_random_kstack_offset().

The advantage is that it applies the stack randomization right after
enter_from_user_mode() and thereby avoids the overhead of get/put_cpu_var()
as that code is invoked with interrupts disabled.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/kernel/traps.c |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -7,7 +7,6 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/irqflags.h>
-#include <linux/randomize_kstack.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/signal.h>
@@ -333,9 +332,7 @@ void do_trap_ecall_u(struct pt_regs *reg
 
 		riscv_v_vstate_discard(regs);
 
-		syscall = syscall_enter_from_user_mode(regs, syscall);
-
-		add_random_kstack_offset();
+		syscall = syscall_enter_from_user_mode_randomize_stack(regs, syscall);
 
 		if (syscall >= 0 && syscall < NR_syscalls) {
 			syscall = array_index_nospec(syscall, NR_syscalls);

