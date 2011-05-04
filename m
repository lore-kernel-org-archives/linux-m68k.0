From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k/atari: Do not use "/" in interrupt names
Date: Wed, 04 May 2011 17:00:00 +0200
Message-ID: <m3d3jybjf3.fsf@linux-m68k.org>
References: <alpine.DEB.2.00.1105041629390.2629@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1105041629390.2629@ayla.of.borg> (Geert
	Uytterhoeven's message of "Wed, 4 May 2011 16:30:03 +0200 (CEST)")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> diff --git a/arch/m68k/atari/atakeyb.c b/arch/m68k/atari/atakeyb.c
> index e1ada31..779efdc 100644
> --- a/arch/m68k/atari/atakeyb.c
> +++ b/arch/m68k/atari/atakeyb.c
> @@ -572,7 +572,7 @@ int atari_keyb_init(void)
>  	kb_state.len = 0;
>  
>  	error = request_irq(IRQ_MFP_ACIA, atari_keyboard_interrupt,
> -			    IRQ_TYPE_SLOW, "keyboard/mouse/MIDI",
> +			    IRQ_TYPE_SLOW, "keyboard:mouse:MIDI",

The name is not a path, but an enumeration, so the slash should probably
be changed to a comma instead.

> diff --git a/arch/m68k/atari/stdma.c b/arch/m68k/atari/stdma.c
> index 604329f..ad68fe9 100644
> --- a/arch/m68k/atari/stdma.c
> +++ b/arch/m68k/atari/stdma.c
> @@ -180,7 +180,7 @@ void __init stdma_init(void)
>  {
>  	stdma_isr = NULL;
>  	if (request_irq(IRQ_MFP_FDC, stdma_int, IRQ_TYPE_SLOW | IRQF_SHARED,
> -			"ST-DMA: floppy/ACSI/IDE/Falcon-SCSI", stdma_int))
> +			"ST-DMA floppy:ACSI:IDE:Falcon-SCSI", stdma_int))

Likewise.

> diff --git a/drivers/net/atarilance.c b/drivers/net/atarilance.c
> index ce0091e..1833b12 100644
> --- a/drivers/net/atarilance.c
> +++ b/drivers/net/atarilance.c
> @@ -554,7 +554,7 @@ static unsigned long __init lance_probe1( struct net_device *dev,
>  		memaddr == (unsigned short *)0xffe00000) {
>  		/* PAMs card and Riebl on ST use level 5 autovector */
>  		if (request_irq(IRQ_AUTO_5, lance_interrupt, IRQ_TYPE_PRIO,
> -		            "PAM/Riebl-ST Ethernet", dev)) {
> +		            "PAM:Riebl-ST Ethernet", dev)) {

Likewise.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
