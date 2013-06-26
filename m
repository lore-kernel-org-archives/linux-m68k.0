From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: iop_msg_pool
Date: Wed, 26 Jun 2013 13:07:44 +0200
Message-ID: <CAMuHMdXzh-3f2hRtUDxd3M+Gu9s1uLt-sPiERYDkXNuKkuUBig@mail.gmail.com>
References: <CAMuHMdUCMUkoDbTFFXnVp-6E0LO5Y=4t64E13cWSpS1jVr2D_w@mail.gmail.com>
	<alpine.LNX.2.00.1306262026380.19790@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:56531 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751817Ab3FZLHp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 26 Jun 2013 07:07:45 -0400
Received: by mail-pd0-f169.google.com with SMTP id y10so1420233pdj.28
        for <linux-m68k@vger.kernel.org>; Wed, 26 Jun 2013 04:07:45 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1306262026380.19790@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Jun 26, 2013 at 12:48 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
>>         if (iop_scc_present) {
>>                 printk("IOP: detected SCC IOP at %p\n", iop_base[IOP_NUM_SCC]);
>>         }
>>         if (iop_ism_present) {
>>                 printk("IOP: detected ISM IOP at %p\n", iop_base[IOP_NUM_ISM]);
>>                 iop_start(iop_base[IOP_NUM_ISM]);
>>                 iop_alive(iop_base[IOP_NUM_ISM]); /* clears the alive flag */
>>         }
>
> Maybe use kcalloc() to allocate iop_msg_pool, iop_send_queue and
> iop_listeners and remove all of the following initialisation. I don't see
> a convenient way to call kfree() though.

I don't think not calling kfree() is an issue here. The code can't be
unloaded anyway.

>>
>>         /* Make the whole pool available and empty the queues */
>>
>>         for (i = 0 ; i < NUM_IOP_MSGS ; i++) {
>>                 iop_msg_pool[i].status = IOP_MSGSTATUS_UNUSED;
>>         }
>>
>>         for (i = 0 ; i < NUM_IOP_CHAN ; i++) {
>>                 iop_send_queue[IOP_NUM_SCC][i] = NULL;
>>                 iop_send_queue[IOP_NUM_ISM][i] = NULL;
>>                 iop_listeners[IOP_NUM_SCC][i].devname = NULL;
>>                 iop_listeners[IOP_NUM_SCC][i].handler = NULL;
>>                 iop_listeners[IOP_NUM_ISM][i].devname = NULL;
>>                 iop_listeners[IOP_NUM_ISM][i].handler = NULL;
>>         }
>> }
>>
>> However, despite the comment at the top, all of the above is done
>> unconditionally?
>
> Seems so. And it is pointless AFAICS with grep.
>
>> Do all Macs use the IOP functionality?
>
> No. iop_scc_present and iop_ism_present are accurate.

Thanks! So we can just do nothing and return if both of them are unset.

Are iop_scc_present and iop_sim_present mutually exclusive?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
