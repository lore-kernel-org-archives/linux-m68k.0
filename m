From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 1/2] m68k: Add infrastructure for machine-specific random_get_entropy()
Date: Fri, 18 Oct 2013 13:24:12 +0200
Message-ID: <1382095453-24086-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

On m68k, get_cycles() (the default implementation for random_get_entropy())
always returns zero, providing no entropy for the random driver.

Add a hook where platforms can provide their own implementation, and wire
it up in the infrastructure provided by commit
61875f30daf60305712e25b209ef41ced2635bad ("random: allow architectures to
optionally define random_get_entropy()").

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - Hook for random_get_entropy() instead of get_cycles()

 arch/m68k/include/asm/timex.h |   10 ++++++++++
 arch/m68k/kernel/time.c       |    4 ++++
 2 files changed, 14 insertions(+)

diff --git a/arch/m68k/include/asm/timex.h b/arch/m68k/include/asm/timex.h
index 6759dad954f6..efc1f4892357 100644
--- a/arch/m68k/include/asm/timex.h
+++ b/arch/m68k/include/asm/timex.h
@@ -28,4 +28,14 @@ static inline cycles_t get_cycles(void)
 	return 0;
 }
 
+extern unsigned long (*mach_random_get_entropy)(void);
+
+static inline unsigned long random_get_entropy(void)
+{
+	if (mach_random_get_entropy)
+		return mach_random_get_entropy();
+	return 0;
+}
+#define random_get_entropy	random_get_entropy
+
 #endif
diff --git a/arch/m68k/kernel/time.c b/arch/m68k/kernel/time.c
index 7eb9792009f8..958f1adb9d0c 100644
--- a/arch/m68k/kernel/time.c
+++ b/arch/m68k/kernel/time.c
@@ -28,6 +28,10 @@
 #include <linux/timex.h>
 #include <linux/profile.h>
 
+
+unsigned long (*mach_random_get_entropy)(void);
+
+
 /*
  * timer_interrupt() needs to keep up the real-time clock,
  * as well as call the "xtime_update()" routine every clocktick
-- 
1.7.9.5
