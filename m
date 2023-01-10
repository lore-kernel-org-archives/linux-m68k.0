Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D77C5479D
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Jan 2023 00:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235036AbjAJApV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Jan 2023 19:45:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234995AbjAJApT (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 9 Jan 2023 19:45:19 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF28DF58F
        for <linux-m68k@vger.kernel.org>; Mon,  9 Jan 2023 16:45:18 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id h7-20020a17090aa88700b00225f3e4c992so14693687pjq.1
        for <linux-m68k@vger.kernel.org>; Mon, 09 Jan 2023 16:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cRS1uuNrZ/VXWG04KnyYN+/H30PFxdTCvSCAVODnZiI=;
        b=MMNDLq1kGh6S7zl1DfZdrzybOmg+15CRwCw5HFlrjlh6o376Jm6QgVJCly8thdNlIJ
         yGFNwheLrnhfCYagEhDsdO7Ir9TmWmYYEfqHttnQqiJw14Mj6cyojlh7T9OJbqTU6cQ0
         cReAKflDJ1+jH264dnMM/GUu012fqJcu9zbbUMh046FEF/m4YfY55eMgrxfnNVT6eEU8
         xydRAlYk7/5sucAmknOTAm7bbTMJWIbEQ9b+gz6/VwkelNXuu5qs38tn0cPO8qBwTqu6
         D5gYrSdkY1jl1QmHITnmTc/nmOGQs2s2PItSbHjHkuLwJ7Q979lI6kG2GA+6towxgGrt
         NfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cRS1uuNrZ/VXWG04KnyYN+/H30PFxdTCvSCAVODnZiI=;
        b=BU7ktUCi01p78Qmlw33ri5GXMiE/SHM1protZLAQ6zcpVuicPuYqt5tj/dMM8kOBHm
         cUhsZK9hoKiNhhu+n/EDEODnbaW8EkXOsvSYzEj8iU4ShQX7iUrr0vjUa7DZMFsml3m4
         FZ6GJAGaNBxpDCMpUS3UVxHwUcF1eLJFu+B0n20Wi+Anfhx9Ukhu6aJAsK+/cHOyYBhr
         EQHQtg7Avm4RCBJMxm1B64FIavoL0ZlFP1RmwM8+0NmyPRW9cAe9Mkr3ILOTNYhm4JxC
         GrOFN6+dtsVbuRQtyA6jmgPHF2d3degq5xOBE0GCTiAIMOZzh4iHZ86iEOHhE0Ul2GNZ
         vRFg==
X-Gm-Message-State: AFqh2krPdF37h+ZpVmIXcex8mVNEFH1brteNnqCvVsZvE4kAsk0Zhj1o
        jgQHDP+HxxuJOVvxXBmOnzw=
X-Google-Smtp-Source: AMrXdXtWX0pHUYdCr0J7dOamPXQUNM7u19F7S2qnhi0W0gRNw+wG5BhbIlAGc4IXE7in5DgYQ6UIBQ==
X-Received: by 2002:a17:902:ca95:b0:189:e711:173 with SMTP id v21-20020a170902ca9500b00189e7110173mr61046227pld.33.1673311518295;
        Mon, 09 Jan 2023 16:45:18 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id i18-20020a170902c95200b00189a50d2a3esm6637901pla.241.2023.01.09.16.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 16:45:17 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id D528C360312; Tue, 10 Jan 2023 13:45:13 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v11 1/3] m68k/kernel - check syscall_trace_enter() return code on m68k
Date:   Tue, 10 Jan 2023 13:45:02 +1300
Message-Id: <20230110004504.20292-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230110004504.20292-1-schmitzmic@gmail.com>
References: <20230110004504.20292-1-schmitzmic@gmail.com>
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

