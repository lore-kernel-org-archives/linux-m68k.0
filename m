Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D069AC433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 17 Jan 2022 08:04:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237866AbiAQIEp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 Jan 2022 03:04:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235436AbiAQIEo (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 17 Jan 2022 03:04:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8260DC061574
        for <linux-m68k@vger.kernel.org>; Mon, 17 Jan 2022 00:04:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2412D60FDB
        for <linux-m68k@vger.kernel.org>; Mon, 17 Jan 2022 08:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F7DC36AE3;
        Mon, 17 Jan 2022 08:04:42 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@vger.kernel.org
Cc:     arnd@arndb.de, Greg Ungerer <gerg@linux-m68k.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] m68knommu: fix ucsimm sparse warnings
Date:   Mon, 17 Jan 2022 18:04:38 +1000
Message-Id: <20220117080438.4020763-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Sparse reports the following warnings:

  arch/m68k/68000/ucsimm.c:19:15: sparse: sparse: symbol 'cs8900a_hwaddr' was not declared. Should it be static?
  arch/m68k/68000/ucsimm.c:22:1: sparse: sparse: symbol 'getserialnum' was not declared. Should it be static?
  arch/m68k/68000/ucsimm.c:23:1: sparse: sparse: symbol 'gethwaddr' was not declared. Should it be static?
  arch/m68k/68000/ucsimm.c:24:1: sparse: sparse: symbol 'getbenv' was not declared. Should it be static?

'cs8900a_hwaddr' is not used anywhere else in the kernel, so it can be
removed.

All of 'getserialnum', 'gethwaddr' and 'getbenv' are only used in this
file, so they can all be made static. It turns out that these also cause
compiler warnings like this too:

  arch/m68k/68000/ucsimm.c:22:15: warning: no previous prototype for 'getserialnum' [-Wmissing-prototypes]

Also fixed by making them all static.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
Reported-by: kernel test robot <lkp@intel.com>
---
 arch/m68k/68000/ucsimm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/68000/ucsimm.c b/arch/m68k/68000/ucsimm.c
index 7c6cbf643712..c54fde75eae8 100644
--- a/arch/m68k/68000/ucsimm.c
+++ b/arch/m68k/68000/ucsimm.c
@@ -16,19 +16,18 @@
 
 #include "m68328.h"
 
-unsigned char *cs8900a_hwaddr;
 static int errno;
 
-_bsc0(char *, getserialnum)
-_bsc1(unsigned char *, gethwaddr, int, a)
-_bsc1(char *, getbenv, char *, a)
+static _bsc0(char *, getserialnum)
+static _bsc1(unsigned char *, gethwaddr, int, a)
+static _bsc1(char *, getbenv, char *, a)
 
 void __init init_ucsimm(char *command, int size)
 {
 	char *p;
 
 	pr_info("uCsimm/uCdimm serial string [%s]\n", getserialnum());
-	p = cs8900a_hwaddr = gethwaddr(0);
+	p = gethwaddr(0);
 	pr_info("uCsimm/uCdimm hwaddr %pM\n", p);
 	p = getbenv("APPEND");
 	if (p)
-- 
2.25.1

