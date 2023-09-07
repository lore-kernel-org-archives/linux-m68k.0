Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450BDEC8738
	for <linux-m68k@archiver.kernel.org>; Thu,  7 Sep 2023 16:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240346AbjIGQPw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232221AbjIGQPf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 7 Sep 2023 12:15:35 -0400
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [IPv6:2a02:1800:110:4::f00:10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93BEC5599
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 09:13:11 -0700 (PDT)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by riemann.telenet-ops.be (Postfix) with ESMTPS id 4RhL6D017nz4x1Ng
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 15:43:00 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c214:2eac:128d:f67e])
        by albert.telenet-ops.be with bizsmtp
        id j1hy2A0042mGBSJ061hyaG; Thu, 07 Sep 2023 15:41:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qeFGQ-002m9K-L7;
        Thu, 07 Sep 2023 15:41:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qeFGf-00CMh0-TR;
        Thu, 07 Sep 2023 15:41:57 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Finn Thain <fthain@linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Philip Blundell <philb@gnu.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        Sam Creasey <sammy@sammy.net>,
        Laurent Vivier <laurent@vivier.eu>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 25/52] m68k: apollo: Replace set but not used variable by READ_ONCE()
Date:   Thu,  7 Sep 2023 15:41:26 +0200
Message-Id: <5406d0829d8204841c8cb8d265ca91a52cd22d2d.1694093327.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694093327.git.geert@linux-m68k.org>
References: <cover.1694093327.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

When building with W=1:

    arch/m68k/apollo/config.c: In function ‘dn_timer_int’:
    arch/m68k/apollo/config.c:171:32: warning: variable ‘x’ set but not used [-Wunused-but-set-variable]
      149 |         volatile unsigned char x;
	  |                                ^

Fix this by using READ_ONCE(), and removing the variable.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/apollo/config.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/apollo/config.c b/arch/m68k/apollo/config.c
index 0e6801eecbaf6361..fef9b8a1be673bad 100644
--- a/arch/m68k/apollo/config.c
+++ b/arch/m68k/apollo/config.c
@@ -146,13 +146,11 @@ void __init config_apollo(void)
 
 irqreturn_t dn_timer_int(int irq, void *dev_id)
 {
-	volatile unsigned char x;
-
 	legacy_timer_tick(1);
 	timer_heartbeat();
 
-	x = *(volatile unsigned char *)(apollo_timer + 3);
-	x = *(volatile unsigned char *)(apollo_timer + 5);
+	READ_ONCE(*(volatile unsigned char *)(apollo_timer + 3));
+	READ_ONCE(*(volatile unsigned char *)(apollo_timer + 5));
 
 	return IRQ_HANDLED;
 }
-- 
2.34.1

