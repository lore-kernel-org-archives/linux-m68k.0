From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] m68k/mac: Allocate IOP message pool and queues
 dynamically
Date: Mon, 1 Jul 2013 17:46:48 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1307011325520.9968@nippy.intranet>
References: <1372586542-1318-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1372586542-1318-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org


On Sun, 30 Jun 2013, Geert Uytterhoeven wrote:

> +static void __init alloc_msg_queue(int iop_num)
> +{
> +	iop_send_queue[iop_num] =
> +		kzalloc(NUM_IOP_CHAN * sizeof(**iop_send_queue), GFP_KERNEL);
> +	iop_listeners[iop_num] =
> +		kzalloc(NUM_IOP_CHAN * sizeof(**iop_listeners), GFP_KERNEL);

Perhaps we should panic on allocation failure? It might upset the static 
checkers otherwise. Can be done in another patch I guess.

> -
> -/*
> - * Register the interrupt handler for the IOPs.
> - * TODO: might be wrong for non-OSS machines. Anyone?
> - */
> -
> -void __init iop_register_interrupts(void)
> -{
> -	if (iop_ism_present) {
> +		/*
> +		 * Register the interrupt handler for the IOPs.
> +		 * TODO: might be wrong for non-OSS machines. Anyone?

My testing with a non-OSS machine (Quadra 950) indicates that the TODO is 
obsolete. And the comment "register the interrupt handler for the IOPs" is 
a bit silly. It merely re-phrases the code. Otherwise, this patch looks 
good to me. Thanks.

Finn
