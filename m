Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571350;
	b=GQbOHeWonYwJQxHK2RrIVMqoDX8EGYYhuDzure7CcBV0rU0Z+grvoZKkCcYysDnAQyPx
	 FhXqHHoThx805Us7upAaLy/+0qsis8dt7ldN87uFuOxYMeH03P8cPaWObv6ankiLsDHw+
	 2IZo99vRiZEDEwOUKPaMfxKQ0+T4Kcx7/nBSfvtCbVo9A4yl7lFdBUP6DIyxG94pvM428
	 bmoj1HkDKIx7rs9pvtCE8uRmf/2f82hqatpGI/Vzo7NlheDbvSSrIPDM+jQFPBec4aNCV
	 eDsbwR7Zwjp5PWzEOAzoRwuq9dT2xwxWrlBnWK89JQezajIJ6x97ZtJg+NMMs51V/oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ObqOZxAlfLiw3L36aCRuRKfWllcmuJhnADCFOCSYZA8=;
	b=THjvqYamSNdMdN0GFngDs1lrtRzkvuKPIoRtJiFURA0dASimzROnfF0qou7NLSFKOQv0
	 WukP5eBiUBidKEUngv8ptA/V495oIg9FO2LDPvscQ0kFk4Sy1UiY1A5aSj0dFdU1A+RMo
	 Kp7FurM/uLCPm7NwV0yFyv17OBK8j3c4qqI15YHW7MHPrUWUEBdNQsZOgUr7h3ZsVzVmS
	 u2qMtzWPjmZWUVuXT604whXOQyKFcx2oi8LqouNccZlk1JrJ3zEZV8JJQf7SselNy6ITl
	 GDB5Z9eaKkFOVkaY89gpnhMj7VqhDGJ1v62kuUZS7Bwb4m0tCWWV3iRYdpdoe3QUxlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=RjPI4vun;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577EF606A326
	for <linux-m68k@lists.linux-m68k.org>; Wed, 25 Nov 2026 01:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 577EF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=RjPI4vun
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a070755c8cso2500441b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Nov 2026 17:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795571348; x=1796176148; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObqOZxAlfLiw3L36aCRuRKfWllcmuJhnADCFOCSYZA8=;
        b=RjPI4vunrk0KbFNA2iArXqwzdnrlfjPu37vryS499cgC42lL/7rs+sQ+HHxFRxxVy+
         gTEF/C3Kv92V8T05fZSAQxS0fnIGd3M6qUz/1HSyKiocxd4a0fnU0x6imvaoz7BBCobS
         VOg6qfiPCSzRZ9ndj3YMVew2ej6hLOWPthHZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795571348; x=1796176148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObqOZxAlfLiw3L36aCRuRKfWllcmuJhnADCFOCSYZA8=;
        b=hbI2SccBuFaDeWIiAo6X8AG9hQmBAz4Gb+NfvHyZ7Q9Py9KDcLMq+YE4TOsJXJgznI
         Ya3RNCmRQs8YcEMjhK6hUEefcxzFMf+dS2UeaqMr6iWuep+YpdNgc9g6ggskVKasgkF4
         p9qJtK6o/e+ti24KZ7cvQFkuheY2U3U+gUaPFpUokqOZb54+uPPFHtqHsPz1D6cuVRQL
         00mGntksnzz2tm98zUrJz3GCoRGjqeKQLGVJKbC9KZXg4Wrxedvx9Cwcl/KJq2uZcaJD
         P6R3s4D4pyysna+ip+I64IBv2lnXX8yWWvPfWWG8tMktkO/xo3IlWFZudHEqYpX6zGBm
         1hYQ==
X-Forwarded-Encrypted: i=1; AL+hErE9HRWLuBSnTrWkXfgoh7YNrdqnSkh8Xskc3bYRWO6/gpRYM6VrQduUi5kIo3MFfNjMCjndST+89mj6@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z9CipS6K49fxmB/VlS4rX0i3+0TXD47Dk3XytvYEh12ZIsS2g/i
	lZKt/2v6qyOxa1IIkzUj2hc3roncocgzy1F1J4X/MzTXotNJDSZABz5JF0lNw9tTUrw=
