Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D898FC46CA1
	for <linux-m68k@archiver.kernel.org>; Thu, 19 Oct 2023 08:55:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235223AbjJSIzb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 19 Oct 2023 04:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235263AbjJSIz2 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 19 Oct 2023 04:55:28 -0400
X-Greylist: delayed 182 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 19 Oct 2023 01:55:23 PDT
Received: from cmccmta1.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0DE3F131
        for <linux-m68k@lists.linux-m68k.org>; Thu, 19 Oct 2023 01:55:22 -0700 (PDT)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
        by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36530ee40221-16a10;
        Thu, 19 Oct 2023 16:52:17 +0800 (CST)
X-RM-TRANSID: 2ee36530ee40221-16a10
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain.localdomain (unknown[10.54.5.255])
        by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46530ee3f36e-588a8;
        Thu, 19 Oct 2023 16:52:16 +0800 (CST)
X-RM-TRANSID: 2ee46530ee3f36e-588a8
From:   zhaimingbing <zhaimingbing@cmss.chinamobile.com>
To:     gerg@linux-m68k.org
Cc:     linux-m68k@lists.linux-m68k.org,
        zhaimingbing <zhaimingbing@cmss.chinamobile.com>
Subject: [PATCH] m68k/include:Add spaces around '+'
Date:   Sat, 14 Oct 2023 18:24:26 +0800
Message-Id: <20231014102426.20048-1-zhaimingbing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add space around + operator to adhere to Linux coding style. Issue found
by checkpatch.pl

Signed-off-by: zhaimingbing <zhaimingbing@cmss.chinamobile.com>
---
 arch/m68k/include/asm/amigaints.h | 48 +++++++++++++++----------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/m68k/include/asm/amigaints.h b/arch/m68k/include/asm/amigaints.h
index b1bcdb835..e33ad2193 100644
--- a/arch/m68k/include/asm/amigaints.h
+++ b/arch/m68k/include/asm/amigaints.h
@@ -26,48 +26,48 @@
 #define AMI_IRQS            (32) /* AUTO_IRQS+AMI_STD_IRQS+2*CIA_IRQS */
 
 /* builtin serial port interrupts */
-#define IRQ_AMIGA_TBE		(IRQ_USER+0)
-#define IRQ_AMIGA_RBF		(IRQ_USER+11)
+#define IRQ_AMIGA_TBE		(IRQ_USER + 0)
+#define IRQ_AMIGA_RBF		(IRQ_USER + 11)
 
 /* floppy disk interrupts */
-#define IRQ_AMIGA_DSKBLK	(IRQ_USER+1)
-#define IRQ_AMIGA_DSKSYN	(IRQ_USER+12)
+#define IRQ_AMIGA_DSKBLK	(IRQ_USER + 1)
+#define IRQ_AMIGA_DSKSYN	(IRQ_USER + 12)
 
 /* software interrupts */
-#define IRQ_AMIGA_SOFT		(IRQ_USER+2)
+#define IRQ_AMIGA_SOFT		(IRQ_USER + 2)
 
 /* interrupts from external hardware */
 #define IRQ_AMIGA_PORTS		IRQ_AUTO_2
 #define IRQ_AMIGA_EXTER		IRQ_AUTO_6
 
 /* copper interrupt */
-#define IRQ_AMIGA_COPPER	(IRQ_USER+4)
+#define IRQ_AMIGA_COPPER	(IRQ_USER + 4)
 
 /* vertical blanking interrupt */
-#define IRQ_AMIGA_VERTB		(IRQ_USER+5)
+#define IRQ_AMIGA_VERTB		(IRQ_USER + 5)
 
 /* Blitter done interrupt */
-#define IRQ_AMIGA_BLIT		(IRQ_USER+6)
+#define IRQ_AMIGA_BLIT		(IRQ_USER + 6)
 
 /* Audio interrupts */
-#define IRQ_AMIGA_AUD0		(IRQ_USER+7)
-#define IRQ_AMIGA_AUD1		(IRQ_USER+8)
-#define IRQ_AMIGA_AUD2		(IRQ_USER+9)
-#define IRQ_AMIGA_AUD3		(IRQ_USER+10)
+#define IRQ_AMIGA_AUD0		(IRQ_USER + 7)
+#define IRQ_AMIGA_AUD1		(IRQ_USER + 8)
+#define IRQ_AMIGA_AUD2		(IRQ_USER + 9)
+#define IRQ_AMIGA_AUD3		(IRQ_USER + 10)
 
 /* CIA interrupt sources */
-#define IRQ_AMIGA_CIAA		(IRQ_USER+14)
-#define IRQ_AMIGA_CIAA_TA	(IRQ_USER+14)
-#define IRQ_AMIGA_CIAA_TB	(IRQ_USER+15)
-#define IRQ_AMIGA_CIAA_ALRM	(IRQ_USER+16)
-#define IRQ_AMIGA_CIAA_SP	(IRQ_USER+17)
-#define IRQ_AMIGA_CIAA_FLG	(IRQ_USER+18)
-#define IRQ_AMIGA_CIAB		(IRQ_USER+19)
-#define IRQ_AMIGA_CIAB_TA	(IRQ_USER+19)
-#define IRQ_AMIGA_CIAB_TB	(IRQ_USER+20)
-#define IRQ_AMIGA_CIAB_ALRM	(IRQ_USER+21)
-#define IRQ_AMIGA_CIAB_SP	(IRQ_USER+22)
-#define IRQ_AMIGA_CIAB_FLG	(IRQ_USER+23)
+#define IRQ_AMIGA_CIAA		(IRQ_USER + 14)
+#define IRQ_AMIGA_CIAA_TA	(IRQ_USER + 14)
+#define IRQ_AMIGA_CIAA_TB	(IRQ_USER + 15)
+#define IRQ_AMIGA_CIAA_ALRM	(IRQ_USER + 16)
+#define IRQ_AMIGA_CIAA_SP	(IRQ_USER + 17)
+#define IRQ_AMIGA_CIAA_FLG	(IRQ_USER + 18)
+#define IRQ_AMIGA_CIAB		(IRQ_USER + 19)
+#define IRQ_AMIGA_CIAB_TA	(IRQ_USER + 19)
+#define IRQ_AMIGA_CIAB_TB	(IRQ_USER + 20)
+#define IRQ_AMIGA_CIAB_ALRM	(IRQ_USER + 21)
+#define IRQ_AMIGA_CIAB_SP	(IRQ_USER + 22)
+#define IRQ_AMIGA_CIAB_FLG	(IRQ_USER + 23)
 
 
 /* INTREQR masks */
-- 
2.33.0



