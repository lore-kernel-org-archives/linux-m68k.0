Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078AD3E5A2F
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Jul 2026 19:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783451181; cv=none; b=ri7EuodHqo7nDGuyK4ZW2R3Ii5jR5zrO28zjKT47uWPALmD90As/fjFXbfbjyGAZBxW9ARab1f4bEDi59CsGdANUkPNzLWOX4Y46fiy3XS4rIKboNY6ELJgtj5NvJYaGE2KpxX5uueAHBmPo92HwoLcqJfiXNPA+48l+0nVeboE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783451181; c=relaxed/simple;
	bh=sal912FX10mEEdn6Oo/dvcWP02bURNYRJM01yX8XZQ0=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=D8yoGVmt9InmMgALLutRQz+pTYfEKqM44LuV5lEkiv1djMj+0geGNYxYSL9i9SvuqmNUDxaOCP2uFg1jdkdPwwLHXizAjsg3nCVliVLO0DJgW+TIKALErQTelBNSJCx3/na3SLHwtPbboZrCaIWQYz1bDhtSF1RCFIncpfrxMAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJaRZSNF; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJaRZSNF"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C56B601EC;
	Tue,  7 Jul 2026 19:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E0D1F00A3A;
	Tue,  7 Jul 2026 19:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783451177;
	bh=bqcx1niI7ioy3DW+/gZQ2MbLYJEE35hyG+fCdizbDSo=;
	h=Date:From:To:Cc:Subject:References;
	b=aJaRZSNFmGdCFvruVG7x5xRrvggSIGN0GND+eCq7/up7llJN2RLb5yTt7nKiF5bMl
	 dDjbHacdEwTpP5I1/lusznloh2jALXKsApluk4rrQ6UjQSVw3qYVOOw6/ktRrDvDFv
	 6mM4CdAeBuHePM8toFrWSjVi5vf12es33TiR0Erbaqy0+HMgOhtPrzfLuSaVmJcBBf
	 Qwx11aY+YPFSRPD5t62E+zU8M90fmxRE9JPIpsU8ZmTyzhptaz9i1jNQWCYVnDIzEX
	 +BqGBqk3JLQ87YaLjGkYNumyEdOthBs5KZUcJ25lEB3+VQ9NuYSR6XQbeSkS9Uk7wj
	 gTZuo3rzjPU7w==
Date: Tue, 07 Jul 2026 21:06:15 +0200
Message-ID: <20260707190253.918861529@kernel.org>
User-Agent: quilt/0.69
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org,
 Kees Cook <kees@kernel.org>,
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
Subject: [patch 05/18] powerpc/syscall: Use
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
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/kernel/syscall.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -2,7 +2,6 @@
 
 #include <linux/compat.h>
 #include <linux/context_tracking.h>
-#include <linux/randomize_kstack.h>
 #include <linux/entry-common.h>
 
 #include <asm/interrupt.h>
@@ -19,8 +18,7 @@ notrace long system_call_exception(struc
 	long ret;
 	syscall_fn f;
 
-	r0 = syscall_enter_from_user_mode(regs, r0);
-	add_random_kstack_offset();
+	r0 = syscall_enter_from_user_mode_randomize_stack(regs, r0);
 
 	if (unlikely(r0 >= NR_syscalls)) {
 		if (unlikely(trap_is_unsupported_scv(regs))) {

