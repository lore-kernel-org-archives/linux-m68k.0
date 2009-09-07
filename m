From: sfking@fdwdc.com
Subject: [RFC 18/31] proof of concept merge of m68k and m68knommu
Date: Sun,  6 Sep 2009 22:40:08 -0700
Message-ID: <7916cd27beda9a78f37dcd9bef81229fcf67e7c6.1252222134.git.sfking@fdwdc.com>
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
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp109.biz.mail.mud.yahoo.com ([68.142.201.178]:34439 "HELO
	smtp109.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1758973AbZIGFrR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 01:47:17 -0400
In-Reply-To: <58c8b539029e276a7fc7ddeca2f2909845959c25.1252222134.git.sfking@fdwdc.com>
In-Reply-To: <cover.1252222129.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org

---
 arch/m68k/lib/Makefile                             |   11 +++++------
 arch/m68k/lib/{Makefile => Makefile_mm}            |    0 
 .../lib/Makefile => m68k/lib/Makefile_no}          |    0 
 3 files changed, 5 insertions(+), 6 deletions(-)
 copy arch/m68k/lib/{Makefile => Makefile_mm} (100%)
 copy arch/{m68knommu/lib/Makefile => m68k/lib/Makefile_no} (100%)

diff --git a/arch/m68k/lib/Makefile b/arch/m68k/lib/Makefile
index af9abf8..1f95881 100644
--- a/arch/m68k/lib/Makefile
+++ b/arch/m68k/lib/Makefile
@@ -1,6 +1,5 @@
-#
-# Makefile for m68k-specific library files..
-#
-
-lib-y	:= ashldi3.o ashrdi3.o lshrdi3.o muldi3.o \
-	   checksum.o string.o uaccess.o
+ifdef CONFIG_MMU
+include arch/m68k/lib/Makefile_mm
+else
+include arch/m68k/lib/Makefile_no
+endif
diff --git a/arch/m68k/lib/Makefile b/arch/m68k/lib/Makefile_mm
similarity index 100%
copy from arch/m68k/lib/Makefile
copy to arch/m68k/lib/Makefile_mm
diff --git a/arch/m68knommu/lib/Makefile b/arch/m68k/lib/Makefile_no
similarity index 100%
copy from arch/m68knommu/lib/Makefile
copy to arch/m68k/lib/Makefile_no
-- 
1.5.6.5

