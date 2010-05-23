From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 160/199] arch/m68k/sun3/leds.c: Checkpatch cleanup
Date: Sun, 23 May 2010 22:01:56 +0200
Message-ID: <1274644930-26600-12-git-send-email-andrea.gelmini@gelma.net>
References: <1274644930-26600-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1274644930-26600-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: Sam Creasey <sammy@sammy.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

arch/m68k/sun3/leds.c:10: ERROR: code indent should use tabs where possible
arch/m68k/sun3/leds.c:11: ERROR: space required after that ',' (ctx:VxV)

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/m68k/sun3/leds.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/sun3/leds.c b/arch/m68k/sun3/leds.c
index a3e9484..aad2e0a 100644
--- a/arch/m68k/sun3/leds.c
+++ b/arch/m68k/sun3/leds.c
@@ -7,7 +7,7 @@ void sun3_leds(unsigned char byte)
 	unsigned char dfc;
 
 	GET_DFC(dfc);
-        SET_DFC(FC_CONTROL);
-	SET_CONTROL_BYTE(AC_LEDS,byte);
+	SET_DFC(FC_CONTROL);
+	SET_CONTROL_BYTE(AC_LEDS, byte);
 	SET_DFC(dfc);
 }
-- 
1.7.1.251.gf80a2
