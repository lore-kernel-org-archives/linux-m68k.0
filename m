Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFF418FDD5
	for <linux-m68k@lists.linux-m68k.org>; Sat, 26 Apr 2025 22:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745707670; cv=none; b=CN90/3UL6KxdiP8iObOclnwBJ/nmnaggGoK8NO5M4dyYtMAXsgN8hGQtuTf9b9GpAL2o+ozbIALrtmlx5SexFTDYhtiHyXO8TBdLCRqE0aqxyT7Cjdg/ai6l+0ibJDdVyYJbNqtPA//a/bKvC+luxb5Gw1PbdFTbzKbvL0gWvO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745707670; c=relaxed/simple;
	bh=7jnVwNv2fEMSIEnmRi1jlxWFVRZqZR5NsvlfRYB1RZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GlWc4CkO9QoP2p9tBvx/m6lY9dOnrz1MVzwG/NgRWrJrnDLOGqJQplPEjo6sWq9JJM/9ukBm1OSFuHnnt3lVLnNBctWflAD02kQvqauqFeP71U/By3b5MbDrR1xsYgH+z/DJIwjxFBnga7anqtcliODRprS5lG7h9I0siUWPoaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=q3hIxSZm; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="q3hIxSZm"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af59c920d32so2274811a12.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 26 Apr 2025 15:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1745707667; x=1746312467; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQLaLeT73x9xsXfg44TW/m8g/pnyYWDCj9Tv82ccYJE=;
        b=q3hIxSZmeyUSBcQGQAOOaGcfzL+GquGRu9GodvAH2L50KBVswjIOVNQHC5OYdQ17Rv
         9fNspMGorlvJozqc1PATX4UkfwxY8ftb01/rNEA20ObSI/wv78rFc7IySr0KsWdiorPq
         8/NqyIets1Hv13zFJeh2QNLsuCN4yeBiatFMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745707667; x=1746312467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQLaLeT73x9xsXfg44TW/m8g/pnyYWDCj9Tv82ccYJE=;
        b=gl4ENCin3+eE1m/eiTRNdUkjfxHsbc6Z3l8Pn3AMpnKHzFwJX8xZqeWf+ag/AUoatM
         uZnJlquCbgj7HPy7t1/wqEuMVMwiwPf+L5Dj0Fi4PqzO2tK/DWX3iormSSYFwzS2KmRs
         Z7QwvOB9qF5DxZG2+VKUkXWTLJ2sb84kHHiIxJqf9eJJVgo+w65A+aMqYCMNs8g07x04
         IkzldzGRYwKdQICcgjuObUcWSNXnG0YlLJ7jXvko5EkQuafrwcGjX+iYjFEhlBwHwLpd
         JFqFuSQ8FkVTFdfday1LahRGOqR+6eysCC1XM7S17DR7YGzEK9kA1v6hsf18uRC2d9Lt
         Su9A==
X-Forwarded-Encrypted: i=1; AJvYcCVl4bxOEqZH+hAnVL0UPr6Pm+7x5A54yozIAfbLTU1CXHwRxZLY3dGU3h1COWvLZUHAdgKNneA9n4Ne@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy5twcTb+6YoimtuwjJ0OOrr1A5QnlzvOPJnmZv9ChTlZf6VUfO
	93nUMWutyU9UeYBu8jkkh/sFFV7+riO32zV9+NsQeNo5Vr4Ymz3NrP5WWTIbGts=
X-Gm-Gg: ASbGncvupkh1UG+ELhq0YKOPD9qWPFNV8RvjHpzF6syXbExkSqeuU5Jwpfak+X3M7WX
	GVtE+dI+6Y4DbKZ52NalOXqhK7x1DG+u6/Ft40CFsaHCMrm5PfxdLvYQ+SWrA7jvP5B8dlnD0NL
	e4RZ5YA4utoC8gwmVShSPNY1sF92iNKjVC6+rdPh/jQMix1/DMfMkFOaBfTMW7kqRbZovuCAz9J
	pSyd/1hFW1dWYdS/glNTJhBG1PZz5lZqWeI/M7q86z93ATnRtxdgmRoL7qXuWExA53A9cAKKCDP
	L3lMgfA/RvLR6R2As7IMdSCqWAneeyTEflWeD8CSDUPusgmzWa2xwqA3u6IHhEWD
X-Google-Smtp-Source: AGHT+IEdCDDjo4yW3+IH0PY2boqnoSSaIO4QUefy4XRkK90mMsiPhPXe+a3+6eYvXQ38oNJtjM09ig==
X-Received: by 2002:a05:6a20:43a8:b0:1f5:a3e8:64c1 with SMTP id adf61e73a8af0-2045b42a884mr9488088637.0.1745707666631;
        Sat, 26 Apr 2025 15:47:46 -0700 (PDT)
