From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: [RFC] m68k: network interface on amcore board
Date: Mon, 31 Oct 2016 11:35:41 +0100
Message-ID: <a697d297-6ecb-817a-fc84-9b802cd3958f@sysam.it>
References: <1e301293-ea8d-5cf3-9561-336b634659ea@sysam.it>
 <CAMuHMdUOWZRffrytiP-6sB4SB1gcA=Vv9pc9u4PFzdMrMF16Ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:35875 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1765434AbcJaKfp (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 31 Oct 2016 06:35:45 -0400
In-Reply-To: <CAMuHMdUOWZRffrytiP-6sB4SB1gcA=Vv9pc9u4PFzdMrMF16Ow@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Hi Geert,

On 31/10/2016 09:01, Geert Uytterhoeven wrote:
> Hi Angelo,
>
> On Mon, Oct 31, 2016 at 8:26 AM, Angelo Dureghello <angelo@sysam.it> wrote:
>> i have still a last issue open on mcf5307-based "amcore"
>> board i would like to fix, and need a suggestion:
>>
>> at design time, i wired the 32bit parallel data bus from cpu to
>> the ethernet chip as "straight" (D0 to D0, ... D32 to D32).
>>
>> dm9000 driver btw works for little-endian cpu only. To have it
>> working, i actually keep a byte "swap" patch in the driver.
>>
>> Since i guess i cannot pretend any driver patch for this case,
>> i am planning a new pcb version with 32bit data bus bytes swapped
>> in hardware.
>>
>> What do you think ?
>
> BenH has written some excellent background information about this:
> Big and Little Endian inside / out
> https://www.linuxplumbersconf.org/2012/wp-content/uploads/2012/09/2012-lpc-ref-big-little-endian-herrenschmidt.odp
> https://www.youtube.com/watch?v=oBSuXP-1Tc0
>
> Happy reading!
>


many thanks for the very interesting presentation,
so from what i understand, the issue is in this terms:

* dm9000 registers/memory byte order is little endian.
* coldfire memory byte order is big endian

The proper way to fix this should be as said in the presentation
above to swap bytes in hardware.

Best regards,
Angelo Dureghello



> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
>
