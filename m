Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90209C4320A
	for <linux-m68k@archiver.kernel.org>; Sun, 29 Aug 2021 03:12:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 783C260E97
	for <linux-m68k@archiver.kernel.org>; Sun, 29 Aug 2021 03:12:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbhH2DNN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 28 Aug 2021 23:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbhH2DNM (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 28 Aug 2021 23:13:12 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C14FBC061756
        for <linux-m68k@vger.kernel.org>; Sat, 28 Aug 2021 20:12:21 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id 18so9288237pfh.9
        for <linux-m68k@vger.kernel.org>; Sat, 28 Aug 2021 20:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zhC40d7Nf/9cmu8jGa1jDCnEdMytQROYuLZfPnuke4U=;
        b=s44uueZqwoTvVPtZ1ZcfGquZdc5gWRoWvwAueSvrOmJWreA5eGOejLDryaUuUUqt5y
         GyOHkB8rGQi8EL6yj7vlnwDNk/+V+y1gCNR1MTPuxdlfnBPKBrTUE6AXGB+758BUYzf6
         nNJkUZHpEnzKTjg8wLCcTtz92/+P7QtRlrCnmL8CsV3CJLeB7+z34743NwGXmGWC7X37
         VRDzaQnC+0Sk2vAQfngRUU92yHXl7I0spJCjgBvcrexuaIQTrqDgGSwYF+tgW/qPW6wQ
         Qaan2DE20elzsDIVZxS3gENWAizHmkizKQeWtmdW194l3TcEnEkCtw5Id14EioWSm9/3
         W7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zhC40d7Nf/9cmu8jGa1jDCnEdMytQROYuLZfPnuke4U=;
        b=DLkTIvh530Xq5po62j9a+JXZ5UgtG7UMrll0HZFD2vIOEH7kucdgFvPZYk/JDdG5n0
         wkm6FDKekEy2OqeFgKwKTPvs1NLH1w3UqSmU61HM6BxCXPV4vLJzLLQKjwcy8jiwFyC+
         hx/gQ9t0MAg0d4MTpzafRcXYpWZ6jlAYSYbkkfu6WP8XlEfpufO3BMMBuYa/XKyEA7bT
         Cifb0lIOQBgF5Ng6StnpxsvH3re/NKtk615s5P+IUfkqN4CKO221qRlQ2etxwVy4SPWi
         MmkuINYvsfwl2gvqm+/L3qBwi7hUvwVZK47fC46YjCMxb6tdOlKne1z7TvmC+cbrY1BF
         GVRQ==
X-Gm-Message-State: AOAM530sl0TqSkPPoWs7BuX4CajVDZHTVXVbUL0AvVGQnvn8U5N4vXjg
        H0QrXVddpEfPyb6qw1MngGA=
X-Google-Smtp-Source: ABdhPJyPVbXnryRzXyZiJKdvzcHhg9COCUSjxPqwRK67sr1cYA5cjcoY9wWERGZ0ei3Rq2B+oL9ifg==
X-Received: by 2002:a63:f963:: with SMTP id q35mr15089819pgk.132.1630206741328;
        Sat, 28 Aug 2021 20:12:21 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-155-6-212-adsl.sparkbb.co.nz. [222.155.6.212])
        by smtp.gmail.com with ESMTPSA id y3sm12463599pgc.67.2021.08.28.20.12.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Aug 2021 20:12:20 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id B98533603E9; Sun, 29 Aug 2021 15:12:17 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     alex@kazik.de, Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v7 2/4] m68k: amiga/pcmcia - implement 16 bit detection support for apne.c
Date:   Sun, 29 Aug 2021 15:11:48 +1200
Message-Id: <1630206710-5954-3-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630206710-5954-1-git-send-email-schmitzmic@gmail.com>
References: <1630206710-5954-1-git-send-email-schmitzmic@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Implement 16 bit card autoprobing by calling the generic PCMCIA
cftable entry parser through the pcmcia_parse_tuple interface.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/amiga/pcmcia.c          | 37 +++++++++++++++++++++++++++++++++++++
 arch/m68k/include/asm/amipcmcia.h |  4 ++++
 2 files changed, 41 insertions(+)

