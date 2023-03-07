Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D996C64EC4
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Mar 2023 02:57:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjCGC5d (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Mar 2023 21:57:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjCGC5c (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 6 Mar 2023 21:57:32 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE4839CFC
        for <linux-m68k@vger.kernel.org>; Mon,  6 Mar 2023 18:57:30 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id u3-20020a17090a450300b00239db6d7d47so10617933pjg.4
        for <linux-m68k@vger.kernel.org>; Mon, 06 Mar 2023 18:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678157850;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:cc
         :references:to:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=RilRltPu4gDhBeji3WtiqsAVNnG4hj/rMwzYxbmNRxs=;
        b=G/NjQ6o9kB3bnQe4zTx8CZYYwr9ajANIM8qP76vrwi2USS0F0OKpjkuXszXrCWhR2k
         O5F+LlLcuVDLltfaDp+wqqIynLGdrKTioKj/w/GbjWn0RYIiqtgCQByGHgmXQbfob8XC
         eTMsZdifGA7JczWiM2i9uAhpLKbHvsjfR2DD+IIR3QTzfxA5RcMRgmygPTqYbGho9uYg
         nnHM/tggXomr8DY3MHliCqASfqvVzR7DuyHs+I21GNPc8mv0cAzZ7SKChetcpABqUFaN
         YjKn94cgz8yaNIUdqjngzoEeQnBxl3UpFfMqVa3QtDE7uhrYe8jNBklqk0CXZHL0GjMX
         mWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678157850;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:cc
         :references:to:subject:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RilRltPu4gDhBeji3WtiqsAVNnG4hj/rMwzYxbmNRxs=;
        b=THB4X16/88WJufXspEBz5Ylz4Yg843Aqy4CJalsETJBq2J4keFQzbWajysgLGYLZ7O
         E+m60sMQ/xZyNq10U1fiyeFmlh7KodaVzvOYZByIhj5a+6K2biWDIUR8rUJLuO8tI4g6
         eK852KAyVvKqk3SBqRb8/VimesYlz8KepsPhwmdNrVG2cdImpT14HCg//SeIWRfTv+Cn
         8mKhJhz7Bo6u4ZvcxNMmBaVniSLo8LhvodV9zcS2rbS7/NIhx4JkQxTkdoM89mv1zjrT
         B5ttDPbRfmGqWfasc1w8G9mlMkhXB1iiLnL73t6R4FmMzBoxLoxTkt/xMtspHhWppeGK
         yoqA==
X-Gm-Message-State: AO0yUKUxCJ8G5u8YWbLd4Q8h+A1/WJ6mj8gAWk8x12N/nNlPqnQHCYAm
        HfTZpCqcQUMxn1BuqM/9jIfnnMxjHe5RqQ==
X-Google-Smtp-Source: AK7set8QfAw6+U2faCcx9J4OSxYn3j8eXm5IGdIEd62Qyzyk0i7V3/0Z93hIraJpO9hx2WMD/rZNAg==
X-Received: by 2002:a05:6a20:160c:b0:cd:1cce:d892 with SMTP id l12-20020a056a20160c00b000cd1cced892mr15379468pzj.9.1678157849745;
        Mon, 06 Mar 2023 18:57:29 -0800 (PST)
Received: from [10.1.1.24] (222-152-221-232-adsl.sparkbb.co.nz. [222.152.221.232])
        by smtp.gmail.com with ESMTPSA id e12-20020a62aa0c000000b005e032bb1c34sm6930229pff.24.2023.03.06.18.57.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Mar 2023 18:57:29 -0800 (PST)
Subject: Re: [PATCH v13 0/3] Add kernel seccomp support for m68k
To:     Kees Cook <keescook@chromium.org>
References: <20230112035529.13521-1-schmitzmic@gmail.com>
 <63fd164e.a70a0220.96864.89bb@mx.google.com>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        glaubitz@physik.fu-berlin.de,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <09cc4bce-668f-f932-79f5-6bd2869a9335@gmail.com>
Date:   Tue, 7 Mar 2023 15:57:22 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <63fd164e.a70a0220.96864.89bb@mx.google.com>
Content-Type: multipart/mixed;
 boundary="------------38867849264380413E02C2E1"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

This is a multi-part message in MIME format.
--------------38867849264380413E02C2E1
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kees,

Am 28.02.2023 um 09:45 schrieb Kees Cook:
> On Thu, Jan 12, 2023 at 04:55:26PM +1300, Michael Schmitz wrote:
>> Previous version of patch 1 did overwrite a syscall return
>> value that was changed by ptrace or seccomp (in regs->d0)
>> by -ENOSYS when skipping a syscall. Branch directly to
>> ret_from_syscall instead of falling through to badsys (which
>> must set -ENOSYS). I'm sure this can be done more elegantly.
>>
>> Patch 3 used the wrong struct definition for ARCH_REGS - the
>> kernel ptrace code copies 19 registers (from syscall stack
>> and switch_stack, pt_regs only contains the 14 from the
>> syscall stack). Stack overflow ensues.
>
> Hi,
>
> Thanks for expanding seccomp support to m68k! I happened to see this
> land in Linus's tree, but it was news to me that it was under
> development. Please use scripts/get_maintainers.pl in the future:

This has been slowly progressed over the past three years, following a 
nudge from Adrian. Most everything was contained in arch/m68k, and I 
don't need get_maintainers.pl to find out Geert's address :-) The 
selftest patches were an afterthought, should have kept you in the loop 
there.

>
> SECURE COMPUTING
> M:      Kees Cook <keescook@chromium.org>
> R:      Andy Lutomirski <luto@amacapital.net>
> R:      Will Drewry <wad@chromium.org>
> S:      Supported
> T:      git git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/seccomp
> F:      Documentation/userspace-api/seccomp_filter.rst
> F:      include/linux/seccomp.h
> F:      include/uapi/linux/seccomp.h
> F:      kernel/seccomp.c
> F:      tools/testing/selftests/kselftest_harness.h
> F:      tools/testing/selftests/seccomp/*
> K:      \bsecure_computing
> K:      \bTIF_SECCOMP\b
>
>> With these changes, 79 of 94 seccomp_bpf tests now succeed.
>
> I'm curious which tests are not passing?

See attached log - it's actually 81 tests passing in the merged version. 
The test system isn't up to date with libraries and stuff in any real 
sense, and I had to disable a few of the tests. Either may well explain 
a few of the failing tests.

Any hints on how to address the remaining failures welcome, of course.

Adrian did report all libseccomp tests passed (see 
https://github.com/seccomp/libseccomp/pull/397), and he may have run the 
kernel selftests on a current system.

Cheers,

	Michael


>
> Thanks!
>
> -Kees
>

--------------38867849264380413E02C2E1
Content-Type: text/plain; charset=UTF-8;
 name="seccomp-6.2rc3-v12-saverc.out"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="seccomp-6.2rc3-v12-saverc.out"

TAP version 13
1..94
# Starting 94 tests from 8 test cases.
#  RUN           TRAP.dfl ...
#            OK  TRAP.dfl
ok 1 TRAP.dfl
#  RUN           TRAP.ign ...
#            OK  TRAP.ign
ok 2 TRAP.ign
#  RUN           TRAP.handler ...
#            OK  TRAP.handler
ok 3 TRAP.handler
#  RUN           precedence.allow_ok ...
#            OK  precedence.allow_ok
ok 4 precedence.allow_ok
#  RUN           precedence.kill_is_highest ...
#            OK  precedence.kill_is_highest
ok 5 precedence.kill_is_highest
#  RUN           precedence.kill_is_highest_in_any_order ...
#            OK  precedence.kill_is_highest_in_any_order
ok 6 precedence.kill_is_highest_in_any_order
#  RUN           precedence.trap_is_second ...
#            OK  precedence.trap_is_second
ok 7 precedence.trap_is_second
#  RUN           precedence.trap_is_second_in_any_order ...
#            OK  precedence.trap_is_second_in_any_order
ok 8 precedence.trap_is_second_in_any_order
#  RUN           precedence.errno_is_third ...
#            OK  precedence.errno_is_third
ok 9 precedence.errno_is_third
#  RUN           precedence.errno_is_third_in_any_order ...
#            OK  precedence.errno_is_third_in_any_order
ok 10 precedence.errno_is_third_in_any_order
#  RUN           precedence.trace_is_fourth ...
#            OK  precedence.trace_is_fourth
ok 11 precedence.trace_is_fourth
#  RUN           precedence.trace_is_fourth_in_any_order ...
#            OK  precedence.trace_is_fourth_in_any_order
ok 12 precedence.trace_is_fourth_in_any_order
#  RUN           precedence.log_is_fifth ...
#            OK  precedence.log_is_fifth
ok 13 precedence.log_is_fifth
#  RUN           precedence.log_is_fifth_in_any_order ...
#            OK  precedence.log_is_fifth_in_any_order
ok 14 precedence.log_is_fifth_in_any_order
#  RUN           TRACE_poke.read_has_side_effects ...
#            OK  TRACE_poke.read_has_side_effects
ok 15 TRACE_poke.read_has_side_effects
#  RUN           TRACE_poke.getpid_runs_normally ...
#            OK  TRACE_poke.getpid_runs_normally
ok 16 TRACE_poke.getpid_runs_normally
#  RUN           TRACE_syscall.ptrace.negative_ENOSYS ...
#            OK  TRACE_syscall.ptrace.negative_ENOSYS
ok 17 TRACE_syscall.ptrace.negative_ENOSYS
#  RUN           TRACE_syscall.ptrace.syscall_allowed ...
#            OK  TRACE_syscall.ptrace.syscall_allowed
ok 18 TRACE_syscall.ptrace.syscall_allowed
#  RUN           TRACE_syscall.ptrace.syscall_redirected ...
#            OK  TRACE_syscall.ptrace.syscall_redirected
ok 19 TRACE_syscall.ptrace.syscall_redirected
#  RUN           TRACE_syscall.ptrace.syscall_errno ...
#            OK  TRACE_syscall.ptrace.syscall_errno
ok 20 TRACE_syscall.ptrace.syscall_errno
#  RUN           TRACE_syscall.ptrace.syscall_faked ...
#            OK  TRACE_syscall.ptrace.syscall_faked
ok 21 TRACE_syscall.ptrace.syscall_faked
#  RUN           TRACE_syscall.ptrace.kill_immediate ...
#            OK  TRACE_syscall.ptrace.kill_immediate
ok 22 TRACE_syscall.ptrace.kill_immediate
#  RUN           TRACE_syscall.ptrace.skip_after ...
#            OK  TRACE_syscall.ptrace.skip_after
ok 23 TRACE_syscall.ptrace.skip_after
#  RUN           TRACE_syscall.ptrace.kill_after ...
#            OK  TRACE_syscall.ptrace.kill_after
ok 24 TRACE_syscall.ptrace.kill_after
#  RUN           TRACE_syscall.seccomp.negative_ENOSYS ...
#            OK  TRACE_syscall.seccomp.negative_ENOSYS
ok 25 TRACE_syscall.seccomp.negative_ENOSYS
#  RUN           TRACE_syscall.seccomp.syscall_allowed ...
#            OK  TRACE_syscall.seccomp.syscall_allowed
ok 26 TRACE_syscall.seccomp.syscall_allowed
#  RUN           TRACE_syscall.seccomp.syscall_redirected ...
#            OK  TRACE_syscall.seccomp.syscall_redirected
ok 27 TRACE_syscall.seccomp.syscall_redirected
#  RUN           TRACE_syscall.seccomp.syscall_errno ...
#            OK  TRACE_syscall.seccomp.syscall_errno
ok 28 TRACE_syscall.seccomp.syscall_errno
#  RUN           TRACE_syscall.seccomp.syscall_faked ...
#            OK  TRACE_syscall.seccomp.syscall_faked
ok 29 TRACE_syscall.seccomp.syscall_faked
#  RUN           TRACE_syscall.seccomp.kill_immediate ...
#            OK  TRACE_syscall.seccomp.kill_immediate
ok 30 TRACE_syscall.seccomp.kill_immediate
#  RUN           TRACE_syscall.seccomp.skip_after ...
#            OK  TRACE_syscall.seccomp.skip_after
ok 31 TRACE_syscall.seccomp.skip_after
#  RUN           TRACE_syscall.seccomp.kill_after ...
#            OK  TRACE_syscall.seccomp.kill_after
ok 32 TRACE_syscall.seccomp.kill_after
#  RUN           TSYNC.siblings_fail_prctl ...
#            OK  TSYNC.siblings_fail_prctl
ok 33 TSYNC.siblings_fail_prctl
#  RUN           TSYNC.two_siblings_with_ancestor ...
# seccomp_bpf.c:2710:two_siblings_with_ancestor:Expected 0x0 (0) == (long)status (195935983)
# seccomp_bpf.c:2712:two_siblings_with_ancestor:Expected 0x0 (0) == (long)status (195935983)
# two_siblings_with_ancestor: Test failed at step #8
#          FAIL  TSYNC.two_siblings_with_ancestor
not ok 34 TSYNC.two_siblings_with_ancestor
#  RUN           TSYNC.two_sibling_want_nnp ...
#            OK  TSYNC.two_sibling_want_nnp
ok 35 TSYNC.two_sibling_want_nnp
#  RUN           TSYNC.two_siblings_with_no_filter ...
# seccomp_bpf.c:2776:two_siblings_with_no_filter:Expected 0x0 (0) == (long)status (195952365)
# seccomp_bpf.c:2778:two_siblings_with_no_filter:Expected 0x0 (0) == (long)status (195952365)
# two_siblings_with_no_filter: Test failed at step #7
#          FAIL  TSYNC.two_siblings_with_no_filter
not ok 36 TSYNC.two_siblings_with_no_filter
#  RUN           TSYNC.two_siblings_with_one_divergence ...
# seccomp_bpf.c:2808:two_siblings_with_one_divergence:Expected self->sibling[0].system_tid (2733) == ret (0)
# seccomp_bpf.c:2809:two_siblings_with_one_divergence:Did not fail on diverged sibling.
# two_siblings_with_one_divergence: Test terminated unexpectedly by signal 9
#          FAIL  TSYNC.two_siblings_with_one_divergence
not ok 37 TSYNC.two_siblings_with_one_divergence
#  RUN           TSYNC.two_siblings_with_one_divergence_no_tid_in_err ...
# seccomp_bpf.c:2854:two_siblings_with_one_divergence_no_tid_in_err:Expected ESRCH (3) == errno (0)
# seccomp_bpf.c:2855:two_siblings_with_one_divergence_no_tid_in_err:Did not return ESRCH for diverged sibling.
# two_siblings_with_one_divergence_no_tid_in_err: Test terminated unexpectedly by signal 9
#          FAIL  TSYNC.two_siblings_with_one_divergence_no_tid_in_err
not ok 38 TSYNC.two_siblings_with_one_divergence_no_tid_in_err
#  RUN           TSYNC.two_siblings_not_under_filter ...
# seccomp_bpf.c:2910:two_siblings_not_under_filter:Expected ret (0) == self->sibling[0].system_tid (2743)
# seccomp_bpf.c:2911:two_siblings_not_under_filter:Did not fail on diverged sibling.
# two_siblings_not_under_filter: Test terminated unexpectedly by signal 9
#          FAIL  TSYNC.two_siblings_not_under_filter
not ok 39 TSYNC.two_siblings_not_under_filter
#  RUN           O_SUSPEND_SECCOMP.setoptions ...
#      SKIP      Kernel does not support PTRACE_O_SUSPEND_SECCOMP (missing CONFIG_CHECKPOINT_RESTORE?)
#            OK  O_SUSPEND_SECCOMP.setoptions
ok 40 # SKIP Kernel does not support PTRACE_O_SUSPEND_SECCOMP (missing CONFIG_CHECKPOINT_RESTORE?)
#  RUN           O_SUSPEND_SECCOMP.seize ...
#      SKIP      Kernel does not support PTRACE_O_SUSPEND_SECCOMP (missing CONFIG_CHECKPOINT_RESTORE?)
#            OK  O_SUSPEND_SECCOMP.seize
ok 41 # SKIP Kernel does not support PTRACE_O_SUSPEND_SECCOMP (missing CONFIG_CHECKPOINT_RESTORE?)
#  RUN           global.kcmp ...
# seccomp_bpf.c:329:kcmp:Expected ret (-1) == 0 (0)
#      SKIP      Kernel does not support kcmp() (missing CONFIG_KCMP?)
#            OK  global.kcmp
ok 42 # SKIP Kernel does not support kcmp() (missing CONFIG_KCMP?)
#  RUN           global.mode_strict_support ...
#            OK  global.mode_strict_support
ok 43 global.mode_strict_support
#  RUN           global.mode_strict_cannot_call_prctl ...
#            OK  global.mode_strict_cannot_call_prctl
ok 44 global.mode_strict_cannot_call_prctl
#  RUN           global.no_new_privs_support ...
#            OK  global.no_new_privs_support
ok 45 global.no_new_privs_support
#  RUN           global.mode_filter_support ...
#            OK  global.mode_filter_support
ok 46 global.mode_filter_support
#  RUN           global.filter_size_limits ...
#            OK  global.filter_size_limits
ok 47 global.filter_size_limits
#  RUN           global.filter_chain_limits ...
#            OK  global.filter_chain_limits
ok 48 global.filter_chain_limits
#  RUN           global.mode_filter_cannot_move_to_strict ...
#            OK  global.mode_filter_cannot_move_to_strict
ok 49 global.mode_filter_cannot_move_to_strict
#  RUN           global.mode_filter_get_seccomp ...
#            OK  global.mode_filter_get_seccomp
ok 50 global.mode_filter_get_seccomp
#  RUN           global.ALLOW_all ...
#            OK  global.ALLOW_all
ok 51 global.ALLOW_all
#  RUN           global.empty_prog ...
#            OK  global.empty_prog
ok 52 global.empty_prog
#  RUN           global.log_all ...
#            OK  global.log_all
ok 53 global.log_all
#  RUN           global.unknown_ret_is_kill_inside ...
#            OK  global.unknown_ret_is_kill_inside
ok 54 global.unknown_ret_is_kill_inside
#  RUN           global.unknown_ret_is_kill_above_allow ...
#            OK  global.unknown_ret_is_kill_above_allow
ok 55 global.unknown_ret_is_kill_above_allow
#  RUN           global.KILL_all ...
#            OK  global.KILL_all
ok 56 global.KILL_all
#  RUN           global.KILL_one ...
#            OK  global.KILL_one
ok 57 global.KILL_one
#  RUN           global.KILL_one_arg_one ...
# seccomp_bpf.c:693:KILL_one_arg_one:Expected 0 (0) == syscall(__NR_times, &fatal_address) (43917)
# KILL_one_arg_one: Test exited normally instead of by signal (code: 3)
#          FAIL  global.KILL_one_arg_one
not ok 58 global.KILL_one_arg_one
#  RUN           global.KILL_one_arg_six ...
# seccomp_bpf.c:738:KILL_one_arg_six:Expected MAP_FAILED (4294967295) != map1 (4294967295)
# KILL_one_arg_six: Test exited normally instead of by signal (code: 5)
#          FAIL  global.KILL_one_arg_six
not ok 59 global.KILL_one_arg_six
#  RUN           global.KILL_thread ...
# seccomp_bpf.c:848:KILL_thread:Expected 0 (0) != WIFEXITED(status) (0)
# KILL_thread: Test terminated by assertion
#          FAIL  global.KILL_thread
not ok 60 global.KILL_thread
#  RUN           global.KILL_process ...
#            OK  global.KILL_process
ok 61 global.KILL_process
#  RUN           global.KILL_unknown ...
#            OK  global.KILL_unknown
ok 62 global.KILL_unknown
#  RUN           global.arg_out_of_range ...
#            OK  global.arg_out_of_range
ok 63 global.arg_out_of_range
#  RUN           global.ERRNO_valid ...
#            OK  global.ERRNO_valid
ok 64 global.ERRNO_valid
#  RUN           global.ERRNO_zero ...
#            OK  global.ERRNO_zero
ok 65 global.ERRNO_zero
#  RUN           global.ERRNO_capped ...
#            OK  global.ERRNO_capped
ok 66 global.ERRNO_capped
#  RUN           global.ERRNO_order ...
#            OK  global.ERRNO_order
ok 67 global.ERRNO_order
#  RUN           global.negative_ENOSYS ...
#            OK  global.negative_ENOSYS
ok 68 global.negative_ENOSYS
#  RUN           global.seccomp_syscall ...
#            OK  global.seccomp_syscall
ok 69 global.seccomp_syscall
#  RUN           global.seccomp_syscall_mode_lock ...
#            OK  global.seccomp_syscall_mode_lock
ok 70 global.seccomp_syscall_mode_lock
#  RUN           global.detect_seccomp_filter_flags ...
#            OK  global.detect_seccomp_filter_flags
ok 71 global.detect_seccomp_filter_flags
#  RUN           global.TSYNC_first ...
#            OK  global.TSYNC_first
ok 72 global.TSYNC_first
#  RUN           global.syscall_restart ...
#            OK  global.syscall_restart
ok 73 global.syscall_restart
#  RUN           global.filter_flag_log ...
#            OK  global.filter_flag_log
ok 74 global.filter_flag_log
#  RUN           global.get_action_avail ...
#            OK  global.get_action_avail
ok 75 global.get_action_avail
#  RUN           global.get_metadata ...
# seccomp_bpf.c:3285:get_metadata:Expected sizeof(md) (16) == ret (-1)
#      SKIP      Kernel does not support PTRACE_SECCOMP_GET_METADATA (missing CONFIG_CHECKPOINT_RESTORE?)
#            OK  global.get_metadata
ok 76 # SKIP Kernel does not support PTRACE_SECCOMP_GET_METADATA (missing CONFIG_CHECKPOINT_RESTORE?)
#  RUN           global.user_notification_basic ...
#            OK  global.user_notification_basic
ok 77 global.user_notification_basic
#  RUN           global.user_notification_with_tsync ...
#            OK  global.user_notification_with_tsync
ok 78 global.user_notification_with_tsync
#  RUN           global.user_notification_kill_in_middle ...
#            OK  global.user_notification_kill_in_middle
ok 79 global.user_notification_kill_in_middle
#  RUN           global.user_notification_signal ...
#            OK  global.user_notification_signal
ok 80 global.user_notification_signal
#  RUN           global.user_notification_closed_listener ...
#            OK  global.user_notification_closed_listener
ok 81 global.user_notification_closed_listener
#  RUN           global.user_notification_child_pid_ns ...
# seccomp_bpf.c:3620:user_notification_child_pid_ns:Expected unshare(CLONE_NEWUSER | CLONE_NEWPID) (-1) == 0 (0)
#      SKIP      kernel missing CLONE_NEWUSER support
#            OK  global.user_notification_child_pid_ns
ok 82 # SKIP kernel missing CLONE_NEWUSER support
#  RUN           global.user_notification_sibling_pid_ns ...
# seccomp_bpf.c:3688:user_notification_sibling_pid_ns:Expected unshare(CLONE_NEWPID) (-1) == 0 (0)
# user_notification_sibling_pid_ns: Test terminated by assertion
# seccomp_bpf.c:3673:user_notification_sibling_pid_ns:Expected unshare(CLONE_NEWPID) (-1) == 0 (0)
#          FAIL  global.user_notification_sibling_pid_ns
not ok 83 global.user_notification_sibling_pid_ns
#  RUN           global.user_notification_fault_recv ...
# seccomp_bpf.c:3731:user_notification_fault_recv:Expected unshare(CLONE_NEWUSER) (-1) == 0 (0)
#      SKIP      kernel missing CLONE_NEWUSER support
#            OK  global.user_notification_fault_recv
ok 84 # SKIP kernel missing CLONE_NEWUSER support
#  RUN           global.seccomp_get_notif_sizes ...
#            OK  global.seccomp_get_notif_sizes
ok 85 global.seccomp_get_notif_sizes
#  RUN           global.user_notification_continue ...
# seccomp_bpf.c:3805:user_notification_continue:kcmp() syscall missing (test is less accurate)
#            OK  global.user_notification_continue
ok 86 global.user_notification_continue
#  RUN           global.user_notification_filter_empty ...
#            OK  global.user_notification_filter_empty
ok 87 global.user_notification_filter_empty
#  RUN           global.user_notification_filter_empty_threaded ...
# user_notification_filter_empty_threaded: Test terminated by timeout
#          FAIL  global.user_notification_filter_empty_threaded
not ok 88 global.user_notification_filter_empty_threaded
#  RUN           global.user_notification_addfd ...
# seccomp_bpf.c:4020:user_notification_addfd:Expected listener (3) == nextfd++ (1)
# user_notification_addfd: Test terminated by assertion
#          FAIL  global.user_notification_addfd
not ok 89 global.user_notification_addfd
#  RUN           global.user_notification_addfd_rlimit ...
# seccomp_bpf.c:4195:user_notification_addfd_rlimit:Expected ioctl(listener, SECCOMP_IOCTL_NOTIF_ADDFD, &addfd) (4) == -1 (-1)
# seccomp_bpf.c:4196:user_notification_addfd_rlimit:Expected errno (0) == EMFILE (24)
# seccomp_bpf.c:4199:user_notification_addfd_rlimit:Expected ioctl(listener, SECCOMP_IOCTL_NOTIF_ADDFD, &addfd) (5) == -1 (-1)
# seccomp_bpf.c:4200:user_notification_addfd_rlimit:Expected errno (0) == EMFILE (24)
# seccomp_bpf.c:4205:user_notification_addfd_rlimit:Expected errno (2) == EBADF (9)
# seccomp_bpf.c:4211:user_notification_addfd_rlimit:Expected ioctl(listener, SECCOMP_IOCTL_NOTIF_SEND, &resp) (-1) == 0 (0)
# seccomp_bpf.c:4216:user_notification_addfd_rlimit:Expected 0 (0) == WEXITSTATUS(status) (1)
# user_notification_addfd_rlimit: Test failed at step #6
#          FAIL  global.user_notification_addfd_rlimit
not ok 90 global.user_notification_addfd_rlimit
#  RUN           global.user_notification_fifo ...
#            OK  global.user_notification_fifo
ok 91 global.user_notification_fifo
#  RUN           global.user_notification_wait_killable_pre_notification ...
# seccomp_bpf.c:4290:user_notification_wait_killable_pre_notification:Expected f (0) != NULL (0)
# seccomp_bpf.c:4291:user_notification_wait_killable_pre_notification:Could not open /proc/2902/syscall: No such file or directory
# user_notification_wait_killable_pre_notification: Test terminated by assertion
#          FAIL  global.user_notification_wait_killable_pre_notification
not ok 92 global.user_notification_wait_killable_pre_notification
#  RUN           global.user_notification_wait_killable ...
#            OK  global.user_notification_wait_killable
ok 93 global.user_notification_wait_killable
#  RUN           global.user_notification_wait_killable_fatal ...
#            OK  global.user_notification_wait_killable_fatal
ok 94 global.user_notification_wait_killable_fatal
# FAILED: 81 / 94 tests passed.
# Totals: pass:75 fail:13 xfail:0 xpass:0 skip:6 error:0

--------------38867849264380413E02C2E1--
