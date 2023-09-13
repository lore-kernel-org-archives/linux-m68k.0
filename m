Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB7CCA5500
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 07:14:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238367AbjIMHOR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 03:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238419AbjIMHOQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 03:14:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01AC1729
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 00:14:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 59908617BD;
        Wed, 13 Sep 2023 07:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8CCBC433C8;
        Wed, 13 Sep 2023 07:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694589251;
        bh=pmse5hSEBZUw5E6i+3bNi5x2lkXGKDqiv7zF8a9ECqY=;
        h=From:To:Cc:Subject:Date:From;
        b=MNc3ZLqTmc9CUdhM9teyMoT9L4M4UC2Sk3YwmKN5ZRrcgjcQtNlVMGUBisrwaZieq
         BAcjKs2srUA71jo+gv7URLgoOb51odL4rEFAvT67FZQOzejU+sa/FSXmo9pio8f1B3
         bZIH6yP/LQuXkXtf8Oiaa5xX2EB9H2yEyt1osDfok6GALWgvIzFt+JtAxVjEP+79P9
         cOm6PaT4euF9J7Gu2JWbo1lXlbNLQammcqKetqd9A0+K/X68JBR8ZplyMxHiiyNAdr
         TS/mkSVQgbmPUx1c1vJairdbO83FeMKWZ44Yh0KeIBSj4HWG7uBpEsSz5kcIjWu+Yk
         NPhapbbgbauLQ==
From:   Greg Ungerer <gerg@kernel.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     geert@linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68k: use kernel's generic libgcc functions
Date:   Wed, 13 Sep 2023 17:13:50 +1000
Message-Id: <20230913071350.1939818-1-gerg@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Greg Ungerer <gerg@linux-m68k.org>

The arch/m68k/lib versions of the libgcc functions: ashldi3, ashrdi3
and lshrdi3 were taken directly from an older version of gcc.
We can use the kernel's own generic lib versions of these - they are
virtually identical. Switch to those and remove the m68k local ones.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---

Tested on ColdFire and on an Atari build under aranym.

 arch/m68k/Kconfig       |  3 ++
 arch/m68k/lib/Makefile  |  3 +-
 arch/m68k/lib/ashldi3.c | 61 ----------------------------------------
 arch/m68k/lib/ashrdi3.c | 62 -----------------------------------------
 arch/m68k/lib/lshrdi3.c | 61 ----------------------------------------
 5 files changed, 4 insertions(+), 186 deletions(-)
 delete mode 100644 arch/m68k/lib/ashldi3.c
 delete mode 100644 arch/m68k/lib/ashrdi3.c
 delete mode 100644 arch/m68k/lib/lshrdi3.c

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 3e318bf9504c..3e96486d9528 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -19,6 +19,9 @@ config M68K
 	select GENERIC_CPU_DEVICES
 	select GENERIC_IOMAP
 	select GENERIC_IRQ_SHOW
+	select GENERIC_LIB_ASHLDI3
+	select GENERIC_LIB_ASHRDI3
+	select GENERIC_LIB_LSHRDI3
 	select HAS_IOPORT if PCI || ISA || ATARI_ROM_ISA
 	select HAVE_ARCH_SECCOMP
 	select HAVE_ARCH_SECCOMP_FILTER
diff --git a/arch/m68k/lib/Makefile b/arch/m68k/lib/Makefile
index eca17f14b4d5..9158688e6cc6 100644
--- a/arch/m68k/lib/Makefile
+++ b/arch/m68k/lib/Makefile
@@ -4,8 +4,7 @@
 # Makefile for m68k-specific library files..
 #
 
-lib-y	:= ashldi3.o ashrdi3.o lshrdi3.o muldi3.o \
-	   memcpy.o memset.o memmove.o
+lib-y	:= muldi3.o memcpy.o memset.o memmove.o
 
 lib-$(CONFIG_MMU) += uaccess.o
 lib-$(CONFIG_CPU_HAS_NO_MULDIV64) += mulsi3.o divsi3.o udivsi3.o
