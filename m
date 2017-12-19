From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: m68k v3.16 status update
Date: Tue, 19 Dec 2017 13:40:10 +1300
Message-ID: <CAOmrzkKgHEO8BY-z5hXKoJFgb7SpZF55jjkeo-9v34PkqsYt_Q@mail.gmail.com>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com>
 <53E48C84.9090709@gmail.com> <53E4DDF1.9060701@kopteri.net>
 <53E54E6C.2040806@gmail.com> <53E5C3A7.3040106@kopteri.net>
 <68e92278-86e7-faef-f5b2-fbc514c27464@gmail.com> <4403d779c1664692ae5a7ef5b69ec888@aalto.fi>
 <CAOmrzkJJXZb153ig=d=Cywr59hid7X3UJvUD-wgtYtZm7KsCuQ@mail.gmail.com> <alpine.LNX.2.21.1712151039050.3@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-io0-f170.google.com ([209.85.223.170]:40491 "EHLO
        mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933981AbdLSAkM (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 18 Dec 2017 19:40:12 -0500
Received: by mail-io0-f170.google.com with SMTP id v186so11778585iod.7
        for <linux-m68k@vger.kernel.org>; Mon, 18 Dec 2017 16:40:11 -0800 (PST)
In-Reply-To: <alpine.LNX.2.21.1712151039050.3@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Vainikka Tuomas <tuomas.vainikka@aalto.fi>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>

Hi Finn,

thanks, doing that now. The log is on IDE so no danger there. My debug
code along with esp_debug = ESP_DEBUG_RECONNECT shows the code path is
exercised by the single disk attached to elgar.

Contrary to the Mac driver, esp->command_block and
esp->command_block_dma are not identical addresses on Amiga. Is there
a generic way to map a DMA address (i.e., physical address AFAIK) to a
kernel virtual one? (I can use esp->command_block in the reconnect
message special case but not otherwise ...)

Cheers,

  Michael


On Fri, Dec 15, 2017 at 12:49 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
> On Fri, 15 Dec 2017, Michael Schmitz wrote:
>
>> Hi Tuomas,
>>
>> fair enough - I'll get the PIO code tested by forcing PIO transfers on
>> elgar, and submit the driver for review once that's done.
>
> You might need to instrument the esp_reconnect_with_tag() code path to
> confirm that elgar's scsi disks exercise the new code. I'd probably just
> set esp_scsi.esp_debug=0x200 (that is, ESP_DEBUG_RECONNECT). But watch out
> for /var/log/kern.log, in case it is on a scsi disk...
>
> --
>
>> Maybe someone else has a chance to test the fix in the meantime.
>>
>> Cheers,
>>
>>   Michael
>>
>>
