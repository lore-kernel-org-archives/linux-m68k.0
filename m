Return-Path: <SRS0=AmHP=3B=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C35B0C33CA2
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Jan 2020 16:50:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9ECEE24125
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Jan 2020 16:50:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732651AbgALQuC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Jan 2020 11:50:02 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:53702 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730277AbgALQtx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 12 Jan 2020 11:49:53 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id pUpr210055USYZQ01UprS1; Sun, 12 Jan 2020 17:49:51 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iqgQw-0007yK-VU; Sun, 12 Jan 2020 17:49:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iqgQw-0005Gp-Ub; Sun, 12 Jan 2020 17:49:50 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 4/5] zorro: Remove unused zorro_dev_driver()
Date:   Sun, 12 Jan 2020 17:49:48 +0100
Message-Id: <20200112164949.20196-5-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200112164949.20196-1-geert@linux-m68k.org>
References: <20200112164949.20196-1-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

This function was never used.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 include/linux/zorro.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/zorro.h b/include/linux/zorro.h
index cb72515b0ac17040..22f3f80fbcb5afe6 100644
--- a/include/linux/zorro.h
+++ b/include/linux/zorro.h
@@ -70,10 +70,6 @@ struct zorro_driver {
 /* New-style probing */
 extern int zorro_register_driver(struct zorro_driver *);
 extern void zorro_unregister_driver(struct zorro_driver *);
-static inline struct zorro_driver *zorro_dev_driver(const struct zorro_dev *z)
-{
-    return z->driver;
-}
 
 
 extern unsigned int zorro_num_autocon;	/* # of autoconfig devices found */
-- 
2.17.1

