Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283E4EB64DC
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Jul 2023 03:38:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjGTDiw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 19 Jul 2023 23:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjGTDiv (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 19 Jul 2023 23:38:51 -0400
Received: from mail.208.org (unknown [183.242.55.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7219B1FCB
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Jul 2023 20:38:50 -0700 (PDT)
Received: from mail.208.org (email.208.org [127.0.0.1])
        by mail.208.org (Postfix) with ESMTP id 4R5z1g5c6zzBRDry
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jul 2023 11:38:47 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
        content-transfer-encoding:content-type:message-id:user-agent
        :references:in-reply-to:subject:to:from:date:mime-version; s=
        dkim; t=1689824327; x=1692416328; bh=rQg2tdrcy4na2v0dS/Olq5JrVKy
        vSeWmwHBFR82qw3U=; b=kRWdAPI/WEZyircnODw5fGbB7yuDteK9r8mw9RCxZWS
        iCbBG7Q66w9MVBDUKcbZvsQdCMFjpWfrUWk7AdDlnxO8PA6rS37IhSkSHaa5Wxk4
        QK5AZ8pXhgyj6wae5Fj3OIO/++hmsy1K5Wb0Ui+RpeN3ezB04/F3dLN5410dJWrv
        UCqIZq948+ETPZ/iCjmROYjQroHqbJhOobbFv6p1C9Ko+p4AGYUYVzb+N78nCoT/
        YKarI+cXdOzuuGdxJD5ezaGuhkLAjxvRlmxgSUPaQOlErTlPgDiVbEgjiFrC78nn
        KzxeiOJt7pllJf6dq3fmcSPbtRyZsCyPx+27p9MiLww==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
        by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id kp7NyzaLJ74S for <linux-m68k@lists.linux-m68k.org>;
        Thu, 20 Jul 2023 11:38:47 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
        by mail.208.org (Postfix) with ESMTPSA id 4R5z1g3fcdzBR1P6;
        Thu, 20 Jul 2023 11:38:47 +0800 (CST)
MIME-Version: 1.0
Date:   Thu, 20 Jul 2023 11:38:47 +0800
From:   sunran001@208suo.com
To:     geert@linux-m68k.org
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: q40: add missing spaces around '='
In-Reply-To: <20230720033737.2092-1-xujianghui@cdjrlc.com>
References: <20230720033737.2092-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <006368d8cf146a4e41d860b615d4b3ec@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

add missing spaces to clear checkpatch errors.

ERROR: spaces required around that '=' (ctx:VxV)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  arch/m68k/q40/q40ints.c | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/q40/q40ints.c b/arch/m68k/q40/q40ints.c
index 127d7ecdbd49..fdd6e48f4fe3 100644
--- a/arch/m68k/q40/q40ints.c
+++ b/arch/m68k/q40/q40ints.c
@@ -132,10 +132,10 @@ static irqreturn_t q40_timer_int(int irq, void 
*dev_id)
  {
  	ql_ticks = ql_ticks ? 0 : 1;
  	if (sound_ticks) {
-		unsigned char sval=(sound_ticks & 1) ? 128-SVOL : 128+SVOL;
+		unsigned char sval = (sound_ticks & 1) ? 128-SVOL : 128+SVOL;
  		sound_ticks--;
-		*DAC_LEFT=sval;
-		*DAC_RIGHT=sval;
+		*DAC_LEFT = sval;
+		*DAC_RIGHT = sval;
  	}

  	if (!ql_ticks) {
@@ -171,7 +171,7 @@ void q40_sched_init (void)

  struct IRQ_TABLE{ unsigned mask; int irq ;};
  #if 0
-static struct IRQ_TABLE iirqs[]={
+static struct IRQ_TABLE iirqs[] = {
    {Q40_IRQ_FRAME_MASK,Q40_IRQ_FRAME},
    {Q40_IRQ_KEYB_MASK,Q40_IRQ_KEYBOARD},
    {0,0}};
@@ -189,7 +189,7 @@ static struct IRQ_TABLE eirqs[] = {
  };

  /* complain only this many times about spurious ints : */
-static int ccleirq=60;    /* ISA dev IRQs*/
+static int ccleirq = 60;    /* ISA dev IRQs*/
  /*static int cclirq=60;*/     /* internal */

  /* FIXME: add shared ints,mask,unmask,probing.... */
