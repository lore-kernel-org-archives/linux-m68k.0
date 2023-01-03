Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3446FC3DA7D
	for <linux-m68k@archiver.kernel.org>; Tue,  3 Jan 2023 08:16:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237078AbjACIQn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 3 Jan 2023 03:16:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237050AbjACIQZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 3 Jan 2023 03:16:25 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1663DF80
        for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Jan 2023 00:16:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 697D4B80E49;
        Tue,  3 Jan 2023 08:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C394DC433D2;
        Tue,  3 Jan 2023 08:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1672733782;
        bh=39BQoTJnxJQxgSTgyciiwrfcOzq7T/IxXK98SKqCj2E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tFKFHiom/V17pPVjwwX75a9b3PIKfa9U02qfu70yFvJWckOTgtIOAbAWWa6ogLa9c
         2rmwVeGkrvEWqAQe2Z2abpJZRnmji1HuVyjrPvEM48EA3urtjsUe5y95L44X1B04cd
         nIhAGLOrD6uGNxT68cNJ3p2ey5EkgMw2GtIdjw+E=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     stable@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patches@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 5.10 20/63] m68k: add support for TIF_NOTIFY_SIGNAL
Date:   Tue,  3 Jan 2023 09:13:50 +0100
Message-Id: <20230103081309.775973572@linuxfoundation.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103081308.548338576@linuxfoundation.org>
References: <20230103081308.548338576@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

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


