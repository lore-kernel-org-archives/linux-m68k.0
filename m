Return-Path: <SRS0=v436=DT=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C38C433E7
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 04:34:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F17E420757
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 04:34:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbgJLEes (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Oct 2020 00:34:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:38116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726431AbgJLEes (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 12 Oct 2020 00:34:48 -0400
Received: from goober.digi.com (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 128A42073A;
        Mon, 12 Oct 2020 04:34:46 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@vger.kernel.org
Cc:     Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68knommu: align BSS section to 4-byte boundaries
Date:   Mon, 12 Oct 2020 14:34:32 +1000
Message-Id: <20201012043432.787588-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The kernel start up code for all of the nommu m68k types expects the
BSS section to be on a 4-byte boundary, and to be a whole number of 32bit
words. The BSS initialization loop sets 32bit sized quantities and has
no provision for odd or unaligned accesses.

Although this has always been the case, in practice the BSS was typically
aligned and sized this way. The problem was first observed after commit
7273ad2b08f8 ("kbuild: link lib-y objects to vmlinux forcibly when
CONFIG_MODULES=y"). Some kernel builds, depending on exact configuration,
then tended to generate even sized BSS sections - which is valid on m68k -
but our BSS init code could not handle properly.

The simplest and smallest solution is to align the BSS appropriately.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/kernel/vmlinux-nommu.lds | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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

