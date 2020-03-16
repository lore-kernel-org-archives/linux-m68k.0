Return-Path: <SRS0=AzVV=5B=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80912C18E5B
	for <linux-m68k@archiver.kernel.org>; Mon, 16 Mar 2020 14:41:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 55D032051A
	for <linux-m68k@archiver.kernel.org>; Mon, 16 Mar 2020 14:41:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="KQUXQLXO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731755AbgCPOlA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Mar 2020 10:41:00 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42399 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731592AbgCPOlA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Mar 2020 10:41:00 -0400
Received: by mail-pf1-f196.google.com with SMTP id x2so9689352pfn.9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Mar 2020 07:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PD9vWH4pmGXRoWmrHB2KwNyUqP3FLoo/089yaMrT3N0=;
        b=KQUXQLXOQvMQyf4Ccx3GTVjn+r9/iijnHj1Xdo7shGj5aCA6s13n7BwTpU/sdgVlN3
         Pg0peZy3dD5xzz6CRbAUzAkmyLK2C9ToKV3HjEF/fpUVF9yhufAAeEuOBp9HJbIqgNVR
         8QcOTpVxa5GRkhkEzowTjimGMDoUxEgjbf6z+UO1Cu+bFk/ccbsd96zo1aOs3tiRPaAW
         mc0SjUhq4FzaTX18fbXRPKfFJtaeFgpKE3LbDiX3YrQwd/xrqDfhpZYFA8sGL4DObwZR
         bPx6EuGp7linLPKg4u6TFbBMk8ep0uQSj37MIitGG/fxgPL9C8ElU2wMHrawk17o0Rdd
         meBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PD9vWH4pmGXRoWmrHB2KwNyUqP3FLoo/089yaMrT3N0=;
        b=TYjcGIU03a6nD2ln8UzOnu9sHUqRSF0d07leKTMtWf6dtSo9dn158VpB+VDPEIU0QZ
         AlPXYeIV1M6G1M8s4/0/ATAitqAwi961m8z03tWeZNQXsjvytYY9G2drhOFPPr0vhbaY
         Y9b9iu5n+Rl3VzhYfkifcVQ8CSkKKK0B0brwoX83s4oiXxHaybIvz5cw/T+WkgAaXnbY
         cU+oV2UsX1ycZockBqL+lVEgZ7lGg37RPW1fJAC/G1bg40NTj7wHHlhfndi1n8CQg+LO
         aOZCnV1D21Q+YDm6RDm9xbcuWNy7T6rKQkJJzgReP8vuQzctVyLD7Ws8zhAAmX+/6VZJ
         +FFg==
X-Gm-Message-State: ANhLgQ2Y5kSfAU0OoUtEcNg185c/cj0CT2WOb5kGbqWnvieHRbtSsCDW
        LPc82GJSoSabWUDZoI4uYIh8lw==
X-Google-Smtp-Source: ADFU+vvYib/OOnoFWwvbz78WVlxQygqEel6SrERqeuVAiLWE+FarQ8FhQHfnbgpW6qVo2Ia6K93jYQ==
X-Received: by 2002:a63:8ec9:: with SMTP id k192mr152583pge.293.1584369659566;
        Mon, 16 Mar 2020 07:40:59 -0700 (PDT)
Received: from Mindolluin.aristanetworks.com ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id i2sm81524pjs.21.2020.03.16.07.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 07:40:58 -0700 (PDT)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCHv2 17/50] m68k: Add show_stack_loglvl()
Date:   Mon, 16 Mar 2020 14:38:43 +0000
Message-Id: <20200316143916.195608-18-dima@arista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316143916.195608-1-dima@arista.com>
References: <20200316143916.195608-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Currently, the log-level of show_stack() depends on a platform
realization. It creates situations where the headers are printed with
lower log level or higher than the stacktrace (depending on
a platform or user).

Furthermore, it forces the logic decision from user to an architecture
side. In result, some users as sysrq/kdb/etc are doing tricks with
temporary rising console_loglevel while printing their messages.
And in result it not only may print unwanted messages from other CPUs,
but also omit printing at all in the unlucky case where the printk()
was deferred.

Introducing log-level parameter and KERN_UNSUPPRESSED [1] seems
an easier approach than introducing more printk buffers.
Also, it will consolidate printings with headers.

Introduce show_stack_loglvl(), that eventually will substitute
show_stack().

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
[1]: https://lore.kernel.org/lkml/20190528002412.1625-1-dima@arista.com/T/#u
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/m68k/kernel/traps.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index 344f93d36a9a..ffcc5ec4fac3 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -811,13 +811,13 @@ asmlinkage void buserr_c(struct frame *fp)
 
 static int kstack_depth_to_print = 48;
 
-void show_trace(unsigned long *stack)
+static void show_trace(unsigned long *stack, const char *loglvl)
 {
 	unsigned long *endstack;
 	unsigned long addr;
 	int i;
 
-	pr_info("Call Trace:");
+	printk("%sCall Trace:", loglvl);
 	addr = (unsigned long)stack + THREAD_SIZE - 1;
 	endstack = (unsigned long *)(addr & -THREAD_SIZE);
 	i = 0;
@@ -935,7 +935,8 @@ void show_registers(struct pt_regs *regs)
 	pr_cont("\n");
 }
 
-void show_stack(struct task_struct *task, unsigned long *stack)
+void show_stack_loglvl(struct task_struct *task, unsigned long *stack,
+		       const char *loglvl)
 {
 	unsigned long *p;
 	unsigned long *endstack;
@@ -949,7 +950,7 @@ void show_stack(struct task_struct *task, unsigned long *stack)
 	}
 	endstack = (unsigned long *)(((unsigned long)stack + THREAD_SIZE - 1) & -THREAD_SIZE);
 
-	pr_info("Stack from %08lx:", (unsigned long)stack);
+	printk("%sStack from %08lx:", loglvl, (unsigned long)stack);
 	p = stack;
 	for (i = 0; i < kstack_depth_to_print; i++) {
 		if (p + 1 > endstack)
@@ -959,7 +960,12 @@ void show_stack(struct task_struct *task, unsigned long *stack)
 		pr_cont(" %08lx", *p++);
 	}
 	pr_cont("\n");
-	show_trace(stack);
+	show_trace(stack, loglvl);
+}
+
+void show_stack(struct task_struct *task, unsigned long *stack)
+{
+	show_stack_loglvl(task, stack, KERN_INFO);
 }
 
 /*
-- 
2.25.1

