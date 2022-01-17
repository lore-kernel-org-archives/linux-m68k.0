Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B8AC433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 17 Jan 2022 05:36:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234555AbiAQFgJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 Jan 2022 00:36:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234364AbiAQFfF (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 17 Jan 2022 00:35:05 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00139C061756
        for <linux-m68k@vger.kernel.org>; Sun, 16 Jan 2022 21:34:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B7F59B80DD0
        for <linux-m68k@vger.kernel.org>; Mon, 17 Jan 2022 05:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71434C36AE3;
        Mon, 17 Jan 2022 05:34:53 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@vger.kernel.org
Cc:     arnd@arndb.de, Greg Ungerer <gerg@linux-m68k.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] m68knommu: fix warning: no previous prototype for 'init_dragen2'
Date:   Mon, 17 Jan 2022 15:34:31 +1000
Message-Id: <20220117053431.3985004-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Fix the compile time warning:

    arch/m68k/68000/dragen2.c:38:13: warning: no previous prototype for 'init_dragen2' [-Wmissing-prototypes]
      38 | void __init init_dragen2(char *command, int size)
         |             ^~~~~~~~~~~~

There already exists a header file prototype, but that file was not
included in the dragen2.c code.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
Reported-by: kernel test robot <lkp@intel.com>
---
 arch/m68k/68000/dragen2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/m68k/68000/dragen2.c b/arch/m68k/68000/dragen2.c
index 62f10a9e1ab7..1a57eff28cfe 100644
--- a/arch/m68k/68000/dragen2.c
+++ b/arch/m68k/68000/dragen2.c
@@ -11,6 +11,7 @@
 #include <linux/init.h>
 #include <asm/machdep.h>
 #include <asm/MC68VZ328.h>
+#include "m68328.h"
 #include "screen.h"
 
 /***************************************************************************/
-- 
2.25.1

