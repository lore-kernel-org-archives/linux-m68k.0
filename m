From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] char: Drop bogus dependency of DEVPORT on !M68K
Date: Mon, 11 Apr 2016 10:40:55 +0200
Message-ID: <1460364055-10174-1-git-send-email-geert__47033.9353233159$1460364091$gmane$org@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Al Stone <ahs3@redhat.com>, Geoff Levand <geoff@infradead.org>, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>

According to full-history-linux commit d3794f4fa7c3edc3 ("[PATCH] M68k
update (part 25)"), port operations are allowed on m68k if CONFIG_ISA is
defined.

However, commit 153dcc54df826d2f ("[PATCH] mem driver: fix conditional
on isa i/o support") accidentally changed an "||" into an "&&",
disabling it completely on m68k. This logic was retained when
introducing the DEVPORT symbol in commit 4f911d64e04a44c4 ("Make
/dev/port conditional on config symbol").

Drop the bogus dependency on !M68K to fix this.

Fixes: 153dcc54df826d2f ("[PATCH] mem driver: fix conditional on isa i/o support")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/char/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index d3b8ddc6241cac2d..fa56bc757fe98fd1 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -585,7 +585,6 @@ config TELCLOCK
 
 config DEVPORT
 	bool
-	depends on !M68K
 	depends on ISA || PCI
 	default y
 
-- 
1.9.1
