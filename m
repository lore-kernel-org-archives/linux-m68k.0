Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD25C64ED6
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Feb 2023 14:47:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjBZOq7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 26 Feb 2023 09:46:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjBZOq6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 26 Feb 2023 09:46:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A98414237
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Feb 2023 06:46:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 359C2B80BED;
        Sun, 26 Feb 2023 14:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261F8C4339B;
        Sun, 26 Feb 2023 14:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677422757;
        bh=nrcxPHSvASqu/87MFtQzuxhVcgvVH6nsL/fsd8kE9v0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FLPZn7wR15cR3819RKYt27bL7ww4sy4hIQObAVMWG+kIqWPxfyGW5XQPbKoQc81tv
         MFXJB6XWYjSWkcOldrCmqMOYTLhe9XPuIbimi0qpNLdoztUUYXfA5LbBHYZlJ7utZ0
         0eDtY1XjM0y76Ib1GfD6LfitVJOSHGR/9Y+ACA6VV9QkSNUAxgJs2polD8BOkDm6Jn
         NA7j/ZKSLcJnrYjzH5NsK3cZQ967ZZcj/UnUYBqPGViK/DpK5aiLEU15WZtlL5D1xl
         Rs8dj5rpAeFsI3/5xMLVGt52jPePC2dGNo19Ow16dZ6mrOp2qjxlyiOjWr158J0w4j
         81xEJ9EM96YVg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sasha Levin <sashal@kernel.org>, gerg@linux-m68k.org,
        ebiederm@xmission.com, linux-m68k@lists.linux-m68k.org
Subject: [PATCH AUTOSEL 6.2 28/53] m68k: Check syscall_trace_enter() return code
Date:   Sun, 26 Feb 2023 09:44:20 -0500
Message-Id: <20230226144446.824580-28-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230226144446.824580-1-sashal@kernel.org>
References: <20230226144446.824580-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Michael Schmitz <schmitzmic@gmail.com>

[ Upstream commit 2ca8a1de4437f21562e57f9ac123914747a8e7a1 ]

Check return code of syscall_trace_enter(), and skip syscall
if -1. Return code will be left at what had been set by
ptrace or seccomp (in regs->d0).

No regression seen in testing with strace on ARAnyM.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Link: https://lore.kernel.org/r/20230112035529.13521-2-schmitzmic@gmail.com
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/m68k/68000/entry.S    | 2 ++
 arch/m68k/coldfire/entry.S | 2 ++
 arch/m68k/kernel/entry.S   | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/arch/m68k/68000/entry.S b/arch/m68k/68000/entry.S
index 997b549330156..7d63e2f1555a0 100644
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
index 9f337c70243a3..35104c5417ff4 100644
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
index 18f278bdbd218..42879e6eb651d 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -184,9 +184,12 @@ do_trace_entry:
 	jbsr	syscall_trace_enter
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
+	addql	#1,%d0			| optimization for cmpil #-1,%d0
+	jeq	ret_from_syscall
 	movel	%sp@(PT_OFF_ORIG_D0),%d0
 	cmpl	#NR_syscalls,%d0
 	jcs	syscall
+	jra	ret_from_syscall
 badsys:
 	movel	#-ENOSYS,%sp@(PT_OFF_D0)
 	jra	ret_from_syscall
-- 
2.39.0

