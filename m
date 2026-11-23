Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439506;
	b=14ri4H4Q048Cpiwjxa16kejuTxHbql2OsyRu4E5ea3EcJTsNCAMxXUTNUZnFLwG/trpB
	 r9ePoAgnBr2i1W8Ayk+PZlru7O2RcXw2oQmld/FOjJ+luXdgacGBvCHRwFwkmVyju73+u
	 9vIC0aMo5MA8w/RjQc/LLZ143cZ2CqAbkCue2+4VsfAJV3dYXMts3tfh3DraTuRiw4+WG
	 jv00x8RgzXr3nF7n2nios8Mhzf0Q6JoRwlPhtjCNSCeLJ8Fnoiq1qIVc+95LQi2gWTEDU
	 LfMNGih20T5Q6VmxoqdaBYsa8rUvMF8bsZBSET05OuqfSJINNlo8y7Rc/Ot998nxPMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=EdMsunFDcUtQDGISK9BC5BpmhF0KnQn+rijOh7gG9a8=;
	b=T4RDvryVS3hAhOZbivR7SeMXDrD4CLIl/fXT+v+4RpEI6mAP2IMpBgPYYFlYEGtp3rpM
	 KLvfqDEoUvfLH3K5gLyQlfu6gHaJ6u+pA3FcpDitsTaptTbyolOXJl7bjnSPryZGIgsWX
	 vGYjAGJOiD8Zy+BYMicLqwmuNhu/cFtpdzdiuiTKzgnQJ1LkFFtNfxp/xrYOuGvmFJ/Fh
	 eGUn167txp12T+mn0S57RdEbJnZpVn2cuLGRrnY497ngeJM3bAAdRkuFMJjrNJHS2+ZcS
	 c/jOxEQCZS6pXvn1M05fR5S4UgwBoB0HDA+QRYdBgCQ9lrBjosU15r+DsIaaSkxOZaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R4AQDEoQ;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BF2606A32A
	for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Nov 2026 13:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9BF2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R4AQDEoQ
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f05bc71e01so12254665ad.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Nov 2026 05:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795439505; x=1796044305; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EdMsunFDcUtQDGISK9BC5BpmhF0KnQn+rijOh7gG9a8=;
        b=R4AQDEoQrxaaE/J8C+C8+sAcibq8RuxbOWvGAAbOI1tc5QAeESbd92BAtdP1hXMVMU
         gfUCVy40Hd32tqokv6A7tue2xfvs1l3Rj0zttbiIiasBYooWY4Btj5hn8SDeuYtMnCmU
         u+yW71NU4sLnRqbU4f0lpRJYnUaHNKfi/KXHHX13OtDLTjZrtXf94OiXr2TOyOwHlx9e
         tbzsMCMWOwRQ9To750QvoPZIXVKzYeRR5SNCMnwOTb7aPgldPNcbSINqYLFYl/w/iE/+
         FdXeZakBzQDx4x/6EF3P6sErkiINuYH7tF1bIk6fzbZPEjAYoal+sIyCKZLYuYLJ/cBk
         TYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439505; x=1796044305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdMsunFDcUtQDGISK9BC5BpmhF0KnQn+rijOh7gG9a8=;
        b=kcp0f7HFylDLXr0WtzpmXC5lGy2cmI23vr3MvQGTVal3s9rYBYjOI67rwz1YXsgATZ
         G37XQ7Ry41UYA4DqlHdCR2qwwYCq5bDLE9wGKGTvsQQn9toC19V32wGAkwI/Zdspdl90
         XWjMIkco72xJdNwd023ofuEMd1gIajRYRPSpiDvbh77V5jz3Eb0fLSFdhw50heCW4Fgr
         zKIBf+we0KVxBSDPJ6ofGorMkb5R9hUl0oRAJTZXKGkae29vZSKUUbgey+S3kNl33Inm
         qXvbcGdWNOuQ82g3JR93uaRUKDcP4qqw+sUitNKZAUNpmYLJfG/SeNGQarYk7kqgr3GE
         bQ1A==
X-Gm-Message-State: APuU4Z87GAHlPE+xl3EiUhSdcVJU5rZzoEV3VrNX8sOrbENX/Tcu2D6B
	qfye1eYe36vZ5tO34v28iuYm0JCWV1NQ52/X5ErQBufcBT+rB1tioror
X-Gm-Gg: AZFdTZdovLqa/Avox1mLdcjG46h+d8a+Pf5hlkoYh9Af9DlCiYb+mvGGW8Flb9wC31o
	V7Sx24L7WCl1bPSUfG3gU7M4Q4zs1LgttEvBzgSY3iQ3NbGk3L6oouDoV2ohL0DA8gvK/iZZh1Y
	Y+Cu/e9ElFmEZx4qC6e1rsyZocDpytlElZjn4ILYOBo21Vbw3UOuCuy0Ir0K+lY2FnOj++kcnYE
	MEnkOui/ItZojIEXnvVOWD7Zo9OGrXeiUwSjcM5TNvNJXp7CV2HN0VmL9/C3PtOC9nSIteaffy9
	aYYiWRcH8mWkRLx7/w8p9+igg5ybCisPgttukmM0EO4VJlZ6sVTmf+A0kZYD7EgE7WJfvbfaATA
	VtCDU5BUyUZmoUK2ACdN/uRx8xaHCHDKGoMzxLYfmPtW8Ekmnke+MZonWsfvRCyNZZrCGQXScV8
	fJ5yqZBVgXzbnWp7s+mlM37hLFV2kzhsicLgXkaa03sXezCrXr5D8nVQ8NwhDnBiBOsM6bbeXbR
	j7Bx2RD6gtJyZalU+tey2IjdZcjxT24NOFd8D/KE3s7aPak1vRWTiK3/qitXeZjJup6kI+j+SZs
	PuIE4aUeXaOGiJYNxAbc3aMQaGjlfvebRg==
