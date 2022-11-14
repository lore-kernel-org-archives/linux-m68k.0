Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051D1C4332F
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Nov 2022 16:30:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237679AbiKNQaj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Nov 2022 11:30:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237621AbiKNQaX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Nov 2022 11:30:23 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BBF7233B7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Nov 2022 08:29:45 -0800 (PST)
From:   John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1668443383;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WuCvNpqsWpwV49S5/EiT2Eu/MmVMQdF6U0k8ms+rMbY=;
        b=Zq0ro6+RhBlIobVqcIjZKMHr+lsqn6RTbq/4EyeR2al6yeBAOLsUfwzHagX+OpThdDIYBn
        VZE/aYWC5cQ2/vx6ZAu1VmP+hab3UZ2YzY8SRYMvGEpYirjn96qqYewSqaotEIlUpyiZWd
        IdQnf2z4Dl6VKKpJ0mR1B4RNgDMnd6gDXi2CXWK5KPeM/1YpW/I0R6dEMqeFNtiwt2WYzs
        uU3lC8oWM6eohQfmqBlXdguZVOt/A0f6HQHlDRgq63C98P5PZU1stTY4muku6/skYgBZDW
        RekqyMf3j5W+N8/ukW2hKWe3aGXXoLYUBBeQX8j4E1y6LWIhHkhGsiyOzWca+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1668443383;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WuCvNpqsWpwV49S5/EiT2Eu/MmVMQdF6U0k8ms+rMbY=;
        b=jh/yhRRxZqyoNHCJ+pkEaPo+hN6JlHwv8X7cSv17o/jCQ4k5FSxhxITDL1Zg48QnQj2yIj
        DwyFvVmfj7sDM+DA==
To:     Petr Mladek <pmladek@suse.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH printk v4 22/39] tty: nfcon: use console_is_registered()
Date:   Mon, 14 Nov 2022 17:35:15 +0106
Message-Id: <20221114162932.141883-23-john.ogness@linutronix.de>
In-Reply-To: <20221114162932.141883-1-john.ogness@linutronix.de>
References: <20221114162932.141883-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Currently CON_ENABLED is being (mis)used to identify if the console
has been registered. This is not reliable because it can be set even
though registration failed or it can be unset, even though the console
is registered. Use console_is_registered() instead.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 arch/m68k/emu/nfcon.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/emu/nfcon.c b/arch/m68k/emu/nfcon.c
index 557d60867f98..6fdc13610565 100644
--- a/arch/m68k/emu/nfcon.c
+++ b/arch/m68k/emu/nfcon.c
@@ -49,7 +49,7 @@ static void nfcon_write(struct console *con, const char *str,
 static struct tty_driver *nfcon_device(struct console *con, int *index)
 {
 	*index = 0;
-	return (con->flags & CON_ENABLED) ? nfcon_tty_driver : NULL;
+	return console_is_registered(con) ? nfcon_tty_driver : NULL;
 }
 
 static struct console nf_console = {
@@ -107,6 +107,11 @@ static int __init nf_debug_setup(char *arg)
 
 	stderr_id = nf_get_id("NF_STDERR");
 	if (stderr_id) {
+		/*
+		 * The console will be enabled when debug=nfcon is specified
+		 * as a kernel parameter. Since this is a non-standard way
+		 * of enabling consoles, it must be explicitly enabled.
+		 */
 		nf_console.flags |= CON_ENABLED;
 		register_console(&nf_console);
 	}
@@ -151,7 +156,7 @@ static int __init nfcon_init(void)
 
 	nfcon_tty_driver = driver;
 
-	if (!(nf_console.flags & CON_ENABLED))
+	if (!console_is_registered(&nf_console))
 		register_console(&nf_console);
 
 	return 0;
-- 
2.30.2

