From: sfking@fdwdc.com
Subject: [RFC 17/31] proof of concept merge of m68k and m68knommu
Date: Sun,  6 Sep 2009 22:40:07 -0700
Message-ID: <58c8b539029e276a7fc7ddeca2f2909845959c25.1252222134.git.sfking@fdwdc.com>
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
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp109.biz.mail.mud.yahoo.com ([68.142.201.178]:34435 "HELO
	smtp109.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1758955AbZIGFrQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 01:47:16 -0400
In-Reply-To: <f9216a12af8475d50631ae2dfea94d807aae1c1f.1252222134.git.sfking@fdwdc.com>
In-Reply-To: <cover.1252222129.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org

---
 arch/m68k/kernel/vmlinux.lds.S                     |   11 +++--------
 .../kernel/{vmlinux.lds.S => vmlinux_mm.lds.S}     |    0 
 .../vmlinux.lds.S => m68k/kernel/vmlinux_no.lds.S} |    0 
 3 files changed, 3 insertions(+), 8 deletions(-)
 copy arch/m68k/kernel/{vmlinux.lds.S => vmlinux_mm.lds.S} (100%)
 copy arch/{m68knommu/kernel/vmlinux.lds.S => m68k/kernel/vmlinux_no.lds.S} (100%)

diff --git a/arch/m68k/kernel/vmlinux.lds.S b/arch/m68k/kernel/vmlinux.lds.S
index 99ba315..de46d6b 100644
--- a/arch/m68k/kernel/vmlinux.lds.S
+++ b/arch/m68k/kernel/vmlinux.lds.S
@@ -1,10 +1,5 @@
-PHDRS
-{
-  text PT_LOAD FILEHDR PHDRS FLAGS (7);
-  data PT_LOAD FLAGS (7);
-}
-#ifdef CONFIG_SUN3
-#include "vmlinux-sun3.lds"
+#ifdef CONFIG_MMU
+#include "vmlinux_mm.lds.S"
 #else
-#include "vmlinux-std.lds"
+#include "vmlinux_no.lds.S"
 #endif
diff --git a/arch/m68k/kernel/vmlinux.lds.S b/arch/m68k/kernel/vmlinux_mm.lds.S
similarity index 100%
copy from arch/m68k/kernel/vmlinux.lds.S
copy to arch/m68k/kernel/vmlinux_mm.lds.S
diff --git a/arch/m68knommu/kernel/vmlinux.lds.S b/arch/m68k/kernel/vmlinux_no.lds.S
similarity index 100%
copy from arch/m68knommu/kernel/vmlinux.lds.S
copy to arch/m68k/kernel/vmlinux_no.lds.S
-- 
1.5.6.5

