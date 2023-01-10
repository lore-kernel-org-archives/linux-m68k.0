Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027B1C54EBE
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Jan 2023 20:22:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbjAJUWw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 10 Jan 2023 15:22:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231948AbjAJUWu (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 10 Jan 2023 15:22:50 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13CDB5C922
        for <linux-m68k@vger.kernel.org>; Tue, 10 Jan 2023 12:22:50 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id h7-20020a17090aa88700b00225f3e4c992so17739487pjq.1
        for <linux-m68k@vger.kernel.org>; Tue, 10 Jan 2023 12:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cRS1uuNrZ/VXWG04KnyYN+/H30PFxdTCvSCAVODnZiI=;
        b=OmrZD6A9YEz6GlEVGhjC53mhLBISPI94KxwKVcqow3SLKZLBrudUd16Tb9W/RTWmSb
         a3tEVT9Bh5VS8zIQ+/gIesfe9pVIwjrTtRRXMT7bol6MGLZ7xJbXeMwcy+Gxc7FzFHnO
         WYuW/iyKQuoofhIznNgAmqReR1m2DBjeMbGaIiXFJmAEdESWdf/qeQ+Pcc5fzmRYK6Js
         SjWXiH3Qqz4uGNfdSkTSRSCvRLKz/z4rwXWVN35WvvnhXfOE6pPkrkK/iCnZ+rD3XzHq
         H0kc9xNLPqDYrK3WnltWQRHo+jaiCBsnFyETAj8t/22vRPiEmuq4UGdv2sT+Ph6LKqcd
         xZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cRS1uuNrZ/VXWG04KnyYN+/H30PFxdTCvSCAVODnZiI=;
        b=ihT6MDqGUIbnpHx4lBkksZG1ZPAYErlc/g4ZmrzA9o+pYN1ODcJx8R4MAO0pNUL6YH
         /MzVWVJulKiQAPXSPzycEMZYcx/SpPmViSHxF1WHGLf58XjeBKlM53KmOhFCTQAhAIxJ
         tm+TH6NtvUGMOOZK/+yE+mXBQ3ALmKMimZsCzFgw4VCMzKa04EWdAZBb+425MDnvfJg7
         wapTitGggIL8kb/PWcXjzzKU4IDVMAgd9gWJIO+IbLEpt+qS1agd7b5gI8IfPgWvrhs9
         3RNNo0LU1pA0cvJeuCOpgG+SLCf9WbHPwxRfzDPkvqHSjyXVZ8wATDhb+nHqh06+hIIg
         bBZg==
X-Gm-Message-State: AFqh2ko35PtYKhcQm19ex8U5FaBTKpPqIGDPVAuZOQ8zpcIgqqqvc0hs
        gkHeDv4ka/2mNXIMTvFvPTHXtyZrKUI=
X-Google-Smtp-Source: AMrXdXv2ork3DY9vVZr5SL6Bu6/HYtgKsRup73Fq9xlo4ekuuwBElhxwJUBkaQHdzR1+BHfrbdg1iw==
X-Received: by 2002:a05:6a20:548e:b0:9d:efd3:66ca with SMTP id i14-20020a056a20548e00b0009defd366camr98988915pzk.17.1673382169500;
        Tue, 10 Jan 2023 12:22:49 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id t2-20020aa79462000000b00582a224e738sm8498134pfq.63.2023.01.10.12.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 12:22:48 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 7ED86360316; Wed, 11 Jan 2023 09:22:45 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v12 1/3] m68k/kernel - check syscall_trace_enter() return code on m68k
Date:   Wed, 11 Jan 2023 09:22:41 +1300
Message-Id: <20230110202243.29383-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230110202243.29383-1-schmitzmic@gmail.com>
References: <20230110202243.29383-1-schmitzmic@gmail.com>
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

