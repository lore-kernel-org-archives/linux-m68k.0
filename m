Return-Path: <SRS0=l4+5=D2=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0B3C433E7
	for <linux-m68k@archiver.kernel.org>; Mon, 19 Oct 2020 00:22:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54F2A22272
	for <linux-m68k@archiver.kernel.org>; Mon, 19 Oct 2020 00:22:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729885AbgJSAWo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 18 Oct 2020 20:22:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:34304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729789AbgJSAWo (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 18 Oct 2020 20:22:44 -0400
Received: from goober.digi.com (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D2F2E2076A;
        Mon, 19 Oct 2020 00:22:42 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@vger.kernel.org
Cc:     Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH v2] m68knommu: align BSS section to 4-byte boundaries
Date:   Mon, 19 Oct 2020 10:22:36 +1000
Message-Id: <20201019002236.3396145-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The kernel start up code for all of the nommu m68k types expects the BSS
section to be on a 4-byte boundary, and to be a whole number of 32bit
words. The BSS initialization loop sets 32bit sized quantities and has
no provision for odd or unaligned accesses.

The alignment and size of the BSS has historically worked out to be 4-byte
aligned and sized - although no explicit alignment or size was specified in
the linker script. So the BSS zeroing code worked as expected.

A problem was first observed after commit 7273ad2b08f8 ("kbuild: link lib-y
objects to vmlinux forcibly when CONFIG_MODULES=y"). Some kernel builds,
depending on exact configuration, then tended to generate even sized BSS
sections - which is valid on m68k - but our BSS init code could not handle
properly.

The simplest and smallest solution is to align and size the BSS
appropriately.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/kernel/vmlinux-nommu.lds | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v2: reworded commit message

diff --git a/arch/m68k/kernel/vmlinux-nommu.lds b/arch/m68k/kernel/vmlinux-nommu.lds
index 7b975420c3d9..730bb653f9c1 100644
--- a/arch/m68k/kernel/vmlinux-nommu.lds
+++ b/arch/m68k/kernel/vmlinux-nommu.lds
@@ -82,7 +82,7 @@ SECTIONS {
 		__init_end = .;
 	}
 
-	BSS_SECTION(0, 0, 0)
+	BSS_SECTION(4, 0, 4)
 
 	_end = .;
 
-- 
2.25.1

