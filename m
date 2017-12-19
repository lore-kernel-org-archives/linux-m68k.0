From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: m68k v3.16 status update
Date: Tue, 19 Dec 2017 19:11:55 +1300
Message-ID: <d5f920dd-6678-d3a7-d823-e6524f3611cd@gmail.com>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com>
 <53E48C84.9090709@gmail.com> <53E4DDF1.9060701@kopteri.net>
 <53E54E6C.2040806@gmail.com> <53E5C3A7.3040106@kopteri.net>
 <68e92278-86e7-faef-f5b2-fbc514c27464@gmail.com>
 <4403d779c1664692ae5a7ef5b69ec888@aalto.fi>
 <CAOmrzkJJXZb153ig=d=Cywr59hid7X3UJvUD-wgtYtZm7KsCuQ@mail.gmail.com>
 <alpine.LNX.2.21.1712151039050.3@nippy.intranet>
 <CAOmrzkKgHEO8BY-z5hXKoJFgb7SpZF55jjkeo-9v34PkqsYt_Q@mail.gmail.com>
 <alpine.LNX.2.21.1712191358160.3@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:41184 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759987AbdLSGMD (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 19 Dec 2017 01:12:03 -0500
Received: by mail-it0-f52.google.com with SMTP id x28so1465726ita.0
        for <linux-m68k@vger.kernel.org>; Mon, 18 Dec 2017 22:12:03 -0800 (PST)
In-Reply-To: <alpine.LNX.2.21.1712191358160.3@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Vainikka Tuomas <tuomas.vainikka@aalto.fi>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>

Hi Finn,

Am 19.12.2017 um 16:35 schrieb Finn Thain:
> On Tue, 19 Dec 2017, Michael Schmitz wrote:
> 
>> Contrary to the Mac driver, esp->command_block and 
>> esp->command_block_dma are not identical addresses on Amiga.
> 
> Why not make them identical, depending on the length of the tranfer? (Then 
> choose PIO or DMA by testing for the same threshold.)

esp->command_block_dma is mapped at driver init time so we don't get to
chose at command submission time. I suspect it's due to a different
memory layout on Amiga (no 1:1 correspondence of physical and kernel
virtual addresses). But Geert ought to be able to answer that.

>> Is there a generic way to map a DMA address (i.e., physical address 
>> AFAIK) to a kernel virtual one?
>>
> 
> I don't know of a good way to do that.
> 
>> (I can use esp->command_block in the reconnect message special case but 
>> not otherwise ...)
> 
> Maybe something like this...
> 
> 	struct esp_cmd_entry *ent = esp->active_cmd;
> 	struct esp_cmd_priv *spriv = ESP_CMD_PRIV(ent->cmd);
> 	struct scatterlist *sg = spriv->cur_sg;
> 	unsigned long addr = sg_page(sg) + sg->offset;
> 
> but that doesn't work for the esp_autosense() case, which doesn't involve 
> esp->ops->map_sg...
> 
> HTH

I'll give that a try to see if this works for regular transfers. Will
look at ways to identify autosense as well (do sense data fit into the
ESP FIFO usually?)

Cheers,

	Michael
