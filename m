From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: zorro_esp, was: Re: m68k v3.16 status update
Date: Wed, 20 Dec 2017 09:13:09 +0100
Message-ID: <CAMuHMdWbb98LeN_Z2EzwctXXGtxwh_H0L8Lwf5RXWfpxMNjSkw@mail.gmail.com>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com>
 <53E48C84.9090709@gmail.com> <53E4DDF1.9060701@kopteri.net>
 <53E54E6C.2040806@gmail.com> <53E5C3A7.3040106@kopteri.net>
 <68e92278-86e7-faef-f5b2-fbc514c27464@gmail.com> <4403d779c1664692ae5a7ef5b69ec888@aalto.fi>
 <CAOmrzkJJXZb153ig=d=Cywr59hid7X3UJvUD-wgtYtZm7KsCuQ@mail.gmail.com>
 <alpine.LNX.2.21.1712151039050.3@nippy.intranet> <CAOmrzkKgHEO8BY-z5hXKoJFgb7SpZF55jjkeo-9v34PkqsYt_Q@mail.gmail.com>
 <CAMuHMdXJtTqpWsftPMgmPOmJYYNRO2ZNRVDDak3Vy-WtC24zZw@mail.gmail.com> <95e9c39f-dd85-9353-6947-3ec740b8bbd4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-qk0-f181.google.com ([209.85.220.181]:37483 "EHLO
        mail-qk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753626AbdLTINL (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Dec 2017 03:13:11 -0500
Received: by mail-qk0-f181.google.com with SMTP id p13so9645509qke.4
        for <linux-m68k@vger.kernel.org>; Wed, 20 Dec 2017 00:13:10 -0800 (PST)
In-Reply-To: <95e9c39f-dd85-9353-6947-3ec740b8bbd4@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, Vainikka Tuomas <tuomas.vainikka@aalto.fi>, linux-m68k <linux-m68k@vger.kernel.org>

Hi Michael,

On Wed, Dec 20, 2017 at 8:33 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 19.12.2017 um 21:19 schrieb Geert Uytterhoeven:
>> On Tue, Dec 19, 2017 at 1:40 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>>> Contrary to the Mac driver, esp->command_block and
>>> esp->command_block_dma are not identical addresses on Amiga. Is there
>>> a generic way to map a DMA address (i.e., physical address AFAIK) to a
>>> kernel virtual one? (I can use esp->command_block in the reconnect
>>> message special case but not otherwise ...)
>>
>> The only generic way is to use the virtual and DMA addresses as returned
>> by the dma_map_*() functions.
>
> Yes, but there is no way to find the mapped virtual address given the
> DMA handle (=physical address). I suppose that would mean walking the
> page tables, looking for a mapping that bears the hallmarks of a DMA
> mapping?

Right. Not taking into account that some regions (e.g. Zorro II) may be mapped
using a fixed large mapping.

That'w why you should keep the DMA address returned by dma_map_*().

>> There may be some platform-specific legacy conversion routines around...
>
> phys_to_virt() does return _a_ mapping but it is not the DMA virtual
> mapping itself. Since we are doing PIO, the cache bits in the mapping
> may not matter at all here so this may be safe in general. It's a hack I
> would not want to submit for review though.

That's meant for RAM mapped by the kernel.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
