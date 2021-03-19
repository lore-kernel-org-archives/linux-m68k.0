Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76701C433E0
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Mar 2021 07:08:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A85764DBA
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Mar 2021 07:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233819AbhCSHIY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 19 Mar 2021 03:08:24 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:41160 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233902AbhCSHHx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 19 Mar 2021 03:07:53 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 930E12AC12;
        Fri, 19 Mar 2021 03:07:50 -0400 (EDT)
Date:   Fri, 19 Mar 2021 18:07:45 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Mike Pavone <pavone@retrodev.com>
cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/mvme16x: Fix timer interrupts
In-Reply-To: <628cb0d0-94af-651f-0d84-f78b966cd8bd@retrodev.com>
Message-ID: <f7fb45d-47e3-aeed-b85d-b3a36b14d7e@telegraphics.com.au>
References: <628cb0d0-94af-651f-0d84-f78b966cd8bd@retrodev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, 16 Mar 2021, Mike Pavone wrote:

> Timer interrupts on MVME16x and MVME17x boards are broken as the CEN and
> COC bits are being inadvertently cleared when clearing the overflow
> counter. This results in no timer interrupts being delivered after the
> first. Initialization then hangs in calibrate_delay as the jiffies counter
> is not updated. OR with current register value to preserve these bits.
> 
> Fixes: 19999a8b8782 ("m68k: mvme16x: Handle timer counter overflow")
> Signed-off-by: Michael Pavone <pavone@retrodev.com>
> ---
>  arch/m68k/mvme16x/config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/mvme16x/config.c b/arch/m68k/mvme16x/config.c
> index 30357fe4ba6c..949d3e19f79c 100644
> --- a/arch/m68k/mvme16x/config.c
> +++ b/arch/m68k/mvme16x/config.c
> @@ -375,7 +375,7 @@ static irqreturn_t mvme16x_timer_int (int irq, void
> *dev_id)
>   	local_irq_save(flags);
>  	out_8(PCCTIC1, in_8(PCCTIC1) | PCCTIC1_INT_CLR);
> -	out_8(PCCTOVR1, PCCTOVR1_OVR_CLR);
> +	out_8(PCCTOVR1, in_8(PCCTOVR1) | PCCTOVR1_OVR_CLR);

Since we know at compile time what bits should be set in PCCTOVR1, we can 
avoid the additional register access. We should do the same in 
mvme16x_sched_init() for clarity. What do you think about this patch?

diff --git a/arch/m68k/include/asm/mvme147hw.h b/arch/m68k/include/asm/mvme147hw.h
index 257b29184af9..e28eb1c0e0bf 100644
--- a/arch/m68k/include/asm/mvme147hw.h
+++ b/arch/m68k/include/asm/mvme147hw.h
@@ -66,6 +66,9 @@ struct pcc_regs {
 #define PCC_INT_ENAB		0x08
 
 #define PCC_TIMER_INT_CLR	0x80
+
+#define PCC_TIMER_TIC_EN	0x01
+#define PCC_TIMER_COC_EN	0x02
 #define PCC_TIMER_CLR_OVF	0x04
 
 #define PCC_LEVEL_ABORT		0x07
diff --git a/arch/m68k/mvme147/config.c b/arch/m68k/mvme147/config.c
index cfdc7f912e14..c16936a4c883 100644
--- a/arch/m68k/mvme147/config.c
+++ b/arch/m68k/mvme147/config.c
@@ -115,7 +115,8 @@ static irqreturn_t mvme147_timer_int (int irq, void *dev_id)
 
 	local_irq_save(flags);
 	m147_pcc->t1_int_cntrl = PCC_TIMER_INT_CLR;
-	m147_pcc->t1_cntrl = PCC_TIMER_CLR_OVF;
+	m147_pcc->t1_cntrl = PCC_TIMER_CLR_OVF | PCC_TIMER_COC_EN |
+			     PCC_TIMER_TIC_EN;
 	clk_total += PCC_TIMER_CYCLES;
 	legacy_timer_tick(1);
 	local_irq_restore(flags);
@@ -133,8 +134,7 @@ void mvme147_sched_init (void)
 	/* Init the clock with a value */
 	/* The clock counter increments until 0xFFFF then reloads */
 	m147_pcc->t1_preload = PCC_TIMER_PRELOAD;
-	m147_pcc->t1_cntrl = 0x0;	/* clear timer */
-	m147_pcc->t1_cntrl = 0x3;	/* start timer */
+	m147_pcc->t1_cntrl = PCC_TIMER_COC_EN | PCC_TIMER_TIC_EN;
 	m147_pcc->t1_int_cntrl = PCC_TIMER_INT_CLR;  /* clear pending ints */
 	m147_pcc->t1_int_cntrl = PCC_INT_ENAB|PCC_LEVEL_TIMER1;
 
diff --git a/arch/m68k/mvme16x/config.c b/arch/m68k/mvme16x/config.c
index 30357fe4ba6c..9833528f9981 100644
--- a/arch/m68k/mvme16x/config.c
+++ b/arch/m68k/mvme16x/config.c
@@ -375,7 +375,7 @@ static irqreturn_t mvme16x_timer_int (int irq, void *dev_id)
 
 	local_irq_save(flags);
 	out_8(PCCTIC1, in_8(PCCTIC1) | PCCTIC1_INT_CLR);
-	out_8(PCCTOVR1, PCCTOVR1_OVR_CLR);
+	out_8(PCCTOVR1, PCCTOVR1_OVR_CLR | PCCTOVR1_TIC_EN | PCCTOVR1_COC_EN);
 	clk_total += PCC_TIMER_CYCLES;
 	legacy_timer_tick(1);
 	local_irq_restore(flags);
@@ -391,7 +391,7 @@ void mvme16x_sched_init(void)
     /* Using PCCchip2 or MC2 chip tick timer 1 */
     out_be32(PCCTCNT1, 0);
     out_be32(PCCTCMP1, PCC_TIMER_CYCLES);
-    out_8(PCCTOVR1, in_8(PCCTOVR1) | PCCTOVR1_TIC_EN | PCCTOVR1_COC_EN);
+    out_8(PCCTOVR1, PCCTOVR1_TIC_EN | PCCTOVR1_COC_EN);
     out_8(PCCTIC1, PCCTIC1_INT_EN | 6);
     if (request_irq(MVME16x_IRQ_TIMER, mvme16x_timer_int, IRQF_TIMER, "timer",
                     NULL))
