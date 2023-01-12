Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6553FC61DB3
	for <linux-m68k@archiver.kernel.org>; Thu, 12 Jan 2023 03:55:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235948AbjALDzl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 11 Jan 2023 22:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235969AbjALDzk (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 11 Jan 2023 22:55:40 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1A848CEF
        for <linux-m68k@vger.kernel.org>; Wed, 11 Jan 2023 19:55:39 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id s13-20020a17090a6e4d00b0022900843652so704243pjm.1
        for <linux-m68k@vger.kernel.org>; Wed, 11 Jan 2023 19:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KwRCjM24ImMRII0SqH+nIDGTOYCpRQlvJaeTadJxoYw=;
        b=HmmnqyLz90gXEDn7lZevt+qWdY+SuvechaP2GJeH3S+mflYiykLIXFKrY11OR8jh9A
         n4+WLxGy8SID8LQUD7jskeV7eAAkCYozp8kPM5ISuHytJwRhWJ4Q8SgqaOxY57P5gUiG
         JrPI6mTeh4tv58cyNTRBgttkkXWe7VSuE8l/YpLtyec/GbBfkd79FZtx1XkLpAZpm8rJ
         9rycMfas4s0VIwWVwPUiySSooXpwslQGDTYSR2U0r3uK1GwcpMY6uwXZ66kT6LmjnTlf
         jki5owraQ5jQSZAc2zWM16bXp+AyM3O0INseUxwucMb5/2nmrqoYejyHQC0iv2JBUV8X
         dkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KwRCjM24ImMRII0SqH+nIDGTOYCpRQlvJaeTadJxoYw=;
        b=Bj7IbrfLsZUF56Be1Sn6iLuFs764FxSxi2yEol9rrsNZliHmd4Y9mTcCsqQOOM8iIg
         lG6VZl2dDnpuFgNTYeEyBjKN0aWbxIwNV+PNW9uwWGJIf46dMAr3cTF59KLLrWl0V9jm
         DrUFJtmT1r8cdt9VugzF6PYo4xPKWm1Qnv4bC8YycOzl59qJCwJPbppZiioxEpYF44ey
         dzs64jKByx7nlKmx34MyupRpf0hGZdtz0iGNh90cwu2Tj9PNse5Np1J4Ky5EnkqGh8Px
         MZLqyZJuawV+J0i/Ne4jsnjIhLAk6S7BMyjP5JXw2HdMxMqlzvlxXRlnzo/Fp8M9BkfK
         NjNQ==
X-Gm-Message-State: AFqh2krGzdTUaMdfx3P8ocNMNBbXgceHxE8HJjjlbty25w1PnnDrsC3h
        CdEF9I9JiXUrsOtZepmB3NM=
X-Google-Smtp-Source: AMrXdXvUQEkkoAkEcnRwx/kN6pZz9Jqq6T0kqCbUYYNY+U/kVnp4GIaxFsLWL052/zQB3BLo8pAFBg==
X-Received: by 2002:a05:6a20:9f85:b0:af:c871:bf4b with SMTP id mm5-20020a056a209f8500b000afc871bf4bmr89414461pzb.26.1673495738884;
        Wed, 11 Jan 2023 19:55:38 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id t24-20020a170902b21800b001766a3b2a26sm10985098plr.105.2023.01.11.19.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 19:55:38 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id C640A36031F; Thu, 12 Jan 2023 16:55:34 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v13 3/3] tools/testing - seccomp test fixes for m68k
Date:   Thu, 12 Jan 2023 16:55:29 +1300
Message-Id: <20230112035529.13521-4-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230112035529.13521-1-schmitzmic@gmail.com>
References: <20230112035529.13521-1-schmitzmic@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add m68k seccomp definitions to seccomp_bpf self test code.

Tested on ARAnyM.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

--
Changes from v12:

Michael Karcher:
- use correct definition of ARCH_REGS (use of struct pt_regs
  cause stack overflow on passing register set to user space
  due to size mismatch, and has some register offsets wrong)
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 9c2f448bb3a9..e222dc113c4b 100644
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
+# define ARCH_REGS	struct user_regs_struct
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

