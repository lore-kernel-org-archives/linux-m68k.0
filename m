From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: m68k v3.16 status update
Date: Thu, 28 Dec 2017 21:02:23 +1300
Message-ID: <118e7cd3-dd10-2f41-0515-480fff370f4e@gmail.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:45479 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751043AbdL1ICb (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 28 Dec 2017 03:02:31 -0500
Received: by mail-io0-f180.google.com with SMTP id e204so37568189iof.12
        for <linux-m68k@vger.kernel.org>; Thu, 28 Dec 2017 00:02:30 -0800 (PST)
In-Reply-To: <alpine.LNX.2.21.1712200935490.3@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Vainikka Tuomas <tuomas.vainikka@aalto.fi>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>

Hi Finn,

Am 20.12.2017 um 12:01 schrieb Finn Thain:
> On Tue, 19 Dec 2017, Michael Schmitz wrote:
> 
>>
>> esp->command_block_dma is mapped at driver init time so we don't get to 
>> chose at command submission time.
> 
> When the command is submitted, ops->send_dma_cmd() can do something like 
> this,
> 
> static void zorro_esp_send_dma_cmd(struct esp *esp, u32 dma_addr, u32 esp_count,
>                                    u32 dma_count, int write, u8 cmd);
> {
> 	if ((dma_addr_t)dma_addr == esp->command_block_dma && esp_count < 4) {
> 		zorro_esp_send_pio_cmd(esp, (u32)esp->command_block, esp_count,
> 		                       dma_count, write, cmd);
> 		return;
> 	}
> 
> 	/* do the usual DMA... */
> }
> 
> This logic completely ignores data transfers (including sense transfers) 
> but it is simple and self-contained and should get the job done.

Oddly enough, this does not quite work. Due to my settings in the
adapter probe function (I don't set the ESP_FLAG_DISABLE_SYNC flag), the
ESP core uses 'select with attention and stop' instead of the normal
select with attention command, which attempts to send just a single byte
IDENTIFY message, and defers sending tag bytes to a later separate
message out phase. The PIO routine I lifted from the Mac ESP driver
apparently does not sucessfully send such a short message (or the select
with attention and stop command requires special handshake).

Setting the ESP_FLAG_DISABLE_SYNC avoids triggering this behaviour.

You should be able to reproduce this on Mac by omitting the
ESP_FLAG_DISABLE_SYNC in the PIO case (just for testing - I don't
advocate letting the driver negotiate sync transfers that PIO can't
actually handle).

I think I'll give up on trying to make PIO transfers work in the general
case on Amiga, at least for now. I'll add comments to the Zorro PIO code
warning that this is only meant as a workaround for extended message in
transfer, and will fail on ESP_CMD_SELAS commands.

Cheers,

	Michael
