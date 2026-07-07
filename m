Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFFB3A5E6C
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Jul 2026 19:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783451191; cv=none; b=TwqDhFORyv5Doahu6DVUWUObb6cUFNvw2RBzrA4RZ11ySGAZmaZ7+P7QXjIjy/+/aCHhSNZTM7lfEtmwR2wVkU3oZCshiMyg9gZJ3nCBTL/2FxqhJdc1Mb5jwiHAM5Cd48oRCFJEF9StIx95B5bcB3nIGefFfXx9vfkXDKXp2wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783451191; c=relaxed/simple;
	bh=PYhMM85AzHjZdVZlu3JZJgIVicv/CXGGISuxXGgoBrA=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=gptNuFm+xbRf9fbiMXumEQmH6wfqeZO0jEEGsEY7gsLDbVxGWLMu5sBlzKJigd4YeDHw6+UcAkaCYkbYY7kO135AgZ6rF1rK1VZs/C9BShkldmScvTHEsUGKNVTnFNVHtCPyap94CUIuiSvOuI4kErRuurhrRfrq0sKyyQ8hOv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAQsikH3; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAQsikH3"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8777661385;
	Tue,  7 Jul 2026 19:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC491F000E9;
	Tue,  7 Jul 2026 19:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783451186;
	bh=EqhpiB2ZofNX2Hns8Xgz4OVDOubexQBaPatIimxnT/c=;
	h=Date:From:To:Cc:Subject:References;
	b=OAQsikH32zcXysH6hCjDCdC0GZdQsSYEYwKYLO4211wdV8Gx5U5QTVE1+P//2FXpn
	 uIqA0JY8lGaPQiDHJVOdRGZSp+QbqEjfTrKS3EEXVNmeOvIQBrVQEfC4uIvhb5uzt+
	 eT9i9M6+UlE8GQ+lRJyRHgkq+kITYoE5ZzhOkYUKb2PU4bWHESCf+nr7SFJdz6XhZt
	 2iGqe+3vU4x0dhlP0lRwEovJHlRUe0zFn5tWw2ueZ7uZSvdCbVVh6SrVwQHTuvbp8Z
	 nNfr1ROiFTyIDkK/ZvtATvAtmDATTdK6yv/sLVE04ZyzvrA9oLmxeUKMvdWrrAByna
	 52gUU2XWEgjgQ==
Date: Tue, 07 Jul 2026 21:06:23 +0200
Message-ID: <20260707190254.030598804@kernel.org>
User-Agent: quilt/0.69
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org,
 Kees Cook <kees@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
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
Subject: [patch 07/18] s390/syscall: Use
 enter_from_user_mode_randomize_stack()
References: <20260707181957.433213175@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

enter_from_user_mode_randomize_stack() replaces enter_from_user_mode() and
the subsequent invocation of add_random_kstack_offset_irqsoff().

As a bonus this avoids the overhead of get/put_cpu_var() in
add_random_kstack_offset().

No functional change.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: linux-s390@vger.kernel.org
---
 arch/s390/kernel/syscall.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/arch/s390/kernel/syscall.c
+++ b/arch/s390/kernel/syscall.c
@@ -97,8 +97,8 @@ void noinstr __do_syscall(struct pt_regs
 {
 	unsigned long nr;
 
-	enter_from_user_mode(regs);
-	add_random_kstack_offset();
+	enter_from_user_mode_randomize_stack(regs);
+
 	regs->psw = get_lowcore()->svc_old_psw;
 	regs->int_code = get_lowcore()->svc_int_code;
 	update_timer_sys();

