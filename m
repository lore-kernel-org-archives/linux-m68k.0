From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: iop_msg_pool
Date: Wed, 26 Jun 2013 20:48:14 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1306262026380.19790@nippy.intranet>
References: <CAMuHMdUCMUkoDbTFFXnVp-6E0LO5Y=4t64E13cWSpS1jVr2D_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:58278 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750843Ab3FZKsX (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 26 Jun 2013 06:48:23 -0400
In-Reply-To: <CAMuHMdUCMUkoDbTFFXnVp-6E0LO5Y=4t64E13cWSpS1jVr2D_w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>


On Wed, 26 Jun 2013, Geert Uytterhoeven wrote:

> arch/m68k/mac/iop.c has:
> 
> static struct iop_msg iop_msg_pool[NUM_IOP_MSGS];
> 
> As iop_msg_pool consumes 4928 bytes, it should be allocated dynamically, 
> especially for multi-platform kernels not running on Mac.

I agree. Though I don't care much for multi-platform kernels: bloat in 
portable code is easily excused when most users of that code run it on 
recent hardware. We don't have that excuse.

> 
> Furthermore:
> 
> /*
>  * Initialize the IOPs, if present.
>  */
> 
> void __init iop_init(void)
> {
>         int i;
> 
>         if (iop_scc_present) {
>                 printk("IOP: detected SCC IOP at %p\n", iop_base[IOP_NUM_SCC]);
>         }
>         if (iop_ism_present) {
>                 printk("IOP: detected ISM IOP at %p\n", iop_base[IOP_NUM_ISM]);
>                 iop_start(iop_base[IOP_NUM_ISM]);
>                 iop_alive(iop_base[IOP_NUM_ISM]); /* clears the alive flag */
>         }

Maybe use kcalloc() to allocate iop_msg_pool, iop_send_queue and 
iop_listeners and remove all of the following initialisation. I don't see 
a convenient way to call kfree() though.

> 
>         /* Make the whole pool available and empty the queues */
> 
>         for (i = 0 ; i < NUM_IOP_MSGS ; i++) {
>                 iop_msg_pool[i].status = IOP_MSGSTATUS_UNUSED;
>         }
> 
>         for (i = 0 ; i < NUM_IOP_CHAN ; i++) {
>                 iop_send_queue[IOP_NUM_SCC][i] = NULL;
>                 iop_send_queue[IOP_NUM_ISM][i] = NULL;
>                 iop_listeners[IOP_NUM_SCC][i].devname = NULL;
>                 iop_listeners[IOP_NUM_SCC][i].handler = NULL;
>                 iop_listeners[IOP_NUM_ISM][i].devname = NULL;
>                 iop_listeners[IOP_NUM_ISM][i].handler = NULL;
>         }
> }
> 
> However, despite the comment at the top, all of the above is done
> unconditionally?

Seems so. And it is pointless AFAICS with grep.

> Do all Macs use the IOP functionality?

No. iop_scc_present and iop_ism_present are accurate.

So far, the only driver to make use of this functionality is 
drivers/macintosh/adb-iop.c:

int adb_iop_probe(void)
{
        if (!iop_ism_present) return -ENODEV;
        return 0;
}

Finn

> 
> P.S. Before anyone mentions zorro_autocon: yes, it's on my list ;-)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
