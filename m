Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB97C54EBD
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Jan 2023 03:06:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235336AbjAJDGQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Jan 2023 22:06:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbjAJDF6 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 9 Jan 2023 22:05:58 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C01389C
        for <linux-m68k@vger.kernel.org>; Mon,  9 Jan 2023 19:05:55 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id jl4so11758515plb.8
        for <linux-m68k@vger.kernel.org>; Mon, 09 Jan 2023 19:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mK9HkFlYGLxLcrlptP8K8P43h+39WTsUtyWO6yrknYs=;
        b=bIz7DkfGT64FcWjiLjGptt1cdC0BJVb2RDBsQIMhxmjjoTSxQoKjSqpAjD9CF5oWHq
         f8zvdONGm2aYYt1Cnp52cojRUIL70zgV4KLD99/v12okCJJ7uE6r1/L8QlyFTQXJEz3w
         uqcjQF0Gm6pu8ALeM2FzeLtvQHGg6LOVLP6qwTSs1Anl+dMi9Ws28OivW1IWFvJdB8rv
         r/zO+GV2ytx29BrdblgQA5qdbp6B36n0eYdGEOEHKj5QHPtixUpdJWnpQ3h/YVl9TZWI
         bycKbmz8Lh7KXnZIDfIVbgZpZ4pAWGJk8o4TIZNPpHjgTsJ1R6YPDTdkzlzWY7ZQELb2
         LcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mK9HkFlYGLxLcrlptP8K8P43h+39WTsUtyWO6yrknYs=;
        b=c0dmaY5nHoJko3aJstt4cqKQFHkxCSimaJ6UOqUeowsGCIqs+gHQpnUdeTw9ol8Xlt
         vyX9mEjXacIiGTrXFZpI6dUp3iccC3OIpCcDqmDuk8Pfu7Oisjmvnp88aROasfnj47+/
         RPFqvwTTEdKaT+rlF1FqN48fSQ4Mhgvg7LEUwtsbHPIaBBIw0y0eiifs3+lBE5saOfwM
         O4rKlec3J54LM7OFWPyydIACsNKO43CijRtZiziizS3ef8X05X15nN7khEWHeYp7Wcw5
         +TPzgDkCVvh3j/VjZ6deeW6sumQF94yR2QeGjcPkUBtxovSb9yGIkGCYMKyKxjZpgHCD
         7PKA==
X-Gm-Message-State: AFqh2kriPFGZdpmlAXQ/CfzU0VWbMGvcF/aJGRA2I9pmb9yEayvAAfHt
        Vh8FcmouKl8z+pV1asHVb7I=
X-Google-Smtp-Source: AMrXdXt+BOF39vEEAb5AGyfKb+zIwkdesJAUfzznbgIA8j+tesavZDhUY1bxp1xzRpvg+N0Y4ASlsg==
X-Received: by 2002:a05:6a20:a51c:b0:b5:eb70:3c15 with SMTP id bd28-20020a056a20a51c00b000b5eb703c15mr4008636pzb.55.1673319954986;
        Mon, 09 Jan 2023 19:05:54 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id e2-20020aa798c2000000b005829c60a838sm6756690pfm.183.2023.01.09.19.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 19:05:54 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 8A6EC360319; Tue, 10 Jan 2023 16:05:50 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH RESEND v11 3/3] tools/testing - seccomp test fixes for m68k
Date:   Tue, 10 Jan 2023 16:05:46 +1300
Message-Id: <20230110030546.21688-4-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230110030546.21688-1-schmitzmic@gmail.com>
References: <20230110030546.21688-1-schmitzmic@gmail.com>
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

