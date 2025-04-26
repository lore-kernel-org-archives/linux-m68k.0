Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C708189B8C
	for <linux-m68k@lists.linux-m68k.org>; Sat, 26 Apr 2025 04:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745640741; cv=none; b=gmbBvJxnNVeAoJkS76qOg0aiIYYdaRTQAmVVEurPyTQJ5AnaAfvfwzFU9D80eC5lgAZ1VmdfuHiNtIjoZqXk+UWB5EJunJzpLol+CIjZ1syhFHHm8hVF5IHi/XzhTegxTQG6RhDeUAUmXomf5IrWaEkBW+qUm4wzyd96qMDPQf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745640741; c=relaxed/simple;
	bh=X798se1yqIjQj7BbSweueyaGMPQVZK7ePL+HlYpOiZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nYo/keRT1f9raTCUuUVeyR+gkJoAM6MVi2DUa6IherwC+O1qfxYlFKXXeBDhqCti8U3uAR8ZX60I688zqZ4cQ4PwAtjT++o68LPrqDRDNfGGKJbAlA1Oj53HfM42qIxvc+h9ehmjknFO2zGv6JTYWxSjcDfaElYewZqFxzT1sl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=XlixYotI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="XlixYotI"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227d6b530d8so34026435ad.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 25 Apr 2025 21:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1745640738; x=1746245538; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LuPMmzATkY8xATRRwXVPRE8uVlsNQkZoSS0OdxW6pAs=;
        b=XlixYotIjpVnO2kOHXf8MIeTZafA5wKP61ByLWBthUkigQyNadb9IxYqXNpRPcdpJa
         teWpZa/BU457hMeZueI0Mh7sCEMpXqCm3kCZa9TZR0GxLmSPWtLORzHZi1lTUM1/51LX
         SlB0A/l6RzBHByXQ/vpflDWtDLe83L4S7fhvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745640738; x=1746245538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LuPMmzATkY8xATRRwXVPRE8uVlsNQkZoSS0OdxW6pAs=;
        b=AeHn5kqVkoe4VLKBfMhK8UH5aveIcQrHUtXM7DwfSDSshTa4wx06ico7fVtyCqVo0E
         MzXpQoNcHIbs7m3R9Nkg43E1kb6ToYr92SEynD/fHyv/TXwAIpv3EJg8Daghnwt0qYkt
         yCuLztYn4AqI7PLdPbFahpS5MLErCxiIm5LYpWMKhrmAQRaDB0viq+dtAte9/w2ElC7x
         kAIDeWsKmZmOCd+9R7T8CaD84mOlaDklW0H+2HeEU40iJracvouih7uP1P0aka6X/oGz
         pcblRGA9aPDz1UbUuHh3id/mpJymKYaag2lZxqT/pXKZXS1TufzqQAg44+NmiiOmgG6r
         P1MA==
X-Forwarded-Encrypted: i=1; AJvYcCWQd8s/j25xddlB/Pn+SAMo72lDHXNnchAwx3rvRiA1q211PQ5P/K4o0A1jzwijzGE7h40mTQTMcLt0@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzkCvKSEGcrM7TE4j7LU4yRUBBzNVbsLo9BkjUXDlheh9MgF9+f
	mqbYlQzVAKokP4e5YBqw67GFNKxJIGpMpVR6cC9lxAzuU43r/2ggFmQ2/VEx9N0=
X-Gm-Gg: ASbGnct5i9d9bU+DdBLXimzQr5a2Q/5RwPVDzZQWrc2p3X7p8P8ylTBDtTInjKHGfsw
	EiVN5gYQw1174vkcyn78jikTkGPLJKJIGQPp/YRilIKNfdJVcA4Jp4tvMQD+GAo6iisHQ15MRCl
	vhflB8mR8ROktFwvtXUs2sEeFnjLPzIJAs4voNrMeSrDMBQpXRVAHGZ9pjRI9gBty9ifietfgGS
	Y4isFqRNC+GYyr1b2oGMMbSWIyKLNBw9YzevC7AlQ7B6X7+h7iBzrPPqIn3OWDca2JZRihncfu0
	XiNJlg+HAq73H9KMDCvUnJCTHn2Bf8hVWxwsSURcM3pbNBJO5t2ldDsnzyagqFdd
