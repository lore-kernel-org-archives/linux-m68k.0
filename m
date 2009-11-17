From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 10/13] mac68k: start CUDA early
Date: Tue, 17 Nov 2009 13:03:41 +1100
Message-ID: <1258423421.2140.555.camel@pasglop>
References: <alpine.OSX.2.00.0911031502250.483@silk.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:34585 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755427AbZKQCDy (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 16 Nov 2009 21:03:54 -0500
In-Reply-To: <alpine.OSX.2.00.0911031502250.483@silk.local>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@ozlabs.org, linux-m68k@vger.kernel.org

On Wed, 2009-11-04 at 00:46 +1100, Finn Thain wrote:
> The valkyriefb driver needs the CUDA to work in order to set the video 
> mode at boot. Initialising the device earlier, and bring the m68k code 
> closer to the powermac code.
> 
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Hi Finn !

> @@ -224,20 +249,9 @@ cuda_probe(void)
>  static int __init
>  cuda_init(void)
>  {
> -#ifdef CONFIG_PPC
>      if (via == NULL)
>  	return -ENODEV;
>      return 0;
> -#else 
> -    int err = cuda_init_via();
> -    if (err) {
> -	printk(KERN_ERR "cuda_init_via() failed\n");
> -	return -ENODEV;
> -    }
> -    out_8(&via[IER], IER_SET|SR_INT); /* enable interrupt from SR */
> -
> -    return via_cuda_start();
> -#endif
>  }
>  #endif /* CONFIG_ADB */

Can't we just get rid of cuda_init() completely ?
 
> @@ -430,9 +444,12 @@ cuda_poll(void)
>      /* cuda_interrupt only takes a normal lock, we disable
>       * interrupts here to avoid re-entering and thus deadlocking.
>       */
> -    disable_irq(cuda_irq);
> -    cuda_interrupt(0, NULL);
> -    enable_irq(cuda_irq);
> +    if (cuda_fully_inited) {
> +	disable_irq(cuda_irq);
> +	cuda_interrupt(0, NULL);
> +	enable_irq(cuda_irq);
> +    } else
> +	cuda_interrupt(0, NULL);
>  }

Wouldn't it be better that way ?

	if (cuda_irq)
		disable_irq(cuda_irq);
	cuda_interrupt(0, NULL);
	if (cuda_irq)
		enable_irq(cuda_irq);

Cheers,
Ben.
