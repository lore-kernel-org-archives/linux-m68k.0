Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F13C54EBC
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Jan 2023 20:22:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232031AbjAJUWx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 10 Jan 2023 15:22:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231768AbjAJUWw (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 10 Jan 2023 15:22:52 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1904A5D422
        for <linux-m68k@vger.kernel.org>; Tue, 10 Jan 2023 12:22:51 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id c8-20020a17090a4d0800b00225c3614161so17686112pjg.5
        for <linux-m68k@vger.kernel.org>; Tue, 10 Jan 2023 12:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mK9HkFlYGLxLcrlptP8K8P43h+39WTsUtyWO6yrknYs=;
        b=g28knvmv/+w/sX8p/buzW8qqTZeDcTTNXILQgX5BqD48Re2vC4z1QlnyJK1wbdq+UU
         ZloUUaH7DD5/cOJmr4APSqmXxqy8RMe+wQ56FgWVGGDRw8E6l2xzxMyfoF7e7Dqiamlw
         WBSo6FSa5Ak47EDTRr7ijnBagMM3iCS28m7dXxhH8xVGClPZl2NuIzKd55gCelFCl5kD
         yXXCs89WCCIzbtal3hOJ2N2TR3m/2fqJLMSLIGujeUpipxKjpT8e/wMsUC9n8+zzjf7L
         M3A/bWQr9VE021DJz4AIytdXg6g+ln9WJCejDPgdeF8RcahVrwSibVRfL4rw7BQamzgb
         71Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mK9HkFlYGLxLcrlptP8K8P43h+39WTsUtyWO6yrknYs=;
        b=sfa/9iwbPotYTSjwvJMew/FZ8LVsvJ5t/g4ORmt5cRYw2aA1iZFsxk2SIuqm1MflbJ
         ZgEiwe1xeURLEm8ccnMrUAbPQqeWiR0vL2kzklCtOu3QBMiyNi8HhfmJzhT+AAvmmlIm
         VYYjgdX0BepKonzICrrRpxtHBSwlQ89to2nMyaEKWL374dy8d1XSShAehNmYyTKwKviD
         1Gkvauk8sSzVgJpRp5pflXiBUtuvG0/Yn1YWezFxwW6ca5ZuRZ7a5FF651jOvKA4j5J7
         Ix4WXf56IrvpDORDRMoZE4nUwBvlvSEEPy2P5uRuu3F1FB9oGC5+XjRz8H97iMd0CQqy
         Lwrw==
X-Gm-Message-State: AFqh2kpwMYptCqZMK6dyToKuPw/su4Yb0asOnlFcRvQr0RsvToDGlZCP
        KQ+pWVweRHUOxxvJG8jCYZw=
X-Google-Smtp-Source: AMrXdXuQQALko54wu9WATAmMkuiPI8WbDWjlL8kodDSz/XQd2zw9/BTSn23HT+WksHZUGzdKYmdQWQ==
X-Received: by 2002:a17:902:ec89:b0:186:b063:32e with SMTP id x9-20020a170902ec8900b00186b063032emr99977705plg.62.1673382170694;
        Tue, 10 Jan 2023 12:22:50 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id u12-20020a17090341cc00b0019327a6b740sm5720618ple.308.2023.01.10.12.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 12:22:50 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id E04FD36031F; Wed, 11 Jan 2023 09:22:46 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v12 3/3] tools/testing - seccomp test fixes for m68k
Date:   Wed, 11 Jan 2023 09:22:43 +1300
Message-Id: <20230110202243.29383-4-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230110202243.29383-1-schmitzmic@gmail.com>
References: <20230110202243.29383-1-schmitzmic@gmail.com>
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

