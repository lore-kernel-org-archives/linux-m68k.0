From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v4 15/16] char/genrtc: remove asm-generic/rtc.h from mips
Date: Mon, 30 May 2016 20:58:03 +0200
Message-ID: <1464634684-1248135-16-git-send-email-arnd__33161.0835310586$1464634854$gmane$org@arndb.de>
References: <1464634684-1248135-1-git-send-email-arnd@arndb.de>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1464634684-1248135-1-git-send-email-arnd@arndb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Arnd Bergmann <arnd@arndb.de>, geert@linux-m68k.org, gregkh@linuxfoundation.org, deller@gmx.de, benh@kernel.crashing.org, mpe@ellerman.id.au, dalias@libc.org, dhowells@redhat.com, linux-alpha@vger.kernel.org, a.zummo@towertech.it, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-m68k@lists.linux-m68k.org, rtc-linux@googlegroups.com, linux-arch@vger.kernel.org

arch/mips/sni/time.c includes asm-generic/rtc.h for no apparent reason,
and it works fine without that header, so lets remove the inclusion
in preparation of deleting the file.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/sni/time.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/sni/time.c b/arch/mips/sni/time.c
index fb4b3520cdc6..7ee14f41fc25 100644
--- a/arch/mips/sni/time.c
+++ b/arch/mips/sni/time.c
@@ -8,7 +8,6 @@
 
 #include <asm/sni.h>
 #include <asm/time.h>
-#include <asm-generic/rtc.h>
 
 #define SNI_CLOCK_TICK_RATE	3686400
 #define SNI_COUNTER2_DIV	64
-- 
2.7.0
