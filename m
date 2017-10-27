From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 3/4] m68k/mac: Disentangle VIA/RBV and NuBus initialization
Date: Thu, 26 Oct 2017 22:45:24 -0400 (EDT)
Message-ID: <f6955de1853b5b5b706acadaea06f9f40caaf1c2.1509071937.git.fthain@telegraphics.com.au>
References: <cover.1509071937.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1509071937.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

The Nubus subsystem should not be concerned with differences between VIA,
RBV and OSS platforms. It should be portable across Macs and PowerMacs.
This goal has implications for the initialization code relating to bus
locking and slot interrupts.

During Nubus initialization, bus transactions are "unlocked": on VIA2 and
RBV machines, via_nubus_init() sets a bit in the via2[gBufB] register to
allow bus-mastering Nubus cards to arbitrate for the bus. This happens
upon subsys_initcall(nubus_init). But because nubus_init() has no effect
on card state, this sequence is arbitrary.

Moreover, when Penguin is used to boot Linux, the bus is already unlocked
when Linux starts. On OSS machines there's no attempt to unlock Nubus
transactions at all. (Maybe there's no benefit on that platform or maybe
no-one knows how.)

All of this demonstrates that there's no benefit in locking out
bus-mastering cards, as yet. (If the need arises, we could lock the bus
for the duration of a timing-critical operation.) NetBSD unlocks the
Nubus early (at VIA initialization) and we can do the same.

via_nubus_init() is also responsible for some VIA interrupt setup that
should happen earlier than subsys_initcall(nubus_init). And actually, the
Nubus subsystem need not be involved with slot interrupts: SLOT2IRQ
works fine because Nubus slot IRQs are geographically assigned
(regardless of platform).

For certain platforms with PDS slots, some Nubus IRQs may be platform
IRQs and this is not something that the NuBus subsystem should worry
about. So let's invoke via_nubus_init() earlier and make the platform
responsible for bus unlocking and interrupt setup instead of the NuBus
subsystem.

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 arch/m68k/mac/oss.c   |  8 --------
 arch/m68k/mac/via.c   |  5 ++++-
 drivers/nubus/nubus.c | 13 -------------
 3 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/arch/m68k/mac/oss.c b/arch/m68k/mac/oss.c
index 61906eb67d0f..21b85605db58 100644
--- a/arch/m68k/mac/oss.c
+++ b/arch/m68k/mac/oss.c
@@ -52,14 +52,6 @@ void __init oss_init(void)
 }
 
 /*
- * Initialize OSS for Nubus access
- */
-
-void __init oss_nubus_init(void)
-{
-}
-
-/*
  * Handle miscellaneous OSS interrupts.
  */
 
diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
index 19ad46ba4787..c38fab213e9f 100644
--- a/arch/m68k/mac/via.c
+++ b/arch/m68k/mac/via.c
@@ -106,6 +106,7 @@ static int gIER,gIFR,gBufA,gBufB;
 static u8 nubus_disabled;
 
 void via_debug_dump(void);
+static void via_nubus_init(void);
 
 /*
  * Initialize the VIAs
@@ -238,6 +239,8 @@ void __init via_init(void)
 		via2[vACR] &= ~0x03; /* disable port A & B latches */
 	}
 
+	via_nubus_init();
+
 	/* Everything below this point is VIA2 only... */
 
 	if (rbv_present)
@@ -359,7 +362,7 @@ int via_get_cache_disable(void)
  * Initialize VIA2 for Nubus access
  */
 
-void __init via_nubus_init(void)
+static void __init via_nubus_init(void)
 {
 	/* unlock nubus transactions */
 
diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index df431e8a0631..4f50f30650cd 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -18,11 +18,6 @@
 #include <asm/setup.h>
 #include <asm/page.h>
 #include <asm/hwtest.h>
-#include <asm/mac_via.h>
-#include <asm/mac_oss.h>
-
-extern void via_nubus_init(void);
-extern void oss_nubus_init(void);
 
 /* Constants */
 
@@ -840,14 +835,6 @@ static int __init nubus_init(void)
 	if (!MACH_IS_MAC)
 		return 0;
 
-	/* Initialize the NuBus interrupts */
-	if (oss_present) {
-		oss_nubus_init();
-	} else {
-		via_nubus_init();
-	}
-
-	/* And probe */
 	pr_info("NuBus: Scanning NuBus slots.\n");
 	nubus_devices = NULL;
 	nubus_boards = NULL;
-- 
2.13.6
