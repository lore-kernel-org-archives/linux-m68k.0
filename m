From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: esp_scsi, was Re: Modified Linux 4.1.20 (mac+scsi) on Quadra
 660av
Date: Wed, 2 Nov 2016 20:18:08 +1300
Message-ID: <68fde294-4211-5984-a42d-8ded31b1a7c8@gmail.com>
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
 <1b5c4c4d-2524-6686-4c0c-0aa80016e9a1@gmail.com>
 <alpine.LNX.2.00.1611020905110.23787@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pf0-f174.google.com ([209.85.192.174]:32858 "EHLO
        mail-pf0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751593AbcKBHSP (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 2 Nov 2016 03:18:15 -0400
Received: by mail-pf0-f174.google.com with SMTP id d2so6952978pfd.0
        for <linux-m68k@vger.kernel.org>; Wed, 02 Nov 2016 00:18:15 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1611020905110.23787@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org, Tuomas Vainikka <tuomas.vainikka@aalto.fi>

Hi Finn,


>>> Besides, ESP_CONFIG3_EWIDE == ESP_CONFIG3_TBMS, so this bit will get 
>>> wiped in esp_reset_cleanup() anyway. Probably this should be 
>>> conditional on FASHME. I think there's a similar bug in 
>>> esp_data_bytes_sent().
>>
>> Oops - these bits should be cleared only for FAS100A and HME. I don't 
>> think we redo domain validation after a bus reset so clearing the bits 
>> here means they are lost for good. Can't spot a bug in 
>> esp_data_bytes_sent() though.
> 
> It's not a bug, it's just that ESP_CONFIG3_EWIDE == ESP_CONFIG3_TBMS:
> 
> 	if (esp->prev_cfg3 & ESP_CONFIG3_EWIDE)
> 		fifo_cnt <<= 1;

I see - having this bit set would have side effects here.


>>> That code comes from esp_reconnect_with_tag(). The interrupt you asked 
>>> about never shows up, hence, "Reconnect IRQ2 timeout".
>>
>> OK, I see the later loop to check for the FDONE status bit. If the ESP 
>> chip never reads in the missing tag bytes, we ACK a message that we 
>> haven't really fully received. But we're treating this as an error 
>> anyway so the cleanup will take care of that.
>>
> 
> The question is, did we cause the error by releasing ACK during DMA.
> 
> But perhaps the chip is smart enough to handle the two commands 
> back-to-back: Transfer Information followed by Accept Message.

You can queue two commands in the command fifo - the Accept Message
would only be run once the Transfer Information is complete.

We can read back the command register to see which command was last
excecuting (or still is). I suspect it's the Transfer Information here.

> The complication is that the spec demands that certain messages be 
> acknowleged with /ATN negated before the final negation of /ACK. I think 
> that negating /ACK with /ATN asserted signals message rejection.

Yep, that's my reading as well.

> 
> Perhaps that's the problem here: scsi_esp_cmd(esp, ESP_CMD_SATN) occurs 
> after the transfer, but instead probably should be scsi_esp_cmd(esp, 

Where? In esp_reconnect, we don't get to that point when returning from
esp_reconnect_with_tag() after timeout. And without timeout, there's
still the check for ESP_CMD_FLAG_ABORT which I don't see set anywhere.

> ESP_CMD_RATN) before scsi_esp_cmd(esp, ESP_CMD_MOK). It would be easy to 
> believe that some targets don't tolerate this.
> 
> Anyway, I suspect our problem lies in this reselection message transfer, 
> not in the configuration registers.

How does the target signal end of message in phase? Stop handshaking, or
change phase? ATN going false?

With the DMA programmed for two tag bytes, and the reselection
originating from a tagged command, I would expect the target to send the
two tag bytes. Would it help to do the message transfer without DMA?

> 
>>
>>> Anyway, there must about 3 potential patches from this discussion. I say 
>>> we do as Geert suggests and move the discussion to the kernel.org lists 
>>> (with code, of course).
>>
>> Agreed - the three patches I see so far would be
>>
>> - set config2 SCSI2 enable bit as originally proposed by Dave,
>>
>> - correct the esp_reset_cleanup() bug so a reset won't wipe out our 
>>   config3 ESP_CONFIG3_TBMS and ESP_CONFIG3_GTM bits
>>
>> - set ESP_CONFIG3_TBMS and ESP_CONFIG3_GTM for all targets in either 
>>   esp_slave_configure() or esp_reset_esp()
>>
>> Is that what you had in mind?
> 
> Something like that. All of which is based on the notion that the config2 
> SCSI2 Enable bit could be useful for an initiator. But that notion looks 
> more and more dubious to me --
> 
> What use could an initiator have for the Group Two Command Block bit 
> (ESP_CONFIG3_GTM)?

Upon closer reading of the docs, none.

> What use could an initiator have for the QTAG Control bit 
> (ESP_CONFIG3_TBMS) when the target never controls /ATN? (I only remembered 
> this yesterday, so please ignore my earlier comments about reselection and 
> SEL-with-ATN.)

I had thought the reselection process similar to selection. But if the
target does not signal further message bytes by keepin ATN asserted,
that bit might not matter here.

Are we dealing with SCSI disks that fool the domain validation into
assuming tagged queuing capability, and then ignore the tag message
bytes, sending only the identify message byte on reselection?

Trying to make reconnect_with_tag work for these disks would be foolish
indeed ...

Cheers,

	Michael
