From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2 4/4] m68k/atari: fix SCC initialization for debug console
Date: Tue, 27 May 2014 19:55:04 +1200
Message-ID: <538444D8.9000805@gmail.com>
References: <alpine.LNX.2.00.1405262326290.13815@nippy.intranet> <CAOmrzkLw1r+QUxqxQUKEwewtnWRmJknYCzLzf29Tq_TsjK-RyQ@mail.gmail.com> <alpine.LNX.2.00.1405271047450.14863@nippy.intranet> <CAOmrzkLLNeCgFsam+e0_nBKRGhjpFv=bv_eT0wp8R=o4z8D0QQ@mail.gmail.com> <alpine.LNX.2.00.1405271306310.14863@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:64980 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751477AbaE0Hzn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 27 May 2014 03:55:43 -0400
Received: by mail-pa0-f52.google.com with SMTP id fa1so8776359pad.11
        for <linux-m68k@vger.kernel.org>; Tue, 27 May 2014 00:55:42 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1405271306310.14863@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,
> On Tue, 27 May 2014, Michael Schmitz wrote:
>
>   
>> so you are saying the head.S setup uses PCLK as clock source in x16 
>> mode, while the serial driver does something more complicated to use the 
>> baud rate generator with a lower frequency clock?
>>     
>
> It seems so. The baud rate table in Atari_SCC.c defines both a clock 
> source and time constant (divisor) for each speed.
>
> static BAUD_ENTRY bdtab_norm[20] = {
> 	/* B0      */ { 0, 0 },
> 	/* B50     */ { CLK_RTxC, 4590 },
> 	/* B75     */ { CLK_RTxC, 3060 },
> 	/* B110    */ { CLK_PCLK, 4576 },
> 	/* B134    */ { CLK_PCLK, 3756 },
> 	/* B150    */ { CLK_RTxC, 1530 },
> 	/* B200    */ { CLK_PCLK, 2516 },
> 	/* B300    */ { CLK_PCLK, 1678 },
> 	/* B600    */ { CLK_PCLK, 838 },
> 	/* B1200   */ { CLK_PCLK, 420 },
> 	/* B1800   */ { CLK_PCLK, 280 },
> 	/* B2400   */ { CLK_PCLK, 210 },
> 	/* B4800   */ { CLK_RTxC, 48 },
> 	/* B9600   */ { CLK_RTxC, 24 },
> 	/* B19200  */ { CLK_RTxC, 12 },
> 	/* B38400  */ { CLK_RTxC, 6 },   /* #15 spd_extra */
> 	/* B57600  */ { CLK_RTxC, 4 },   /* #16 spd_hi */
> 	/* B115200 */ { CLK_RTxC, 2 },   /* #17 spd_vhi */
> 	/* B230400 */ { CLK_RTxC, 1 },   /* #18 spd_shi */
> 	/* B460800 */ { 0, 0 }           /* #19 spd_warp: Impossible */
> };
>
> The x16 mode is set by SCC_change_speed() when time constant == 1 or time 
> constant > 4 though I don't understand why that is.
>   
divisor (time constant) > 4 invokes the BRG setup logic instead of using 
direct modes, and the divisor gets changed to (divisor/2) - 2. Probably 
just a way to munge both direct and BRG modes into one simple table. I 
didn't write the code :-)

> Atari_SCC.c, for 38400 baud, in SCC_change_speed() essentially does,
>
> AUX1_CTRL_REG = 0x44
> CLK_CTRL_REG = 0x50
> DPLL_CTRL_REG = 0x00
> TIMER_LOW_REG = 1
> TIMER_HIGH_REG = 0
> DPLL_CTRL_REG = 0x01
>
> That is, set the BRG clock source to RTxC pin and time constant to 1, 
> which would give 38250 baud for a 3.6720 MHz clock source.
>
> Whereas, head.S for 9600 baud does something like this,
>
> AUX1_CTRL_REG = 0x44
> CLK_CTRL_REG = 0x50
> TIMER_LOW_REG = 24
> TIMER_HIGH_REG = 0
> DPLL_CTRL_REG = 0x02
> DPLL_CTRL_REG = 0x03
>
> That is, set the BRG clock source to PCLK and time constant to 24, which 
> would give 9680.2 baud for a 8.0539 MHz clock source.
>
> Problem: bdtab_norm[] above specifies { CLK_RTxC, 24 } for 9600 baud. This 
> doesn't make sense. Perhaps the logic in SCC_ioctl() in Atari_SCC.c fixes 
> it up for speeds specified by the user? Who knows.
>   

That ends up using time constant 10 and mode 16 as per your calculation 
for 3.67 MHz clock input - 9562 baud instead of the 9680 possible from 
the 8 MHz clock. I might have misunderstood something - would really 
want to check that using a scope.

Both appear to work OK, so no matter really.

Cheers,

    Michael
