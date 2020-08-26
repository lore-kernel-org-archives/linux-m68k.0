Return-Path: <SRS0=i6Xs=CE=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F347DC433E1
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Aug 2020 11:47:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC50620707
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Aug 2020 11:47:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728871AbgHZLrx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Aug 2020 07:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728857AbgHZLTd (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 26 Aug 2020 07:19:33 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF5AC061786
        for <linux-m68k@vger.kernel.org>; Wed, 26 Aug 2020 04:19:01 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id LBJo2300E4C55Sk06BJo7k; Wed, 26 Aug 2020 13:18:51 +0200
Received: from geert (helo=localhost)
        by ramsan with local-esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kAtS4-0006bS-9u; Wed, 26 Aug 2020 13:18:48 +0200
Date:   Wed, 26 Aug 2020 13:18:48 +0200 (CEST)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc:     Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org,
        schwab@linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH] m68k/kernel - wire up syscall_trace_enter/leave for
 m68k
In-Reply-To: <a02bfdb3-95d4-4375-e069-186a95be3921@physik.fu-berlin.de>
Message-ID: <alpine.DEB.2.21.2008261315050.25325@ramsan.of.borg>
References: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de> <1595823555-11103-1-git-send-email-schmitzmic@gmail.com> <13c91e87-7e26-1bc6-8ac0-68a790ee99cd@physik.fu-berlin.de> <5d98d276-c867-7f9b-f5b5-048e5e70ee3c@gmail.com>
 <a02bfdb3-95d4-4375-e069-186a95be3921@physik.fu-berlin.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

 	Hi Adrian,

On Mon, 27 Jul 2020, John Paul Adrian Glaubitz wrote:
> On 7/27/20 10:48 PM, Michael Schmitz wrote:
>> I can't test any of the later seccomp related stuff, so I'd rather leave that bit to someone else who can.
>
> I will work on the necessary changes for libseccomp this week, so that we can test
> whether the libseccomp live tests pass correctly on a patched kernel.

Any update on this?

With the below, you can run "make kselftest-all" (does not support O=!),
copy tools/testing/selftests/seccomp/seccomp_bpf and
tools/testing/selftests/seccomp/seccomp_benchmark to your m68k system,
and run the tests.  Of course they fail, as the actual seccomp support
hasn't been written yet...

From f5d325fadc43823f2a7ab2ff2e436da5ebb31565 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Aug 2020 11:52:26 +0200
Subject: [PATCH] [WIP] selftests/seccomp: Add m68k support

FIXME

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
  tools/testing/selftests/seccomp/seccomp_bpf.c | 11 +++++++++--
  1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 7a6d40286a421c63..21cfcd3fec9ddc61 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -135,6 +135,8 @@ struct seccomp_data {
  #  define __NR_seccomp 337
  # elif defined(__sh__)
  #  define __NR_seccomp 372
+# elif defined(__mc68000__)
+#  define __NR_seccomp 380
  # else
  #  warning "seccomp syscall number unknown for this architecture"
  #  define __NR_seccomp 0xffff
@@ -1725,6 +1727,10 @@ TEST_F(TRACE_poke, getpid_runs_normally)
  # define ARCH_REGS	struct pt_regs
  # define SYSCALL_NUM	gpr[3]
  # define SYSCALL_RET	gpr[0]
+#elif defined(__mc68000__)
+# define ARCH_REGS	struct pt_regs
+# define SYSCALL_NUM	orig_d0
+# define SYSCALL_RET	d0
  #else
  # error "Do not know how to find your architecture's registers and syscalls"
  #endif
@@ -1748,7 +1754,7 @@ TEST_F(TRACE_poke, getpid_runs_normally)
  /* Use PTRACE_GETREGS and PTRACE_SETREGS when available. This is useful for
   * architectures without HAVE_ARCH_TRACEHOOK (e.g. User-mode Linux).
   */
-#if defined(__x86_64__) || defined(__i386__) || defined(__mips__)
+#if defined(__x86_64__) || defined(__i386__) || defined(__mips__) || defined(__mc68000)
  #define HAVE_GETREGS
  #endif

@@ -1797,7 +1803,8 @@ void change_syscall(struct __test_metadata *_metadata,

  #if defined(__x86_64__) || defined(__i386__) || defined(__powerpc__) || \
  	defined(__s390__) || defined(__hppa__) || defined(__riscv) || \
-	defined(__xtensa__) || defined(__csky__) || defined(__sh__)
+	defined(__xtensa__) || defined(__csky__) || defined(__sh__) || \
+	defined(__mc68000)
  	{
  		regs.SYSCALL_NUM = syscall;
  	}
-- 
2.17.1

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