Received: from shiro.work.home.arpa. ([2400:4162:2428:2ffe:5393:61f3:16d7:186f])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b15fa80fa6asm4844659a12.61.2025.04.26.15.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 15:47:46 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: w@1wt.eu,
	linux@weissschuh.net,
	linux-m68k@lists.linux-m68k.org,
	geert@linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH v3] tools/nolibc: Add m68k support
Date: Sun, 27 Apr 2025 07:47:38 +0900
Message-ID: <20250426224738.284874-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nolibc support for m68k. Should be helpful for nommu where
linking libc can bloat even hello world to the point where you get
an OOM just trying to load it.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 tools/include/nolibc/arch-m68k.h            | 141 ++++++++++++++++++++
 tools/include/nolibc/arch.h                 |   2 +
 tools/testing/selftests/nolibc/Makefile     |   5 +
 tools/testing/selftests/nolibc/run-tests.sh |   5 +
 4 files changed, 153 insertions(+)
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
index b8c1da9a88d1..d20b2304aac2 100644
--- a/tools/include/nolibc/arch.h
+++ b/tools/include/nolibc/arch.h
@@ -35,6 +35,8 @@
 #include "arch-loongarch.h"
 #elif defined(__sparc__)
 #include "arch-sparc.h"
+#elif defined(__m68k__)
+#include "arch-m68k.h"
 #else
 #error Unsupported Architecture
 #endif
diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index d17750761d9f..2671383045db 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -80,6 +80,7 @@ IMAGE_s390       = arch/s390/boot/bzImage
 IMAGE_loongarch  = arch/loongarch/boot/vmlinuz.efi
 IMAGE_sparc32    = arch/sparc/boot/image
 IMAGE_sparc64    = arch/sparc/boot/image
+IMAGE_m68k       = vmlinux
 IMAGE            = $(objtree)/$(IMAGE_$(XARCH))
 IMAGE_NAME       = $(notdir $(IMAGE))
 
@@ -103,8 +104,10 @@ DEFCONFIG_s390       = defconfig compat.config
 DEFCONFIG_loongarch  = defconfig
 DEFCONFIG_sparc32    = sparc32_defconfig
 DEFCONFIG_sparc64    = sparc64_defconfig
+DEFCONFIG_m68k       = virt_defconfig
 DEFCONFIG            = $(DEFCONFIG_$(XARCH))
 
+EXTRACONFIG_m68k      = -e CONFIG_BLK_DEV_INITRD
 EXTRACONFIG           = $(EXTRACONFIG_$(XARCH))
 
 # optional tests to run (default = all)
@@ -130,6 +133,7 @@ QEMU_ARCH_s390       = s390x
 QEMU_ARCH_loongarch  = loongarch64
 QEMU_ARCH_sparc32    = sparc
 QEMU_ARCH_sparc64    = sparc64
+QEMU_ARCH_m68k       = m68k
 QEMU_ARCH            = $(QEMU_ARCH_$(XARCH))
 
 QEMU_ARCH_USER_ppc64le = ppc64le
@@ -162,6 +166,7 @@ QEMU_ARGS_s390       = -M s390-ccw-virtio -append "console=ttyS0 panic=-1 $(TEST
 QEMU_ARGS_loongarch  = -M virt -append "console=ttyS0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_sparc32    = -M SS-5 -m 256M -append "console=ttyS0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_sparc64    = -M sun4u -append "console=ttyS0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_m68k       = -M virt -append "console=ttyGF0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS            = -m 1G $(QEMU_ARGS_$(XARCH)) $(QEMU_ARGS_BIOS) $(QEMU_ARGS_EXTRA)
 
 # OUTPUT is only set when run from the main makefile, otherwise
diff --git a/tools/testing/selftests/nolibc/run-tests.sh b/tools/testing/selftests/nolibc/run-tests.sh
index 040956a9f5b8..8277599e6441 100755
--- a/tools/testing/selftests/nolibc/run-tests.sh
+++ b/tools/testing/selftests/nolibc/run-tests.sh
@@ -26,6 +26,7 @@ all_archs=(
 	s390x s390
 	loongarch
 	sparc32 sparc64
+	m68k
 )
 archs="${all_archs[@]}"
 
@@ -186,6 +187,10 @@ test_arch() {
 		echo "Unsupported configuration"
 		return
 	fi
+	if [ "$arch" = "m68k" ] && [ "$llvm" = "1" ]; then
+		echo "Unsupported configuration"
+		return
+	fi
 
 	mkdir -p "$build_dir"
 	swallow_output "${MAKE[@]}" defconfig
-- 
2.49.0

