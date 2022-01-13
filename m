Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABAEBC433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 13 Jan 2022 01:09:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbiAMBJQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 12 Jan 2022 20:09:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbiAMBJL (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 12 Jan 2022 20:09:11 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84004C06173F
        for <linux-m68k@vger.kernel.org>; Wed, 12 Jan 2022 17:09:11 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id n30-20020a17090a5aa100b001b2b6509685so8391431pji.3
        for <linux-m68k@vger.kernel.org>; Wed, 12 Jan 2022 17:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cRS1uuNrZ/VXWG04KnyYN+/H30PFxdTCvSCAVODnZiI=;
        b=IDAQBoviVu3fdsRxeisU7QnHxf1AZ29gGnRoD2hb8xH9LE5uRRpCugnxDeAV5EFQOD
         hh+ZMMYO587MGfjmkJq4VTCTRb9lDNV3EhnTIJBNx0lJZVf+a73MmQJyxCTsoBLK55dI
         N3NH5ENTSgXT0Tx/lCNph070/pu6PNp3LwczvmE5kRqYPXEs41JcN4b7l1tmYLwq1jHg
         +jvN3jPKOI8cmDgK6MEvYz6U00OD21XyhdHozLhEFefhZJQOFlsEsNKCJK2Xg8iRrGBA
         ZobV7S/9WH/afBcTo5rCZuuwMEuIVdKVhi5oyv4HFxjQ8YPoWKIeTKIPaDa1WG4QoY6u
         n6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cRS1uuNrZ/VXWG04KnyYN+/H30PFxdTCvSCAVODnZiI=;
        b=ciW/fA9yfFhCDiISts/GjdI/07D83M3xW+Yyg5b3Z6D0NnJp0UwUt4mDfKwCeCE3bu
         SZcF8P2nDY0Ts3ALO9hcRpTCPkK1Id7JnQwEPmaz6qHEYTTC7Rt26vegzw2WOfWLBmj8
         MKx3cxQgn1RRclXYWscFeCU7EFx8vV8iTnyRLizeoxMLAXJn6c+rnrYqTiiQJwTtN/po
         LOATAxFMsS82KX5juGUmypWD1XzHo3Nb7h7NnTUBmFXe2wfuJTGq5z7iutIuLVltD4rP
         uFVIt2XYUvthx+qJE64qYSaKM6LdimBt8fmWBoXhgEPbHBUhbOpvrB8csgmZP7P8ky0E
         +Bkg==
X-Gm-Message-State: AOAM533p2s9j3uJnjNgWUc4uQNyUVybhLPSzRUhBNFqC+AxbRUJbVyI1
        cnmRd38WcplxnDUOBhtjxo5R416Bclc=
X-Google-Smtp-Source: ABdhPJwMmpzcl9zR0nUPKGhbmpWS5CpDeYjZHv48Sva+UKWEmV+vOKgJmPo3y0gLy7+CkSL0hiQFQg==
X-Received: by 2002:a63:a011:: with SMTP id r17mr1985155pge.300.1642036151106;
        Wed, 12 Jan 2022 17:09:11 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
        by smtp.gmail.com with ESMTPSA id h5sm731609pfi.46.2022.01.12.17.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 17:09:10 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id A7F17360331; Thu, 13 Jan 2022 14:09:06 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     ebiederm@xmission.com, viro@zeniv.linux.org.uk,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v8 2/3] m68k/kernel - check syscall_trace_enter() return code on m68k
Date:   Thu, 13 Jan 2022 14:09:02 +1300
Message-Id: <20220113010903.720-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220113010903.720-1-schmitzmic@gmail.com>
References: <20220113010903.720-1-schmitzmic@gmail.com>
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

