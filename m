Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4685013B284
	for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Nov 2025 00:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764201926; cv=none; b=h5OUK3KsSEqRZN1WsNGEio5JY2o9KEY1rFAulbHRS0z5lpbRkKMCXvmHF0JXhRDuQ4Qqarq1bvMDX4ffDlPtBJbRSTePmf0IfIfo2OaRdCiRYYQ8mv3dpwV3bGPHSRup2Y/pvNSjIqgZIbGpE42dpKOrZGrLweYjwnh25Rw0BxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764201926; c=relaxed/simple;
	bh=fm31LYr+r1Mk6eOmL2mUFR1pHlPClurZTUfRYmKhjXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lHsZQjvXUW+OVTT8ABfzXkHlX7YU3C3L1JqAFMRi0f09HViZNv1tZQJ/cuTDQkVd1MSa9nnmbGRBlhwnB6j23B0raOYjuOYNATNlhDKvc0igjyzjNwJRIGf1JPN93PMng1ldMXc+Zdv1cQ92wm9oGzxuC+IiIMfKT0NHOk08+0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=Q8cPIaZs; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="Q8cPIaZs"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so310129b3a.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Nov 2025 16:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1764201922; x=1764806722; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AbgYeXRX1tpSa+fMkqPhu1VxNciITZms7StEKaxjxLQ=;
        b=Q8cPIaZsJbEjTYYRc2xD+ZvpH+04/3ITcYvUoKm6BcpFxshXhu6V2hvSR/e9xNZbPV
         h4pBllsgCkfimtfQ3ZBFuaYPwJXRj0Ibi5Z2XkkMPcAXxKdRmi5loBgKrZUK72bszNGo
         2VMXLgkWxLqQewSCqCT3cAm0WxHAcgHwDq09c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764201922; x=1764806722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbgYeXRX1tpSa+fMkqPhu1VxNciITZms7StEKaxjxLQ=;
        b=YZz/b9gVzemdLv/bXOY97IeA6lJCCbfygNjXLVJZl0ymZg/xHo5VizdpZOkQsM+G2U
         MaFi7FBPTvxfOkjb7qkuZboQCYEGKiiCNBNeFUJH1ZleJ3xdW/PoRq6ZAcRvXX18Y/sc
         +QV0zKm6eh+hnjwtYqoutxpd2+Su7Ei6cOs3ytgmZnwtE7IuR3EuESSY4gYNI0ktQKvG
         jN/d08ceSE25I7Mh97ghH9upCAIHEPzJZe6SlZ/56DUua3Evs+raRGIRdMqkJ398oHGD
         wQh4PIb2B9FZv01OTad6n/el6nW6ALSi1wp76TH34m6bm7SEEjKbmAW0xvGlvt3uUzJI
         5Bwg==
X-Forwarded-Encrypted: i=1; AJvYcCVgLCq59BUmCR7+OnAn1pJWvAfGahSRheb1SVSr7jVc7OH+oqrVnFUXC3+klumog8s3go0+78M6ZOui@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyxgaKsxqAgUvAcDH252VgxWRbmACAUp4tiUPrKDzCkR8XWXacE
	qvAjeN0Iusujpi61Dbfzc87xxufc0sFrect3XTsXdrJqL1BrHy4rMMN8sdvbZiTjd74=
X-Gm-Gg: ASbGncucdYEU5D2NMo6gNNW+sLxfICrr+c/RDQy7jNxX6jHdMWe289eRrpnIS3nruvp
	1l/JtZ5lc1o9PNbNu73bo69G5bTPOT78aRBp+UVD9AZYihxWsMP8Ay8nfSKih7uS/0XLVoGu/7b
	iKjA8P9G4m8Kf7jXmd+M6wpFfB9YPhFY5Q0Vf62YQGzxrlc9/L8Y+d9gLsdtY8vDBOORjgaUK7D
	b21+JZiWKVh5SgKejHAw7tFdrn5Ic4xWrZHWOSNm8runf9YgP10OEuPCNYNJlMVzqAYvW8lJBRV
	+JSv/pKflsQ4ChdnqZP5PS9c+htqnOMKkGOuPsIZlI66bpKPe4kEPFN9sFQ1gyCSm4DRlZx6Yzn
	NS1t6eLCP4KqjMIKJ0tBl5B/Dz8CBrnH4gsNKyeJVT4ZPt9lEh/iQ5SDS7C/Kz1/vNp+32RY0Ql
	wct7GjdFrM45llPYtROq4RxO/urBqOw+CcDvPPIsriCtiJfMJLOi8ZtITEbDwmPeqe18iwV2yck
	w==
X-Google-Smtp-Source: AGHT+IFN5aVvaTObkYMnMTFfGGpIzE1DEzwUB8tuClZa/6aKwhPO8ooP00iIWtMSm2wPzadATDS/7g==
X-Received: by 2002:a05:6a20:7d9e:b0:342:5249:83b5 with SMTP id adf61e73a8af0-3614eb18216mr21887038637.11.1764201922462;
        Wed, 26 Nov 2025 16:05:22 -0800 (PST)
