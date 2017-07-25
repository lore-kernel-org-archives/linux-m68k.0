From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2] m68k: Restore symbol versions for symbols exported from assembly
Date: Tue, 25 Jul 2017 09:09:35 +0200
Message-ID: <1500966575-4136-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Ben Hutchings <ben@decadent.org.uk>, Greg Ungerer <gerg@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

From: Ben Hutchings <ben@decadent.org.uk>

WARNING: EXPORT symbol "__divsi3" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__umodsi3" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__mulsi3" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__modsi3" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__udivsi3" [vmlinux] version generation failed, symbol will not be versioned.

Add <asm/asm-prototypes.h> so that genksyms knows the types of these
symbols and can generate CRCs for them.

Fixes: d13ffb563044 ("m68k: move exports to definitions"
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
[geert: Add warning messages, match actual prototypes]
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Based on gccint.info

Several prototypes in the kernel disagree w.r.t. signedness of the
second parameter, and use e.g.

    signed int __divsi3(signed int, unsigned int);

v2:
  - Add warning messages, match actual prototypes.
---
 arch/m68k/include/asm/asm-prototypes.h | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 arch/m68k/include/asm/asm-prototypes.h

diff --git a/arch/m68k/include/asm/asm-prototypes.h b/arch/m68k/include/asm/asm-prototypes.h
new file mode 100644
index 0000000000000000..22ccb9c975767201
--- /dev/null
+++ b/arch/m68k/include/asm/asm-prototypes.h
@@ -0,0 +1,5 @@
+extern int __divsi3(int, int);
+extern int __modsi3(int, int);
+extern int __mulsi3(int, int);
+extern unsigned int __udivsi3(unsigned int, unsigned int);
+extern unsigned int __umodsi3(unsigned int, unsigned int);
-- 
2.7.4
