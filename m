From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 01/22] m68k/atari: Modernize printing of kernel
 messages
Date: Thu, 8 Dec 2016 09:36:32 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1612080925380.9219__46312.0839362547$1481150523$gmane$org@nippy.intranet>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org> <1481123360-10978-2-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-2-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org


On Wed, 7 Dec 2016, Geert Uytterhoeven wrote:

>   - Convert from printk() to pr_*(),
>   - Add missing continuations, to fix user-visible breakage,
>   - Drop useless WARNING prefix,
>   - Move trailing spaces to start of continuations.
> 
> Fixes: 4bcc595ccd80decb ("printk: reinstate KERN_CONT for printing continuation lines")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/m68k/atari/atakeyb.c | 14 ++++++------
>  arch/m68k/atari/config.c  | 56 +++++++++++++++++++++++------------------------
>  2 files changed, 35 insertions(+), 35 deletions(-)
> 
> diff --git a/arch/m68k/atari/atakeyb.c b/arch/m68k/atari/atakeyb.c
> index 264db11268039329..37091898adb3d3b5 100644
> --- a/arch/m68k/atari/atakeyb.c
> +++ b/arch/m68k/atari/atakeyb.c
> @@ -149,7 +149,7 @@ static irqreturn_t atari_keyboard_interrupt(int irq, void *dummy)
>  	if (acia_stat & ACIA_OVRN) {
>  		/* a very fast typist or a slow system, give a warning */
>  		/* ...happens often if interrupts were disabled for too long */
> -		printk(KERN_DEBUG "Keyboard overrun\n");
> +		pr_debug("Keyboard overrun\n");
>  		scancode = acia.key_data;
>  		if (ikbd_self_test)
>  			/* During self test, don't do resyncing, just process the code */

This is not equivalent (unless there is a DEBUG macro definition hinding 
in a header file somewhere). Since the changelog doesn't mention 
suppressing any output, perhaps you were deceived by the questionable API, 
as I have been in the past (see 16b9d870a0 and d61c5427f6).

-- 
