From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: [PATCH] arch: m68k: mvme147: config.c:  Remove unused function
Date: Thu,  1 Jan 2015 17:49:11 +0100
Message-ID: <1420130951-29766-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, linux-kernel@vger.kernel.org

Remove the function mvme147_init_console_port() that is not used anywhere.

This was partially found by using a static code analysis program called cppcheck.

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
---
 arch/m68k/mvme147/config.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/m68k/mvme147/config.c b/arch/m68k/mvme147/config.c
index 1bb3ce6..5da5e6e 100644
--- a/arch/m68k/mvme147/config.c
+++ b/arch/m68k/mvme147/config.c
@@ -209,8 +209,3 @@ void m147_scc_write (struct console *co, const char *str, unsigned count)
 	}
 	local_irq_restore(flags);
 }
-
-void mvme147_init_console_port (struct console *co, int cflag)
-{
-	co->write    = m147_scc_write;
-}
-- 
1.7.10.4
