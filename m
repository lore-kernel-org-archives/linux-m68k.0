From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH] m68k/atari - ide: do not register interrupt if host->get_lock is set
Date: Tue, 28 Jan 2014 21:07:46 +1300
Message-ID: <1390896466-16446-2-git-send-email-schmitz@debian.org>
References: <1390896466-16446-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:51486 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753822AbaA1IH5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 28 Jan 2014 03:07:57 -0500
Received: by mail-pa0-f52.google.com with SMTP id bj1so51013pad.39
        for <linux-m68k@vger.kernel.org>; Tue, 28 Jan 2014 00:07:57 -0800 (PST)
In-Reply-To: <1390896466-16446-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, Michael Schmitz <schmitz@debian.org>

On m68k, host->get_lock may be used to both lock and register the
interrupt that the IDE host shares with other device drivers. Registering
the IDE interrupt handler in ide-probe.c results in duplicating the
interrupt registered, and may result in IDE accepting interrupts even
when another driver has locked the interrupt hardware.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 drivers/ide/ide-probe.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/ide/ide-probe.c b/drivers/ide/ide-probe.c
index 2a744a9..ae691da 100644
--- a/drivers/ide/ide-probe.c
+++ b/drivers/ide/ide-probe.c
@@ -853,8 +853,9 @@ static int init_irq (ide_hwif_t *hwif)
 	if (irq_handler == NULL)
 		irq_handler = ide_intr;
 
-	if (request_irq(hwif->irq, irq_handler, sa, hwif->name, hwif))
-		goto out_up;
+	if (!host->get_lock)
+		if (request_irq(hwif->irq, irq_handler, sa, hwif->name, hwif))
+			goto out_up;
 
 #if !defined(__mc68000__)
 	printk(KERN_INFO "%s at 0x%03lx-0x%03lx,0x%03lx on irq %d", hwif->name,
-- 
1.7.0.4
