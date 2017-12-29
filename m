From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: m68k v3.16 status update
Date: Fri, 29 Dec 2017 22:09:56 +1300
Message-ID: <4d17b971-2f42-6d37-1498-79863b3b8f13@gmail.com>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com>
 <53E48C84.9090709@gmail.com> <53E4DDF1.9060701@kopteri.net>
 <53E54E6C.2040806@gmail.com> <53E5C3A7.3040106@kopteri.net>
 <68e92278-86e7-faef-f5b2-fbc514c27464@gmail.com>
 <4403d779c1664692ae5a7ef5b69ec888@aalto.fi>
 <CAOmrzkJJXZb153ig=d=Cywr59hid7X3UJvUD-wgtYtZm7KsCuQ@mail.gmail.com>
 <alpine.LNX.2.21.1712151039050.3@nippy.intranet>
 <CAOmrzkKgHEO8BY-z5hXKoJFgb7SpZF55jjkeo-9v34PkqsYt_Q@mail.gmail.com>
 <alpine.LNX.2.21.1712191358160.3@nippy.intranet>
 <d5f920dd-6678-d3a7-d823-e6524f3611cd@gmail.com>
 <alpine.LNX.2.21.1712200935490.3@nippy.intranet>
 <118e7cd3-dd10-2f41-0515-480fff370f4e@gmail.com>
 <alpine.LNX.2.21.1712290945330.3@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pl0-f41.google.com ([209.85.160.41]:40073 "EHLO
        mail-pl0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755385AbdL2JKE (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 29 Dec 2017 04:10:04 -0500
Received: by mail-pl0-f41.google.com with SMTP id 62so21253189pld.7
        for <linux-m68k@vger.kernel.org>; Fri, 29 Dec 2017 01:10:04 -0800 (PST)
In-Reply-To: <alpine.LNX.2.21.1712290945330.3@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Vainikka Tuomas <tuomas.vainikka@aalto.fi>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>

Hi Finn,

Am 29.12.2017 um 13:02 schrieb Finn Thain:
> On Thu, 28 Dec 2017, Michael Schmitz wrote:
> 
>>
>> Oddly enough, this does not quite work. Due to my settings in the 
>> adapter probe function (I don't set the ESP_FLAG_DISABLE_SYNC flag), the 
>> ESP core uses 'select with attention and stop' instead of the normal 
>> select with attention command,
> 
> I don't know why the driver would need to use ESP_CMD_SELAS over 
> ESP_CMD_SA3. It might be interesting to bypass the ESP_FLAG_DOING_SLOWCMD 
> test entirely.

As far as I understand the code, this is done when sync transfer
parameters or wide transfer hasn't been negotiated for a target yet. A
precaution, IOW.

> 
>> which attempts to send just a single byte IDENTIFY message, and defers 
>> sending tag bytes to a later separate message out phase. The PIO routine 
>> I lifted from the Mac ESP driver apparently does not sucessfully send 
>> such a short message (or the select with attention and stop command 
>> requires special handshake).
>>
> 
> That routine does not expect esp->ireg & ~ESP_INTR_BSERV when sending. But 
> with ESP_CMD_SELAS, you'll get ESP_INTR_FDONE | ESP_INTR_BSERV. One 
> datasheet says,
> 
>         Select with ATN and Stop
> 
>         This command should be used in place of [Select with ATN] when 
>         multiple message phase bytes are to be sent. The command will 
>         select a target with ATN asserted, send one message byte, and 
>         generate bus service and function complete interrupts, and stop.
> 
> A different datasheet (probably a more appropriate one) says,
> 
>         The Select with ATN and Stop Steps Command is used by the 
>         Initiator to send messages with lengths other than 1 or 3 bytes. 
>         When this command is issued, the device executes the Selection 
>         process, transfers the first message byte, then STOPS the 
>         sequence. ATN is not deasserted at this time, allowing the 
>         Initiator to send additional message bytes after the ID message. 
>         To send these additional bytes, the Initiator must write the 
>         transfer counter with the number of bytes which will follow, then 
>         issue an information transfer command. (Note: the Target is still 
>         in the message out phase when this command is issued). ATN will 
>         remain asserted until the transfer counter decrements to zero.
> 
> This suggests to me that the interrupt needs to be cleared and handled 
> before the transfer of the extra message bytes.

Yes, I had seen that in the data sheet. Changing the interrupt mask to
ignore ESP_INTR_FDONE in PIO read (i.e. message out) to account for
ESP_CMD_SELAS does still not give a working selection. I might have to
clear the interrupt some way.

>> Setting the ESP_FLAG_DISABLE_SYNC avoids triggering this behaviour.
>>
>> You should be able to reproduce this on Mac by omitting the 
>> ESP_FLAG_DISABLE_SYNC in the PIO case (just for testing - I don't 
>> advocate letting the driver negotiate sync transfers that PIO can't 
>> actually handle).
>>
> 
> My Quadras aren't here with me at the moment. But I have some esp_scsi 
> debug logs that Stan captured on his Mac (I have a script to decode 
> these):
> 
> scsi host0: cmd[01 = ESP_CMD_FLUSH]
> scsi host0: cmd[c3 = ESP_CMD_SELAS ESP_CMD_DMA]

Yes, that's the one.

> scsi host0: intr        sreg[96 = ESP_STAT_TCNT ESP_STAT_INTR ESP_MOP]  seqreg[91]      sreg2[00 =]     ireg[18 = ESP_INTR_FDONE ESP_INTR_BSERV]

And that's the interrupt conditions expected. I think I had seqreg c3,
can't remember the ireg values. Kernel log messages are not captured in
syslog on elgar at the moment so I haven't got a saved log.

> scsi host0: cmd[00 = ESP_CMD_NULL]
> scsi host0: cmd[01 = ESP_CMD_FLUSH]
> scsi host0: event[0d = ESP_EVENT_CHECK_PHASE]   phase[06 = ESP_MOP]
> scsi host0: event[09 = ESP_EVENT_MSGOUT]        phase[06 = ESP_MOP]
> scsi host0: cmd[01 = ESP_CMD_FLUSH]
> ESP: Sending message [
> 01
> 03
> 01
> 4c
> 0f
> ]
> scsi host0: cmd[01 = ESP_CMD_FLUSH]
> scsi host0: cmd[90 = ESP_CMD_TI ESP_CMD_DMA]
> 
> I can't see why that wouldn't work in the PIO case. The interrupt flags 
> would have been cleared well before ESP_EVENT_MSGOUT.

I can't see why either. Works OK in the DMA case (as in the PDMA case,
on Mac).

> Perhaps ESP_FLAG_DOING_SLOWCMD never happens on Quadras.

I think it doesn't happen on PIO Macs because esp->flags has
ESP_FLAG_DISABLE_SYNC set, suppressing sync negotiation (and wide
negotiation can't happen).

> 
>> I think I'll give up on trying to make PIO transfers work in the general 
>> case on Amiga, at least for now.
> 
> Yes, I agree. AFAICT we can't handle the general case without core driver 
> concerns leaking into the wrapper driver (which harms modularity), unless
> we refactor all of the wrapper drivers (mac_esp, jazz_esp, am53c974 etc).

Best not go there - all known ESP boards support DMA, or PIO out of the
box as in the Mac case. (Making sure PIO drivers use the identity
mapping as DMA mapping as you do on Mac might still be a way out though).

Cheers,

	Michael
