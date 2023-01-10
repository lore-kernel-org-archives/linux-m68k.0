Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2476DC5479D
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Jan 2023 03:06:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbjAJDF7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Jan 2023 22:05:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbjAJDF5 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 9 Jan 2023 22:05:57 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93829C1D
        for <linux-m68k@vger.kernel.org>; Mon,  9 Jan 2023 19:05:53 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id o8-20020a17090a9f8800b00223de0364beso14924907pjp.4
        for <linux-m68k@vger.kernel.org>; Mon, 09 Jan 2023 19:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cRS1uuNrZ/VXWG04KnyYN+/H30PFxdTCvSCAVODnZiI=;
        b=lFVsjFYIr/q2FH1V6r9bPLhzOpI5Z7u8nkXbmxXTNbaD5QMuGTM9uckjPn29UuIrg9
         hthEMkaxBwwLuKItKBcZ9tJosPNTV2HJikA/iDBCV8GqOv3XGMpP4k8uvYQauYxQr729
         xmtbB5pT5F64qb/wMQoPhEZearhYJ7Zwhujj0KVbyj9gw8nwIp8wHP6+Ln40qq913AFG
         vD+8MZn6F8UJkZ1drAYSu8RWfvv/BDe+lD0OZ/AsMwCT/vi4xy64HHS+8/wEfmKcfziH
         VWJ8FhJIQ2FJUfELvLnQvCjTCSM4HOqepAC37dXo+QVLBoaiBXTUOXsNVuCe8gJuNDhO
         obgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cRS1uuNrZ/VXWG04KnyYN+/H30PFxdTCvSCAVODnZiI=;
        b=u1nH32/QQTZnjui3LvgbWkC4iynwBiSnUhr3WGFhJwnGTMxvky1MjrNl2wTqUlsjlL
         vfZ/cpefIpvQh3Ite3HUOnsxNYw8Y3f84Jcv0iTtieSXj8C4YadR3eHavN/1oUYDkp7W
         mF7VfAGgAxRhhEciAjMO8AqK+iHzufoDUxb4a0J9mMwwLUDKfKZVZJVX50j5IswD43ay
         0A7NzerzKX9i5xVgv06CxanCLduK5pv78BVOXZMr8vOGDra3uiaLyGXgtfUJWl+9APL+
         C7p1WgiIZuAyMGL5A4IEHDjkhdLyVe+lxh2M5QIhHjWjKELpdWGMPowr69QKsXTZufAq
         TxZw==
X-Gm-Message-State: AFqh2kq/t+0NRHHmfdKJ+XWkebVuHpIC+8USUltgqP5Ql8kZw45erB8B
        yhab75agyxr8o25vsk31fQKpmKGk8Ag=
X-Google-Smtp-Source: AMrXdXvPgXoB0hbL04H5EXmKU6YrOKWhfjkSuyuvD1MJmH0+aWat7U2gi6oBu+7loUhCplQ45pBiDA==
X-Received: by 2002:a05:6a21:9011:b0:b6:8b6:413f with SMTP id tq17-20020a056a21901100b000b608b6413fmr1738906pzb.52.1673319953067;
        Mon, 09 Jan 2023 19:05:53 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id c22-20020a6566d6000000b0045dc85c4a5fsm1756917pgw.44.2023.01.09.19.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 19:05:52 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 249E8360312; Tue, 10 Jan 2023 16:05:49 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH RESEND v11 1/3] m68k/kernel - check syscall_trace_enter() return code on m68k
Date:   Tue, 10 Jan 2023 16:05:44 +1300
Message-Id: <20230110030546.21688-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230110030546.21688-1-schmitzmic@gmail.com>
References: <20230110030546.21688-1-schmitzmic@gmail.com>
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

