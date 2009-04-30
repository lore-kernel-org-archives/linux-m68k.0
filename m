From: Tim Abbott <tabbott@MIT.EDU>
Subject: [PATCH 2/2] m68k: use new macros for .data.init_task.
Date: Thu, 30 Apr 2009 19:49:23 -0400
Message-ID: <1241135363-8506-3-git-send-email-tabbott@mit.edu>
References: <1241135363-8506-1-git-send-email-tabbott@mit.edu>
 <1241135363-8506-2-git-send-email-tabbott@mit.edu>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from BISCAYNE-ONE-STATION.MIT.EDU ([18.7.7.80]:59956 "EHLO
	biscayne-one-station.mit.edu" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1763299AbZD3XvC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 30 Apr 2009 19:51:02 -0400
In-Reply-To: <1241135363-8506-2-git-send-email-tabbott@mit.edu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>, Anders Kaseorg <andersk@mit.edu>, Waseem Daher <wdaher@mit.edu>, Denys Vlasenko <vda.linux@googlemail.com>, Jeff Arnold <jbarnold@mit.edu>, Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, Tim Abbott <tabbott@mit.edu>

.data.init_task should not need a separate output section; this change
moves it into the .data section.

I changed the aligment in both linker scripts to be THREAD_SIZE from
8192 and PAGE_SIZE, respectively.  I'd like an ack from one of the
m68k maintainers that this is right.

Signed-off-by: Tim Abbott <tabbott@mit.edu>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
---
 arch/m68k/kernel/process.c        |    4 ++--
 arch/m68k/kernel/vmlinux-std.lds  |    3 +--
 arch/m68k/kernel/vmlinux-sun3.lds |    2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index ec37fb5..6bf2cac 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -46,8 +46,8 @@ struct mm_struct init_mm = INIT_MM(init_mm);
 
 EXPORT_SYMBOL(init_mm);
 
-union thread_union init_thread_union
-__attribute__((section(".data.init_task"), aligned(THREAD_SIZE)))
+union thread_union init_thread_union __init_task_data
+__attribute__((aligned(THREAD_SIZE)))
        = { INIT_THREAD_INFO(init_task) };
 
 /* initial task structure */
diff --git a/arch/m68k/kernel/vmlinux-std.lds b/arch/m68k/kernel/vmlinux-std.lds
index ac800bc..9e3cd1d 100644
--- a/arch/m68k/kernel/vmlinux-std.lds
+++ b/arch/m68k/kernel/vmlinux-std.lds
@@ -30,6 +30,7 @@ SECTIONS
   RODATA
 
   .data : {			/* Data */
+	INIT_TASK_DATA(THREAD_SIZE)
 	CACHELINE_ALIGNED_DATA(16)
 	DATA_DATA
 	CONSTRUCTORS
@@ -76,8 +77,6 @@ SECTIONS
   . = ALIGN(8192);
   __init_end = .;
 
-  .data.init_task : { *(.data.init_task) }	/* The initial task and kernel stack */
-
   _end = . ;
 
   /* Sections to be discarded */
diff --git a/arch/m68k/kernel/vmlinux-sun3.lds b/arch/m68k/kernel/vmlinux-sun3.lds
index c192f77..8a988db 100644
--- a/arch/m68k/kernel/vmlinux-sun3.lds
+++ b/arch/m68k/kernel/vmlinux-sun3.lds
@@ -24,6 +24,7 @@ SECTIONS
   _etext = .;			/* End of text section */
 
   .data : {			/* Data */
+	INIT_TASK_DATA(THREAD_SIZE)
 	DATA_DATA
 	CONSTRUCTORS
 	. = ALIGN(16);		/* Exception table */
@@ -70,7 +71,6 @@ __init_begin = .;
 #endif
 	. = ALIGN(PAGE_SIZE);
 	__init_end = .;
-	.data.init.task : { *(.data.init_task) }
 
 
   .bss : { *(.bss) }		/* BSS */
-- 
1.6.2.1

