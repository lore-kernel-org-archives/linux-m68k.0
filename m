From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH/RFC 2/2] m68k/amiga: Provide mach_get_cycles()
Date: Mon,  9 Sep 2013 21:26:14 +0200
Message-ID: <1378754774-25804-2-git-send-email-geert__38025.5682197914$1378754809$gmane$org@linux-m68k.org>
References: <1378754774-25804-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1378754774-25804-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Thorsten Glaser <tg@mirbsd.de>, Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Use the 24-bit Time-Of-Day clock in CIA B, which is clocked by HSYNC.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
  1. Completely untested! It does compile ;-)

  2. Is a 24-bit counter running at 15-31 kHz good enough?
     Two cascaded 16-bit CIA timers running from the 700 kHz E-clock would
     be better, but as jiffies use CIA B Timer A and the floppy driver uses
     CIA A Timer B, we don't have two available timers in the same CIA
     without some code shuffling.

  3. What are the semantics of get_cycles()?
     Does it have to be a "nice" counter, or can there be some
     irregularities?
     I.e. can I add one more line
     
	x = (x << 8) | ciab.talo;	// low byte of 700 kHz timer
	
     to get 32 bits?

 arch/m68k/amiga/config.c |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
index acd9c16..914e056 100644
--- a/arch/m68k/amiga/config.c
+++ b/arch/m68k/amiga/config.c
@@ -358,6 +358,20 @@ static void __init amiga_identify(void)
 #undef AMIGAHW_ANNOUNCE
 }
 
+
+static cycles_t amiga_get_cycles(void)
+{
+	cycles_t x;
+
+	/* CIA B 24-bit TOD is clocked by HSYNC */
+	x = ciab.todhi;
+	x = (x << 8) | ciab.todmid;
+	x = (x << 8) | ciab.todlo;
+
+	return x;
+}
+
+
     /*
      *  Setup the Amiga configuration info
      */
@@ -395,6 +409,8 @@ void __init config_amiga(void)
 	mach_heartbeat = amiga_heartbeat;
 #endif
 
+	mach_get_cycles = amiga_get_cycles;
+
 	/* Fill in the clock value (based on the 700 kHz E-Clock) */
 	amiga_colorclock = 5*amiga_eclock;	/* 3.5 MHz */
 
-- 
1.7.9.5
