Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B340C32771
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Sep 2022 13:11:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235112AbiIZNLR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Sep 2022 09:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234905AbiIZNKj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Sep 2022 09:10:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B46B56D9D8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 04:40:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6BE1BB80757;
        Mon, 26 Sep 2022 11:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF6FC433D7;
        Mon, 26 Sep 2022 11:39:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ocwElm7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1664192349;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/OaZBhlRIR9fYa/RVTcT+Hf8OTMyveUC57VEgu/MCqE=;
        b=ocwElm7B7cHETLZnQ5X+HgTtoeHMD4++KVVWDg1ouR2VJrCDxFlPD4Pn9Um2ZLnaKkMLEn
        e+yKSZB2OMCOe9Q1txasGQrxchFxfxL2zlpHxIxEhb5gz0o11vjOkVjaIG83/kFKv720GL
        JvcPXbkn1p5DQqweqD6suqXzEpfa0hc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a3e50d8a (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Mon, 26 Sep 2022 11:39:09 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     linux-m68k@lists.linux-m68k.org, qemu-devel@nongnu.org
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH qemu v2 2/2] m68k: align bootinfo strings and data to 4 bytes
Date:   Mon, 26 Sep 2022 13:39:00 +0200
Message-Id: <20220926113900.1256630-2-Jason@zx2c4.com>
In-Reply-To: <20220926113900.1256630-1-Jason@zx2c4.com>
References: <20220926113900.1256630-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Various tools, such as kexec-tools and m68k-bootinfo, expect each
bootinfo entry to be aligned to 4 bytes, not 2 bytes. So adjust the
padding to fill this out as such.

Also, break apart the padding additions from the other field length
additions, so that it's more clear why these magic numbers are being
added, and comment them too.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/m68k/bootinfo.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/m68k/bootinfo.h b/hw/m68k/bootinfo.h
index bd8b212fd3..897162b818 100644
--- a/hw/m68k/bootinfo.h
+++ b/hw/m68k/bootinfo.h
@@ -48,13 +48,14 @@
         stw_phys(as, base, id); \
         base += 2; \
         stw_phys(as, base, \
-                 (sizeof(struct bi_record) + strlen(string) + 2) & ~1); \
+                 (sizeof(struct bi_record) + strlen(string) + \
+                  1 /* null termination */ + 3 /* padding */) & ~3); \
         base += 2; \
         for (i = 0; string[i]; i++) { \
             stb_phys(as, base++, string[i]); \
         } \
         stb_phys(as, base++, 0); \
-        base = (base + 1) & ~1; \
+        base = (base + 3) & ~3; \
     } while (0)
 
 #define BOOTINFODATA(as, base, id, data, len) \
@@ -63,13 +64,14 @@
         stw_phys(as, base, id); \
         base += 2; \
         stw_phys(as, base, \
-                 (sizeof(struct bi_record) + len + 3) & ~1); \
+                 (sizeof(struct bi_record) + len + \
+                  2 /* length field */ + 3 /* padding */) & ~3); \
         base += 2; \
         stw_phys(as, base, len); \
         base += 2; \
         for (i = 0; i < len; ++i) { \
             stb_phys(as, base++, data[i]); \
         } \
-        base = (base + 1) & ~1; \
+        base = (base + 3) & ~3; \
     } while (0)
 #endif
-- 
2.37.3