X-Gm-Gg: AZFdTZcDjNfEC0t1kGOUIXO0z3ntUy72oQDwjUOv5qpf3qDcLR1Cmf95lK/m4JOJExm
	S8FLoeiwv48U+BUA7fkSvde9HHGtx0WAmPwxuqVTHWImjxY5fTB11X1zDBpRKmg9hYuE7aGzgHN
	uYiA2TEtDNRWE8I3KYymf0SyUEBZbyCF6acVXPiu9w8kfq+iMd3KAxkzhL4hdK4h0dvKJI/COVQ
	7rXGRhbvufIoTps+/Q8vWCH2jCLYuRwKp2k72atldgtebR1tjtJnTtF2ofSIrvS1VCFDRIKHXg9
	imrBmFRoE295PkyH4PGGn5TeWQ3O0fRcBb1jAGlC+mPMs2NeL5//sGC0LxlpMnk+YTCvRjC7maf
	nZkT1hnli29GlJj883EUdEJ5jPZG9MEN/oYp+OET5hLj1XxVbOeC+cCK3TCtqfvgX97wDh9dLah
	pP4SsaVfNhVOz+QhZCDH6QNDyXmEDLI053Hf/ASAPJsFdUVAACXdy2XJxjT2eD3lpxpvDLBsSUm
	nvHYXkcqvyH9UK5ggpJPeqQAbes0W20653r+2MFts4VU3GTq0cW9FVfTSx2OQFH7Q/w+219qwLg
	z8veGRboKV62LXsch3aDwd5lpDBLQUchcKtHEK2CF+Coo8kaFwemRY6WOY6rHpLfi9z+ID8=
X-Received: by 2002:a05:6a00:2d06:b0:8a8:5b84:4c04 with SMTP id d2e1a72fcca58-8c87c95bd39mr14220491b3a.38.1795571348479;
        Tue, 24 Nov 2026 17:49:08 -0800 (PST)
Received: from shiro (p1721212-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.166.141.212])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-8c87343f571sm7739226b3a.34.2026.11.24.17.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 17:49:07 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	gerg@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2] m68k: Define the m68k-specific syscalls with SYSCALL_DEFINE
Date: Wed, 25 Nov 2026 10:47:37 +0900
Message-ID: <20261125014737.2421722-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On m68k a syscall handler's stack arguments are the user's registers
saved in pt_regs, and RESTORE_ALL reloads them on the way out. The C
ABI lets a function reuse its incoming argument slots, so anything the
handler writes there ends up in user space. SYSCALL_DEFINEn() stops
the compiler doing that with asmlinkage_protect(), but sys_mmap2() and
the other m68k-specific syscalls are plain asmlinkage functions.

With GCC 16 and a kernel built with -O2, sys_mmap2() becomes a tail
call to ksys_mmap_pgoff(), which builds its call to vm_mmap_pgoff() by
shifting its arguments up one slot in place. User space gets d2-d5
back holding addr/len/prot/flags.

This issue was noticed in nolibc programs that are using mmap() and
I initially thought nolibc's m68k support was to blame.

Define sys_mmap2(), sys_cacheflush(), sys_atomic_cmpxchg_32() and
sys_set_thread_area() with SYSCALL_DEFINEn() so their arguments are
protected, and make their prototypes in asm/syscalls.h return long to
match. sys_atomic_cmpxchg_32() gets an additional small logic change
to fix how it gets pt_regs as the hack it currently uses is no longer
valid since its code is wrapped in an outer function by
__SYSCALL_DEFINEx().

For consistency sys_getpagesize(), sys_get_thread_area() and
sys_atomic_barrier() get SYSCALL_DEFINE0() even though they don't
technically need it. The generated code doesn't change.

Fixes: a90f590a1bee ("mm: add ksys_mmap_pgoff() helper; remove in-kernel calls to sys_mmap_pgoff()")
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---

v2:
- Added a fix to sys_atomic_cmpxchg_32() highlighted by sashiko.
- Converted the argumentless ones too as suggested by Arnd, I considered making
  this a second commit but that felt like adding two extra emails for something
  that looks fine squashed into this patch. I assumed Arnd's reviewed-by would
  carry over so kept it. Shout at me if thats not ok :).
- Follow up work: It looks like the same lump of code for sys_getpagesize() is
  in multiple arches, I might send some patches to deduplicate that later.

v1:
I think this is right, I've tested it on real 030, 040 and 060 machines.

I found this issue making DRM/KMS programs with nolibc. Since I wrote the m68k
support for nolibc I suspected I had missed some ABI thing and messed it up and
I put a local workaround in there. Then the issue started showing up a normal libc.

I fixed the sys_mmap2() place by stepping through the kernel in QEMU and working
out who was messing up the registers. My fix worked but I wasn't sure why
there was an issue to start with so I asked my clanker and it disassembled the
kernel and explained the tail-call thing in the commit message.

 arch/m68k/include/asm/syscalls.h | 16 +++++++-------
 arch/m68k/kernel/sys_m68k.c      | 38 ++++++++++++++------------------
 2 files changed, 24 insertions(+), 30 deletions(-)

diff --git a/arch/m68k/include/asm/syscalls.h b/arch/m68k/include/asm/syscalls.h
index fb3639acd07b..38a0f985fc76 100644
--- a/arch/m68k/include/asm/syscalls.h
+++ b/arch/m68k/include/asm/syscalls.h
@@ -5,14 +5,14 @@
 #include <linux/compiler_types.h>
 #include <linux/linkage.h>
 
