From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68k: add missing SOFTIRQENTRY_TEXT linker section
Date: Tue, 14 Nov 2017 16:04:37 +1000
Message-ID: <1510639477-30734-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out1.external.iinet.net.au ([203.59.1.210]:26809
        "EHLO icp-osb-irony-out1.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750790AbdKNGEx (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 14 Nov 2017 01:04:53 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>

Commit be7635e7287e ("arch, ftrace: for KASAN put hard/soft IRQ entries
into separate sections") added a new linker section, SOFTIRQENTRY_TEXT,
to the linker scripts for most architectures. It didn't add it to any of
the linker scripts for the m68k architecture. This was not really a problem
because it is only defined if either of CONFIG_FUNCTION_GRAPH_TRACER or
CONFIG_KASAN are enabled - which can never be true for m68k.

However commit 229a71860547 ("irq: Make the irqentry text section
unconditional") means that SOFTIRQENTRY_TEXT is now always defined. So on
m68k we now end up with a separate ELF section for .softirqentry.text
instead of it being part of the .text section. On some m68k targets in some
configurations this can also cause a fatal link error:

  LD      vmlinux
/usr/local/bin/../m68k-uclinux/bin/ld.real: section .softirqentry.text loaded at [0000000010de10c0,0000000010de12dd] overlaps section .rodata loaded at [0000000010de10c0,0000000010e0fd67]

To fix add in the missing SOFTIRQENTRY_TEXT section into the m68k linker
scripts. I noticed that m68k is also missing the IRQENTRY_TEXT section,
so this patch also adds an entry for that too.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/kernel/vmlinux-nommu.lds | 2 ++
 arch/m68k/kernel/vmlinux-std.lds   | 2 ++
 arch/m68k/kernel/vmlinux-sun3.lds  | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/m68k/kernel/vmlinux-nommu.lds b/arch/m68k/kernel/vmlinux-nommu.lds
index 3aa571a..cf6edda 100644
--- a/arch/m68k/kernel/vmlinux-nommu.lds
+++ b/arch/m68k/kernel/vmlinux-nommu.lds
@@ -45,6 +45,8 @@ SECTIONS {
 	.text : {
 		HEAD_TEXT
 		TEXT_TEXT
+		IRQENTRY_TEXT
+		SOFTIRQENTRY_TEXT
 		SCHED_TEXT
 		CPUIDLE_TEXT
 		LOCK_TEXT
diff --git a/arch/m68k/kernel/vmlinux-std.lds b/arch/m68k/kernel/vmlinux-std.lds
index 89172b8..625a578 100644
--- a/arch/m68k/kernel/vmlinux-std.lds
+++ b/arch/m68k/kernel/vmlinux-std.lds
@@ -16,6 +16,8 @@ SECTIONS
   .text : {
 	HEAD_TEXT
 	TEXT_TEXT
+	IRQENTRY_TEXT
+	SOFTIRQENTRY_TEXT
 	SCHED_TEXT
 	CPUIDLE_TEXT
 	LOCK_TEXT
diff --git a/arch/m68k/kernel/vmlinux-sun3.lds b/arch/m68k/kernel/vmlinux-sun3.lds
index 293990e..9868270 100644
--- a/arch/m68k/kernel/vmlinux-sun3.lds
+++ b/arch/m68k/kernel/vmlinux-sun3.lds
@@ -16,6 +16,8 @@ SECTIONS
   .text : {
 	HEAD_TEXT
 	TEXT_TEXT
+	IRQENTRY_TEXT
+	SOFTIRQENTRY_TEXT
 	SCHED_TEXT
 	CPUIDLE_TEXT
 	LOCK_TEXT
-- 
1.9.1
