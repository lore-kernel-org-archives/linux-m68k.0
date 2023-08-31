Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6C0C83F12
	for <linux-m68k@archiver.kernel.org>; Thu, 31 Aug 2023 12:16:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbjHaMQe (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 31 Aug 2023 08:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346185AbjHaMQd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 31 Aug 2023 08:16:33 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB350E42
        for <linux-m68k@lists.linux-m68k.org>; Thu, 31 Aug 2023 05:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693484189; x=1725020189;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bjlnEC/C9WEW4GsyF1ErOkMjTyR9dXcbW38ShAvH5aM=;
  b=X2EFl1ayBdGEBHNgTfTCXZ1nG0ZWbG3Na4qmzGWimQlJvlgg6hq7Rbla
   TvrUv3buqLlQ+RNoKR2IyVtW0H10n3Z2RtMq/i/OuRCdbS4+kSGEJ/Bq5
   qC7TmzxVp/N1zmMvqfRI1acPYoPu2URzqvbxQ5AsobvBe5FSQYSLwCZPo
   FmLphM9PQswM6ZNK982wTAJLcMhUlQr5KPzB8ZbCNGZUPcaSPw54IOiFd
   J/oGRuPBGcCr7Tesobl7UrxjpQQGRUb2ctQAC1h2X7y4mFu1LNKEXeII3
   F2AE7Kp2AHVzHGlglve4Ba1+/tADqQODPdX+MwyPeMZOEYSN2Y5Vpwj7b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="378630876"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="378630876"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 05:16:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="689294967"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="689294967"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 31 Aug 2023 05:16:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 908933F5; Thu, 31 Aug 2023 15:16:25 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v1 1/1] zorro: Use helpers from ioport.h
Date:   Thu, 31 Aug 2023 15:16:23 +0300
Message-Id: <20230831121623.36293-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

We can use the DEFINE_RES_MEM_NAMED() macro and resource_contains() helper
instead of reimplementing them in the code. No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/zorro/zorro.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/zorro/zorro.c b/drivers/zorro/zorro.c
index 1b9928648583..7d29586c7db5 100644
--- a/drivers/zorro/zorro.c
+++ b/drivers/zorro/zorro.c
@@ -117,17 +117,13 @@ static struct resource __init *zorro_find_parent_resource(
 	int i;
 
 	for (i = 0; i < bridge->num_resources; i++) {
-		struct resource *r = &bridge->resource[i];
-
-		if (zorro_resource_start(z) >= r->start &&
-		    zorro_resource_end(z) <= r->end)
-			return r;
+		if (resource_contains(&bridge->resource[i], &z->resource)
+			return &bridge->resource[i];
 	}
+
 	return &iomem_resource;
 }
 
-
-
 static int __init amiga_zorro_probe(struct platform_device *pdev)
 {
 	struct zorro_bus *bus;
@@ -176,9 +172,7 @@ static int __init amiga_zorro_probe(struct platform_device *pdev)
 		z->slotsize = zi->slotsize;
 		sprintf(z->name, "Zorro device %08x", z->id);
 		zorro_name_device(z);
-		z->resource.start = zi->boardaddr;
-		z->resource.end = zi->boardaddr + zi->boardsize - 1;
-		z->resource.name = z->name;
+		z->resource = DEFINE_RES_MEM_NAMED(zi->boardaddr, zi->boardsize, z->name);
 		r = zorro_find_parent_resource(pdev, z);
 		error = request_resource(r, &z->resource);
 		if (error && !(z->rom.er_Type & ERTF_MEMLIST))
-- 
2.40.0.1.gaa8946217a0b