-asmlinkage int sys_cacheflush(unsigned long addr, int scope, int cache,
-			      unsigned long len);
-asmlinkage int sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3,
-				     int d4, int d5, unsigned long __user *mem);
-asmlinkage int sys_getpagesize(void);
-asmlinkage unsigned long sys_get_thread_area(void);
-asmlinkage int sys_set_thread_area(unsigned long tp);
-asmlinkage int sys_atomic_barrier(void);
+asmlinkage long sys_cacheflush(unsigned long addr, int scope, int cache,
+			       unsigned long len);
+asmlinkage long sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3,
+				      int d4, int d5, unsigned long __user *mem);
+asmlinkage long sys_getpagesize(void);
+asmlinkage long sys_get_thread_area(void);
+asmlinkage long sys_set_thread_area(unsigned long tp);
+asmlinkage long sys_atomic_barrier(void);
 
 #include <asm-generic/syscalls.h>
 
diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
index 1af5e6082467..4cc5aaf74886 100644
--- a/arch/m68k/kernel/sys_m68k.c
+++ b/arch/m68k/kernel/sys_m68k.c
@@ -37,9 +37,9 @@
 
 #include "../mm/fault.h"
 
-asmlinkage long sys_mmap2(unsigned long addr, unsigned long len,
-	unsigned long prot, unsigned long flags,
-	unsigned long fd, unsigned long pgoff)
+SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned long, len,
+		unsigned long, prot, unsigned long, flags,
+		unsigned long, fd, unsigned long, pgoff)
 {
 	/*
 	 * This is wrong for sun3 - there PAGE_SIZE is 8Kb,
@@ -374,8 +374,8 @@ cache_flush_060 (unsigned long addr, int scope, int cache, unsigned long len)
 }
 
 /* sys_cacheflush -- flush (part of) the processor cache.  */
-asmlinkage int
-sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
+SYSCALL_DEFINE4(cacheflush, unsigned long, addr, int, scope, int, cache,
+		unsigned long, len)
 {
 	int ret = -EINVAL;
 
@@ -459,9 +459,8 @@ sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
 
 /* This syscall gets its arguments in A0 (mem), D2 (oldval) and
    D1 (newval).  */
-asmlinkage int
-sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
-		      unsigned long __user * mem)
+SYSCALL_DEFINE6(atomic_cmpxchg_32, unsigned long, newval, int, oldval,
+		int, d3, int, d4, int, d5, unsigned long __user *, mem)
 {
 	/* This was borrowed from ARM's implementation.  */
 	for (;;) {
@@ -515,12 +514,8 @@ sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
 		   Make the kernel do the necessary page stuff, then re-iterate.
 		   Simulate a write access fault to do that.  */
 		{
-			/* The first argument of the function corresponds to
-			   D1, which is the first field of struct pt_regs.  */
-			struct pt_regs *fp = (struct pt_regs *)&newval;
-
 			/* '3' is an RMW flag.  */
-			if (do_page_fault(fp, (unsigned long)mem, 3))
+			if (do_page_fault(current_pt_regs(), (unsigned long)mem, 3))
 				/* If the do_page_fault() failed, we don't
 				   have anything meaningful to return.
 				   There should be a SIGSEGV pending for
@@ -533,8 +528,8 @@ sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
 #else
 
 /* sys_cacheflush -- flush (part of) the processor cache.  */
-asmlinkage int
-sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
+SYSCALL_DEFINE4(cacheflush, unsigned long, addr, int, scope, int, cache,
+		unsigned long, len)
 {
 	flush_cache_all();
 	return 0;
@@ -542,9 +537,8 @@ sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
 
 /* This syscall gets its arguments in A0 (mem), D2 (oldval) and
    D1 (newval).  */
-asmlinkage int
-sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
-		      unsigned long __user * mem)
+SYSCALL_DEFINE6(atomic_cmpxchg_32, unsigned long, newval, int, oldval,
+		int, d3, int, d4, int, d5, unsigned long __user *, mem)
 {
 	struct mm_struct *mm = current->mm;
 	unsigned long mem_value;
@@ -561,23 +555,23 @@ sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
 
 #endif /* CONFIG_MMU */
 
-asmlinkage int sys_getpagesize(void)
+SYSCALL_DEFINE0(getpagesize)
 {
 	return PAGE_SIZE;
 }
 
-asmlinkage unsigned long sys_get_thread_area(void)
+SYSCALL_DEFINE0(get_thread_area)
 {
 	return current_thread_info()->tp_value;
 }
 
-asmlinkage int sys_set_thread_area(unsigned long tp)
+SYSCALL_DEFINE1(set_thread_area, unsigned long, tp)
 {
 	current_thread_info()->tp_value = tp;
 	return 0;
 }
 
-asmlinkage int sys_atomic_barrier(void)
+SYSCALL_DEFINE0(atomic_barrier)
 {
 	/* no code needed for uniprocs */
 	return 0;
-- 
2.55.0

