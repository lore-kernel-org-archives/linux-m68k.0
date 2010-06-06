From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH 0/11] m68k: Atari EtherNAT Updates
Date: Sun, 06 Jun 2010 05:59:47 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1006060547550.1329@zirkon.biophys.uni-duesseldorf.de>
References: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:40678 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751211Ab0FFE7u (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 6 Jun 2010 00:59:50 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-11.01 (built Feb 12 2010; 32bit))
 id <0L3K00700R3OFA00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Sun, 06 Jun 2010 05:59:48 +0200 (MEST)
In-reply-to: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Geert,

> 	Hi Michael,
> 
> As the Atari EtherNAT driver no longer compiles in post-2.6.34, I ported all
> recent changes to the smc91x driver to it.

You're an angel! I will pull your tree and try to compile the updated driver. 
Was my backwards compatibility patch to the kernel ld script ever applied? 

Getting the kernel to the Falcon will be a bit of a problem - my new PC has no 
floppy driver (the old main board was fried when we got a smart power meter 
installed) and the Falcon isn't currently on the network. 
 
>       m68k: Atari EtherNAT - request_irq - Remove unnecessary leading & from sec
>       m68k: Atari EtherNAT - convert to dev_pm_ops
>       m68k: Atari EtherNAT - Fix irq flags
>       m68k: Atari EtherNAT - fix unused flags warnings on UP systems
>       m68k: Atari EtherNAT - Fix up type mismatch in smc_drv_resume().
>       m68k: Atari EtherNAT - use netdev_mc_count and netdev_mc_empty when approp
>       m68k: Atari EtherNAT - convert multiple drivers to use netdev_for_each_mc_
>       m68k: Atari EtherNAT - remove trailing space in messages
>       m68k: Atari EtherNAT - include cleanup: slab.h
>       m68k: Atari EtherNAT - convert multicast list to list_head
>       m68k: Atari EtherNAT - trans_start cleanups

Lots of patches - much appreciated!

Thanks,

	Michael