diff --git a/arch/m68k/lib/ashldi3.c b/arch/m68k/lib/ashldi3.c
deleted file mode 100644
index ac08f8141390..000000000000
--- a/arch/m68k/lib/ashldi3.c
+++ /dev/null
@@ -1,61 +0,0 @@
-/* ashrdi3.c extracted from gcc-2.95.2/libgcc2.c which is: */
-/* Copyright (C) 1989, 92-98, 1999 Free Software Foundation, Inc.
-
-This file is part of GNU CC.
-
-GNU CC is free software; you can redistribute it and/or modify
-it under the terms of the GNU General Public License as published by
-the Free Software Foundation; either version 2, or (at your option)
-any later version.
-
-GNU CC is distributed in the hope that it will be useful,
-but WITHOUT ANY WARRANTY; without even the implied warranty of
-MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-GNU General Public License for more details. */
-
-#include <linux/compiler.h>
-#include <linux/export.h>
-
-#define BITS_PER_UNIT 8
-
-typedef		 int SItype	__mode(SI);
-typedef unsigned int USItype	__mode(SI);
-typedef		 int DItype	__mode(DI);
-typedef int word_type           __mode(__word__);
-
-struct DIstruct {SItype high, low;};
-
-typedef union
-{
-  struct DIstruct s;
-  DItype ll;
-} DIunion;
-
-DItype
-__ashldi3 (DItype u, word_type b)
-{
-  DIunion w;
-  word_type bm;
-  DIunion uu;
-
-  if (b == 0)
-    return u;
-
-  uu.ll = u;
-
-  bm = (sizeof (SItype) * BITS_PER_UNIT) - b;
-  if (bm <= 0)
-    {
-      w.s.low = 0;
-      w.s.high = (USItype)uu.s.low << -bm;
-    }
-  else
-    {
-      USItype carries = (USItype)uu.s.low >> bm;
-      w.s.low = (USItype)uu.s.low << b;
-      w.s.high = ((USItype)uu.s.high << b) | carries;
-    }
-
-  return w.ll;
-}
-EXPORT_SYMBOL(__ashldi3);
diff --git a/arch/m68k/lib/ashrdi3.c b/arch/m68k/lib/ashrdi3.c
deleted file mode 100644
index 5837b1dd3334..000000000000
--- a/arch/m68k/lib/ashrdi3.c
+++ /dev/null
@@ -1,62 +0,0 @@
-/* ashrdi3.c extracted from gcc-2.7.2/libgcc2.c which is: */
-/* Copyright (C) 1989, 1992, 1993, 1994, 1995 Free Software Foundation, Inc.
-
-This file is part of GNU CC.
-
-GNU CC is free software; you can redistribute it and/or modify
-it under the terms of the GNU General Public License as published by
-the Free Software Foundation; either version 2, or (at your option)
-any later version.
-
-GNU CC is distributed in the hope that it will be useful,
-but WITHOUT ANY WARRANTY; without even the implied warranty of
-MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-GNU General Public License for more details. */
-
-#include <linux/compiler.h>
-#include <linux/export.h>
-
-#define BITS_PER_UNIT 8
-
-typedef		 int SItype	__mode(SI);
-typedef unsigned int USItype	__mode(SI);
-typedef		 int DItype	__mode(DI);
-typedef int word_type           __mode(__word__);
-
-struct DIstruct {SItype high, low;};
-
-typedef union
-{
-  struct DIstruct s;
-  DItype ll;
-} DIunion;
-
-DItype
-__ashrdi3 (DItype u, word_type b)
-{
-  DIunion w;
-  word_type bm;
-  DIunion uu;
-
-  if (b == 0)
-    return u;
-
-  uu.ll = u;
-
-  bm = (sizeof (SItype) * BITS_PER_UNIT) - b;
-  if (bm <= 0)
-    {
-      /* w.s.high = 1..1 or 0..0 */
-      w.s.high = uu.s.high >> (sizeof (SItype) * BITS_PER_UNIT - 1);
-      w.s.low = uu.s.high >> -bm;
-    }
-  else
-    {
-      USItype carries = (USItype)uu.s.high << bm;
-      w.s.high = uu.s.high >> b;
-      w.s.low = ((USItype)uu.s.low >> b) | carries;
-    }
-
-  return w.ll;
-}
-EXPORT_SYMBOL(__ashrdi3);
diff --git a/arch/m68k/lib/lshrdi3.c b/arch/m68k/lib/lshrdi3.c
deleted file mode 100644
index 7f40566be6c8..000000000000
--- a/arch/m68k/lib/lshrdi3.c
+++ /dev/null
@@ -1,61 +0,0 @@
-/* lshrdi3.c extracted from gcc-2.7.2/libgcc2.c which is: */
-/* Copyright (C) 1989, 1992, 1993, 1994, 1995 Free Software Foundation, Inc.
-
-This file is part of GNU CC.
-
-GNU CC is free software; you can redistribute it and/or modify
-it under the terms of the GNU General Public License as published by
-the Free Software Foundation; either version 2, or (at your option)
-any later version.
-
-GNU CC is distributed in the hope that it will be useful,
-but WITHOUT ANY WARRANTY; without even the implied warranty of
-MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-GNU General Public License for more details. */
-
-#include <linux/compiler.h>
-#include <linux/export.h>
-
-#define BITS_PER_UNIT 8
-
-typedef		 int SItype	__mode(SI);
-typedef unsigned int USItype	__mode(SI);
-typedef		 int DItype	__mode(DI);
-typedef int word_type           __mode(__word__);
-
-struct DIstruct {SItype high, low;};
-
-typedef union
-{
-  struct DIstruct s;
-  DItype ll;
-} DIunion;
-
-DItype
-__lshrdi3 (DItype u, word_type b)
-{
-  DIunion w;
-  word_type bm;
-  DIunion uu;
-
-  if (b == 0)
-    return u;
-
-  uu.ll = u;
-
-  bm = (sizeof (SItype) * BITS_PER_UNIT) - b;
-  if (bm <= 0)
-    {
-      w.s.high = 0;
-      w.s.low = (USItype)uu.s.high >> -bm;
-    }
-  else
-    {
-      USItype carries = (USItype)uu.s.high << bm;
-      w.s.high = (USItype)uu.s.high >> b;
-      w.s.low = ((USItype)uu.s.low >> b) | carries;
-    }
-
-  return w.ll;
-}
-EXPORT_SYMBOL(__lshrdi3);
-- 
2.25.1

