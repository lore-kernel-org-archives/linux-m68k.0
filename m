From: Brad Boyer <flar@allandria.com>
Subject: Re: [PATCH 1/1] Changes for 68000 code integration.
Date: Fri, 27 Apr 2012 00:33:55 -0700
Message-ID: <20120427073355.GA28132@cynthia.pants.nu>
References: <MC68000integration>
 <1335481717-8652-1-git-send-email-ljalvs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cynthia.allandria.com ([76.245.85.235]:60117 "EHLO
	cynthia.pants.nu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758452Ab2D0Hz2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 27 Apr 2012 03:55:28 -0400
Content-Disposition: inline
In-Reply-To: <1335481717-8652-1-git-send-email-ljalvs@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Luis Alves <ljalvs@gmail.com>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, gerg@uclinux.org

On Fri, Apr 27, 2012 at 12:08:37AM +0100, Luis Alves wrote:
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index 8a9c767..2abac0f 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -32,26 +32,33 @@ endchoice
>  
>  if M68KCLASSIC
>  
> -config M68000
> +
> +config M68XXX
>  	bool
>  	select CPU_HAS_NO_BITFIELDS
>  	select CPU_HAS_NO_MULDIV64
>  	select GENERIC_CSUM
>  	help
> -	  The Freescale (was Motorola) 68000 CPU is the first generation of
> -	  the well known M68K family of processors. The CPU core as well as
> -	  being available as a stand alone CPU was also used in many
> -	  System-On-Chip devices (eg 68328, 68302, etc). It does not contain
> -	  a paging MMU.
> +	  Common features for the first generation of M68K CPUs. It
> +	  includes the original MC68000 and CPU32 core.
> +
>  
>  config MCPU32
>  	bool
> -	select CPU_HAS_NO_BITFIELDS
> +	select M68XXX
>  	help
>  	  The Freescale (was then Motorola) CPU32 is a CPU core that is
>  	  based on the 68020 processor. For the most part it is used in
>  	  System-On-Chip parts, and does not contain a paging MMU.

I believe this misrepresents the CPU32 feature set. According to the old
paper copy I have of the Motorola CPU32 reference manual, the only
unimplemented instructions relative to the 68020 are these:

1) Bit field instructions
2) Module call/return
3) RMW instructions (CAS/CAS2)
4) Coprocessor instructions
5) BCD instructions

The 64 bit MUL and DIV variants are explicitly listed in the instruction set.

The CPU32 is also missing some (but not all) of the addressing modes
which were added with the 68020.

I haven't worked with any of these chips in a long time, but the CPU32
is quite a bit newer and more complicated than a 68000 or 68010. I
did a project based on a 68332 about 15 years ago and still have all
the printed reference manuals for that particular chip.

	Brad Boyer
	flar@allandria.com
