Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C6D2F56
	for <linux-m68k@lists.linux-m68k.org>; Sat, 26 Apr 2025 06:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745650417; cv=none; b=Olc9OdQFeuVsEu1q3jjPu0Hml6h4b3nSvAqWA1tdjzV4t2t6U5/3Bmo0dJdYwpijnqrEqv5256c36OIMEr2vv9aJQvH3YzxCYSGBHYIDT0brjNDPGhNP+FKTfIChiY+e8lIpxdRCDhgoPPJY6P+iv5w28yoUnL1EBpYvo6fG2Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745650417; c=relaxed/simple;
	bh=RFBwDJo4GSFjRgTv+2Gl2PtEuuAX7oj7HYmkoB/Iyfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nykx0L7Y5b8fsT63fcvB9tXLI+qxCECGZJX/dme3Lx13gFkMXLgJPSUo9ObOWZyVF76lZ3M3DOA7zacutBrBgY60eBaOCJC6XJ1z2y1LiO5RFnUHRw3T1TNPJp8E0tzkWJPDbllbLt46seG0EU0+PfOGTd+viO0iCq6pjBlx8A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=pKCv9i8E; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="pKCv9i8E"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736b34a71a1so3574975b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 25 Apr 2025 23:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1745650414; x=1746255214; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jm67qBA6pEjtHb8ZLygOp76gyn+FLVbzfGRvi4TyLEc=;
        b=pKCv9i8Em5JYdRf5mmydxR5s2IA+TqgXTLM9VDZ7cO8l4yRcvztgylKQB6mR0bUSa7
         agoZj7wNr4ttmkC+PqkwG2UQCVmkT/ncO9weeu1+ij2B1jwbdmQIPV+y2yNB28LuKJIO
         iKN620vZjcvzxxYtb19FP/PavBY8k4Vs0rJFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745650414; x=1746255214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jm67qBA6pEjtHb8ZLygOp76gyn+FLVbzfGRvi4TyLEc=;
        b=kvCyoOk+uk1QLi3vRUmtlQFneqzw7BkHemBtIOIr7sSm3KlNHMjoeHX782Vjppmp5h
         sZhAZOf7DduSjTMH4ZzhclCtQ9lBJd4/g6A3WsE+isgMXRf8XiQ+vmilTjVAMlz+k2+C
         YNrobMNP+HPeUTLw/MJRot4QJwLKeFOnFqd7re4L5Vc9K01nQiCT+sFyGYkJpQeKVzJa
         yxbaiJQtISOWPt4etK7UcCIOfSRkAOpoNJVRpqlggpo8X8rzl7Djt5tnCdBHAu6qmZzc
         woNfPEl8n5aNny31tHbaA8pLqhuvR9xlMNOKZMhCea6Cr4+46jFAGO33qDY/9UecnLKM
         Dkug==
X-Forwarded-Encrypted: i=1; AJvYcCUPGm9ENPUI4NOmi/6lZWUv34eArZPFS5t5PXw7RjinBTAClZc7vIafkeZ+9vYhQosQvFFp3WXGyTOd@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyW52U6/0zfs9HkRdg+sOys+VW5+rQT1emkev3nT7rQpHKXXE2P
	mdz3Ix4ZnnkjtYfJeSDcTjDQTF3h2huzXvM/ZdYIO8kYDPUTsBx0y3Xh4Jzt+lE=
X-Gm-Gg: ASbGncvtxcvOoUma+8laAUlCC9SKn5viuTVUIs+3idbNHeKBebNJOv7oEXHjGpayCbs
	qni6KopDoiCQj4B1I39SDHgAL+qnE1xIK4khVgvqayRKzcwMGtUH1V2P8e/ZUh6hcg2BmEQNTeM
	I9kGXJ0lg5f7P747WKNFvXwr2SaS+fFX14TeH+FYsehNmE8RGz9YmLTN8wc8ZVz9D1WMxnoafPL
	JHgmWYWAmYMl3bBPNJfI43XH77nYBnn4m+MuxRHhWk6KozHD/yOL9byHew0riKOY06plIwbLkFm
	g0bhc/9ETDnOkP+RknDfGn1WIKMQVrNkV0fC1Lo9Sx23xcnrZR/D9Q==
