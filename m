From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: esp_scsi, was Re: Modified Linux 4.1.20 (mac+scsi) on Quadra
 660av
Date: Wed, 2 Nov 2016 09:10:10 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1611020905110.23787@nippy.intranet>
References: <579F54CA.7010009@yahoo.com> <alpine.LNX.2.00.1608021112170.25032@nippy.intranet> <57A0CACE.8060801@yahoo.com> <alpine.LNX.2.00.1608031413180.2246@nippy.intranet> <81b56e9c-21bf-09c1-6faa-2c79937b7557@gmail.com> <alpine.LNX.2.00.1610281447190.29347@nippy.intranet>
 <eab997b4-16be-2f63-1bc8-3d5030cc254e@gmail.com> <alpine.LNX.2.00.1610301649530.22486@nippy.intranet> <07619c3e-0786-cacf-9fcb-e32e5ed77a09@gmail.com> <alpine.LNX.2.00.1611011012510.23137@nippy.intranet> <1b5c4c4d-2524-6686-4c0c-0aa80016e9a1@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:34040 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751074AbcKAWKF (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 1 Nov 2016 18:10:05 -0400
In-Reply-To: <1b5c4c4d-2524-6686-4c0c-0aa80016e9a1@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Mac User <userm57@yahoo.com>, linux-m68k@vger.kernel.org, Tuomas Vainikka <tuomas.vainikka@aalto.fi>


On Tue, 1 Nov 2016, Michael Schmitz wrote:

> > It would be better, I think, to fix this in the core driver, so that 
> > any target is free to use three byte messages regardless of the 
> > board-specific driver (except ESP100 I guess).
> 
> That would be the best solution, but from what I understand, no one has 
> reported this bug for revisions > FAS236. I'd rather not touch these 
> cases - can't test them.

Even untested patches can carry low risk, given enough review, in which 
case we should avoid hacks.

Anyway, based on activity on the list, it seems likely that there are 
testers for the affected silicon. Besides ESP236 and FAS236, it is 
probably only FASHME and PCSCSI.

> 
> > 
> > Besides, ESP_CONFIG3_EWIDE == ESP_CONFIG3_TBMS, so this bit will get 
> > wiped in esp_reset_cleanup() anyway. Probably this should be 
> > conditional on FASHME. I think there's a similar bug in 
> > esp_data_bytes_sent().
> 
> Oops - these bits should be cleared only for FAS100A and HME. I don't 
> think we redo domain validation after a bus reset so clearing the bits 
> here means they are lost for good. Can't spot a bug in 
> esp_data_bytes_sent() though.

It's not a bug, it's just that ESP_CONFIG3_EWIDE == ESP_CONFIG3_TBMS:

	if (esp->prev_cfg3 & ESP_CONFIG3_EWIDE)
		fifo_cnt <<= 1;

> 
> >>> Anyway, is safe to do this?
> >>>
> >>>         esp->ops->send_dma_cmd(esp, esp->command_block_dma,
> >>>                                2, 2, 1, ESP_CMD_DMA | ESP_CMD_TI);
> >>>
> >>>         /* ACK the message.  */
> >>>         scsi_esp_cmd(esp, ESP_CMD_MOK);
> >>>
> >>> For PIO and PDMA, the transfer will be finished before the MOK 
> >>> ("Message Accepted") command, but for DMA this seems to be racey...
> >>
> >> It sure is racey. Is there a DMA complete interrupt that you can wait 
> >> for before proceeding with the ACK?
> > 
> > That code comes from esp_reconnect_with_tag(). The interrupt you asked 
> > about never shows up, hence, "Reconnect IRQ2 timeout".
> 
> OK, I see the later loop to check for the FDONE status bit. If the ESP 
> chip never reads in the missing tag bytes, we ACK a message that we 
> haven't really fully received. But we're treating this as an error 
> anyway so the cleanup will take care of that.
> 

The question is, did we cause the error by releasing ACK during DMA.

But perhaps the chip is smart enough to handle the two commands 
back-to-back: Transfer Information followed by Accept Message.

> In the normal case, I suppose the ESP chip has read all message bytes 
> into the FIFO so the ACK there is probably OK.
> 
> Could be moved until after the IRQ2 checking loop to make sure (not 
> certain what this'll do to the target - is there a max. time to ACK the 
> message before the target stuffs up?).

The complication is that the spec demands that certain messages be 
acknowleged with /ATN negated before the final negation of /ACK. I think 
that negating /ACK with /ATN asserted signals message rejection.

Perhaps that's the problem here: scsi_esp_cmd(esp, ESP_CMD_SATN) occurs 
after the transfer, but instead probably should be scsi_esp_cmd(esp, 
ESP_CMD_RATN) before scsi_esp_cmd(esp, ESP_CMD_MOK). It would be easy to 
believe that some targets don't tolerate this.

Anyway, I suspect our problem lies in this reselection message transfer, 
not in the configuration registers.

> 
> > Anyway, there must about 3 potential patches from this discussion. I say 
> > we do as Geert suggests and move the discussion to the kernel.org lists 
> > (with code, of course).
> 
> Agreed - the three patches I see so far would be
> 
> - set config2 SCSI2 enable bit as originally proposed by Dave,
> 
> - correct the esp_reset_cleanup() bug so a reset won't wipe out our 
>   config3 ESP_CONFIG3_TBMS and ESP_CONFIG3_GTM bits
> 
> - set ESP_CONFIG3_TBMS and ESP_CONFIG3_GTM for all targets in either 
>   esp_slave_configure() or esp_reset_esp()
> 
> Is that what you had in mind?

Something like that. All of which is based on the notion that the config2 
SCSI2 Enable bit could be useful for an initiator. But that notion looks 
more and more dubious to me --

What use could an initiator have for the Group Two Command Block bit 
(ESP_CONFIG3_GTM)?

What use could an initiator have for the QTAG Control bit 
(ESP_CONFIG3_TBMS) when the target never controls /ATN? (I only remembered 
this yesterday, so please ignore my earlier comments about reselection and 
SEL-with-ATN.)

-- 

> 
> Cheers,
> 
> 	Michael