Received: from kinako.work.home.arpa (p1352012-ipxg00a01sizuokaden.shizuoka.ocn.ne.jp. [114.145.28.12])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7c3f0d65682sm22865797b3a.56.2025.11.26.16.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 16:05:21 -0800 (PST)
From: Daniel Palmer <daniel@thingy.jp>
To: geert@linux-m68k.org
Cc: kas@kernel.org,
	mingo@kernel.org,
	seanjc@google.com,
	bp@alien8.de,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH] m68k: implement runtime consts
Date: Thu, 27 Nov 2025 09:05:04 +0900
Message-ID: <20251127000505.2117956-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This implements runtime consts for m68k which hopefully improves
performance a tiny bit, maybe, hopefully... going downhill with
the wind behind us.

Constant pointers are just a register load with an immediate that is
fixed up.

Constant shifts are a very small register load with an immediate that
is fixed up and then the val is shifted by the register. Putting the
shift amount in a register is needed as the shift instruction can only
encode a maximum of shift by 8 with an immediate.

Before:

0013c6ea <__d_lookup_rcu_op_compare>:
  ...
  13c6fc:       2003            movel %d3,%d0
  13c6fe:       2239 0069 a980  movel 69a980 <d_hash_shift>,%d1
  13c704:       e2a8            lsrl %d1,%d0
  13c706:       e588            lsll #2,%d0
  13c708:       d0b9 0069 a97c  addl 69a97c <dentry_hashtable>,%d0
  ...

After:

0013c6c0 <__d_lookup_rcu_op_compare>:
  ...
  13c6d2:       207c cafe f00d  moveal #-889262067,%a0
  13c6d8:       2003            movel %d3,%d0
  13c6da:       720c            moveq #12,%d1
  13c6dc:       e2a8            lsrl %d1,%d0
  13c6de:       e588            lsll #2,%d0
  13c6e0:       d1c0            addal %d0,%a0
  ...

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 arch/m68k/include/asm/runtime-const.h | 76 +++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 arch/m68k/include/asm/runtime-const.h

diff --git a/arch/m68k/include/asm/runtime-const.h b/arch/m68k/include/asm/runtime-const.h
new file mode 100644
index 000000000000..576031c5b808
--- /dev/null
+++ b/arch/m68k/include/asm/runtime-const.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * runtime const implementation for m68k
+ * Copyright (C) 2025 Daniel Palmer<daniel@thingy.jp>
+ *
+ * Based on arm64 version.
+ */
+#ifndef _ASM_RUNTIME_CONST_H
+#define _ASM_RUNTIME_CONST_H
+
+#include <asm/cacheflush.h>
+#include <linux/bitfield.h>
+
+#define runtime_const_ptr(sym) ({				\
+	typeof(sym) __ret;					\
+	asm_inline("1:\t"					\
+		"mov.l #0xcafef00d,%0\n\t"			\
+		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"	\
+		".long 1b - .\n\t"				\
+		".popsection"					\
+		: "=a" (__ret));				\
+	__ret; })
+
+static inline void __runtime_fixup_ptr(void *where, unsigned long val)
+{
+	u32 *value = where + 2;
+	const unsigned long start = ((unsigned long) where) + 2;
+	const unsigned long end = start + sizeof(*value);
+
+	*value = val;
+
+	flush_icache_range(start, end);
+}
+
+#define runtime_const_shift_right_32(val, sym) ({		\
+	u32 __tmp;						\
+	asm_inline("1:\t"					\
+		"moveq #12, %0\n\t"				\
+		"lsr.l %0, %1\n\t"				\
+		".pushsection runtime_shift_" #sym ",\"a\"\n\t"	\
+		".long 1b - .\n\t"				\
+		".popsection"					\
+		: "=&d" (__tmp), "+d" (val));			\
+	val; })
+
+#define MOVEQ_DATA GENMASK(7, 0)
+static inline void __runtime_fixup_shift(void *where, unsigned long val)
+{
+	u16 *insn = where;
+	const unsigned long start = (unsigned long) where;
+	const unsigned long end = start + sizeof(*insn);
+
+	FIELD_MODIFY(MOVEQ_DATA, insn, val);
+
+	flush_icache_range(start, end);
+}
+
+#define runtime_const_init(type, sym) do {		\
+	extern s32 __start_runtime_##type##_##sym[];	\
+	extern s32 __stop_runtime_##type##_##sym[];	\
+	runtime_const_fixup(__runtime_fixup_##type,	\
+		(unsigned long)(sym),			\
+		__start_runtime_##type##_##sym,		\
+		__stop_runtime_##type##_##sym);		\
+} while (0)
+
+static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
+	unsigned long val, s32 *start, s32 *end)
+{
+	while (start < end) {
+		fn(*start + (void *)start, val);
+		start++;
+	}
+}
+
+#endif
-- 
2.51.0

