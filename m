From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 5/5] m68k: CPU32 does not support unaligned accesses
Date: Thu,  7 Jun 2012 20:47:07 +0200
Message-ID: <1339094827-12349-5-git-send-email-geert@linux-m68k.org>
References: <1339094827-12349-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1339094827-12349-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@uclinux.org>, Philippe De Muyter <phdm@macqel.be>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Hence select CPU_HAS_NO_UNALIGNED

Reported-by: Philippe De Muyter <phdm@macqel.be>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/Kconfig.cpu |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index c4ed650..d4f3a98 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -50,6 +50,7 @@ config M68000
 config MCPU32
 	bool
 	select CPU_HAS_NO_BITFIELDS
+	select CPU_HAS_NO_UNALIGNED
 	help
 	  The Freescale (was then Motorola) CPU32 is a CPU core that is
 	  based on the 68020 processor. For the most part it is used in
-- 
1.7.0.4
