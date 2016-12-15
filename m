From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH] m68k/mac: remove unneeded linux/miscdevice.h include
Date: Thu, 15 Dec 2016 16:02:08 +0100
Message-ID: <20161215150208.30752-1-clabbe.montjoie__20730.9212805287$1481814278$gmane$org@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: funaho@jurai.org, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>

arch/m68k/mac/misc.c does not use any miscdevice so the
inclusion of linux/miscdevice.h is unnecessary.
This patch remove this unnecessary include.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 arch/m68k/mac/misc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/m68k/mac/misc.c b/arch/m68k/mac/misc.c
index 0fb54a9..c6b10bd 100644
--- a/arch/m68k/mac/misc.c
+++ b/arch/m68k/mac/misc.c
@@ -4,7 +4,6 @@
 
 #include <linux/types.h>
 #include <linux/errno.h>
-#include <linux/miscdevice.h>
 #include <linux/kernel.h>
 #include <linux/delay.h>
 #include <linux/sched.h>
-- 
2.10.2
