Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFD3C7619A
	for <linux-m68k@archiver.kernel.org>; Mon, 20 Mar 2023 00:57:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbjCTA5Y (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 19 Mar 2023 20:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbjCTA4I (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 19 Mar 2023 20:56:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E45B41C58C
        for <linux-m68k@lists.linux-m68k.org>; Sun, 19 Mar 2023 17:54:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D6A3FB80D4B;
        Mon, 20 Mar 2023 00:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C281BC433D2;
        Mon, 20 Mar 2023 00:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679273669;
        bh=F0ukMBHO/kPpbe6k3DjTflDUCcbuGBOy15vOvYd6NWE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kguM7QE64zXE9tcfmWaneUgfbO9MdCSL9LpXDch9SFedpdQBI0pWNgWsIbQObPK06
         ic0ldhNqyQi74ouTFKlMb1ej99Y8OIHNJiuXyRb/sizlPjUZk6kF9InyISL00upwda
         GrXb3+XQX8dFFDkz+FJesrVdErrWO/1GWHGzi1futLDe2gaFf/oFZvbuzKytAaAp2N
         3Ruyl1LZIHa+0xHW4s41CYwMl+OdgaAqrq0w/rfLimC45tqvx72cRBQWP1wYV65xLj
         w9ZgRiGEDpeT6wJubq4juyBzKVJye+Bnw4MW8oSCYEDWCKnFxYLgj9iWYWGqSf5F/L
         0Be4fHt6Lg0ow==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Eero Tamminen <oak@helsinkinet.fi>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sasha Levin <sashal@kernel.org>, laurent@vivier.eu,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH AUTOSEL 6.1 07/29] m68k: Only force 030 bus error if PC not in exception table
Date:   Sun, 19 Mar 2023 20:53:49 -0400
Message-Id: <20230320005413.1428452-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320005413.1428452-1-sashal@kernel.org>
References: <20230320005413.1428452-1-sashal@kernel.org>
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
index 5c8cba0efc63e..a700807c9b6d9 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -30,6 +30,7 @@
 #include <linux/init.h>
 #include <linux/ptrace.h>
 #include <linux/kallsyms.h>
+#include <linux/extable.h>
 
 #include <asm/setup.h>
 #include <asm/fpu.h>
@@ -545,7 +546,8 @@ static inline void bus_error030 (struct frame *fp)
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

