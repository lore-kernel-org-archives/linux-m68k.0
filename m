From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: m68k v3.16 status update
Date: Wed, 20 Dec 2017 14:42:03 +1300
Message-ID: <CAOmrzk+p--smOeV1j=7FF9vREOoq-2_of+sAtKEcQFQTpWr3+Q@mail.gmail.com>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com>
 <53E48C84.9090709@gmail.com> <53E4DDF1.9060701@kopteri.net>
 <53E54E6C.2040806@gmail.com> <53E5C3A7.3040106@kopteri.net>
 <68e92278-86e7-faef-f5b2-fbc514c27464@gmail.com> <4403d779c1664692ae5a7ef5b69ec888@aalto.fi>
 <CAOmrzkJJXZb153ig=d=Cywr59hid7X3UJvUD-wgtYtZm7KsCuQ@mail.gmail.com>
 <alpine.LNX.2.21.1712151039050.3@nippy.intranet> <CAOmrzkKgHEO8BY-z5hXKoJFgb7SpZF55jjkeo-9v34PkqsYt_Q@mail.gmail.com>
 <alpine.LNX.2.21.1712191358160.3@nippy.intranet> <d5f920dd-6678-d3a7-d823-e6524f3611cd@gmail.com>
 <alpine.LNX.2.21.1712200935490.3@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:40734 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751559AbdLTBmE (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 19 Dec 2017 20:42:04 -0500
Received: by mail-it0-f45.google.com with SMTP id f190so4998934ita.5
        for <linux-m68k@vger.kernel.org>; Tue, 19 Dec 2017 17:42:04 -0800 (PST)
In-Reply-To: <alpine.LNX.2.21.1712200935490.3@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Vainikka Tuomas <tuomas.vainikka@aalto.fi>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>

Hi Finn,

On Wed, Dec 20, 2017 at 12:01 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
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
>         if ((dma_addr_t)dma_addr == esp->command_block_dma && esp_count < 4) {
>                 zorro_esp_send_pio_cmd(esp, (u32)esp->command_block, esp_count,
>                                        dma_count, write, cmd);
>                 return;
>         }
>
>         /* do the usual DMA... */
> }
>
> This logic completely ignores data transfers (including sense transfers)
> but it is simple and self-contained and should get the job done.

That's one way to do this, yes.

> From what you said, I think you already arrived at this code (or something
> equivalent). Is there a problem? Do we have to do PIO data transfers too?

I test for phase == ESP_MIP and direct to the PIO routine, and use the
following code to fix up the transfer address there:

+       /* extended message in transfer? need to fixup addr */
+       if (cmd == ESP_CMD_TI && addr == esp->command_block_dma)
+               addr = (u32) esp->command_block;
+

Note that addr = phys_to_virt((u32) esp->command_block_dma) works just
the same (even though phys_to_virt((u32) esp->command_block_dma) !=
esp->command_block).

We don't have to do PIO data transfers - would have been useful to
debug DMA issues on 'new' boards but not essential.

Your solution is simpler and more generic so I'll try that one and
will probably use it.

Cheers,

  Michael


>
> --
