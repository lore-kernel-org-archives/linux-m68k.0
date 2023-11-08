Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAA2C4167B
	for <linux-m68k@archiver.kernel.org>; Wed,  8 Nov 2023 00:20:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235165AbjKHAUC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 7 Nov 2023 19:20:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjKHAUB (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 7 Nov 2023 19:20:01 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E537C125
        for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Nov 2023 16:19:58 -0800 (PST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
        by sin.source.kernel.org (Postfix) with ESMTP id 43437CE0FE8;
        Wed,  8 Nov 2023 00:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550BCC433C8;
        Wed,  8 Nov 2023 00:19:50 +0000 (UTC)
Date:   Tue, 7 Nov 2023 19:19:53 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Ankur Arora <ankur.a.arora@oracle.com>
Cc:     linux-kernel@vger.kernel.org, tglx@linutronix.de,
        peterz@infradead.org, torvalds@linux-foundation.org,
        paulmck@kernel.org, linux-mm@kvack.org, x86@kernel.org,
        akpm@linux-foundation.org, luto@kernel.org, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        willy@infradead.org, mgorman@suse.de, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com,
        boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
        jgross@suse.com, andrew.cooper3@citrix.com, mingo@kernel.org,
        bristot@kernel.org, mathieu.desnoyers@efficios.com,
        geert@linux-m68k.org, glaubitz@physik.fu-berlin.de,
        anton.ivanov@cambridgegreys.com, mattst88@gmail.com,
        krypton@ulrich-teichert.org, David.Laight@ACULAB.COM,
        richard@nod.at, mjguzik@gmail.com,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [RFC PATCH 46/86] tracing: handle lazy resched
Message-ID: <20231107191953.6b44790b@gandalf.local.home>
In-Reply-To: <20231107215742.363031-47-ankur.a.arora@oracle.com>
References: <20231107215742.363031-1-ankur.a.arora@oracle.com>
        <20231107215742.363031-47-ankur.a.arora@oracle.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue,  7 Nov 2023 13:57:32 -0800
Ankur Arora <ankur.a.arora@oracle.com> wrote:

> Tracing support.
> 
> Note: this is quite incomplete.

What's not complete? The removal of the IRQS_NOSUPPORT?

Really, that's only for alpha, m68k and nios2. I think setting 'X' is not
needed anymore, and we can use that bit for this, and for those archs, have
0 for interrupts disabled.

-- Steve


> 
> Originally-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---
>  include/linux/trace_events.h |  6 +++---
>  kernel/trace/trace.c         |  2 ++
>  kernel/trace/trace_output.c  | 16 ++++++++++++++--
>  3 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/trace_events.h b/include/linux/trace_events.h
> index 21ae37e49319..355d25d5e398 100644
> --- a/include/linux/trace_events.h
> +++ b/include/linux/trace_events.h
> @@ -178,7 +178,7 @@ unsigned int tracing_gen_ctx_irq_test(unsigned int irqs_status);
>  
>  enum trace_flag_type {
>  	TRACE_FLAG_IRQS_OFF		= 0x01,
> -	TRACE_FLAG_IRQS_NOSUPPORT	= 0x02,
> +	TRACE_FLAG_NEED_RESCHED_LAZY    = 0x02,
>  	TRACE_FLAG_NEED_RESCHED		= 0x04,
>  	TRACE_FLAG_HARDIRQ		= 0x08,
>  	TRACE_FLAG_SOFTIRQ		= 0x10,
> @@ -205,11 +205,11 @@ static inline unsigned int tracing_gen_ctx(void)
>  
>  static inline unsigned int tracing_gen_ctx_flags(unsigned long irqflags)
>  {
> -	return tracing_gen_ctx_irq_test(TRACE_FLAG_IRQS_NOSUPPORT);
> +	return tracing_gen_ctx_irq_test(0);
>  }
>  static inline unsigned int tracing_gen_ctx(void)
>  {
> -	return tracing_gen_ctx_irq_test(TRACE_FLAG_IRQS_NOSUPPORT);
> +	return tracing_gen_ctx_irq_test(0);
>  }
>  #endif
>  
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index 7f067ad9cf50..0776dba32c2d 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -2722,6 +2722,8 @@ unsigned int tracing_gen_ctx_irq_test(unsigned int irqs_status)
>  
>  	if (tif_need_resched(RESCHED_eager))
>  		trace_flags |= TRACE_FLAG_NEED_RESCHED;
> +	if (tif_need_resched(RESCHED_lazy))
> +		trace_flags |= TRACE_FLAG_NEED_RESCHED_LAZY;
>  	if (test_preempt_need_resched())
>  		trace_flags |= TRACE_FLAG_PREEMPT_RESCHED;
>  	return (trace_flags << 16) | (min_t(unsigned int, pc & 0xff, 0xf)) |
> diff --git a/kernel/trace/trace_output.c b/kernel/trace/trace_output.c
> index db575094c498..c251a44ad8ac 100644
> --- a/kernel/trace/trace_output.c
> +++ b/kernel/trace/trace_output.c
> @@ -460,17 +460,29 @@ int trace_print_lat_fmt(struct trace_seq *s, struct trace_entry *entry)
>  		(entry->flags & TRACE_FLAG_IRQS_OFF && bh_off) ? 'D' :
>  		(entry->flags & TRACE_FLAG_IRQS_OFF) ? 'd' :
>  		bh_off ? 'b' :
> -		(entry->flags & TRACE_FLAG_IRQS_NOSUPPORT) ? 'X' :
> +		!IS_ENABLED(CONFIG_TRACE_IRQFLAGS_SUPPORT) ? 'X' :
>  		'.';
>  
> -	switch (entry->flags & (TRACE_FLAG_NEED_RESCHED |
> +	switch (entry->flags & (TRACE_FLAG_NEED_RESCHED | TRACE_FLAG_NEED_RESCHED_LAZY |
>  				TRACE_FLAG_PREEMPT_RESCHED)) {
> +	case TRACE_FLAG_NEED_RESCHED | TRACE_FLAG_NEED_RESCHED_LAZY | TRACE_FLAG_PREEMPT_RESCHED:
> +		need_resched = 'B';
> +		break;
>  	case TRACE_FLAG_NEED_RESCHED | TRACE_FLAG_PREEMPT_RESCHED:
>  		need_resched = 'N';
>  		break;
> +	case TRACE_FLAG_NEED_RESCHED_LAZY | TRACE_FLAG_PREEMPT_RESCHED:
> +		need_resched = 'L';
> +		break;
> +	case TRACE_FLAG_NEED_RESCHED | TRACE_FLAG_NEED_RESCHED_LAZY:
> +		need_resched = 'b';
> +		break;
>  	case TRACE_FLAG_NEED_RESCHED:
>  		need_resched = 'n';
>  		break;
> +	case TRACE_FLAG_NEED_RESCHED_LAZY:
> +		need_resched = 'l';
> +		break;
>  	case TRACE_FLAG_PREEMPT_RESCHED:
>  		need_resched = 'p';
>  		break;

