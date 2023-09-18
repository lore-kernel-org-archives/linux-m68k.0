Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CF1C46CA1
	for <linux-m68k@archiver.kernel.org>; Mon, 18 Sep 2023 10:08:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbjIRKHg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 18 Sep 2023 06:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241275AbjIRKHf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 18 Sep 2023 06:07:35 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD93A6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 18 Sep 2023 03:07:29 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:9622:9b2f:73fd:43ad])
        by baptiste.telenet-ops.be with bizsmtp
        id nN7T2A0064u9dj801N7Tl5; Mon, 18 Sep 2023 12:07:27 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qiB9m-003wXj-5L;
        Mon, 18 Sep 2023 12:07:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qiBA6-006Gbr-Su;
        Mon, 18 Sep 2023 12:07:26 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Sam Creasey <sammy@sammy.net>
Cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: sun3: Change led_pattern[] to unsigned char
Date:   Mon, 18 Sep 2023 12:07:25 +0200
Message-Id: <794c5d543dbdae8336a13ef2459adafaaadb7d86.1695031620.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The values stored in led_pattern[] are only used for passing to
sun3_leds(), which takes an "unsigned char".
Change the type of led_pattern[] accordingly, to reduce kernel size.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/sun3/sun3ints.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/sun3/sun3ints.c b/arch/m68k/sun3/sun3ints.c
index 781e7c0a6f523a2b..32eaf55f87bec174 100644
--- a/arch/m68k/sun3/sun3ints.c
+++ b/arch/m68k/sun3/sun3ints.c
@@ -29,11 +29,11 @@ void sun3_enable_interrupts(void)
 	sun3_enable_irq(0);
 }
 
-static int led_pattern[8] = {
-       ~(0x80), ~(0x01),
-       ~(0x40), ~(0x02),
-       ~(0x20), ~(0x04),
-       ~(0x10), ~(0x08)
+static unsigned char led_pattern[8] = {
+	(u8)~(0x80), (u8)~(0x01),
+	(u8)~(0x40), (u8)~(0x02),
+	(u8)~(0x20), (u8)~(0x04),
+	(u8)~(0x10), (u8)~(0x08)
 };
 
 volatile unsigned char* sun3_intreg;
-- 
2.34.1

