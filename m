Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC6BC6FD1F
	for <linux-m68k@archiver.kernel.org>; Mon, 20 Mar 2023 01:03:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbjCTBDS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 19 Mar 2023 21:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbjCTBC2 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 19 Mar 2023 21:02:28 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06112231C7
        for <linux-m68k@lists.linux-m68k.org>; Sun, 19 Mar 2023 17:57:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 75956CE1022;
        Mon, 20 Mar 2023 00:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1973C433EF;
        Mon, 20 Mar 2023 00:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679273770;
        bh=VgMjAVeopcsSQqLNr5C05PNYh2ZPq8TLuphXfB81Puk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FaD1sbHoU1fYRwnUHzxAgxoKpivPJIk+gEKctQc7E4l+QLDNm2xOMF4yXoBvB1ID0
         zb4UpaEQ+dz3i6/2SGfbe/gN1zhyfn1FdcNnkJ44fPzXgHJRPv12u4Llj2Ik2qETpQ
         hDOBWQpduY2EzCzEvA52FnZwrxvJl2zkEXXrRcP8xEkbv7qaFoJ5UX+1WRNjFp50ie
         hoB9bxkTRaIyQrXpvslkkW9ITagdI/FtsBn2wgSrncLbg6HY4ZP6dXEMNUErTqVa8l
         g9cdIdBBKJyCRNVSa9BD3AHQ1N9f6vuRSoeNCOmVbnETYdmI+tv4uMPy9yblbPUAVI
         2fLhCWu6hI8rA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Eero Tamminen <oak@helsinkinet.fi>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sasha Levin <sashal@kernel.org>, laurent@vivier.eu,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH AUTOSEL 5.10 05/15] m68k: Only force 030 bus error if PC not in exception table
Date:   Sun, 19 Mar 2023 20:55:49 -0400
Message-Id: <20230320005559.1429040-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320005559.1429040-1-sashal@kernel.org>
References: <20230320005559.1429040-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Michael Schmitz <schmitzmic@gmail.com>

[ Upstream commit e36a82bebbf7da814530d5a179bef9df5934b717 ]

__get_kernel_nofault() does copy data in supervisor mode when
forcing a task backtrace log through /proc/sysrq_trigger.
This is expected cause a bus error exception on e.g. NULL
pointer dereferencing when logging a kernel task has no
workqueue associated. This bus error ought to be ignored.

Our 030 bus error handler is ill equipped to deal with this:

Whenever ssw indicates a kernel mode access on a data fault,
we don't even attempt to handle the fault and instead always
send a SEGV signal (or panic). As a result, the check
for exception handling at the fault PC (buried in
send_sig_fault() which gets called from do_page_fault()
eventually) is never used.

In contrast, both 040 and 060 access error handlers do not
care whether a fault happened on supervisor mode access,
and will call do_page_fault() on those, ultimately honoring
the exception table.

Add a check in bus_error030 to call do_page_fault() in case
we do have an entry for the fault PC in our exception table.

I had attempted a fix for this earlier in 2019 that did rely
on testing pagefault_disabled() (see link below) to achieve
the same thing, but this patch should be more generic.

Tested on 030 Atari Falcon.

Reported-by: Eero Tamminen <oak@helsinkinet.fi>
Link: https://lore.kernel.org/r/alpine.LNX.2.21.1904091023540.25@nippy.intranet
Link: https://lore.kernel.org/r/63130691-1984-c423-c1f2-73bfd8d3dcd3@gmail.com
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Link: https://lore.kernel.org/r/20230301021107.26307-1-schmitzmic@gmail.com
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/m68k/kernel/traps.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index b2a31afb998c2..7d42c84649ac2 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -30,6 +30,7 @@
 #include <linux/init.h>
 #include <linux/ptrace.h>
 #include <linux/kallsyms.h>
+#include <linux/extable.h>
 
 #include <asm/setup.h>
 #include <asm/fpu.h>
@@ -549,7 +550,8 @@ static inline void bus_error030 (struct frame *fp)
 			errorcode |= 2;
 
 		if (mmusr & (MMU_I | MMU_WP)) {
-			if (ssw & 4) {
+			/* We might have an exception table for this PC */
+			if (ssw & 4 && !search_exception_tables(fp->ptregs.pc)) {
 				pr_err("Data %s fault at %#010lx in %s (pc=%#lx)\n",
 				       ssw & RW ? "read" : "write",
 				       fp->un.fmtb.daddr,
-- 
2.39.2

