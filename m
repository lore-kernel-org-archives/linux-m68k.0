Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C4AC54EBC
	for <linux-m68k@archiver.kernel.org>; Thu, 12 Jan 2023 03:55:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234465AbjALDzk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 11 Jan 2023 22:55:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235948AbjALDzj (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 11 Jan 2023 22:55:39 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E2948CEC
        for <linux-m68k@vger.kernel.org>; Wed, 11 Jan 2023 19:55:38 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id o13so14386107pjg.2
        for <linux-m68k@vger.kernel.org>; Wed, 11 Jan 2023 19:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5V0NCMtlXRayjVUU+9cl3KSrtgg5Ii50oA7kYcIFOOU=;
        b=WhXw86fuT5kseAHNtdiR4LMNt6satlwnIYAusMaskGFsmI4NS5JDZYzC/nHNRTWS4z
         zspK90afM1Cr3bDIgD1IrfHYKBagol9y1y4BjpjH8+957gd7iYgG2g/7X1RFi8Tc1QiS
         NuAN3ESihdBV6cfO+bhQbral8v1TjSYeJ/Pb8YTgVX9B74qxpfbJSIKdCPiC8qeugIFp
         bVFuHC8MKLvpQ4z3oo0NGSlNqFJg5gMYMssVxAhq0OKEfbYhumogwLLvZAAeNCKS390c
         MQwWQhG+L84Rkz2JEFYPo3nTQFdEBmBthZK2myz7KQc75STfqj2aPn/cgDFJ9AxbDgnb
         2ruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5V0NCMtlXRayjVUU+9cl3KSrtgg5Ii50oA7kYcIFOOU=;
        b=W5+YjHk7vXFWCfS9Lhh045JtfY7IWJP+PMGglDJnXUDUDg9xMx0VF15nN1m/lbf1cx
         QmtlQedwAW2bG8lHPAVrwylHyDIiNwqBnbaPOt+gqTquVAnazh6hGwCHh1R7bp+uWEfp
         ar8IXPznp9/pqY2h45++8qtydHbCwzAcW+fXp6mjT/560CN028pvkkWNMxGi5VTNmcRz
         Ao1r83qMe5UH+2cZDwKJ6UnUzY1nVePpQMVRqY0/jXx1Sr6mXsDCIdQeCcY22IobV5SM
         CgS/PdoUXtDh1s8xzZ/fQ/meGd9q40ZMeCwMfDRHpDF+wnMhG7cO6jDUPcYIB9s6DIoj
         tk7w==
X-Gm-Message-State: AFqh2kqgCohyRMOitjWVndm1XGxZeATz7C0Bkp2AVtjuRGSC92a2+O5u
        0un8gd79GFY+M20c0uWyNicsB5ahfN8=
X-Google-Smtp-Source: AMrXdXvvQ0amS82gV47smHYp/7GplG7QEIjW/4whJpo729VGGWWrGMLi4VaBWOpwyDHTvG0mxM3LoQ==
X-Received: by 2002:a17:902:7786:b0:192:7d96:570d with SMTP id o6-20020a170902778600b001927d96570dmr41790917pll.19.1673495737625;
        Wed, 11 Jan 2023 19:55:37 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id u16-20020a170902e5d000b001871acf245csm10983072plf.37.2023.01.11.19.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 19:55:36 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 7074B360316; Thu, 12 Jan 2023 16:55:33 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v13 1/3] m68k/kernel - check syscall_trace_enter() return code on m68k
Date:   Thu, 12 Jan 2023 16:55:27 +1300
Message-Id: <20230112035529.13521-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230112035529.13521-1-schmitzmic@gmail.com>
References: <20230112035529.13521-1-schmitzmic@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Check return code of syscall_trace_enter(), and skip syscall
if -1. Return code will be left at what had been set by
ptrace or seccomp (in regs->d0).

No regression seen in testing with strace on ARAnyM.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

--
Changes from v12:

- prevent overwriting the syscall return value after change
  by ptrace or seccomp on 68020+

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
 arch/m68k/kernel/entry.S   | 3 +++
 3 files changed, 7 insertions(+)

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
index 18f278bdbd21..42879e6eb651 100644
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
2.17.1