X-Google-Smtp-Source: AGHT+IHIZFD7SC+VCaiJEN9Ucea/7xDUmwe56OfPeUEExIBNy9kJZpr29LjEj0S+2onGXU4Fs1xFhw==
X-Received: by 2002:a17:903:3d08:b0:224:910:23f6 with SMTP id d9443c01a7336-22dbf743518mr74777915ad.45.1745640738287;
        Fri, 25 Apr 2025 21:12:18 -0700 (PDT)
Received: from shiro.work.home.arpa. ([2400:4162:2428:2ffe:5393:61f3:16d7:186f])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22db51025basm41093945ad.187.2025.04.25.21.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 21:12:17 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: w@1wt.eu,
	linux@weissschuh.net,
	linux-m68k@lists.linux-m68k.org,
	geert@linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH] tools/nolibc: Add m68k support
Date: Sat, 26 Apr 2025 13:12:12 +0900
Message-ID: <20250426041212.4141152-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Palmer <daniel@thingy.jp>

Add nolibc support for m68k. Should be helpful for nommu where
linking libc can bloat even hello world to the point where you get
an OOM just trying to load it.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 tools/include/nolibc/arch-m68k.h | 141 +++++++++++++++++++++++++++++++
 tools/include/nolibc/arch.h      |   2 +
 2 files changed, 143 insertions(+)
 create mode 100644 tools/include/nolibc/arch-m68k.h

