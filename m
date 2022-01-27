Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3EDC433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 27 Jan 2022 07:42:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237426AbiA0HmJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 27 Jan 2022 02:42:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbiA0HmI (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 27 Jan 2022 02:42:08 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8904FC061714
        for <linux-m68k@vger.kernel.org>; Wed, 26 Jan 2022 23:42:07 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id e16so1583306pgn.4
        for <linux-m68k@vger.kernel.org>; Wed, 26 Jan 2022 23:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cRS1uuNrZ/VXWG04KnyYN+/H30PFxdTCvSCAVODnZiI=;
        b=Be7O2SDng+rWN+vbF+qmRb12HEKbyza7my7excALZKArn8N3Y3m41+iL5r6mQMfjh9
         sc16LgZ9QQbfrpudDUh09QYvxO/q0uLTmajna5McerzJJ1Pqr18uXTBOKtDbqsAEPNkW
         wIjEYNsVpsQiGULHQD1ID+mWsXKAVoyCW+Vvi44KujDuQX8fFWXstuyjzm6aSPjBVgJF
         cHhmwUXFm4f1TqVZJlMXZc1gKE+q8SjMd1UUCdoMv+zsGknurUTkEMXJrRZOIAeqsOhR
         K0WRpEeMTQjIOTvZRPIhqpKB2uq8YDLvdp+L8PD9X5VS9WWCs0+fWqGl8ShYQkr2mQ6I
         9lbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cRS1uuNrZ/VXWG04KnyYN+/H30PFxdTCvSCAVODnZiI=;
        b=ol6+vNNyJc1fZVaxq1Gnx6tVijmPUMzeyxv4tJUM7CEI5SmIbYutSXlKdH99EY/xC3
         zZD+Nj64cbgf0czE4+4lbj4GncoVJWUWvGTO5CKCXQ33jwUemCf0SfOWgqBPOYZMqog2
         RsSoKGPbaP6GNH8xYa3hf/XTMlsk5JeIldUiHiliC/BmX/Pa1GcB9SYVlHZaghC4f0Qr
         ere9PB4VTgu3EER2VWAGfc9fujIifY+dXiBQBSQ+CVzjC1WWxqggvCNCWkzwRibYy4dI
         SWZz/y3MGYPP7ThzzUjL5mHyf7rwm75DssxpwunykiFp3m8x3HRDxg8UlLkoU4s8nYv5
         eULA==
X-Gm-Message-State: AOAM533/kjUzW9swAlw3byYyHIUq5cAKfiuUP+VT7G+Ol1iVJDBUlFNV
        oLC/YfphfIXii8UnBJWD6Y/GZcSUbd0=
X-Google-Smtp-Source: ABdhPJy1DFMOCA7CWkUJT44g+Ql/qMjxXJO4rha323dqtIS/+OvUNLeMPE19mP/pLW2T+PMMCzBkIw==
X-Received: by 2002:a63:8249:: with SMTP id w70mr1869022pgd.545.1643269327143;
        Wed, 26 Jan 2022 23:42:07 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
        by smtp.gmail.com with ESMTPSA id mq3sm1922640pjb.4.2022.01.26.23.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 23:42:06 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 9AB58360335; Thu, 27 Jan 2022 20:42:02 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     ebiederm@xmission.com, viro@zeniv.linux.org.uk,
        glaubitz@physik.fu-berlin.de,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v10 2/3] m68k/kernel - check syscall_trace_enter() return code on m68k
Date:   Thu, 27 Jan 2022 20:41:57 +1300
Message-Id: <20220127074158.25888-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220127074158.25888-1-schmitzmic@gmail.com>
References: <20220127074158.25888-1-schmitzmic@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Check return code of syscall_trace_enter(), and skip syscall
if -1. Return code will be left at what had been set by
ptrace or seccomp (in regs->d0).

No regression seen in testing with strace on ARAnyM.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

--
Changes from v7:

Al Viro:
- split return code checks from switch to syscall_trace_enter()

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
---
 arch/m68k/68000/entry.S    | 2 ++
 arch/m68k/coldfire/entry.S | 2 ++
 arch/m68k/kernel/entry.S   | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/m68k/68000/entry.S b/arch/m68k/68000/entry.S
index 997b54933015..7d63e2f1555a 100644
--- a/arch/m68k/68000/entry.S
+++ b/arch/m68k/68000/entry.S
@@ -45,6 +45,8 @@ do_trace:
 	jbsr	syscall_trace_enter
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
+	addql	#1,%d0
+	jeq	ret_from_exception
 	movel	%sp@(PT_OFF_ORIG_D0),%d1
 	movel	#-ENOSYS,%d0
 	cmpl	#NR_syscalls,%d1
diff --git a/arch/m68k/coldfire/entry.S b/arch/m68k/coldfire/entry.S
index 9f337c70243a..35104c5417ff 100644
--- a/arch/m68k/coldfire/entry.S
+++ b/arch/m68k/coldfire/entry.S
@@ -90,6 +90,8 @@ ENTRY(system_call)
 	jbsr	syscall_trace_enter
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
+	addql	#1,%d0
+	jeq	ret_from_exception
 	movel	%d3,%a0
 	jbsr	%a0@
 	movel	%d0,%sp@(PT_OFF_D0)		/* save the return value */
diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 18f278bdbd21..0d5b7085d76f 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -184,6 +184,8 @@ do_trace_entry:
 	jbsr	syscall_trace_enter
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
+	addql	#1,%d0			| optimization for cmpil #-1,%d0
+	jeq	ret_from_syscall
 	movel	%sp@(PT_OFF_ORIG_D0),%d0
 	cmpl	#NR_syscalls,%d0
 	jcs	syscall
-- 
2.17.1