X-Google-Smtp-Source: AGHT+IH541oQ92u6sWEgtf8GTwN8NDJl+KS4dSjE7NaSzs2K0cuGJGG5bMaJNhGl6htYZtNI18jHxA==
X-Received: by 2002:a05:6a00:4642:b0:73e:359:1c86 with SMTP id d2e1a72fcca58-73ff73bce2cmr2956645b3a.18.1745650413702;
        Fri, 25 Apr 2025 23:53:33 -0700 (PDT)
Received: from shiro.work.home.arpa. ([2400:4162:2428:2ffe:5393:61f3:16d7:186f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73e25912c65sm4237489b3a.25.2025.04.25.23.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 23:53:33 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: w@1wt.eu,
	linux@weissschuh.net,
	linux-m68k@lists.linux-m68k.org,
	geert@linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH v2] tools/nolibc: Add m68k support
Date: Sat, 26 Apr 2025 15:53:23 +0900
Message-ID: <20250426065323.259267-1-daniel@0x0f.com>
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
 tools/include/nolibc/arch-m68k.h            | 141 ++++++++++++++++++++
 tools/include/nolibc/arch.h                 |   2 +
 tools/testing/selftests/nolibc/Makefile     |   5 +
 tools/testing/selftests/nolibc/run-tests.sh |   1 +
 4 files changed, 149 insertions(+)
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
diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 58bcbbd029bc..2d6bbd8eb213 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -76,6 +76,7 @@ IMAGE_riscv64    = arch/riscv/boot/Image
 IMAGE_s390x      = arch/s390/boot/bzImage
 IMAGE_s390       = arch/s390/boot/bzImage
 IMAGE_loongarch  = arch/loongarch/boot/vmlinuz.efi
+IMAGE_m68k       = vmlinux
 IMAGE            = $(objtree)/$(IMAGE_$(XARCH))
 IMAGE_NAME       = $(notdir $(IMAGE))
 
@@ -97,8 +98,10 @@ DEFCONFIG_riscv64    = defconfig
 DEFCONFIG_s390x      = defconfig
 DEFCONFIG_s390       = defconfig compat.config
 DEFCONFIG_loongarch  = defconfig
+DEFCONFIG_m68k       = virt_defconfig
 DEFCONFIG            = $(DEFCONFIG_$(XARCH))
 
+EXTRACONFIG_m68k      = -e CONFIG_BLK_DEV_INITRD
 EXTRACONFIG           = $(EXTRACONFIG_$(XARCH))
 
 # optional tests to run (default = all)
@@ -122,6 +125,7 @@ QEMU_ARCH_riscv64    = riscv64
 QEMU_ARCH_s390x      = s390x
 QEMU_ARCH_s390       = s390x
 QEMU_ARCH_loongarch  = loongarch64
+QEMU_ARCH_m68k       = m68k
 QEMU_ARCH            = $(QEMU_ARCH_$(XARCH))
 
 QEMU_ARCH_USER_ppc64le = ppc64le
@@ -152,6 +156,7 @@ QEMU_ARGS_riscv64    = -M virt -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_T
 QEMU_ARGS_s390x      = -M s390-ccw-virtio -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_s390       = -M s390-ccw-virtio -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_loongarch  = -M virt -append "console=ttyS0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_m68k       = -M virt -append "console=ttyGF0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS            = -m 1G $(QEMU_ARGS_$(XARCH)) $(QEMU_ARGS_BIOS) $(QEMU_ARGS_EXTRA)
 
 # OUTPUT is only set when run from the main makefile, otherwise
diff --git a/tools/testing/selftests/nolibc/run-tests.sh b/tools/testing/selftests/nolibc/run-tests.sh
index 0299a0912d40..ba90c0b8c482 100755
--- a/tools/testing/selftests/nolibc/run-tests.sh
+++ b/tools/testing/selftests/nolibc/run-tests.sh
@@ -25,6 +25,7 @@ all_archs=(
 	riscv32 riscv64
 	s390x s390
 	loongarch
+	m68k
 )
 archs="${all_archs[@]}"
 
-- 
2.49.0

