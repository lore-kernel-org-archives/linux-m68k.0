Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CCFC3DA7D
	for <linux-m68k@archiver.kernel.org>; Tue,  3 Jan 2023 07:38:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236928AbjACHiH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 3 Jan 2023 02:38:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236930AbjACHiG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 3 Jan 2023 02:38:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 977B95F71
        for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Jan 2023 23:38:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1A23D611DE;
        Tue,  3 Jan 2023 07:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5562EC433EF;
        Tue,  3 Jan 2023 07:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1672731483;
        bh=cBL2SUyqUcNz0S8YcGVB3rlZ6eY2y4w6qYz8jsriXE0=;
        h=Subject:To:Cc:From:Date:From;
        b=BL3Ng+8gv/uXSbQOZYSm86XQx5x5NHNpfw8kDq+iBHjvEEUIbheLXZK4daE28ZRA3
         gHo64Ral56PNOWj2P/dcsfX47kG/7+0auESfTYyTXSpBLCuJXHcXviz9x480pOo/LH
         GMPBe/7lqFoXr2eUjNvoR8xeA6wYyqsVCSYXLEK4=
Subject: Patch "m68k: add support for TIF_NOTIFY_SIGNAL" has been added to the 5.10-stable tree
To:     axboe@kernel.dk, geert@linux-m68k.org, gregkh@linuxfoundation.org,
        linux-m68k@lists.linux-m68k.org
Cc:     <stable-commits@vger.kernel.org>
From:   <gregkh@linuxfoundation.org>
Date:   Tue, 03 Jan 2023 08:36:28 +0100
Message-ID: <167273138844112@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    m68k: add support for TIF_NOTIFY_SIGNAL

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     m68k-add-support-for-tif_notify_signal.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From da81a523c0a6278891e020596edc7a32cb593922 Mon Sep 17 00:00:00 2001
From: Jens Axboe <axboe@kernel.dk>
Date: Fri, 9 Oct 2020 15:10:55 -0600
Subject: m68k: add support for TIF_NOTIFY_SIGNAL

From: Jens Axboe <axboe@kernel.dk>

[ Upstream commit e660653cd9f2df470d156c249631f68b9dee51ee ]

Wire up TIF_NOTIFY_SIGNAL handling for m68k.

Cc: linux-m68k@lists.linux-m68k.org
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/m68k/include/asm/thread_info.h |    1 +
 arch/m68k/kernel/signal.c           |    3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

--- a/arch/m68k/include/asm/thread_info.h
+++ b/arch/m68k/include/asm/thread_info.h
@@ -60,6 +60,7 @@ static inline struct thread_info *curren
  * bits 0-7 are tested at every exception exit
  * bits 8-15 are also tested at syscall exit
  */
+#define TIF_NOTIFY_SIGNAL	4
 #define TIF_NOTIFY_RESUME	5	/* callback before returning to user */
 #define TIF_SIGPENDING		6	/* signal pending */
 #define TIF_NEED_RESCHED	7	/* rescheduling necessary */
