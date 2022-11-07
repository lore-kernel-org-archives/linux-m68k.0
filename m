Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49104C07E9D
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Nov 2022 14:16:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbiKGOQ4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Nov 2022 09:16:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbiKGOQx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Nov 2022 09:16:53 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A446A1D0E5
        for <linux-m68k@lists.linux-m68k.org>; Mon,  7 Nov 2022 06:16:52 -0800 (PST)
From:   John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1667830611;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hTh+Y7bD13JCVuc3SV32h+lY6g8QzK5tRTIXwcqSGfI=;
        b=vQeoLKWE1k4R6O3nMnBfOLEHIpwhVsbvXcVbHBj6NMymPvMJgyWKk8a+SWMhfut8ws1okf
        Rqf9Cz5bLPDfyH+IyWepofmoKnEQOGvQ1iHo3uNlukZnoFRP/pK5Sn5O02G21xpmFqMb+u
        hlTpVg1FSFH8SZ5WJyjH7IZ6QWr3b0vra6/IicriLiXUPXoi2kY+4Ry5gxKoUarCzr9z0L
        Jn/x7yIxlwj3fKZG/3gv9EsOyIpQRYwIlQqQP0/vFXqq5R1VhYgWlvhKaj+E2sPNiXxMoP
        PRI0wvXScmB0NbnXYTOF9ujFHajDe8JAN/lBQ8WvjFv+BmWum45rO42CvDc0XA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1667830611;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hTh+Y7bD13JCVuc3SV32h+lY6g8QzK5tRTIXwcqSGfI=;
        b=T64AeLS2skGi+8SZjeqwwtVGih9S8IofM6v6ACJ2ABibEKOmMbg6PouGq2vD32FeJ/mS4n
        /VBpHt26tQKzOUBw==
To:     Petr Mladek <pmladek@suse.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH printk v3 24/40] tty: nfcon: use console_is_registered()
Date:   Mon,  7 Nov 2022 15:22:22 +0106
Message-Id: <20221107141638.3790965-25-john.ogness@linutronix.de>
In-Reply-To: <20221107141638.3790965-1-john.ogness@linutronix.de>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Currently CON_ENABLED is being (mis)used to identify if the console
has been registered. This is not reliable because it can be set even
though registration failed or it can be unset, even though the console
is registered.

Instead, use console_is_registered().

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 arch/m68k/emu/nfcon.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/emu/nfcon.c b/arch/m68k/emu/nfcon.c
index 557d60867f98..292669fa480f 100644
--- a/arch/m68k/emu/nfcon.c
+++ b/arch/m68k/emu/nfcon.c
@@ -49,14 +49,14 @@ static void nfcon_write(struct console *con, const char *str,
 static struct tty_driver *nfcon_device(struct console *con, int *index)
 {
 	*index = 0;
-	return (con->flags & CON_ENABLED) ? nfcon_tty_driver : NULL;
+	return console_is_registered(con) ? nfcon_tty_driver : NULL;
 }
 
 static struct console nf_console = {
 	.name	= "nfcon",
 	.write	= nfcon_write,
 	.device	= nfcon_device,
-	.flags	= CON_PRINTBUFFER,
+	.flags	= CON_PRINTBUFFER | CON_ENABLED,
 	.index	= -1,
 };
 
@@ -106,10 +106,8 @@ static int __init nf_debug_setup(char *arg)
 		return 0;
 
 	stderr_id = nf_get_id("NF_STDERR");
-	if (stderr_id) {
-		nf_console.flags |= CON_ENABLED;
+	if (stderr_id)
 		register_console(&nf_console);
-	}
 
 	return 0;
 }
@@ -151,7 +149,7 @@ static int __init nfcon_init(void)
 
 	nfcon_tty_driver = driver;
 
-	if (!(nf_console.flags & CON_ENABLED))
+	if (!console_is_registered(&nf_console))
 		register_console(&nf_console);
 
 	return 0;
-- 
2.30.2

