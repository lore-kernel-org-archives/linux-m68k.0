From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/atari: EtherNEC - Remove #inclusion of asm/system.h
Date: Sun,  1 Apr 2012 22:52:03 +0200
Message-ID: <1333313523-17707-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from georges.telenet-ops.be ([195.130.137.68]:58265 "EHLO
	georges.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752599Ab2DAUwK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Apr 2012 16:52:10 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@debian.org>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit 9ffc93f203c18a70623f21950f1dd473c9ec48cd ("Remove all
 #inclusions of asm/system.h")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/ethernet/8390/atari_ethernec.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/net/ethernet/8390/atari_ethernec.c b/drivers/net/ethernet/8390/atari_ethernec.c
index 086d968..4b1b953 100644
--- a/drivers/net/ethernet/8390/atari_ethernec.c
+++ b/drivers/net/ethernet/8390/atari_ethernec.c
@@ -98,7 +98,6 @@ static const char version2[] =
 #include <linux/jiffies.h>
 #include <linux/workqueue.h>
 
-#include <asm/system.h>
 #include <asm/atarihw.h>
 #include <asm/atariints.h>
 #include <asm/io.h>
-- 
1.7.0.4
