From: Tim Abbott <tabbott@MIT.EDU>
Subject: [PATCH 1/2] m68k: use new macro for .data.cacheline_aligned section.
Date: Thu, 30 Apr 2009 19:49:22 -0400
Message-ID: <1241135363-8506-2-git-send-email-tabbott@mit.edu>
References: <1241135363-8506-1-git-send-email-tabbott@mit.edu>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from BISCAYNE-ONE-STATION.MIT.EDU ([18.7.7.80]:60506 "EHLO
	biscayne-one-station.mit.edu" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1764350AbZD3XyP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 30 Apr 2009 19:54:15 -0400
In-Reply-To: <1241135363-8506-1-git-send-email-tabbott@mit.edu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>, Anders Kaseorg <andersk@mit.edu>, Waseem Daher <wdaher@mit.edu>, Denys Vlasenko <vda.linux@googlemail.com>, Jeff Arnold <jbarnold@mit.edu>, Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, Tim Abbott <tabbott@mit.edu>

.data.cacheline_aligned should not need a separate output section;
this change moves it into the .data section.

Signed-off-by: Tim Abbott <tabbott@mit.edu>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
---
 arch/m68k/kernel/vmlinux-std.lds |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/kernel/vmlinux-std.lds b/arch/m68k/kernel/vmlinux-std.lds
index 01d212b..ac800bc 100644
--- a/arch/m68k/kernel/vmlinux-std.lds
+++ b/arch/m68k/kernel/vmlinux-std.lds
@@ -30,13 +30,11 @@ SECTIONS
   RODATA
 
   .data : {			/* Data */
+	CACHELINE_ALIGNED_DATA(16)
 	DATA_DATA
 	CONSTRUCTORS
 	}
 
-  . = ALIGN(16);
-  .data.cacheline_aligned : { *(.data.cacheline_aligned) }
-
   .bss : { *(.bss) }		/* BSS */
 
   _edata = .;			/* End of data section */
-- 
1.6.2.1

