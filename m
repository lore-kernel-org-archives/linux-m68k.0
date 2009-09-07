From: sfking@fdwdc.com
Subject: [RFC 21/31] proof of concept merge of m68k and m68knommu
Date: Sun,  6 Sep 2009 22:40:11 -0700
Message-ID: <2e03009ed21c515946779f20bfbd182d04fa45fe.1252222134.git.sfking@fdwdc.com>
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
 <572b33baa354e24a1e4ddfbaaf4b9ad71f262f0c.1252222134.git.sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp109.biz.mail.mud.yahoo.com ([68.142.201.178]:34450 "HELO
	smtp109.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1758980AbZIGFrT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 01:47:19 -0400
In-Reply-To: <572b33baa354e24a1e4ddfbaaf4b9ad71f262f0c.1252222134.git.sfking@fdwdc.com>
In-Reply-To: <cover.1252222129.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org

---
 arch/m68k/mm/Makefile                              |   13 +++++--------
 arch/m68k/mm/{Makefile => Makefile_mm}             |    0 
 .../{m68knommu/mm/Makefile => m68k/mm/Makefile_no} |    0 
 3 files changed, 5 insertions(+), 8 deletions(-)
 copy arch/m68k/mm/{Makefile => Makefile_mm} (100%)
 copy arch/{m68knommu/mm/Makefile => m68k/mm/Makefile_no} (100%)

diff --git a/arch/m68k/mm/Makefile b/arch/m68k/mm/Makefile
index 5eaa43c..b60270e 100644
--- a/arch/m68k/mm/Makefile
+++ b/arch/m68k/mm/Makefile
@@ -1,8 +1,5 @@
-#
-# Makefile for the linux m68k-specific parts of the memory manager.
-#
-
-obj-y		:= cache.o init.o fault.o hwtest.o
-
-obj-$(CONFIG_MMU_MOTOROLA)	+= kmap.o memory.o motorola.o
-obj-$(CONFIG_MMU_SUN3)		+= sun3kmap.o sun3mmu.o
+ifdef CONFIG_MMU
+include arch/m68k/mm/Makefile_mm
+else
+include arch/m68k/mm/Makefile_no
+endif
diff --git a/arch/m68k/mm/Makefile b/arch/m68k/mm/Makefile_mm
similarity index 100%
copy from arch/m68k/mm/Makefile
copy to arch/m68k/mm/Makefile_mm
diff --git a/arch/m68knommu/mm/Makefile b/arch/m68k/mm/Makefile_no
similarity index 100%
copy from arch/m68knommu/mm/Makefile
copy to arch/m68k/mm/Makefile_no
-- 
1.5.6.5

