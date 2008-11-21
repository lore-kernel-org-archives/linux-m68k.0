From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] MVME16x: add support for EARLY_PRINTK
Date: Fri, 21 Nov 2008 11:29:22 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811211129070.26004@anakin>
References: <1227186532.19809.3.camel@kars.perseus.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from edna.telenet-ops.be ([195.130.132.58]:38357 "EHLO
	edna.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752623AbYKUK3Y (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Nov 2008 05:29:24 -0500
In-Reply-To: <1227186532.19809.3.camel@kars.perseus.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Kars de Jong <jongk@linux-m68k.org>
Cc: Linux/m68k kernel mailing list <linux-m68k@vger.kernel.org>

On Thu, 20 Nov 2008, Kars de Jong wrote:
> +void __init mvme16x_early_console(void)

static?

> +{
> +	register_console(&cons_info);
> +
> +	printk(KERN_INFO "MVME16x: early console registered\n");
> +}
> +#endif
>  
>  void __init config_mvme16x(void)
>  {
> @@ -184,6 +341,9 @@ void __init config_mvme16x(void)
>  	pcc2chip[PccSCCMICR] = 0x10;
>  	pcc2chip[PccSCCTICR] = 0x10;
>  	pcc2chip[PccSCCRICR] = 0x10;
> +#ifdef CONFIG_EARLY_PRINTK
> +	mvme16x_early_console();
> +#endif

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
