Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795488978;
	b=eoCU4ys6SMozW+VbC2V4X3X6b+tQsy7bzlJX+kjh3paexvEfQfXD2HHe8NrZ+EK7bsbR
	 n8wwl9B10WJDty+7qXTUpkfofw0fOMGi3FDUvbg2gMWuZp0az9PZJ5GwCEjFf9tAn+Ygh
	 JntD4DG8R7Q/cEWxOVOKTXli8hJ72okJGuzx25BhGJES9e5EfhwySPKKgOI7uhAnttp2v
	 ds5sny2nsTxJtBm9J2kCCrz0fnaMF5gFqhlyJKyEUAr1tYQv1NFgu8J80/YR55jWleyQQ
	 2v/caNYCxCSpRgYSCQLAjJoWl1N+MZI9EOY0KGO+hBt2V4GfOf/xfAGrqoozQ3uYALg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795488978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VTJx4zOZOCq27U0Jzn+4GN03jUopCsjAx/64NooQBH8=;
	b=yBY3ZaOy87Qy2/QSw7ssDPwBo6O6f3Gfq6lvlI1ikKeUpKiqLCEPy1RmvjpCqUJxYzX5
	 NCyh9fN51J8et3LX3QmU6w+ITxVodeCKrT1PoSl9BJa1AyUwCx1kSh3Y6Gnp6F6BZuHXy
	 i9S419Pb5NG3kV04+HTVPtyr+R8qGkns5m5PV3/PcWzm6jVZ6vFs+fcqxdMcZPQIpInP2
	 Bvieyl3N7HIwJhrbwuUyLjicdXF8QbNhr6yL2yHVya7Upyfj5DkaWCIGEF90T3HtNPvks
	 Q3vXo+pObUV190BSTJ+uoCxI3XA/QNlH7Ok7L6bdoqpBAWVKBfOVRyJoRp/ms5ufCGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=J4PTl+Br;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24704606A321
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Nov 2026 02:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24704606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=J4PTl+Br
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so2282372a91.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Nov 2026 18:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795488977; x=1796093777; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VTJx4zOZOCq27U0Jzn+4GN03jUopCsjAx/64NooQBH8=;
        b=J4PTl+Br+fZN56ufDjF1yEREKJrGztJU8I0oMy5xGSo5MMABAp3myzZAdxQQK50CKc
         zw15/SIWry9tYkp+aIZ/WIhrD6FAd7aPdhA90rV6j9zhhXq6EMlvGuPk9m86EQl6iphr
         +b5mL7Hx4tqD17voRcMdAvG6a+jynZBMRDgVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795488977; x=1796093777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTJx4zOZOCq27U0Jzn+4GN03jUopCsjAx/64NooQBH8=;
        b=mz+Kyrmyfh3GJfh8LWsxfwn7bbNZCuxcwJU+6CpcjJM8QqwstAp7Jhk6bOycm6VZrj
         EhgoSlpfPrUROaki4mTy+KJfsUOMf3/FRggvXgUz6cmKCUkEJq5wezssRXQHxH7Gm7C0
         mpbiF0G0/lekXyxbcFX2vuu3fZCiVBPTjB1LeNcJ70Ie0wWTAdV1Kkc5okFiZzxgCOdj
         64WtbB2W5rq0VKc6LS4aGernZQeDS3GpQvsgE0TPOhtGL6F+erPiXywfIs9pTXlJf+Ao
         1Nh7wHtwDGtF2oaunX6EbzaiFT7aBG3aP2gWBCI5Iz8N75kGF1KWi0T63wFZ5DTkRA/p
         y/ZQ==
X-Forwarded-Encrypted: i=1; AL+hErEPzbC541IHLdwxXfCs+JYmWiRyScILkdN4xf8jMELf6SKAEhr6gsIOoYNxba7h16ZsKiYg5+txZms7@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z8m4Qd/lsPYlCdlCJo0MTCxi1PAOkqPoiVwiX/9LpP7qsWY7n8t
	gJKGwmPb0qYrS3lMQTA651LqjI+8aY4qV4L6B64lbuBLM+prcW3Y5eZqxoF9R6s502A=
