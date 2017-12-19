From: Finn Thain <fthain@telegraphics.com.au>
Subject: zorro_esp, was Re: m68k v3.16 status update
Date: Wed, 20 Dec 2017 09:06:50 +1100 (AEDT)
Message-ID: <alpine.LNX.2.21.1712191835410.3@nippy.intranet>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com> <53E48C84.9090709@gmail.com> <53E4DDF1.9060701@kopteri.net> <53E54E6C.2040806@gmail.com> <53E5C3A7.3040106@kopteri.net> <68e92278-86e7-faef-f5b2-fbc514c27464@gmail.com>
 <4403d779c1664692ae5a7ef5b69ec888@aalto.fi> <CAOmrzkJJXZb153ig=d=Cywr59hid7X3UJvUD-wgtYtZm7KsCuQ@mail.gmail.com> <alpine.LNX.2.21.1712151039050.3@nippy.intranet> <CAOmrzkKgHEO8BY-z5hXKoJFgb7SpZF55jjkeo-9v34PkqsYt_Q@mail.gmail.com> <alpine.LNX.2.21.1712191358160.3@nippy.intranet>
 <d5f920dd-6678-d3a7-d823-e6524f3611cd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:55116 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750859AbdLSWGw (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 19 Dec 2017 17:06:52 -0500
In-Reply-To: <d5f920dd-6678-d3a7-d823-e6524f3611cd@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Vainikka Tuomas <tuomas.vainikka@aalto.fi>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>

On Tue, 19 Dec 2017, Michael Schmitz wrote:

> > 
> > > Contrary to the Mac driver, esp->command_block and 
> > > esp->command_block_dma are not identical addresses on Amiga.
> > 
> > Why not make them identical, depending on the length of the tranfer? 
> > (Then choose PIO or DMA by testing for the same threshold.)
> 
> esp->command_block_dma is mapped at driver init time so we don't get to 
> chose at command submission time.

You could set esp->command_block_dma to an address like 0xffffffff. Then 
when zorro_esp's ops->send_dma_cmd method is to do a DMA to or from that 
address, check the transfer length. If the length is small, use 
esp->command_block as the address for a PIO transfer. Otherwise, use the 
mapped esp->command_block (which you saved somewhere at driver init time) 
for a DMA transfer.

This is a hack, of course. Perhaps we can avoid the hack if we pass the 
virtual address as an argument to ops->send_dma_cmd.

(Or *sg could be passed, if we cook up a couple of scattergather structs 
to replace ent->sense_ptr and esp->command_block. This might allow for the 
elimination of ops->map_single and ops->unmap_single altogether...)

> > 
> > > (I can use esp->command_block in the reconnect message special case 
> > > but not otherwise ...)
> > 
> > Maybe something like this...
> > 
> > 	struct esp_cmd_entry *ent = esp->active_cmd;
> > 	struct esp_cmd_priv *spriv = ESP_CMD_PRIV(ent->cmd);
> > 	struct scatterlist *sg = spriv->cur_sg;
> > 	unsigned long addr = sg_page(sg) + sg->offset;
> > 
> > but that doesn't work for the esp_autosense() case, which doesn't 
> > involve esp->ops->map_sg...
> > 
> > HTH
> 
> I'll give that a try to see if this works for regular transfers.
> 
> Will look at ways to identify autosense as well (do sense data fit into 
> the ESP FIFO usually?)

You can identify the autosense case easily enough,

	struct esp_cmd_entry *ent = esp->active_cmd;
	struct esp_cmd_priv *spriv = ESP_CMD_PRIV(ent->cmd);
	unsigned long addr;

	if (ent->flags & ESP_CMD_FLAG_AUTOSENSE)
		addr = spriv->sense_ptr;
	else {
		struct scatterlist *sg = spriv->cur_sg;

		addr = sg_page(sg) + sg->offset;
	}

But that still leaves the command_block case unhandled (I don't think we 
can use spriv->cur_sg for that, so we'd need a hack like the one above). 

All this complexity doesn't really belong in the ops->send_dma_cmd method, 
so I think we are back to passing in the virtual pointer as a parameter. 

That change would touch every esp driver. But it could improve mac_esp, 
since mac_esp would no longer have to do any fake dma mapping. Maybe I 
should do a patch for this?

-- 

> 
> Cheers,
> 
> 	Michael
> 
> 
