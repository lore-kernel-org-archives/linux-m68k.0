Return-Path: <SRS0=aYBz=YW=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A39CA9EC3
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Oct 2019 22:07:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7FB6E21835
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Oct 2019 22:07:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729427AbfJ2WHc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Oct 2019 18:07:32 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45029 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727822AbfJ2WHc (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Oct 2019 18:07:32 -0400
Received: by mail-wr1-f65.google.com with SMTP id z11so74616wro.11
        for <linux-m68k@vger.kernel.org>; Tue, 29 Oct 2019 15:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MM2OKFFua38PXT8sKOJv0ovhd1ttYC6bRgmSAItAuS4=;
        b=daG5+plckEPXnuxMj1XXbdto6rQeX8PkORhdAi6qxb4hXmFHBZBuy2pVZKCLRAc5mr
         aZ4xuHQOSvfJFV005byI3YXTcPH9Sr92G3n1+LRiHrQfzPVqKUP3cw+2prz+u5wh54hN
         Z0zuK01MtAJvLLAL+DAEzqRna4t6lmHi+GbOGt8Ihs8eAHIScJWgyzuP4/ATAsn9utrY
         vfhMvsYlGqYlwhNuUrvBLCt5r72qV9TKR8MVQEvu2R+YtINS8AUYJFVXtqxRHtDhvjWE
         I8t+HRwNIXEuEvk15FaXNQi5WCcogoRgLZ7+yNHKuTxys6wL34slcw5y+e+owx0P9OEf
         IB7A==
X-Gm-Message-State: APjAAAX6RnBrmoVrBw6RgkviSPT266qp36oaj702beZ2WrnjRCXyHRCc
        rBSwzqGUsUvjgIxHKRlixUcbrJtOY+o=
X-Google-Smtp-Source: APXvYqxUIBPR7xXm0IHHeCLvf1Os4/ZUaU1EU4+Bo0pkGrbjWYdULGRzqGxgef0CU7ld1MGj0wLw1Q==
X-Received: by 2002:a5d:40c4:: with SMTP id b4mr20844233wrq.290.1572386850430;
        Tue, 29 Oct 2019 15:07:30 -0700 (PDT)
Received: from localhost.localdomain (82-75-169-199.cable.dynamic.v4.ziggo.nl. [82.75.169.199])
        by smtp.gmail.com with ESMTPSA id o18sm563991wrm.11.2019.10.29.15.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 15:07:29 -0700 (PDT)
From:   Kars de Jong <jongk@linux-m68k.org>
To:     linux-m68k@vger.kernel.org
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Kars de Jong <jongk@linux-m68k.org>
Subject: [PATCH] esp_scsi: Add support for FSC chip
Date:   Tue, 29 Oct 2019 23:05:03 +0100
Message-Id: <20191029220503.7553-1-jongk@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CACz-3rh9ZCyU1825yU8xxty5BGrwFhpbjKNoWnn0mGiv_h2Kag@mail.gmail.com>
References: <CACz-3rh9ZCyU1825yU8xxty5BGrwFhpbjKNoWnn0mGiv_h2Kag@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The FSC (NCR53CF9x-2 / SYM53CF9x-2) has a different family code than QLogic
or Emulex parts. This caused it to be detected as a FAS100A.

Unforunately, this meant the configuration of the CONFIG3 register was
incorrect. This causes data transfer issues.

The FSC also has a feature called Active Negation which should always be
enabled according to the data manual. This is done using the CONFIG4
register.

Signed-off-by: Kars de Jong <jongk@linux-m68k.org>
---
 drivers/scsi/esp_scsi.c | 10 ++++++++--
 drivers/scsi/esp_scsi.h | 10 ++++++----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/esp_scsi.c b/drivers/scsi/esp_scsi.c
index bb88995a12c7..6b34a5764de5 100644
--- a/drivers/scsi/esp_scsi.c
+++ b/drivers/scsi/esp_scsi.c
@@ -263,7 +263,11 @@ static void esp_reset_esp(struct esp *esp)
 			esp->rev = FAS236;
 		else if (family_code == 0x0a)
 			esp->rev = FASHME; /* Version is usually '5'. */
-		else
+		else if (family_code == 0x14) {
+			esp->rev = FSC;
+			/* Enable Active Negation */
+			esp_write8(ESP_CONFIG4_RADE, ESP_CFG4);
+		} else
 			esp->rev = FAS100A;
 		esp->min_period = ((4 * esp->ccycle) / 1000);
 	} else {
@@ -308,7 +312,8 @@ static void esp_reset_esp(struct esp *esp)
 
 	case FAS236:
 	case PCSCSI:
-		/* Fast 236, AM53c974 or HME */
+	case FSC:
+		/* Fast 236, AM53c974, FSC or HME */
 		esp_write8(esp->config2, ESP_CFG2);
 		if (esp->rev == FASHME) {
 			u8 cfg3 = esp->target[0].esp_config3;
@@ -2373,6 +2378,7 @@ static const char *esp_chip_names[] = {
 	"ESP100A",
 	"ESP236",
 	"FAS236",
+	"FSC",
 	"FAS100A",
 	"FAST",
 	"FASHME",
diff --git a/drivers/scsi/esp_scsi.h b/drivers/scsi/esp_scsi.h
index 91b32f2a1a1b..b60ea3e5e0eb 100644
--- a/drivers/scsi/esp_scsi.h
+++ b/drivers/scsi/esp_scsi.h
@@ -211,6 +211,7 @@
 /* ESP unique ID register read-only, found on fas236+fas100a only */
 #define ESP_UID_F100A         0x00     /* ESP FAS100A  */
 #define ESP_UID_F236          0x02     /* ESP FAS236   */
+#define ESP_UID_FSC           0x14     /* NCR/Symbios Logic FSC */
 #define ESP_UID_REV           0x07     /* ESP revision */
 #define ESP_UID_FAM           0xf8     /* ESP family   */
 
@@ -262,10 +263,11 @@ enum esp_rev {
 	ESP100A    = 0x01,  /* NCR53C90A */
 	ESP236     = 0x02,
 	FAS236     = 0x03,
-	FAS100A    = 0x04,
-	FAST       = 0x05,
-	FASHME     = 0x06,
-	PCSCSI     = 0x07,  /* AM53c974 */
+	FSC        = 0x04,  /* NCR/Symbios Logic FSC */
+	FAS100A    = 0x05,
+	FAST       = 0x06,
+	FASHME     = 0x07,
+	PCSCSI     = 0x08,  /* AM53c974 */
 };
 
 struct esp_cmd_entry {
-- 
2.17.1

