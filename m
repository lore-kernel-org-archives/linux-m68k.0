Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E3EC07E9D
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Sep 2022 17:03:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbiIWRDw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Sep 2022 13:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231649AbiIWRDu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Sep 2022 13:03:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 370F014AD43
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 10:03:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ACFAA61255;
        Fri, 23 Sep 2022 17:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194F0C433B5;
        Fri, 23 Sep 2022 17:03:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="CCHnmmCS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1663952626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=zSq4SOzJNqbi4MDYH6SNjZYv9uMDpNSoVaymUl1nOfg=;
        b=CCHnmmCSK2H/v6uLm0G7g5ql7zHcMco00NyuEROR+WZB7YRsAfRqeofKB8HcINH7xIrG6t
        hSRDe328dk7drR5SiPlweCD5PwJ/5r9HoZY33vjEMBoIaNS7+KlBQN3i1/EIjee9sAHv4C
        ewf/07NLbtXtojkEqHKslpfrh+DW9zE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d17156b5 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Fri, 23 Sep 2022 17:03:46 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v3 1/3] m68k: process bootinfo records before saving them
Date:   Fri, 23 Sep 2022 19:03:38 +0200
Message-Id: <20220923170340.4099226-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The RNG seed boot record is memzeroed after processing, in order to
preserve forward secrecy. By saving the bootinfo for procfs prior to
that, forward secrecy is violated, since it becomes possible to recover
past states. So, save the bootinfo block only after first processing
them.

Fixes: a1ee38ab1a75 ("m68k: virt: Use RNG seed from bootinfo block")
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/m68k/kernel/setup_mm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index e62fa8f2149b..7e7ef67cff8b 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -109,10 +109,9 @@ extern void paging_init(void);
 
 static void __init m68k_parse_bootinfo(const struct bi_record *record)
 {
+	const struct bi_record *first_record = record;
 	uint16_t tag;
 
-	save_bootinfo(record);
-
 	while ((tag = be16_to_cpu(record->tag)) != BI_LAST) {
 		int unknown = 0;
 		const void *data = record->data;
@@ -182,6 +181,8 @@ static void __init m68k_parse_bootinfo(const struct bi_record *record)
 		record = (struct bi_record *)((unsigned long)record + size);
 	}
 
+	save_bootinfo(first_record);
+
 	m68k_realnum_memory = m68k_num_memory;
 #ifdef CONFIG_SINGLE_MEMORY_CHUNK
 	if (m68k_num_memory > 1) {
-- 
2.37.3

