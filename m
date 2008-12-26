From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] m68k: fix recursive dependency in Kconfig
Date: Fri, 26 Dec 2008 22:46:43 +0100
Message-ID: <20081226214643.GA17590@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

We had a recursive dependency between MMU_MOTOROLA and MMU_SUN3
Fix it by dropping the unused dependencies on MMU_MOTOROLA.

MMU_MOTOROLA is set to y only using select so any dependencies
are anyway ignored.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
---

I hit this recursive dependency with a patched version
of kconfig so you may not see it today.
The fix is obvious - please apply.

	Sam


 arch/m68k/Kconfig |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 836fb66..c825bde 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -280,7 +280,6 @@ config M68060
 
 config MMU_MOTOROLA
 	bool
-	depends on MMU && !MMU_SUN3
 
 config MMU_SUN3
 	bool
-- 
1.6.0.2.GIT

