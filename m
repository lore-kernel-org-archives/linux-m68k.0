Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A862AC54EBD
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Jan 2023 00:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234995AbjAJApX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Jan 2023 19:45:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234800AbjAJApU (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 9 Jan 2023 19:45:20 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 919BE1181B
        for <linux-m68k@vger.kernel.org>; Mon,  9 Jan 2023 16:45:19 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id 20so2132138pfu.13
        for <linux-m68k@vger.kernel.org>; Mon, 09 Jan 2023 16:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mK9HkFlYGLxLcrlptP8K8P43h+39WTsUtyWO6yrknYs=;
        b=gLCFdwGhuJsFjuI/LQu/+j0JtAKqzethGK7YUDwc+C7SACwlHM2zGQigB+0hrZ3ujG
         deE8ivmcyGDjqiLYSdbzOdr4kBm67Gqt71LLQd7WiUc4X8mdsmcGHV73oV1/OaN9pJs5
         tto/cGqTze6f1paGLDYHRhiJ6ymiLTDi+1OAfIBnNj8DNonbjlxpVhnRdQVGBUemtW5Z
         Xy8hUHDTaX0NdTr04r0LXkdQ+BS3ZXTASMynNWXWIEH6LJk3+eNs4bEKZVm1bFGY3wqB
         NyhiCnHd8Rk+Ur83xvjU2LpJkK3VaSahx79qNQodGZs5zIgJHxoMVdSbyg++xYcg00Vg
         VRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mK9HkFlYGLxLcrlptP8K8P43h+39WTsUtyWO6yrknYs=;
        b=HJ3jSGPRaJPifM6XGUXDMawzPsgvWJTtrofCvVxbrJBEz/bko2X2+/W9tcY4dmw2Aa
         eOlhopBrD0XxaYoG3+t+XjUcGES13uoMcvwNtTFkv3mICNURHui7Lp58FjsZmCvzp6Jt
         fkboWWswJN1tbGXmlrPrik6xqG/EFd/QFRSyb8KZDa+2eYMAMRrw/QrOuCJ5zfv4YwQ5
         CJocQ2g6bTy3WRWpNrzW5i/BnByVWTco0xAsKvdd5xvf+WODH63wocJrgeF9enNSKS5D
         r16sbqDoAhHXGET1r8S+rwNDK/j/listwVqHK7oXDRTzGzRh6cBMwTbtcA78zpPTEPQS
         WpAg==
X-Gm-Message-State: AFqh2kqoVsDikchPIjaXRDYvFr3eQ5FZCz9iaKAy25huc8NNPExxUczd
        rB9F7n+kPCEj4Q4BQIcKtKJ9P78zKIQ=
X-Google-Smtp-Source: AMrXdXu0Drs6nUntECCCI8GlXw0toBx8+aMriNz6XnqMmV/crDk5QTyMjx228foBd0JlowAydAMPIA==
X-Received: by 2002:a05:6a00:1a16:b0:58a:aaa3:f72e with SMTP id g22-20020a056a001a1600b0058aaaa3f72emr199321pfv.6.1673311519158;
        Mon, 09 Jan 2023 16:45:19 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id a82-20020a621a55000000b00587c11bc925sm3454742pfa.168.2023.01.09.16.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 16:45:18 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 4AED2360319; Tue, 10 Jan 2023 13:45:15 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v11 3/3] tools/testing - seccomp test fixes for m68k
Date:   Tue, 10 Jan 2023 13:45:04 +1300
Message-Id: <20230110004504.20292-4-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230110004504.20292-1-schmitzmic@gmail.com>
References: <20230110004504.20292-1-schmitzmic@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add m68k seccomp definitions to seccomp_bpf self test code.

Tested on ARAnyM.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 9c2f448bb3a9..9f854524eed3 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -138,6 +138,8 @@ struct seccomp_data {
 #  define __NR_seccomp 337
 # elif defined(__sh__)
 #  define __NR_seccomp 372
+# elif defined(__mc68000__)
+#  define __NR_seccomp 380
 # else
 #  warning "seccomp syscall number unknown for this architecture"
 #  define __NR_seccomp 0xffff
@@ -1838,6 +1840,10 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 # define ARCH_REGS		struct pt_regs
 # define SYSCALL_NUM(_regs)	(_regs).regs[3]
 # define SYSCALL_RET(_regs)	(_regs).regs[0]
+#elif defined(__mc68000__)
+# define ARCH_REGS	struct pt_regs
+# define SYSCALL_NUM(_regs)	(_regs).orig_d0
+# define SYSCALL_RET(_regs)	(_regs).d0
 #else
 # error "Do not know how to find your architecture's registers and syscalls"
 #endif
@@ -1902,7 +1908,7 @@ const bool ptrace_entry_set_syscall_ret =
  * Use PTRACE_GETREGS and PTRACE_SETREGS when available. This is useful for
  * architectures without HAVE_ARCH_TRACEHOOK (e.g. User-mode Linux).
  */
-#if defined(__x86_64__) || defined(__i386__) || defined(__mips__)
+#if defined(__x86_64__) || defined(__i386__) || defined(__mips__) || defined(__mc68000__)
 # define ARCH_GETREGS(_regs)	ptrace(PTRACE_GETREGS, tracee, 0, &(_regs))
 # define ARCH_SETREGS(_regs)	ptrace(PTRACE_SETREGS, tracee, 0, &(_regs))
 #else
-- 
2.17.1

