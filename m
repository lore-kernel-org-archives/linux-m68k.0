From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH v2 4/4] m68k/atari: fix SCC initialization for debug
 console
Date: Tue, 27 May 2014 15:22:23 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1405271306310.14863@nippy.intranet>
References: <alpine.LNX.2.00.1405262326290.13815@nippy.intranet> <CAOmrzkLw1r+QUxqxQUKEwewtnWRmJknYCzLzf29Tq_TsjK-RyQ@mail.gmail.com> <alpine.LNX.2.00.1405271047450.14863@nippy.intranet> <CAOmrzkLLNeCgFsam+e0_nBKRGhjpFv=bv_eT0wp8R=o4z8D0QQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:33792 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752672AbaE0FXi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 27 May 2014 01:23:38 -0400
In-Reply-To: <CAOmrzkLLNeCgFsam+e0_nBKRGhjpFv=bv_eT0wp8R=o4z8D0QQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Tue, 27 May 2014, Michael Schmitz wrote:

> so you are saying the head.S setup uses PCLK as clock source in x16 
> mode, while the serial driver does something more complicated to use the 
> baud rate generator with a lower frequency clock?

It seems so. The baud rate table in Atari_SCC.c defines both a clock 
source and time constant (divisor) for each speed.

static BAUD_ENTRY bdtab_norm[20] = {
	/* B0      */ { 0, 0 },
	/* B50     */ { CLK_RTxC, 4590 },
	/* B75     */ { CLK_RTxC, 3060 },
	/* B110    */ { CLK_PCLK, 4576 },
	/* B134    */ { CLK_PCLK, 3756 },
	/* B150    */ { CLK_RTxC, 1530 },
	/* B200    */ { CLK_PCLK, 2516 },
	/* B300    */ { CLK_PCLK, 1678 },
	/* B600    */ { CLK_PCLK, 838 },
	/* B1200   */ { CLK_PCLK, 420 },
	/* B1800   */ { CLK_PCLK, 280 },
	/* B2400   */ { CLK_PCLK, 210 },
	/* B4800   */ { CLK_RTxC, 48 },
	/* B9600   */ { CLK_RTxC, 24 },
	/* B19200  */ { CLK_RTxC, 12 },
	/* B38400  */ { CLK_RTxC, 6 },   /* #15 spd_extra */
	/* B57600  */ { CLK_RTxC, 4 },   /* #16 spd_hi */
	/* B115200 */ { CLK_RTxC, 2 },   /* #17 spd_vhi */
	/* B230400 */ { CLK_RTxC, 1 },   /* #18 spd_shi */
	/* B460800 */ { 0, 0 }           /* #19 spd_warp: Impossible */
};

The x16 mode is set by SCC_change_speed() when time constant == 1 or time 
constant > 4 though I don't understand why that is.

Atari_SCC.c, for 38400 baud, in SCC_change_speed() essentially does,

AUX1_CTRL_REG = 0x44
CLK_CTRL_REG = 0x50
DPLL_CTRL_REG = 0x00
TIMER_LOW_REG = 1
TIMER_HIGH_REG = 0
DPLL_CTRL_REG = 0x01

That is, set the BRG clock source to RTxC pin and time constant to 1, 
which would give 38250 baud for a 3.6720 MHz clock source.

Whereas, head.S for 9600 baud does something like this,

AUX1_CTRL_REG = 0x44
CLK_CTRL_REG = 0x50
TIMER_LOW_REG = 24
TIMER_HIGH_REG = 0
DPLL_CTRL_REG = 0x02
DPLL_CTRL_REG = 0x03

That is, set the BRG clock source to PCLK and time constant to 24, which 
would give 9680.2 baud for a 8.0539 MHz clock source.

Problem: bdtab_norm[] above specifies { CLK_RTxC, 24 } for 9600 baud. This 
doesn't make sense. Perhaps the logic in SCC_ioctl() in Atari_SCC.c fixes 
it up for speeds specified by the user? Who knows.

-- 