--- a/arch/m68k/kernel/signal.c
+++ b/arch/m68k/kernel/signal.c
@@ -1129,7 +1129,8 @@ static void do_signal(struct pt_regs *re
 
 void do_notify_resume(struct pt_regs *regs)
 {
-	if (test_thread_flag(TIF_SIGPENDING))
+	if (test_thread_flag(TIF_NOTIFY_SIGNAL) ||
+	    test_thread_flag(TIF_SIGPENDING))
 		do_signal(regs);
 
 	if (test_thread_flag(TIF_NOTIFY_RESUME))


Patches currently in stable-queue which might be from axboe@kernel.dk are

queue-5.10/x86-process-setup-io_threads-more-like-normal-user-space-threads.patch
queue-5.10/powerpc-add-support-for-tif_notify_signal.patch
queue-5.10/eventfd-provide-a-eventfd_signal_mask-helper.patch
queue-5.10/fs-provide-locked-helper-variant-of-close_fd_get_file.patch
queue-5.10/relay-fix-type-mismatch-when-allocating-memory-in-re.patch
queue-5.10/eventfd-change-int-to-__u64-in-eventfd_signal-ifndef.patch
queue-5.10/io_uring-pass-in-epoll_uring_wake-for-eventfd-signaling-and-wakeups.patch
queue-5.10/blk-mq-fix-possible-memleak-when-register-hctx-faile.patch
queue-5.10/fix-handling-of-nd-depth-on-lookup_cached-failures-in-try_to_unlazy.patch
queue-5.10/net-provide-__sys_shutdown_sock-that-takes-a-socket.patch
queue-5.10/task_work-unconditionally-run-task_work-from-get_signal.patch
queue-5.10/openrisc-add-support-for-tif_notify_signal.patch
queue-5.10/signal-add-task_sigpending-helper.patch
queue-5.10/net-remove-cmsg-restriction-from-io_uring-based-send-recvmsg-calls.patch
queue-5.10/alpha-add-support-for-tif_notify_signal.patch
queue-5.10/nios32-add-support-for-tif_notify_signal.patch
queue-5.10/ia64-don-t-call-handle_signal-unless-there-s-actually-a-signal-queued.patch
queue-5.10/task_work-remove-legacy-twa_signal-path.patch
queue-5.10/revert-proc-don-t-allow-async-path-resolution-of-proc-self-components.patch
queue-5.10/m68k-add-support-for-tif_notify_signal.patch
queue-5.10/s390-add-support-for-tif_notify_signal.patch
queue-5.10/um-add-support-for-tif_notify_signal.patch
queue-5.10/tools-headers-uapi-sync-openat2.h-with-the-kernel-sources.patch
queue-5.10/kernel-provide-create_io_thread-helper.patch
queue-5.10/iov_iter-add-helper-to-save-iov_iter-state.patch
queue-5.10/arc-unbork-5.11-bootup-fix-snafu-in-_tif_notify_signal-handling.patch
queue-5.10/arch-ensure-parisc-powerpc-handle-pf_io_worker-in-copy_thread.patch
queue-5.10/csky-add-support-for-tif_notify_signal.patch
queue-5.10/arm-add-support-for-tif_notify_signal.patch
queue-5.10/kernel-stop-masking-signals-in-create_io_thread.patch
queue-5.10/fs-expose-lookup_cached-through-openat2-resolve_cached.patch
queue-5.10/task_work-add-helper-for-more-targeted-task_work-canceling.patch
queue-5.10/nds32-add-support-for-tif_notify_signal.patch
queue-5.10/signal-kill-jobctl_task_work.patch
queue-5.10/hexagon-add-support-for-tif_notify_signal.patch
queue-5.10/sh-add-support-for-tif_notify_signal.patch
queue-5.10/riscv-add-support-for-tif_notify_signal.patch
queue-5.10/h8300-add-support-for-tif_notify_signal.patch
queue-5.10/io_uring-import-5.15-stable-io_uring.patch
queue-5.10/sparc-add-support-for-tif_notify_signal.patch
queue-5.10/blktrace-fix-output-non-blktrace-event-when-blk_clas.patch
queue-5.10/eventpoll-add-epoll_uring_wake-poll-wakeup-flag.patch
queue-5.10/parisc-add-support-for-tif_notify_signal.patch
queue-5.10/entry-add-support-for-tif_notify_signal.patch
queue-5.10/x86-wire-up-tif_notify_signal.patch
queue-5.10/task_work-use-tif_notify_signal-if-available.patch
queue-5.10/drbd-fix-an-invalid-memory-access-caused-by-incorrec.patch
queue-5.10/kernel-don-t-call-do_exit-for-pf_io_worker-threads.patch
queue-5.10/kernel-allow-fork-with-tif_notify_signal-pending.patch
queue-5.10/pata_ipx4xx_cf-fix-unsigned-comparison-with-less-tha.patch
queue-5.10/mips-add-support-for-tif_notify_signal.patch
queue-5.10/xtensa-add-support-for-tif_notify_signal.patch
queue-5.10/c6x-add-support-for-tif_notify_signal.patch
queue-5.10/microblaze-add-support-for-tif_notify_signal.patch
queue-5.10/net-add-accept-helper-not-installing-fd.patch
queue-5.10/ia64-add-support-for-tif_notify_signal.patch
queue-5.10/arm64-add-support-for-tif_notify_signal.patch
queue-5.10/arc-add-support-for-tif_notify_signal.patch
queue-5.10/revert-proc-don-t-allow-async-path-resolution-of-proc-thread-self-components.patch
queue-5.10/fs-make-do_renameat2-take-struct-filename.patch
queue-5.10/kernel-remove-checking-for-tif_notify_signal.patch
queue-5.10/arch-setup-pf_io_worker-threads-like-pf_kthread.patch
queue-5.10/nvme-pci-fix-mempool-alloc-size.patch
queue-5.10/fs-add-support-for-lookup_cached.patch
