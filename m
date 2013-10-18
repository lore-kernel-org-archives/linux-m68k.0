From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 2/2] m68k/amiga: Provide mach_random_get_entropy()
Date: Fri, 18 Oct 2013 13:24:13 +0200
Message-ID: <1382095453-24086-2-git-send-email-geert__33893.8471315943$1382095493$gmane$org@linux-m68k.org>
References: <1382095453-24086-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1382095453-24086-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Use the beam position registers, which provide at least 17 bits of data
changing at 1.79 MHz.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - Use beam position registers (which provide a faster rate but less bits)
    instead of 24-bit Time-Of-Day clock in CIA B running at HSYNC.

 arch/m68k/amiga/config.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
index f78361bff623..0b46d32a345f 100644
--- a/arch/m68k/amiga/config.c
+++ b/arch/m68k/amiga/config.c
@@ -354,6 +354,14 @@ static void __init amiga_identify(void)
 #undef AMIGAHW_ANNOUNCE
 }
 
+
+static unsigned long amiga_random_get_entropy(void)
+{
+	/* VPOSR/VHPOSR provide at least 17 bits of data changing at 1.79 MHz */
+	return *(unsigned long *)&amiga_custom.vposr;
+}
+
+
     /*
      *  Setup the Amiga configuration info
      */
@@ -391,6 +399,8 @@ void __init config_amiga(void)
 	mach_heartbeat = amiga_heartbeat;
 #endif
 
+	mach_random_get_entropy = amiga_random_get_entropy;
+
 	/* Fill in the clock value (based on the 700 kHz E-Clock) */
 	amiga_colorclock = 5*amiga_eclock;	/* 3.5 MHz */
 
-- 
1.7.9.5
