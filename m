From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2 4/4] m68k/atari: fix SCC initialization for debug console
Date: Tue, 27 May 2014 09:51:58 +1200
Message-ID: <CAOmrzkLw1r+QUxqxQUKEwewtnWRmJknYCzLzf29Tq_TsjK-RyQ@mail.gmail.com>
References: <alpine.LNX.2.00.1405262326290.13815@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:38490 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751406AbaEZVv7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 26 May 2014 17:51:59 -0400
Received: by mail-oa0-f41.google.com with SMTP id m1so8754743oag.14
        for <linux-m68k@vger.kernel.org>; Mon, 26 May 2014 14:51:58 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1405262326290.13815@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,

according to the old driver source, all Ataris except for the TT use a
3.672 MHz clock at RTxC[A,B] for both the 9600 and 38400 baud
settings. Most lower baud rates use the 8 MHz PCLK input.
Divisors are 24 (9600 baud) and 6 (38400 baud) in that case.

The TT uses that same arrangement on channel A, but something very
different on channel B - 307.2 kHz at RTxCB and 2.4576 MHz on TRxCB.
Divisors are 2 (using RTxCB) and 4 (using TRxCB), resepectively.

Adding all that in would complicate the code too much - let's settle
for a comment in the code to say SCC_B should not be used on the TT
without fixing the init table.

See page 1181 of the Profibuch - that corresponds well with the old
SCC driver source (can send that by PM should you need it).

Further comment inline.

Cheers,

  Michael

On Tue, May 27, 2014 at 1:29 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
>
> Fix SCC initialization for Atari as was previously fixed for Mac. It's
> probably not practical to share more code but some attempt is made to
> align the Mac and Atari variants.
>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>
> ---
> This patch needs testing on Atari. It can't be tested without editing
> macro definitions to enable SCC debug output (which also means disabling
> MFP debug output).
>
> Changed in v2: drop the baud rate change
>
> ---
>  arch/m68k/kernel/head.S |   31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
>
> Index: linux-m68k/arch/m68k/kernel/head.S
> ===================================================================
> --- linux-m68k.orig/arch/m68k/kernel/head.S     2014-05-26 23:13:50.000000000 +1000
> +++ linux-m68k/arch/m68k/kernel/head.S  2014-05-26 23:24:33.000000000 +1000
> @@ -2722,6 +2722,7 @@ func_return       get_new_page
>  #define MAC_USE_SCC_B /* Printer port */
>
>  #if defined(MAC_USE_SCC_A) || defined(MAC_USE_SCC_B)
> +/* Initialisation table for SCC with 3.6864 MHz PCLK */
>  L(scc_initable_mac):
>         .byte   4,0x44          /* x16, 1 stopbit, no parity */
>         .byte   3,0xc0          /* receiver: 8 bpc */
> @@ -2744,14 +2745,12 @@ L(scc_initable_mac):
>  #define USE_MFP
>
>  #if defined(USE_SCC_A) || defined(USE_SCC_B)
> -#define USE_SCC
> -/* Initialisation table for SCC */
> -L(scc_initable):
> -       .byte   9,12            /* Reset */
> +/* Initialisation table for SCC with 7.9872 MHz PCLK */
> +/* PCLK == 8.0539 gives baud == 9680.1 */
> +L(scc_initable_atari):
>         .byte   4,0x44          /* x16, 1 stopbit, no parity */
>         .byte   3,0xc0          /* receiver: 8 bpc */
>         .byte   5,0xe2          /* transmitter: 8 bpc, assert dtr/rts */
> -       .byte   9,0             /* no interrupts */
>         .byte   10,0            /* NRZ */
>         .byte   11,0x50         /* use baud rate generator */
>         .byte   12,24,13,0      /* 9600 baud */

Would be 6 instead of 24 here for 38400, presumably?

> @@ -2800,7 +2799,7 @@ LMFP_UDR     = 0xfffa2f
>   */
>
>  /*
> - * Initialize serial port hardware for 9600/8/1
> + * Initialize serial port hardware
>   */
>  func_start     serial_init,%d0/%d1/%a0/%a1
>         /*
> @@ -2810,7 +2809,7 @@ func_start        serial_init,%d0/%d1/%a0/%a1
>          *              d0 = boot info offset
>          *      CONFIG_ATARI
>          *              a0 = address of SCC
> -        *              a1 = Liobase address/address of scc_initable
> +        *              a1 = Liobase address/address of scc_initable_atari
>          *              d0 = init data for serial port
>          *      CONFIG_MAC
>          *              a0 = address of SCC
> @@ -2846,9 +2845,21 @@ func_start       serial_init,%d0/%d1/%a0/%a1
>         moveb   %a1@(LPSG_READ),%d0
>         bset    #5,%d0
>         moveb   %d0,%a1@(LPSG_WRITE)
> -#elif defined(USE_SCC)
> +#elif defined(USE_SCC_A) || defined(USE_SCC_B)
>         lea     %a1@(LSCC_CTRL),%a0
> -       lea     %pc@(L(scc_initable)),%a1
> +       /* Reset SCC register pointer */
> +       moveb   %a0@,%d0
> +       /* Reset SCC device: write register pointer then register value */
> +       moveb   #9,%a0@
> +       moveb   #0xc0,%a0@
> +       /* Wait for 5 PCLK cycles, which is about 63 CPU cycles */
> +       /* 5 / 7.9872 MHz = approx. 0.63 us = 63 / 100 MHz */
> +       movel   #32,%d0
> +2:
> +       subq    #1,%d0
> +       jne     2b
> +       /* Initialize channel */
> +       lea     %pc@(L(scc_initable_atari)),%a1
>  2:     moveb   %a1@+,%d0
>         jmi     3f
>         moveb   %d0,%a0@
> @@ -3017,7 +3028,7 @@ func_start        serial_putc,%d0/%d1/%a0/%a1
>         nop
>         bset    #5,%d0
>         moveb   %d0,%a1@(LPSG_WRITE)
> -#elif defined(USE_SCC)
> +#elif defined(USE_SCC_A) || defined(USE_SCC_B)
>  3:     btst    #2,%a1@(LSCC_CTRL)
>         jeq     3b
>         moveb   %d0,%a1@(LSCC_DATA)
>
