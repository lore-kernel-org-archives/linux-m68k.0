From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 19/27] m68k/hp300: Convert HP9000/300 and HP9000/400 to genirq
Date: Sun, 30 Oct 2011 13:48:27 +0100
Message-ID: <1319978915-10933-20-git-send-email-geert@linux-m68k.org>
References: <1319978915-10933-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1319978915-10933-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Philip Blundell <philb@gnu.org>
List-Id: linux-m68k@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Philip Blundell <philb@gnu.org>
---
 arch/m68k/Kconfig |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 9ba1a89..e4bd0c9 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -91,7 +91,6 @@ config USE_GENERIC_HARDIRQS
 	depends on !MVME147
 	depends on !MVME16x
 	depends on !BVME6000
-	depends on !HP300
 	depends on !SUN3X
 	depends on !Q40
 	depends on !SUN3
-- 
1.7.0.4
