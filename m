From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [RFC] m68k/mac: Remove SONIC interrupt hack
Date: Mon, 12 Dec 2016 15:22:48 +0100
Message-ID: <ce6b1575-e3f6-4b49-c70f-0ce0d788e9a0@vivier.eu>
References: <alpine.LNX.2.00.1612121404080.16984@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.135]:62644 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752594AbcLLOW4 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 12 Dec 2016 09:22:56 -0500
In-Reply-To: <alpine.LNX.2.00.1612121404080.16984@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, linux-m68k@vger.kernel.org
Cc: Michael Schmitz <schmitzmic@gmail.com>

Le 12/12/2016 à 04:45, Finn Thain a écrit :
> In macints.c there is some startup code which disables the SONIC interrupt 
> in an attempt to avoid an unhandled slot interrupt, which would be fatal. 
> This only works on those machines where the SONIC device is on-board.
> 
> When the mac_sonic driver is built-in, there's little point in doing this, 
> because the device will be initialized a few seconds later anyway. But 
> when mac_sonic is a module, the window for an unhandled interrupt is 
> longer.
> 
> Either way, we've already run the gauntlet for 5 or 10 seconds by the time 
> we get around to disabling this particular device. It's only by sheer luck 
> that we got this far.
> 
> Really, this is too little too late. The general problem of unhandled 
> early interrupts also affects other devices on other models. There are 
> better ways to resolve this problem.
> 
> 1) When using the Penguin bootloader, boot Mac OS with extensions disabled 
>    (by holding down the shift key at startup or by use of the Extensions 
>    Manager control panel). The Penguin docs already contain this advice, 
>    as it is always effective.
> 
> 2) Have the Penguin bootloader disable the interrupt. It already attempts 
>    to disable slot interrupts. But since some hardware cannot mask slot 
>    interrupts, Penguin should probably close the relevant device drivers 
>    instead.
> 
> 3) Use Emile instead of Penguin. AFAIK the boot ROM never enables network 
>    device interrupts and hence they don't need to be disabled.
> 
> We should remove this hack. It requires maintenance and it doesn't solve 
> the problem. It improves the odds in a small number of cases. Far better 
> to simply set CONFIG_MAC_SONIC=y.
> 
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

> 
> ---
> 
> BTW, is it possible to get an error message printed to the console when an 
> irq is raised for which there is no handler? (Neglecting that this could 
> happen even before the early console starts...)
> 
> Index: linux/arch/m68k/mac/macints.c
> ===================================================================
> --- linux.orig/arch/m68k/mac/macints.c	2016-12-12 12:04:54.000000000 +1100
> +++ linux/arch/m68k/mac/macints.c	2016-12-12 13:03:10.000000000 +1100
> @@ -125,8 +125,6 @@
>  #include <asm/hwtest.h>
>  #include <asm/irq_regs.h>
>  
> -#define SHUTUP_SONIC
> -
>  extern void show_registers(struct pt_regs *);
>  
>  irqreturn_t mac_nmi_handler(int, void *);
> @@ -151,16 +149,6 @@ void __init mac_init_IRQ(void)
>  #endif
>  	m68k_setup_irq_controller(&mac_irq_chip, handle_simple_irq, IRQ_USER,
>  				  NUM_MAC_SOURCES - IRQ_USER);
> -	/* Make sure the SONIC interrupt is cleared or things get ugly */
> -#ifdef SHUTUP_SONIC
> -	printk("Killing onboard sonic... ");
> -	/* This address should hopefully be mapped already */
> -	if (hwreg_present((void*)(0x50f0a000))) {
> -		*(long *)(0x50f0a014) = 0x7fffL;
> -		*(long *)(0x50f0a010) = 0L;
> -	}
> -	printk("Done.\n");
> -#endif /* SHUTUP_SONIC */
>  
>  	/*
>  	 * Now register the handlers for the master IRQ handlers
> 
