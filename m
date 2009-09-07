From: sfking@fdwdc.com
Subject: [RFC 20/31] proof of concept merge of m68k and m68knommu
Date: Sun,  6 Sep 2009 22:40:10 -0700
Message-ID: <572b33baa354e24a1e4ddfbaaf4b9ad71f262f0c.1252222134.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
 <cfdcab7374087d5279ec9a1269831e8159d98f2b.1252222133.git.sfking@fdwdc.com>
 <8cb57205150fb96915e9d12c936be301a5e1e1e1.1252222133.git.sfking@fdwdc.com>
 <44c52df23985288bc2f4a819b73b3cc6da0826b9.1252222133.git.sfking@fdwdc.com>
 <6db080fb352e20adab49ed7762d3200831160b0f.1252222133.git.sfking@fdwdc.com>
 <c2e845e94079ee2a24e19456666f571c687f93f7.1252222133.git.sfking@fdwdc.com>
 <afa7a198356e79718b7682ea33cdfeec1933ae3d.1252222133.git.sfking@fdwdc.com>
 <f6625c80e8b3246063209517cccc855c056b2b71.1252222133.git.sfking@fdwdc.com>
 <55335001e487bd208ef4801c9df7e2d38a842ad3.1252222134.git.sfking@fdwdc.com>
 <1960838f2a4476b115b27420dcec29f81f0a15c1.1252222134.git.sfking@fdwdc.com>
 <491494a31232c4ce3a7fb96c3ed9db228f0ec5b4.1252222134.git.sfking@fdwdc.com>
 <b5baa71b2c543432ce8561ef7c18ef73201d47a8.1252222134.git.sfking@fdwdc.com>
 <fa246e049b7bc779d1c85def3f733a540463c3e2.1252222134.git.sfking@fdwdc.com>
 <c90263ddd638105b7df953128fd150d7fafc56ee.1252222134.git.sfking@fdwdc.com>
 <732b3e401d3708f1abf810ff0028e48d63df7e4b.1252222134.git.sfking@fdwdc.com>
 <9132c5b379a84a9b9a8762fc557abcae6e6ca479.1252222134.git.sfking@fdwdc.com>
 <f9216a12af8475d50631ae2dfea94d807aae1c1f.1252222134.git.sfking@fdwdc.com>
 <58c8b539029e276a7fc7ddeca2f2909845959c25.1252222134.git.sfking@fdwdc.com>
 <7916cd27beda9a78f37dcd9bef81229fcf67e7c6.1252222134.git.sfking@fdwdc.com>
 <f3cef3055f176a78514b07c083d19b5aec5f821f.1252222134.git.sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp109.biz.mail.mud.yahoo.com ([68.142.201.178]:34444 "HELO
	smtp109.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1758977AbZIGFrT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 01:47:19 -0400
In-Reply-To: <f3cef3055f176a78514b07c083d19b5aec5f821f.1252222134.git.sfking@fdwdc.com>
In-Reply-To: <cover.1252222129.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org

---
 arch/m68k/lib/muldi3.c                             |   68 ++------------------
 arch/m68k/lib/{muldi3.c => muldi3_mm.c}            |    0 
 .../lib/muldi3.c => m68k/lib/muldi3_no.c}          |    0 
 3 files changed, 5 insertions(+), 63 deletions(-)
 copy arch/m68k/lib/{muldi3.c => muldi3_mm.c} (100%)
 copy arch/{m68knommu/lib/muldi3.c => m68k/lib/muldi3_no.c} (100%)

diff --git a/arch/m68k/lib/muldi3.c b/arch/m68k/lib/muldi3.c
index be4f275..16e0eb3 100644
--- a/arch/m68k/lib/muldi3.c
+++ b/arch/m68k/lib/muldi3.c
@@ -1,63 +1,5 @@
-/* muldi3.c extracted from gcc-2.7.2.3/libgcc2.c and
-			   gcc-2.7.2.3/longlong.h which is: */
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
-GNU General Public License for more details.
-
-You should have received a copy of the GNU General Public License
-along with GNU CC; see the file COPYING.  If not, write to
-the Free Software Foundation, 59 Temple Place - Suite 330,
-Boston, MA 02111-1307, USA.  */
-
-#define BITS_PER_UNIT 8
-
-#define umul_ppmm(w1, w0, u, v) \
-  __asm__ ("mulu%.l %3,%1:%0"						\
-           : "=d" ((USItype)(w0)),					\
-             "=d" ((USItype)(w1))					\
-           : "%0" ((USItype)(u)),					\
-             "dmi" ((USItype)(v)))
-
-#define __umulsidi3(u, v) \
-  ({DIunion __w;							\
-    umul_ppmm (__w.s.high, __w.s.low, u, v);				\
-    __w.ll; })
-
-typedef		 int SItype	__attribute__ ((mode (SI)));
-typedef unsigned int USItype	__attribute__ ((mode (SI)));
-typedef		 int DItype	__attribute__ ((mode (DI)));
-typedef int word_type __attribute__ ((mode (__word__)));
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
-__muldi3 (DItype u, DItype v)
-{
-  DIunion w;
-  DIunion uu, vv;
-
-  uu.ll = u,
-  vv.ll = v;
-
-  w.ll = __umulsidi3 (uu.s.low, vv.s.low);
-  w.s.high += ((USItype) uu.s.low * (USItype) vv.s.high
-	       + (USItype) uu.s.high * (USItype) vv.s.low);
-
-  return w.ll;
-}
+#ifdef CONFIG_MMU
+#include "muldi3_mm.c"
+#else
+#include "muldi3_no.c"
+#endif
diff --git a/arch/m68k/lib/muldi3.c b/arch/m68k/lib/muldi3_mm.c
similarity index 100%
copy from arch/m68k/lib/muldi3.c
copy to arch/m68k/lib/muldi3_mm.c
diff --git a/arch/m68knommu/lib/muldi3.c b/arch/m68k/lib/muldi3_no.c
similarity index 100%
copy from arch/m68knommu/lib/muldi3.c
copy to arch/m68k/lib/muldi3_no.c
-- 
1.5.6.5

