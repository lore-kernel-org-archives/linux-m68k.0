Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A50C433F5
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Sep 2021 12:45:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25C456101B
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Sep 2021 12:45:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344314AbhIGMqY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 7 Sep 2021 08:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343949AbhIGMqX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 7 Sep 2021 08:46:23 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACE7AC06175F
        for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Sep 2021 05:45:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1453:c543:e4e0:1e66])
        by michel.telenet-ops.be with bizsmtp
        id r0lD2500f3goimA060lDxK; Tue, 07 Sep 2021 14:45:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mNaTR-002fhQ-Gi; Tue, 07 Sep 2021 14:45:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mNaTQ-00BQUo-Q3; Tue, 07 Sep 2021 14:45:12 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: mvme: Remove overdue #warnings in RTC handling
Date:   Tue,  7 Sep 2021 14:45:11 +0200
Message-Id: <20210907124511.2723414-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The warnings were introduced when converting the MVME147 and MVME16x
RTC handling from gettod to hwclk.  Replace the #warning by a comment,
and return an error to inform the upper layer that writing to the RTC is
not yet supported.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/mvme147/config.c | 4 +++-
 arch/m68k/mvme16x/config.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/mvme147/config.c b/arch/m68k/mvme147/config.c
index e1e90c49a49624cc..dfd6202fd403e92b 100644
--- a/arch/m68k/mvme147/config.c
+++ b/arch/m68k/mvme147/config.c
@@ -171,7 +171,6 @@ static int bcd2int (unsigned char b)
 
 int mvme147_hwclk(int op, struct rtc_time *t)
 {
-#warning check me!
 	if (!op) {
 		m147_rtc->ctrl = RTC_READ;
 		t->tm_year = bcd2int (m147_rtc->bcd_year);
@@ -183,6 +182,9 @@ int mvme147_hwclk(int op, struct rtc_time *t)
 		m147_rtc->ctrl = 0;
 		if (t->tm_year < 70)
 			t->tm_year += 100;
+	} else {
+		/* FIXME Setting the time is not yet supported */
+		return -EOPNOTSUPP;
 	}
 	return 0;
 }
diff --git a/arch/m68k/mvme16x/config.c b/arch/m68k/mvme16x/config.c
index b59593c7cfb9dfbf..b4422c2dfbbf4f7c 100644
--- a/arch/m68k/mvme16x/config.c
+++ b/arch/m68k/mvme16x/config.c
@@ -436,7 +436,6 @@ int bcd2int (unsigned char b)
 
 int mvme16x_hwclk(int op, struct rtc_time *t)
 {
-#warning check me!
 	if (!op) {
 		rtc->ctrl = RTC_READ;
 		t->tm_year = bcd2int (rtc->bcd_year);
@@ -448,6 +447,9 @@ int mvme16x_hwclk(int op, struct rtc_time *t)
 		rtc->ctrl = 0;
 		if (t->tm_year < 70)
 			t->tm_year += 100;
+	} else {
+		/* FIXME Setting the time is not yet supported */
+		return -EOPNOTSUPP;
 	}
 	return 0;
 }
-- 
2.25.1

