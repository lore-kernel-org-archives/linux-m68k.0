From: Matthew Lear <matt@bubblegen.co.uk>
Subject: Re: 2.6.29 & network stack strangeness
Date: Wed, 10 Jun 2009 10:36:08 +0100
Message-ID: <4A2F7E88.6040602@bubblegen.co.uk>
References: <4A2936AF.4080601@bubblegen.co.uk>    <Pine.LNX.4.64.0906060149130.16687@loopy.telegraphics.com.au>    <4A294532.7030904@bubblegen.co.uk>    <Pine.LNX.4.64.0906060233071.16687@loopy.telegraphics.com.au>    <4A294B63.7010404@bubblegen.co.uk> <4A2DC70F.7080401@freescale.com> <3585ad3f94615c5bfa3f8100f6cfeb0d.squirrel@webmail.plus.net> <4A2F1C74.1010800@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from relay.ptn-ipout01.plus.net ([212.159.7.35]:33882 "EHLO
	relay.ptn-ipout01.plus.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756661AbZFJJgJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 10 Jun 2009 05:36:09 -0400
In-Reply-To: <4A2F1C74.1010800@freescale.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Lanttor <lanttor.guo@freescale.com>
Cc: linux-m68k@vger.kernel.org

Lanttor wrote:
> I met the interrupt issue before on mcf5445x platform, following is my fixed patch, but I am not sure it could help resolve your problem, just have a try  :-) 

Thanks but this makes no difference. From what I can tell, the patch to entry.S
is essentially benign because ret_from_interrupt() is not invoked anywhere.

Also, the patch to ints.c adds invocations of irq_enter() and irq_exit()
to process_int(). These macros really just force entry/exit to/from hard
interrupt context and increment/decrement a count (used for tracking
nested interrupts). Given that process_int() is called by inthandler() in
entry.S, I think this is always going to be in interrupt context anyway, so I
can't see the advantage of this. Maybe I'm missing something?

> 
> For your mcf54455 platform, if you use one ether net port, try to disable second ether net port (FEC2) on the menuconfig to see whether it would affect the net working. 

Yes. I've already got the second net port disabled.

I have had some level of success by calling flush_cache_all() immediately after
calling netif_rx() in the rx part of the fec interrupt handler - fec_enet_rx()
in fec.c.

This plus a hack to netif_rx() seems to vastly improve things in that I can wget
large files, run netcat tests although in the cast of netcat there is still a
high number of rx overruns in the fec driver.

Hack:

--- a/net/core/dev.c        2009-05-12 07:02:24.000000000 +0100
+++ b/net/core/dev.c       2009-06-10 10:26:47.000000000 +0100
@@ -1969,16 +1969,18 @@
                        __skb_queue_tail(&queue->input_pkt_queue, skb);
                        local_irq_restore(flags);
                        return NET_RX_SUCCESS;
                }

                napi_schedule(&queue->backlog);
                goto enqueue;
        }
+        else
+                napi_schedule(&queue->backlog);

        __get_cpu_var(netdev_rx_stat).dropped++;
        local_irq_restore(flags);

        kfree_skb(skb);
        return NET_RX_DROP;
 }

This effectively ignores the backlog check and schedules the receive function to
run.

I think all this points to is that there is a timing problem in the system. That
said, I can believe the cache coherency issue as I've read some postings on the
net about similar issues with ethernet tx on ppc...

--  Matt
