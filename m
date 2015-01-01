From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: [PATCH] arch: m68k: mac: misc.c:  Remove some unused functions
Date: Thu,  1 Jan 2015 18:02:12 +0100
Message-ID: <1420131732-31039-1-git-send-email-rickard_strandqvist__28729.8170653687$1420131577$gmane$org@spectrumdigital.se>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joshua Thompson <funaho@jurai.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Removes some functions that are not used anywhere:
mac_pram_write() mac_pram_read()

This was partially found by using a static code analysis program called cppcheck.

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
---
 arch/m68k/mac/misc.c |   46 ----------------------------------------------
 1 file changed, 46 deletions(-)

diff --git a/arch/m68k/mac/misc.c b/arch/m68k/mac/misc.c
index 707b61a..6fe7eb6 100644
--- a/arch/m68k/mac/misc.c
+++ b/arch/m68k/mac/misc.c
@@ -453,52 +453,6 @@ void pmu_shutdown(void)
  *-------------------------------------------------------------------
  */
 
-void mac_pram_read(int offset, __u8 *buffer, int len)
-{
-	__u8 (*func)(int);
-	int i;
-
-	switch(macintosh_config->adb_type) {
-	case MAC_ADB_IISI:
-		func = maciisi_read_pram; break;
-	case MAC_ADB_PB1:
-	case MAC_ADB_PB2:
-		func = pmu_read_pram; break;
-	case MAC_ADB_CUDA:
-		func = cuda_read_pram; break;
-	default:
-		func = via_read_pram;
-	}
-	if (!func)
-		return;
-	for (i = 0 ; i < len ; i++) {
-		buffer[i] = (*func)(offset++);
-	}
-}
-
-void mac_pram_write(int offset, __u8 *buffer, int len)
-{
-	void (*func)(int, __u8);
-	int i;
-
-	switch(macintosh_config->adb_type) {
-	case MAC_ADB_IISI:
-		func = maciisi_write_pram; break;
-	case MAC_ADB_PB1:
-	case MAC_ADB_PB2:
-		func = pmu_write_pram; break;
-	case MAC_ADB_CUDA:
-		func = cuda_write_pram; break;
-	default:
-		func = via_write_pram;
-	}
-	if (!func)
-		return;
-	for (i = 0 ; i < len ; i++) {
-		(*func)(offset++, buffer[i]);
-	}
-}
-
 void mac_poweroff(void)
 {
 	/*
-- 
1.7.10.4
