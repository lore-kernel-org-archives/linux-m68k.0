From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 52/66] arch/m68k/hp300/time.h: Checkpatch cleanup
Date: Sat, 27 Feb 2010 17:51:33 +0100
Message-ID: <1267289508-31031-53-git-send-email-andrea.gelmini__29522.6933238611$1267290206$gmane$org@gelma.net>
References: <1267289508-31031-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1267289508-31031-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andrea Gelmini <andrea.gelmini@gelma.net>, Philip Blundell <philb@gnu.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

arch/m68k/hp300/time.h:2: WARNING: space prohibited between function name and open parenthesis '('

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/m68k/hp300/time.h |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/hp300/time.h b/arch/m68k/hp300/time.h
index f5b3d09..7b98242 100644
--- a/arch/m68k/hp300/time.h
+++ b/arch/m68k/hp300/time.h
@@ -1,4 +1,2 @@
 extern void hp300_sched_init(irq_handler_t vector);
-extern unsigned long hp300_gettimeoffset (void);
-
-
+extern unsigned long hp300_gettimeoffset(void);
-- 
1.7.0.90.g251a4