diff --git a/arch/m68k/amiga/pcmcia.c b/arch/m68k/amiga/pcmcia.c
index 7106f0c..e7651e6 100644
--- a/arch/m68k/amiga/pcmcia.c
+++ b/arch/m68k/amiga/pcmcia.c
@@ -16,6 +16,7 @@
 #include <linux/jiffies.h>
 #include <linux/timer.h>
 #include <linux/module.h>
+#include <pcmcia/cistpl.h>
 
 #include <asm/amigayle.h>
 #include <asm/amipcmcia.h>
@@ -120,3 +121,39 @@ void pcmcia_write_disable(void)
 }
 EXPORT_SYMBOL(pcmcia_write_disable);
 
+int pcmcia_is_16bit(void)
+{
+	u_char cftuple[258];
+	int cftuple_len;
+	tuple_t cftable_tuple;
+	cistpl_cftable_entry_t cftable_entry;
+
+	cftuple_len = pcmcia_copy_tuple(CISTPL_CFTABLE_ENTRY, cftuple, 256);
+	if (cftuple_len < 3)
+		return 0;
+#ifdef DEBUG
+	else
+		print_hex_dump(KERN_WARNING, "cftable: ", DUMP_PREFIX_NONE, 8,
+				sizeof(char), cftuple, cftuple_len, false);
+#endif
+
+	/* build tuple_t struct and call pcmcia_parse_tuple */
+	cftable_tuple.DesiredTuple = CISTPL_CFTABLE_ENTRY;
+	cftable_tuple.TupleCode = CISTPL_CFTABLE_ENTRY;
+	cftable_tuple.TupleData = &cftuple[2];
+	cftable_tuple.TupleDataLen = cftuple_len-2;
+	cftable_tuple.TupleDataMax = cftuple_len-2;
+
+	if (pcmcia_parse_tuple(&cftable_tuple, &cftable_entry))
+		return 0;
+
+#ifdef DEBUG
+	pr_info("IO flags: %x\n", cftable_entry.io.flags);
+#endif
+
+	if (cftable_entry.io.flags & CISTPL_IO_16BIT)
+		return 1;
+
+	return 0;
+}
+EXPORT_SYMBOL(pcmcia_is_16bit);
diff --git a/arch/m68k/include/asm/amipcmcia.h b/arch/m68k/include/asm/amipcmcia.h
index 6f1ec18..fac9534 100644
--- a/arch/m68k/include/asm/amipcmcia.h
+++ b/arch/m68k/include/asm/amipcmcia.h
@@ -19,10 +19,12 @@
 
 void pcmcia_reset(void);
 int pcmcia_copy_tuple(unsigned char tuple_id, void *tuple, int max_len);
+int pcmcia_parse_tuple(void *tuple, void *parse);
 void pcmcia_program_voltage(int voltage);
 void pcmcia_access_speed(int speed);
 void pcmcia_write_enable(void);
 void pcmcia_write_disable(void);
+int pcmcia_is_16bit(void);
 
 static inline u_char pcmcia_read_status(void)
 {
@@ -64,6 +66,7 @@ static inline void pcmcia_disable_irq(void)
 #define PCMCIA_SPEED_250NS	250
 #define PCMCIA_SPEED_720NS	720
 
+#ifndef _LINUX_CISTPL_H
 /* PCMCIA Tuple codes */
 
 #define CISTPL_NULL		0x00
@@ -106,5 +109,6 @@ static inline void pcmcia_disable_irq(void)
 #define CISTPL_FUNCID_NETWORK	0x06
 #define CISTPL_FUNCID_AIMS	0x07
 #define CISTPL_FUNCID_SCSI	0x08
+#endif
 
 #endif
-- 
2.7.4