diff --git a/tools/include/nolibc/arch-m68k.h b/tools/include/nolibc/arch-m68k.h
new file mode 100644
index 000000000000..6dac1845f298
--- /dev/null
+++ b/tools/include/nolibc/arch-m68k.h
@@ -0,0 +1,141 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+/*
+ * m68k specific definitions for NOLIBC
+ * Copyright (C) 2025 Daniel Palmer<daniel@thingy.jp>
+ *
+ * Roughly based on one or more of the other arch files.
+ *
+ */
+
+#ifndef _NOLIBC_ARCH_M68K_H
+#define _NOLIBC_ARCH_M68K_H
+
+#include "compiler.h"
+#include "crt.h"
+
+#define _NOLIBC_SYSCALL_CLOBBERLIST "memory"
+
+#define my_syscall0(num)                                                      \
+({                                                                            \
+	register long _num __asm__ ("d0") = (num);                            \
+									      \
+	__asm__ volatile (                                                    \
+		"trap #0\n"                                                   \
+		: "+r"(_num)                                                  \
+		: "r"(_num)                                                   \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_num;                                                                 \
+})
+
+#define my_syscall1(num, arg1)                                                \
+({                                                                            \
+	register long _num __asm__ ("d0") = (num);                            \
+	register long _arg1 __asm__ ("d1") = (long)(arg1);                    \
+									      \
+	__asm__ volatile (                                                    \
+		"trap #0\n"                                                   \
+		: "+r"(_num)                                                  \
+		: "r"(_arg1)                                                  \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_num;                                                                 \
+})
+
+#define my_syscall2(num, arg1, arg2)                                          \
+({                                                                            \
+	register long _num __asm__ ("d0") = (num);                            \
+	register long _arg1 __asm__ ("d1") = (long)(arg1);                    \
+	register long _arg2 __asm__ ("d2") = (long)(arg2);                    \
+									      \
+	__asm__ volatile (                                                    \
+		"trap #0\n"                                                   \
+		: "+r"(_num)                                                  \
+		: "r"(_arg1), "r"(_arg2)                                      \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_num;                                                                 \
+})
+
+#define my_syscall3(num, arg1, arg2, arg3)                                    \
+({                                                                            \
+	register long _num __asm__ ("d0")  = (num);                           \
+	register long _arg1 __asm__ ("d1") = (long)(arg1);                    \
+	register long _arg2 __asm__ ("d2") = (long)(arg2);                    \
+	register long _arg3 __asm__ ("d3") = (long)(arg3);                    \
+									      \
+	__asm__ volatile (                                                    \
+		"trap #0\n"                                                   \
+		: "+r"(_num)                                                  \
+		: "r"(_arg1), "r"(_arg2), "r"(_arg3)                          \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_num;                                                                 \
+})
+
+#define my_syscall4(num, arg1, arg2, arg3, arg4)                              \
+({                                                                            \
+	register long _num __asm__ ("d0") = (num);                            \
+	register long _arg1 __asm__ ("d1") = (long)(arg1);                    \
+	register long _arg2 __asm__ ("d2") = (long)(arg2);                    \
+	register long _arg3 __asm__ ("d3") = (long)(arg3);                    \
+	register long _arg4 __asm__ ("d4") = (long)(arg4);                    \
+									      \
+	__asm__ volatile (                                                    \
+		"trap #0\n"                                                   \
+		: "+r" (_num)                                                 \
+		: "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4)              \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_num;                                                                 \
+})
+
+#define my_syscall5(num, arg1, arg2, arg3, arg4, arg5)                        \
+({                                                                            \
+	register long _num __asm__ ("d0") = (num);                            \
+	register long _arg1 __asm__ ("d1") = (long)(arg1);                    \
+	register long _arg2 __asm__ ("d2") = (long)(arg2);                    \
+	register long _arg3 __asm__ ("d3") = (long)(arg3);                    \
+	register long _arg4 __asm__ ("d4") = (long)(arg4);                    \
+	register long _arg5 __asm__ ("d5") = (long)(arg5);                    \
+									      \
+	__asm__ volatile (                                                    \
+		"trap #0\n"                                                   \
+		: "+r" (_num)                                                 \
+		: "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5)  \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_num;                                                                 \
+})
+
+#define my_syscall6(num, arg1, arg2, arg3, arg4, arg5, arg6)                  \
+({                                                                            \
+	register long _num __asm__ ("d0")  = (num);                           \
+	register long _arg1 __asm__ ("d1") = (long)(arg1);                    \
+	register long _arg2 __asm__ ("d2") = (long)(arg2);                    \
+	register long _arg3 __asm__ ("d3") = (long)(arg3);                    \
+	register long _arg4 __asm__ ("d4") = (long)(arg4);                    \
+	register long _arg5 __asm__ ("d5") = (long)(arg5);                    \
+	register long _arg6 __asm__ ("a0") = (long)(arg6);                    \
+									      \
+	__asm__ volatile (                                                    \
+		"trap #0\n"                                                   \
+		: "+r" (_num)                                                 \
+		: "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5), \
+		  "r"(_arg6)                                                  \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_num;                                                                 \
+})
+
+void _start(void);
+void __attribute__((weak, noreturn)) __nolibc_entrypoint __no_stack_protector _start(void)
+{
+	__asm__ volatile (
+		"movel %sp, %sp@-\n"
+		"jsr _start_c\n"
+	);
+	__nolibc_entrypoint_epilogue();
+}
+
+#endif /* _NOLIBC_ARCH_M68K_H */
diff --git a/tools/include/nolibc/arch.h b/tools/include/nolibc/arch.h
index 8a2c143c0fba..ba3da0f098f1 100644
--- a/tools/include/nolibc/arch.h
+++ b/tools/include/nolibc/arch.h
@@ -33,6 +33,8 @@
 #include "arch-s390.h"
 #elif defined(__loongarch__)
 #include "arch-loongarch.h"
+#elif defined(__m68k__)
+#include "arch-m68k.h"
 #else
 #error Unsupported Architecture
 #endif
-- 
2.49.0

