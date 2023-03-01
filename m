Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD55C64EC4
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Mar 2023 02:11:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjCACLP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 28 Feb 2023 21:11:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbjCACLO (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 28 Feb 2023 21:11:14 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8218303FE
        for <linux-m68k@vger.kernel.org>; Tue, 28 Feb 2023 18:11:13 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id x34so11870138pjj.0
        for <linux-m68k@vger.kernel.org>; Tue, 28 Feb 2023 18:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677636673;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Va88uhiUkFXxss4wYj3UHtOUwaumASyvkz/3EFFpM4U=;
        b=hU5I/pXt+anrG4Q3/iPZjGHnAn2QTw/cw2Suf/dtKITiAmF8p5DDpbcNoOZ/PDqf3u
         kJAGnX4vMW8axRUE4FSMxfiU7cp5I1iqlXyA62cESD/VEszZv7n1MdW13Ewfp1H2zdHF
         SYZI7YEDQZzvUYkmbpAFAw4kTD65FqlokRgwru9u/h8TGaWPdSMRa9TxT+dnTp81KNN5
         Pnvn+Lid/gxpBfRqLM5q8Vw2a1chfjz4YwLaWgg26pgWqbrnUco2a7Xmrjw7nr7ZSyjN
         WVSsw7mJq68CXULcVKke3JGqtSKvi4QA9U/6KfvLPbk+cqo4skVsJJoRn2OHePt2CQNn
         slDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677636673;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Va88uhiUkFXxss4wYj3UHtOUwaumASyvkz/3EFFpM4U=;
        b=IQnagG6Y628FopGrBpQQWin0XAHuZsPGxTnhaM7y8GPW9rKk/MSnrlb/Io/WxhCIXB
         i6IKoJIKfRPfeamXqdyCDgiomAAFT/c6E5E4Dm1yavuPXHsApcVM/8es7rGltMZ1Djfs
         0AjPOsvaSZecTJ6z69eX6G53EvSP0O+n60fNwxSp3x0g+H05PZC/hq9BYvkOG1cvEI35
         UivwoBIACQfr/+49Sh/BVG36H40NwWJDjMOr/96qlwxynWCIfugHJ8Td14L+SFJP3pej
         OkqWKorZYP5qySS1HTj2+Qdjms7ApjQJmtcasCxV3giu8XVMR7axQ8+1YSirE/l+p09f
         VMew==
X-Gm-Message-State: AO0yUKVB9DUHjIuW8j8S8d81qcJz2v1bQJaKNG31kXmTYWgZ63mAxxqR
        ONQP7yzIcDznFead65AaIIVFaLoB0ye+Fw==
X-Google-Smtp-Source: AK7set+J3aA/rVMICaFHIWo98CkTry+47Gx7GxXsSKLcfvSt2e/SxwpXX1HAgPC4FFfnBRILUjApyA==
X-Received: by 2002:a17:902:dac8:b0:19a:a210:825 with SMTP id q8-20020a170902dac800b0019aa2100825mr5598368plx.20.1677636673264;
        Tue, 28 Feb 2023 18:11:13 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902eb1100b001992fc0a8eesm7152294plb.174.2023.02.28.18.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 18:11:12 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id C282E3604D7; Wed,  1 Mar 2023 15:11:08 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     schmitzmic@gmail.com, Eero Tamminen <oak@helsinkinet.fi>,
        Finn Thain <fthain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>
Subject: [PATCH v2] m68k: kernel/traps.c - only force 030 bus error if PC not in exception table
Date:   Wed,  1 Mar 2023 15:11:07 +1300
Message-Id: <20230301021107.26307-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

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

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
Reported-by: Eero Tamminen <oak@helsinkinet.fi>
CC: Eero Tamminen <oak@helsinkinet.fi>
CC: Finn Thain <fthain@linux-m68k.org>
CC: Andreas Schwab <schwab@linux-m68k.org>
CC: Geert Uytterhoeven <geert@linux-m68k.org>
Link: https://lore.kernel.org/r/alpine.LNX.2.21.1904091023540.25@nippy.intranet
Link: https://lore.kernel.org/r/63130691-1984-c423-c1f2-73bfd8d3dcd3@gmail.com
--

Changes from v1:

- add comment
- reword commit message
- add link to old patch as well (stick to lore.kernel.org
  even though these links are currently not functional)
---
 arch/m68k/kernel/traps.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index 5c8cba0efc63..a700807c9b6d 100644
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
2.17.1

