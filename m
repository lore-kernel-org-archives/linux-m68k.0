From: Sam Creasey <sammy@sammy.net>
Subject: Re: Number of interrupts on Sun3?
Date: Wed, 27 Apr 2011 11:51:52 -0400
Message-ID: <20110427155152.GA17943@anhedonia>
References: <alpine.DEB.2.00.1104271646190.30970@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1104271646190.30970@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sam Creasey <sammy@sammy.net>, Linux/m68k <linux-m68k@lists.linux-m68k.org>


On Wed, Apr 27, 2011 at 04:53:55PM +0200, Geert Uytterhoeven wrote:
>       Hi Sammy,
> 
> Do you know why NR_IRQS is defined to 200 in
> arch/m68k/include/asm/irq.h,
> while arch/m68k/sun3/sun3ints.c:sun3_init_IRQ() sets up only 128
> user
> interrupts?
> 
> I would expect either NR_IRQS to be 132 (8 auto + 128 user), or
> sun3_init_IRQ() to set up all 192 user interrupts.
> 
> Ah, commit 35bdd52d7401b1208552523d6fa28d4a37dbc74d ("m68k: Correct
> number of
> interrupts for Sun3") changed it from 192 to 128.
> I guess it forgot to reduce NR_IRQS?

That's my guess (forgetting to reduce NR_IRQS).   I don't remember why
(if there was a good reason) I changed the argument to
m68k_setup_user_interrupt() down to 128...  I feel like we should be
setting up all of the user interrupts.

> Still, why is user interrupt 127 (IRQ_USER+127) called "vec255"?
> That should be either interrupt 191, or "vec191"?
> 
> Is that a misconversion in commit
> ebba61d5b05ecfda388dd4c156bafdb78d398055
> ("[PATCH] m68k: convert sun3 irq code")?

Yeah, I think it should have been renamed in that commit.

-- Sam
