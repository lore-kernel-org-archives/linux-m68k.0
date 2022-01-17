Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67573C433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 17 Jan 2022 05:37:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233258AbiAQFhQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 Jan 2022 00:37:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234326AbiAQFfq (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 17 Jan 2022 00:35:46 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 221C3C061762
        for <linux-m68k@vger.kernel.org>; Sun, 16 Jan 2022 21:35:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DA010B80C8B
        for <linux-m68k@vger.kernel.org>; Mon, 17 Jan 2022 05:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AFEAC36AED;
        Mon, 17 Jan 2022 05:35:09 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@vger.kernel.org
Cc:     arnd@arndb.de, Greg Ungerer <gerg@linux-m68k.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] =?UTF-8?q?m68knommu:=20fix=20warning:=20=E2=80=98screen?= =?UTF-8?q?=5Fbits=E2=80=99=20defined=20but=20not=20used?=
Date:   Mon, 17 Jan 2022 15:35:04 +1000
Message-Id: <20220117053504.3985071-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The 'screen_bits' LCD initializer bit array is only required if
CONFIG_INIT_LCD is enabled, otherwise we get the following warning:

    arch/m68k/68000/screen.h:4:22: warning: ‘screen_bits’ defined but not used [-Wunused-variable]
     static unsigned char screen_bits[] = {
                          ^~~~~~~~~~~

Make the inclusion of 'screen_bits" conditional on CONFIG_INIT_LCD.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
Reported-by: kernel test robot <lkp@intel.com>
---
 arch/m68k/68000/screen.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/68000/screen.h b/arch/m68k/68000/screen.h
index 2089bdf02688..8f7418008908 100644
--- a/arch/m68k/68000/screen.h
+++ b/arch/m68k/68000/screen.h
@@ -1,4 +1,5 @@
 /* Created with The GIMP */
+#ifdef CONFIG_INIT_LCD
 #define screen_width 320
 #define screen_height 240
 static unsigned char screen_bits[] = {
@@ -802,3 +803,4 @@ static unsigned char screen_bits[] = {
    0x93, 0x10, 0xe2, 0x11, 0x00, 0x94, 0x22, 0x52, 0x69, 0x53, 0x52, 0x45,
    0x49, 0x22, 0xa4, 0x4a, 0x55, 0x29, 0x2a, 0xa4, 0x52, 0x42, 0xaa, 0xa5,
    0x52, 0xa8, 0xaa, 0x55, 0x4a, 0xab, 0xa9, 0x4a, 0x54, 0x49, 0x32, 0x24 };
+#endif /* CONFIG_INIT_LCD */
-- 
2.25.1

