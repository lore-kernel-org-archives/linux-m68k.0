Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAD0C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Jan 2022 07:16:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442712AbiAYHQi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Jan 2022 02:16:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442713AbiAYHKl (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Jan 2022 02:10:41 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF49C068098
        for <linux-m68k@vger.kernel.org>; Mon, 24 Jan 2022 22:08:29 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id d5so16478817pjk.5
        for <linux-m68k@vger.kernel.org>; Mon, 24 Jan 2022 22:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cRS1uuNrZ/VXWG04KnyYN+/H30PFxdTCvSCAVODnZiI=;
        b=ZPXZ+PXTLF/0dn5OK+8+/zMhUftaD/+0PhEw7p6jaM/FWwP8sQernsdgd6CTmrlyAj
         I/r9jViyz9qSqSnQhEk4taACAQNTeB69+j0e1BICOe3JSk1gr5ea+0qxBY7UzG0ZUWwD
         01YkvT3b55eTSUfrub3yWmOfgXHpvkOwj8aFi83geFMGaYiZVz2hoae8enqlnse3QPrS
         XqlnRy1j9BA21WldbPW+/qhOtBiXeg3eSSBbmM8+nl2+KwAStgexohFcec96wMp/prCD
         Ba3VohJ3xpktFkwVw001jjB3zksb1BIIW1IDmBc8SFYyi9iM9wt7/fjuSzpCVm5cBHeZ
         jlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cRS1uuNrZ/VXWG04KnyYN+/H30PFxdTCvSCAVODnZiI=;
        b=krE+FmgDZjMpn19kJYikVY3JP1jTCyC8P0x3H3x5FIWLiiah92nkNweerzWsaoK2lN
         kaKnRpCsjAEjmcZheBFAkbEL1AlesIQ5s+wys1vT932mK4UkgwUmjxH64gxlDDCh1fvG
         WhMX7dZ2sfN6eY6X3ugrlZGBvfS3XgTk+F4orrIpsEJgN+bYH2lwCJ5LhS3A8Ixqs0UF
         zp4MYNmPCSiIuOLQf8KH3n9qKsZAqmyDdxkHzhfmBvpIhq2/ZW+87hBnT+ChI3EfpD7o
         hfpEpf2foVrZWDf1G0eBIzAF5kM+zexFifTudukkDvez7tfEeF+jA5+/NAI8E9SeKxDx
         LM1w==
X-Gm-Message-State: AOAM533vjlZKvZ0H2R/rXGDJluicROHWKT/KyDRBL74GgTjQ7w83pcdD
        qLpBqwoBCL2G3iu3hwK0aFPeMR44Yug=
X-Google-Smtp-Source: ABdhPJytctiySTifTDbpw4j85x+P0y1iKFV0tAraYRjjGPzjOXBdyQHT0AWbyX7FJN4MijHqBu1bWQ==
X-Received: by 2002:a17:90a:34cc:: with SMTP id m12mr2013756pjf.24.1643090908986;
        Mon, 24 Jan 2022 22:08:28 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
        by smtp.gmail.com with ESMTPSA id b20sm5020292pfv.134.2022.01.24.22.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 22:08:27 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 60BFE360335; Tue, 25 Jan 2022 19:08:24 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     ebiederm@xmission.com, viro@zeniv.linux.org.uk,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v9 2/3] m68k/kernel - check syscall_trace_enter() return code on m68k
Date:   Tue, 25 Jan 2022 19:08:20 +1300
Message-Id: <20220125060821.2405-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220125060821.2405-1-schmitzmic@gmail.com>
References: <20220125060821.2405-1-schmitzmic@gmail.com>
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

