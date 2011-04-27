From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Number of interrupts on Sun3?
Date: Wed, 27 Apr 2011 16:53:55 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1104271646190.30970@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Creasey <sammy@sammy.net>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

	Hi Sammy,

Do you know why NR_IRQS is defined to 200 in arch/m68k/include/asm/irq.h,
while arch/m68k/sun3/sun3ints.c:sun3_init_IRQ() sets up only 128 user
interrupts?

I would expect either NR_IRQS to be 132 (8 auto + 128 user), or
sun3_init_IRQ() to set up all 192 user interrupts.

Ah, commit 35bdd52d7401b1208552523d6fa28d4a37dbc74d ("m68k: Correct number of
interrupts for Sun3") changed it from 192 to 128.
I guess it forgot to reduce NR_IRQS?

Still, why is user interrupt 127 (IRQ_USER+127) called "vec255"?
That should be either interrupt 191, or "vec191"?

Is that a misconversion in commit ebba61d5b05ecfda388dd4c156bafdb78d398055
("[PATCH] m68k: convert sun3 irq code")?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
