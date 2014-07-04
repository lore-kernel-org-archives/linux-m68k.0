From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] m68k: Remove FIXME comment in file sun3_pgalloc.h
Date: Fri, 4 Jul 2014 11:28:05 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1407041125060.15901@nippy.intranet>
References: <1404351693-5588-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1404351693-5588-1-git-send-email-xerofoify@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>
Cc: sammy@sammy.net, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org


On Wed, 2 Jul 2014, Nicholas Krause wrote:

> Removes a FIXME comment in this file due to it not compiling as it now 
> compiles.

What got fixed?

It doesn't say "FIXME - this doesn't compile".

> 
> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
> ---
>  arch/m68k/include/asm/sun3_pgalloc.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/m68k/include/asm/sun3_pgalloc.h b/arch/m68k/include/asm/sun3_pgalloc.h
> index f868506..1798f25 100644
> --- a/arch/m68k/include/asm/sun3_pgalloc.h
> +++ b/arch/m68k/include/asm/sun3_pgalloc.h
> @@ -12,7 +12,6 @@
>  
>  #include <asm/tlb.h>
>  
> -/* FIXME - when we get this compiling */
>  /* erm, now that it's compiling, what do we do with it? */
>  #define _KERNPG_TABLE 0
>  
> 

-- 
