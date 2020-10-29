Return-Path: <SRS0=djhu=EE=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027AAC4363A
	for <linux-m68k@archiver.kernel.org>; Thu, 29 Oct 2020 16:15:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9537420756
	for <linux-m68k@archiver.kernel.org>; Thu, 29 Oct 2020 16:15:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="AGYiuWoC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgJ2QPn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 29 Oct 2020 12:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgJ2QPn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 29 Oct 2020 12:15:43 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95659C0613CF
        for <linux-m68k@lists.linux-m68k.org>; Thu, 29 Oct 2020 09:15:41 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id p15so4141912ioh.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 29 Oct 2020 09:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=YRrVtO19eSOVwESOouw0GvEksrz/O8PtyducrZY846g=;
        b=AGYiuWoCDbvaXC0lCEGQjKQQR9JF/XxV3lRycX5DFyu6Gdqjrv1f1fBNU7fJfEWb4i
         vrqak6VtNygnKpa77oFvLNLajlFSYQZK48ht2yJm7eBlOczDwv/aVG9PDazO9Ah7ylaV
         joHEMWFKO/gOYr7ldbdWzoKz3LbsTk0DMS9uS0Fo2V2CeH/Atv1lxR3/nMV6j1Ovw/uJ
         PJvYD6VyAsJPsD/u/IJtjwOsp0jnGsm+ltT+PNd7e8n92yTXtGWiILa1S6RWLlDLjqj6
         +kWYpOxJG3a0/a7p5UEqoHj5OuZ7BpwXe8Ywlnq8/CR7/HHJc9F4O8XcJ1ZWglMxwK0W
         ti2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=YRrVtO19eSOVwESOouw0GvEksrz/O8PtyducrZY846g=;
        b=RdxMSAhKWGR8pd3pbcns5RKmvMWdvBL2mW9KebKBnrz8igYpqtg7IVowDJZ4p4SdIM
         S/v7qM5Ie10V34L71rS99LII3dArO4BBx7SVL4u/xiqgfofc9ULDUOwBHNpmXYLR3HEk
         aYFO5mMYUkAPip2sz/myEuEyuef2Iq65NdXjD3mIJRcABGyeC26/3i2dNmIDB6kO4Pam
         EfRW+nJ341fuIyotMhr7u29tdZ9bJTA4q6BckGz/Sh+ajgy8TqQezXkta/AdleR5dA8E
         8S5L9zClgu1xKOIe8h7MFY9/HproULk9hYKtMJBeN6eXKHdIqFMu2+ExZgARUUNAk8+j
         hTJg==
X-Gm-Message-State: AOAM532BSij8kFeDWB1vFHTygw4F2iExrMeGF323PI5q+Ho37vo5Giyv
        O/yjhOPPr0lODtqxjD39CWmjbgnc6PTLFw==
X-Google-Smtp-Source: ABdhPJySvcJfDtryCK/6LjPPqFZB2BtjpMBAL6WqSTpsnjyC67xcyPU5VKw67936NYTBYI5yVWvViw==
X-Received: by 2002:a02:c80a:: with SMTP id p10mr4053208jao.114.1603988140468;
        Thu, 29 Oct 2020 09:15:40 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id j5sm2342416ioa.28.2020.10.29.09.15.39
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 09:15:40 -0700 (PDT)
To:     linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] m68k: add support for TIF_NOTIFY_SIGNAL
Message-ID: <63245c79-6fa4-49f6-d468-becf9a805ca8@kernel.dk>
Date:   Thu, 29 Oct 2020 10:15:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Wire up TIF_NOTIFY_SIGNAL handling for m68k.

Cc: linux-m68k@lists.linux-m68k.org
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---

5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
for details:

https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/

As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
as that will enable a set of cleanups once all of them support it. I'm
happy carrying this patch if need be, or it can be funelled through the
arch tree. Let me know.

 arch/m68k/include/asm/thread_info.h | 1 +
 arch/m68k/kernel/signal.c           | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/thread_info.h b/arch/m68k/include/asm/thread_info.h
index 3689c6718c88..15a757073fa5 100644
--- a/arch/m68k/include/asm/thread_info.h
+++ b/arch/m68k/include/asm/thread_info.h
@@ -60,6 +60,7 @@ static inline struct thread_info *current_thread_info(void)
  * bits 0-7 are tested at every exception exit
  * bits 8-15 are also tested at syscall exit
  */
+#define TIF_NOTIFY_SIGNAL	4
 #define TIF_NOTIFY_RESUME	5	/* callback before returning to user */
 #define TIF_SIGPENDING		6	/* signal pending */
 #define TIF_NEED_RESCHED	7	/* rescheduling necessary */
diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
index 46f91e0f6a08..349570f16a78 100644
--- a/arch/m68k/kernel/signal.c
+++ b/arch/m68k/kernel/signal.c
@@ -1133,7 +1133,8 @@ static void do_signal(struct pt_regs *regs)
 
 void do_notify_resume(struct pt_regs *regs)
 {
-	if (test_thread_flag(TIF_SIGPENDING))
+	if (test_thread_flag(TIF_NOTIFY_SIGNAL) ||
+	    test_thread_flag(TIF_SIGPENDING))
 		do_signal(regs);
 
 	if (test_thread_flag(TIF_NOTIFY_RESUME))
-- 
2.29.0

-- 
Jens Axboe

