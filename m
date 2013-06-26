From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: iop_msg_pool
Date: Wed, 26 Jun 2013 11:45:40 +0200
Message-ID: <CAMuHMdUCMUkoDbTFFXnVp-6E0LO5Y=4t64E13cWSpS1jVr2D_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:41499 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751631Ab3FZJpk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 26 Jun 2013 05:45:40 -0400
Received: by mail-pb0-f53.google.com with SMTP id xb12so13868887pbc.26
        for <linux-m68k@vger.kernel.org>; Wed, 26 Jun 2013 02:45:40 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

arch/m68k/mac/iop.c has:

static struct iop_msg iop_msg_pool[NUM_IOP_MSGS];

As iop_msg_pool consumes 4928 bytes, it should be allocated dynamically,
especially for multi-platform kernels not running on Mac.

Furthermore:

/*
 * Initialize the IOPs, if present.
 */

void __init iop_init(void)
{
        int i;

        if (iop_scc_present) {
                printk("IOP: detected SCC IOP at %p\n", iop_base[IOP_NUM_SCC]);
        }
        if (iop_ism_present) {
                printk("IOP: detected ISM IOP at %p\n", iop_base[IOP_NUM_ISM]);
                iop_start(iop_base[IOP_NUM_ISM]);
                iop_alive(iop_base[IOP_NUM_ISM]); /* clears the alive flag */
        }

        /* Make the whole pool available and empty the queues */

        for (i = 0 ; i < NUM_IOP_MSGS ; i++) {
                iop_msg_pool[i].status = IOP_MSGSTATUS_UNUSED;
        }

        for (i = 0 ; i < NUM_IOP_CHAN ; i++) {
                iop_send_queue[IOP_NUM_SCC][i] = NULL;
                iop_send_queue[IOP_NUM_ISM][i] = NULL;
                iop_listeners[IOP_NUM_SCC][i].devname = NULL;
                iop_listeners[IOP_NUM_SCC][i].handler = NULL;
                iop_listeners[IOP_NUM_ISM][i].devname = NULL;
                iop_listeners[IOP_NUM_ISM][i].handler = NULL;
        }
}

However, despite the comment at the top, all of the above is done
unconditionally?
Do all Macs use the IOP functionality?

P.S. Before anyone mentions zorro_autocon: yes, it's on my list ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
