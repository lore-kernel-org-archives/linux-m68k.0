Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A33FC433FE
	for <linux-m68k@archiver.kernel.org>; Thu, 27 Jan 2022 07:42:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237430AbiA0HmI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 27 Jan 2022 02:42:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237426AbiA0HmH (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 27 Jan 2022 02:42:07 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE55C06173B
        for <linux-m68k@vger.kernel.org>; Wed, 26 Jan 2022 23:42:07 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d7so1752321plr.12
        for <linux-m68k@vger.kernel.org>; Wed, 26 Jan 2022 23:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=b0k0Q6QG/6k5gpknBDZTiWz4v+wffd/XVo4QzU/unGE=;
        b=UDJ7pF4C5cV4rnja6kZ2pT1Vj3VfwZe4w+gc0mIgmoxTmy68oxf+oqTf6NDQ1RlV5T
         tJ04S/gdYF5q8HrSHDyOtDlw6lHPDJqfjxa96n8C1VqSJuCxWHrw2xTWMw4RdUQyiM5F
         lHYGMnN23TdhbbxedYoaqSvJCim6SUh0X3ozVTuLQq2IN+A21iiaRKBV62oHtzrx6FN4
         P0GKe94UhzyR3OmIiXYxS00aPfJP3UJfx8cEd2PjOpERTyTigKiGe1Dk+PFrcbkN8GkU
         tMr8lV0N0O1b3tJlPJ42XJ9DZScRUFjEBJQoI4lpZxwkI4+N9OeolqkRcDxvKCt63TZ8
         hoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=b0k0Q6QG/6k5gpknBDZTiWz4v+wffd/XVo4QzU/unGE=;
        b=kXUEPbV/gWshvpOZD59qEink4bHckp/wQoY90XBc+YRPqleK1UvcgxNTVqvusY6iZX
         Dw7DmnTAvNpFAyhurNDQJvjdJ6IoQA+a13ilWR5MLkeTmZocT+RVdr5D/EZl4sngl+Ad
         ivymuNP7MXgpvaO9tVdfDg1Rtr5Y6qT/GYZjk+b2hXd/z6Jt1OEKK7PATtlfo52yW8uS
         pLPO0H3ya7TGxSVMGeW73w2qAdz89gvMuNmpQ/AHkAELaVejugsTq0oi9sfbB7LXpLCU
         yoiKaPaVPY2Rm2xm6B/vQoKFhBTDU7gK2OHc08pTBIe0DHmved5KwEniXoU2DEkIKAuh
         lvXw==
X-Gm-Message-State: AOAM531jjEdzWlr46IfPShVxr+wqP4pZjRQOQNR7RlUedRtt9lpoHept
        NN0sszIrmMgdnGm1VOOLZOc=
X-Google-Smtp-Source: ABdhPJz4WAUYAZ0NrUSNuT3L3GWWdQ3jwBcDbLRty7UIcVSOcuPo1y4OuKf4o9gtZ84qtOcol7GjZA==
X-Received: by 2002:a17:902:ce8d:: with SMTP id f13mr2748708plg.53.1643269326493;
        Wed, 26 Jan 2022 23:42:06 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
        by smtp.gmail.com with ESMTPSA id b14sm4558211pfm.17.2022.01.26.23.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 23:42:05 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id E5F3B360334; Thu, 27 Jan 2022 20:42:01 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     ebiederm@xmission.com, viro@zeniv.linux.org.uk,
        glaubitz@physik.fu-berlin.de,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v10 1/3] m68k/kernel - wire up syscall_trace_enter/leave for m68k
Date:   Thu, 27 Jan 2022 20:41:56 +1300
Message-Id: <20220127074158.25888-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220127074158.25888-1-schmitzmic@gmail.com>
References: <20220127074158.25888-1-schmitzmic@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

m68k (other than Coldfire) uses syscall_trace for both trace entry
and trace exit. Seccomp support requires separate entry points for
trace entry and exit which are already provided for Coldfire.

Replace syscall_trace by syscall_trace_enter and syscall_trace_leave
in preparation for seccomp support.

No regression seen in testing with strace on ARAnyM.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

--
Changes from v8:

- adapt ptrace.c patch to recent changes by Eric Biederman

Changes from v7:

Al Viro:
- split first patch to separate the switch to
  syscall_trace_enter/leave() from return code checks

Changes from v6:

Geert Uytterhoeven:
- add syscall_trace_enter() return code check for 68000
  and coldfire

Changes from v5:

- add comment to explain optimization

Changes from v4:

Andreas Schwab:
- optimize return code test (addql #1,%d0 for cmpil #-1,%d0)
- spelling fix in commit message

Changes from v3:

- change syscall_trace_enter return code test from !=0 to ==-1

revert syscall trace return code checks
---
 arch/m68k/kernel/entry.S  | 4 ++--
 arch/m68k/kernel/ptrace.c | 7 -------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 9434fca68de5..18f278bdbd21 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -181,7 +181,7 @@ do_trace_entry:
 	movel	#-ENOSYS,%sp@(PT_OFF_D0)| needed for strace
 	subql	#4,%sp
 	SAVE_SWITCH_STACK
-	jbsr	syscall_trace
+	jbsr	syscall_trace_enter
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
 	movel	%sp@(PT_OFF_ORIG_D0),%d0
@@ -194,7 +194,7 @@ badsys:
 do_trace_exit:
 	subql	#4,%sp
 	SAVE_SWITCH_STACK
-	jbsr	syscall_trace
+	jbsr	syscall_trace_leave
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
 	jra	.Lret_from_exception
diff --git a/arch/m68k/kernel/ptrace.c b/arch/m68k/kernel/ptrace.c
index aa3a0b8d07e9..74d58a82a135 100644
--- a/arch/m68k/kernel/ptrace.c
+++ b/arch/m68k/kernel/ptrace.c
@@ -271,12 +271,6 @@ long arch_ptrace(struct task_struct *child, long request,
 	return -EIO;
 }
 
-asmlinkage void syscall_trace(void)
-{
-	ptrace_report_syscall(0);
-}
-
-#if defined(CONFIG_COLDFIRE) || !defined(CONFIG_MMU)
 asmlinkage int syscall_trace_enter(void)
 {
 	int ret = 0;
@@ -291,4 +285,3 @@ asmlinkage void syscall_trace_leave(void)
 	if (test_thread_flag(TIF_SYSCALL_TRACE))
 		tracehook_report_syscall_exit(task_pt_regs(current), 0);
 }
-#endif /* CONFIG_COLDFIRE */
-- 
2.17.1