X-Gm-Gg: AZFdTZfJ2hYIyAPeYGOSavj8SvRMKZCYKT1q0NSbeHG2c/2qW/TShKL9ueSOxn3+i8Z
	gqYDsCqtrswZ9mbqv8qoBd/AjU8k/iYnYT7ww83NCr2Fuxu3DvM5EtlOGJITRbs8pWz6d5pRUQ/
	nQQIdAcMUe/kU/X8s25bRSgCp4adsEKNbcUqIgB1KYx6tHD10++ihXgpv6MG2sj0B3imwOb4MLY
	bnibdr3AXm4EGx5He30gwEZ8U9zIjHb0RMuJEeKRKZ4NcJZUxEwU97kq48dgkxMP2nP/xhn5PvY
	s8eCt42RtSUEBLq7CX/xEeM+wiA+x419raVtsKqvVyYIEi295oH41kzclTgU192gux6Z6ZdXRVP
	v6DZlJqzYKDzQCO0d6n8L4PCeyEmwd/3AQeM/YxxFFSSkVuZo3jZaRVSxl1pywZD0U7/tCUah1P
	DTKRsMp7cFwpR+6So9FuqGLkBhAhV36twnyNH9W/mZ3NylzcL8NXNDIzyQAldQRsfwpCLFaWCan
	SXJ7zu+rqDaUwmIv2e3433U8bpUuSYBYupugfretast0Qto0NmWJaByk8iMHUvIXS4U+2s8os6w
	HVkIgSTEpiNjFmcm6JlhLqRYeySBSzm5fpl2MAn+Te/amwpf+Z25lLPeMsuozYnKjRIH7WQ=
X-Received: by 2002:a17:90b:2cce:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3b41c95e0ecmr8634213a91.33.1795488976892;
        Mon, 23 Nov 2026 18:56:16 -0800 (PST)
Received: from shiro (p1721212-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.166.141.212])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41ad48786sm20764273a91.9.2026.11.23.18.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:56:16 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	gerg@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] m68k: Define the m68k-specific syscalls with SYSCALL_DEFINE
Date: Tue, 24 Nov 2026 11:55:55 +0900
Message-ID: <20261124025555.2348580-1-daniel@0x0f.com>
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
match.

Fixes: a90f590a1bee ("mm: add ksys_mmap_pgoff() helper; remove in-kernel calls to sys_mmap_pgoff()")
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---

I think this is right, I've tested it on real 030, 040 and 060 machines.

I found this issue making DRM/KMS programs with nolibc. Since I wrote the m68k
support for nolibc I suspected I had missed some ABI thing and messed it up and
I put a local workaround in there. Then the issue started showing up a normal libc.

I fixed the sys_mmap2() place by stepping through the kernel in QEMU and working
out who was messing up the registers. My fix worked but I wasn't sure why
there was an issue to start with so I asked my clanker and it disassembled the
kernel and explained the tail-call thing in the commit message.

 arch/m68k/include/asm/syscalls.h | 10 +++++-----
 arch/m68k/kernel/sys_m68k.c      | 26 ++++++++++++--------------
 2 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/arch/m68k/include/asm/syscalls.h b/arch/m68k/include/asm/syscalls.h
index fb3639acd07b..f317b35d6970 100644
--- a/arch/m68k/include/asm/syscalls.h
+++ b/arch/m68k/include/asm/syscalls.h
@@ -5,13 +5,13 @@
 #include <linux/compiler_types.h>
 #include <linux/linkage.h>
 
-asmlinkage int sys_cacheflush(unsigned long addr, int scope, int cache,
-			      unsigned long len);
-asmlinkage int sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3,
-				     int d4, int d5, unsigned long __user *mem);
+asmlinkage long sys_cacheflush(unsigned long addr, int scope, int cache,
+			       unsigned long len);
+asmlinkage long sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3,
+				      int d4, int d5, unsigned long __user *mem);
 asmlinkage int sys_getpagesize(void);
 asmlinkage unsigned long sys_get_thread_area(void);
-asmlinkage int sys_set_thread_area(unsigned long tp);
+asmlinkage long sys_set_thread_area(unsigned long tp);
 asmlinkage int sys_atomic_barrier(void);
 
 #include <asm-generic/syscalls.h>
diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
index 1af5e6082467..9e6d38e57495 100644
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
@@ -533,8 +532,8 @@ sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
 #else
 
 /* sys_cacheflush -- flush (part of) the processor cache.  */
-asmlinkage int
-sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
+SYSCALL_DEFINE4(cacheflush, unsigned long, addr, int, scope, int, cache,
+		unsigned long, len)
 {
 	flush_cache_all();
 	return 0;
@@ -542,9 +541,8 @@ sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
 
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
@@ -571,7 +569,7 @@ asmlinkage unsigned long sys_get_thread_area(void)
 	return current_thread_info()->tp_value;
 }
 
-asmlinkage int sys_set_thread_area(unsigned long tp)
+SYSCALL_DEFINE1(set_thread_area, unsigned long, tp)
 {
 	current_thread_info()->tp_value = tp;
 	return 0;
-- 
2.55.0

