From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: m68k v3.16 status update
Date: Wed, 20 Dec 2017 14:34:22 +1100 (AEDT)
Message-ID: <alpine.LNX.2.21.1712201416270.3@nippy.intranet>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com> <53E48C84.9090709@gmail.com> <53E4DDF1.9060701@kopteri.net> <53E54E6C.2040806@gmail.com> <53E5C3A7.3040106@kopteri.net> <68e92278-86e7-faef-f5b2-fbc514c27464@gmail.com>
 <4403d779c1664692ae5a7ef5b69ec888@aalto.fi> <CAOmrzkJJXZb153ig=d=Cywr59hid7X3UJvUD-wgtYtZm7KsCuQ@mail.gmail.com> <alpine.LNX.2.21.1712151039050.3@nippy.intranet> <CAOmrzkKgHEO8BY-z5hXKoJFgb7SpZF55jjkeo-9v34PkqsYt_Q@mail.gmail.com> <alpine.LNX.2.21.1712191358160.3@nippy.intranet>
 <d5f920dd-6678-d3a7-d823-e6524f3611cd@gmail.com> <alpine.LNX.2.21.1712200935490.3@nippy.intranet> <CAOmrzk+p--smOeV1j=7FF9vREOoq-2_of+sAtKEcQFQTpWr3+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:60790 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753323AbdLTDeY (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 19 Dec 2017 22:34:24 -0500
In-Reply-To: <CAOmrzk+p--smOeV1j=7FF9vREOoq-2_of+sAtKEcQFQTpWr3+Q@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Vainikka Tuomas <tuomas.vainikka@aalto.fi>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>

On Wed, 20 Dec 2017, Michael Schmitz wrote:

> 
> I test for phase == ESP_MIP and direct to the PIO routine,

I'm more pessimistic and expect short DMA transfers to fail in any phase 
(though in practice that may never happen).

> and use the following code to fix up the transfer address there:
> 
> +       /* extended message in transfer? need to fixup addr */
> +       if (cmd == ESP_CMD_TI && addr == esp->command_block_dma)
> +               addr = (u32) esp->command_block;
> +
> 
> Note that addr = phys_to_virt((u32) esp->command_block_dma) works just
> the same (even though phys_to_virt((u32) esp->command_block_dma) !=
> esp->command_block).
> 
> We don't have to do PIO data transfers - would have been useful to
> debug DMA issues on 'new' boards but not essential.
> 

Yes. I think it would be good to add a comment to say that the problem was 
only observed for 2-byte MESSAGE IN transfers (so far), and also that in 
general short transfers will not be caught this way because they may 
involve cmd->sense_buffer or scsi_sglist(cmd) and not esp->command_block.

> Your solution is simpler and more generic so I'll try that one and will 
> probably use it.
> 

Like you, I'd also prefer a complete solution but it can wait until the 
need arises.

-- 

> Cheers,
> 
>   Michael
> 