X-Received: by 2002:a17:90b:2d8a:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3b41c952eefmr10186812a91.41.1795439504874;
        Mon, 23 Nov 2026 05:11:44 -0800 (PST)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm20903469a91.7.2026.11.23.05.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:11:44 -0800 (PST)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	Angelo Dureghello <adureghello@baylibre.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: coldfire: Use the builtin fls() and __fls() on ISA_A+ and ISA_C
Date: Mon, 23 Nov 2026 21:11:01 +0800
Message-Id: <20261123131101.639643-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Let fls() and __fls() use the ff1 instruction on ColdFire ISA_A+ and
ISA_C cores instead of the generic binary search in C, as __ffs() and
ffs() already do. GCC emits ff1 for __builtin_clz() on exactly the cores
for which it defines __mcfisaaplus__ or __mcfisac__, the macros that
already select the ff1 versions of __ffs() and ffs(), so no new
condition is needed. Commit a6260ef84103 ("m68knommu: add ffs and __ffs
plattform which support ISA A+ or ISA C") added the ff1 versions of
__ffs() and ffs() in 2008 and kept the generic fls(); the generic
__fls() followed in 2009.

Use the asm-generic builtin versions of fls() and __fls() when
__mcfisaaplus__ or __mcfisac__ is defined, and keep the generic C
versions for ISA_A, ISA_B and 68000. The bitrev/ff1 asm of __ffs() and
ffs() stays, as this asm is shorter than the code GCC generates for
the builtin versions of __ffs() and ffs().

With GCC 12 to 16, fls() shrinks from 28 instructions to 8 or 9 and
__fls() from 24 to 6. With GCC 8 to 16, the functions of each ISA_A+ or
ISA_C defconfig kernel shrink in total by at least 8676 and at most
13266 bytes (scripts/bloat-o-meter -t), depending on the defconfig and
the compiler. In lib/find_bit.c, only _find_last_bit() changes, from 55
to 35 instructions for m5208evb with GCC 16.

fls(0) still returns 0, and __fls() still returns unsigned int.
__fls(0), which is undefined, now returns ~0 instead of 0. For other
CPUs, the preprocessed source changes only in its line numbers.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/all/dbb44e92-0bc5-449d-9e43-1f93362aa6c3@app.fastmail.com/
Signed-off-by: Tzu-Ching Yang <shingekinocore@gmail.com>
---
I have no ColdFire hardware. On QEMU mcf5208evb (ISA_A+), the ffs and
bitops KUnit tests pass before and after with GCC 8.3 to 16.2. In
find_bit_benchmark on that machine, with the bitmaps drawn from a fixed
seed so that the kernels before and after use the same bitmaps, and the
executed instructions counted by a TCG plugin, find_last_bit goes from
52.3 to 38.3 instructions per iteration on the random bitmap with GCC
16, and bitmap_find_next_zero_area_off, which calls find_last_bit(),
from 3302 to 2864; the tests of the other helpers do not change. The
ISA_C kernels were only built, as QEMU has no ISA_C machine.

Under QEMU user mode, with the kernel's flags for -mcpu=5208, 532x and
54455 and each GCC at -O2 and -Os, old and new fls(), __fls() and
fls64() agree on all 2^32 inputs (fls64() in either 32-bit half)
except the undefined __fls(0).

The seven ISA_A+ and ISA_C defconfigs (m5208evb, m5235evb, m5275evb,
m5282evb, m5329evb, m54418evb and stmark2) were built with GCC 8.3 to
16.2 before and after, with the same .config before and after. A W=1
build of these seven and of twenty other ColdFire and m68k defconfigs,
each with at least GCC 8.3, 12.5 and 16.2, has no new warning.

The new out-of-line fls() for m5208evb with GCC 16.2:

	movel %sp@(4),%d0
	tstl %d0
	beqs 1f
	movel %d0,%d1
	ff1 %d1
	moveq #32,%d0
	subl %d1,%d0
1:	rts

Against v7.4-rc1; also applies to the m68knommu and m68k for-next
branches and to next-20261113.

 arch/m68k/include/asm/bitops.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/bitops.h b/arch/m68k/include/asm/bitops.h
index e9639e48c6c3c..81923a9fa4494 100644
--- a/arch/m68k/include/asm/bitops.h
+++ b/arch/m68k/include/asm/bitops.h
@@ -506,13 +506,14 @@ static inline __attribute_const__ int ffs(int x)
 	return __ffs(x) + 1;
 }
 
+#include <asm-generic/bitops/builtin-fls.h>
+#include <asm-generic/bitops/builtin-__fls.h>
 #else
 #include <asm-generic/bitops/ffs.h>
 #include <asm-generic/bitops/__ffs.h>
-#endif
-
 #include <asm-generic/bitops/fls.h>
 #include <asm-generic/bitops/__fls.h>
+#endif
 
 #else
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1

