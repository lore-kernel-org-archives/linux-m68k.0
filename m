From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: m68k v3.16 status update
Date: Fri, 29 Dec 2017 11:02:01 +1100 (AEDT)
Message-ID: <alpine.LNX.2.21.1712290945330.3@nippy.intranet>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com> <53E48C84.9090709@gmail.com> <53E4DDF1.9060701@kopteri.net> <53E54E6C.2040806@gmail.com> <53E5C3A7.3040106@kopteri.net> <68e92278-86e7-faef-f5b2-fbc514c27464@gmail.com>
 <4403d779c1664692ae5a7ef5b69ec888@aalto.fi> <CAOmrzkJJXZb153ig=d=Cywr59hid7X3UJvUD-wgtYtZm7KsCuQ@mail.gmail.com> <alpine.LNX.2.21.1712151039050.3@nippy.intranet> <CAOmrzkKgHEO8BY-z5hXKoJFgb7SpZF55jjkeo-9v34PkqsYt_Q@mail.gmail.com> <alpine.LNX.2.21.1712191358160.3@nippy.intranet>
 <d5f920dd-6678-d3a7-d823-e6524f3611cd@gmail.com> <alpine.LNX.2.21.1712200935490.3@nippy.intranet> <118e7cd3-dd10-2f41-0515-480fff370f4e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:34220 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753943AbdL2ABv (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 28 Dec 2017 19:01:51 -0500
In-Reply-To: <118e7cd3-dd10-2f41-0515-480fff370f4e@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Vainikka Tuomas <tuomas.vainikka@aalto.fi>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>

On Thu, 28 Dec 2017, Michael Schmitz wrote:

> 
> Oddly enough, this does not quite work. Due to my settings in the 
> adapter probe function (I don't set the ESP_FLAG_DISABLE_SYNC flag), the 
> ESP core uses 'select with attention and stop' instead of the normal 
> select with attention command,

I don't know why the driver would need to use ESP_CMD_SELAS over 
ESP_CMD_SA3. It might be interesting to bypass the ESP_FLAG_DOING_SLOWCMD 
test entirely.

> which attempts to send just a single byte IDENTIFY message, and defers 
> sending tag bytes to a later separate message out phase. The PIO routine 
> I lifted from the Mac ESP driver apparently does not sucessfully send 
> such a short message (or the select with attention and stop command 
> requires special handshake).
> 

That routine does not expect esp->ireg & ~ESP_INTR_BSERV when sending. But 
with ESP_CMD_SELAS, you'll get ESP_INTR_FDONE | ESP_INTR_BSERV. One 
datasheet says,

        Select with ATN and Stop

        This command should be used in place of [Select with ATN] when 
        multiple message phase bytes are to be sent. The command will 
        select a target with ATN asserted, send one message byte, and 
        generate bus service and function complete interrupts, and stop.

A different datasheet (probably a more appropriate one) says,

        The Select with ATN and Stop Steps Command is used by the 
        Initiator to send messages with lengths other than 1 or 3 bytes. 
        When this command is issued, the device executes the Selection 
        process, transfers the first message byte, then STOPS the 
        sequence. ATN is not deasserted at this time, allowing the 
        Initiator to send additional message bytes after the ID message. 
        To send these additional bytes, the Initiator must write the 
        transfer counter with the number of bytes which will follow, then 
        issue an information transfer command. (Note: the Target is still 
        in the message out phase when this command is issued). ATN will 
        remain asserted until the transfer counter decrements to zero.

This suggests to me that the interrupt needs to be cleared and handled 
before the transfer of the extra message bytes.

> Setting the ESP_FLAG_DISABLE_SYNC avoids triggering this behaviour.
> 
> You should be able to reproduce this on Mac by omitting the 
> ESP_FLAG_DISABLE_SYNC in the PIO case (just for testing - I don't 
> advocate letting the driver negotiate sync transfers that PIO can't 
> actually handle).
> 

My Quadras aren't here with me at the moment. But I have some esp_scsi 
debug logs that Stan captured on his Mac (I have a script to decode 
these):

scsi host0: cmd[01 = ESP_CMD_FLUSH]
scsi host0: cmd[c3 = ESP_CMD_SELAS ESP_CMD_DMA]
scsi host0: intr        sreg[96 = ESP_STAT_TCNT ESP_STAT_INTR ESP_MOP]  seqreg[91]      sreg2[00 =]     ireg[18 = ESP_INTR_FDONE ESP_INTR_BSERV]
scsi host0: cmd[00 = ESP_CMD_NULL]
scsi host0: cmd[01 = ESP_CMD_FLUSH]
scsi host0: event[0d = ESP_EVENT_CHECK_PHASE]   phase[06 = ESP_MOP]
scsi host0: event[09 = ESP_EVENT_MSGOUT]        phase[06 = ESP_MOP]
scsi host0: cmd[01 = ESP_CMD_FLUSH]
ESP: Sending message [
01
03
01
4c
0f
]
scsi host0: cmd[01 = ESP_CMD_FLUSH]
scsi host0: cmd[90 = ESP_CMD_TI ESP_CMD_DMA]

I can't see why that wouldn't work in the PIO case. The interrupt flags 
would have been cleared well before ESP_EVENT_MSGOUT.

Perhaps ESP_FLAG_DOING_SLOWCMD never happens on Quadras.

> I think I'll give up on trying to make PIO transfers work in the general 
> case on Amiga, at least for now.

Yes, I agree. AFAICT we can't handle the general case without core driver 
concerns leaking into the wrapper driver (which harms modularity), unless
we refactor all of the wrapper drivers (mac_esp, jazz_esp, am53c974 etc).

-- 

> I'll add comments to the Zorro PIO code warning that this is only meant 
> as a workaround for extended message in transfer, and will fail on 
> ESP_CMD_SELAS commands.
> 
> Cheers,
> 
> 	Michael
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
