From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: esp_scsi, was Re: Modified Linux 4.1.20 (mac+scsi) on Quadra
 660av
Date: Tue, 1 Nov 2016 20:00:04 +1300
Message-ID: <1b5c4c4d-2524-6686-4c0c-0aa80016e9a1@gmail.com>
References: <579F54CA.7010009@yahoo.com>
 <alpine.LNX.2.00.1608021112170.25032@nippy.intranet>
 <57A0CACE.8060801@yahoo.com>
 <alpine.LNX.2.00.1608031413180.2246@nippy.intranet>
 <81b56e9c-21bf-09c1-6faa-2c79937b7557@gmail.com>
 <alpine.LNX.2.00.1610281447190.29347@nippy.intranet>
 <eab997b4-16be-2f63-1bc8-3d5030cc254e@gmail.com>
 <alpine.LNX.2.00.1610301649530.22486@nippy.intranet>
 <07619c3e-0786-cacf-9fcb-e32e5ed77a09@gmail.com>
 <alpine.LNX.2.00.1611011012510.23137@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pf0-f178.google.com ([209.85.192.178]:35060 "EHLO
        mail-pf0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1167320AbcKAHAN (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 1 Nov 2016 03:00:13 -0400
Received: by mail-pf0-f178.google.com with SMTP id s8so90371569pfj.2
        for <linux-m68k@vger.kernel.org>; Tue, 01 Nov 2016 00:00:13 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1611011012510.23137@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Mac User <userm57@yahoo.com>, linux-m68k@vger.kernel.org, Tuomas Vainikka <tuomas.vainikka@aalto.fi>

Hi Finn,

>>> The SEL-with-ATN process is discussed in the "Configuration Register 
>>> 3" section, Bit 3, in 
>>> http://www.ibiblio.org/pub/historic-linux/early-ports/Sparc/NCR/NCR53C9X.txt
>>
>> What chip revision is this doc for?
> 
> It can only be FAS100A. That's the document which David cited when he 
> posted his ESP_CONFIG2_SCSI2ENAB patch in 2014, which is why I was using 
> it. I think the documents Kars cited may be more relevant in this case:
> http://www.spinics.net/lists/linux-scsi/msg73856.html
> (those documents are all available from bitsavers).

Thanks, I'll look at those again.

>> As far as I can make out, it should be fas100a? The esp_scsi.h comments 
>> suggest the tagged queuing bit is for revisions fas236. The chips used 
>> on Macs were probably esp236 or fas236? Depending on the
> 
> The Quadras I've used have ESP236 chips, according to esp_scsi detection. 

Right - we've already established that bit 6 (ESP_CONFIG3_TBMS) is what
we need (plus possibly bit 5).

>> The ESP driver explicitly clears this bit and only sets it for the 
>> FAS236 variant (using it as fast clock bit there). The logic for setting 
>> a target's config3 value refer to the stored config for target 0, and 
>> the only place I can see that get initialized is again in esp_get_rev(). 
>> First to 5, then to 0 once it's clear the register even exists. We could 
>> set bit 3 here, but it may not matter for the chip revisions that we are 
>> interested in... Better set bit 6 (ESP_CONFIG3_TBMS) in our 
>> esp_slave_configure() hook?
> 
> That hook lets particular board-specific drivers disable particular 
> features for particular targets. It would be better, I think, to fix this 
> in the core driver, so that any target is free to use three byte messages 
> regardless of the board-specific driver (except ESP100 I guess).

That would be the best solution, but from what I understand, no one has
reported this bug for revisions > FAS236. I'd rather not touch these
cases - can't test them.

> 
> Besides, ESP_CONFIG3_EWIDE == ESP_CONFIG3_TBMS, so this bit will get wiped 
> in esp_reset_cleanup() anyway. Probably this should be conditional on 
> FASHME. I think there's a similar bug in esp_data_bytes_sent().

Oops - these bits should be cleared only for FAS100A and HME. I don't
think we redo domain validation after a bus reset so clearing the bits
here means they are lost for good.
Can't spot a bug in esp_data_bytes_sent() though.

>>> Anyway, is safe to do this?
>>>
>>>         esp->ops->send_dma_cmd(esp, esp->command_block_dma,
>>>                                2, 2, 1, ESP_CMD_DMA | ESP_CMD_TI);
>>>
>>>         /* ACK the message.  */
>>>         scsi_esp_cmd(esp, ESP_CMD_MOK);
>>>
>>> For PIO and PDMA, the transfer will be finished before the MOK 
>>> ("Message Accepted") command, but for DMA this seems to be racey...
>>
>> It sure is racey. Is there a DMA complete interrupt that you can wait 
>> for before proceeding with the ACK?
> 
> That code comes from esp_reconnect_with_tag(). The interrupt you asked 
> about never shows up, hence, "Reconnect IRQ2 timeout".

OK, I see the later loop to check for the FDONE status bit. If the ESP
chip never reads in the missing tag bytes, we ACK a message that we
haven't really fully received. But we're treating this as an error
anyway so the cleanup will take care of that. In the normal case, I
suppose the ESP chip has read all message bytes into the FIFO so the ACK
there is probably OK.

Could be moved until after the IRQ2 checking loop to make sure (not
certain what this'll do to the target - is there a max. time to ACK the
message before the target stuffs up?).

> Anyway, there must about 3 potential patches from this discussion. I say 
> we do as Geert suggests and move the discussion to the kernel.org lists 
> (with code, of course).

Agreed - the three patches I see so far would be

- set config2 SCSI2 enable bit as originally proposed by Dave,

- correct the esp_reset_cleanup() bug so a reset won't wipe out our
config3 ESP_CONFIG3_TBMS and ESP_CONFIG3_GTM bits

- set ESP_CONFIG3_TBMS and ESP_CONFIG3_GTM for all targets in either
esp_slave_configure() or esp_reset_esp()

Is that what you had in mind?

Cheers,

	Michael
