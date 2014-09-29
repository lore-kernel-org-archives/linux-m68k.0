From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH] [TRIVIAL] m68k: Fix typo 'COFNIG_MBAR'
Date: Mon, 29 Sep 2014 10:10:40 +1000
Message-ID: <5428A380.9030408@westnet.com.au>
References: <1411753216.7866.65.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1411753216.7866.65.camel@x220>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>, Jiri Kosina <trivial@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Paul,

On 27/09/14 03:40, Paul Bolle wrote:
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
> Untested!

Thanks. I have applied this to the m68knommu git tree (since
that is where we tend to keep all ColdFire fixes).


> Geert, PASR is obviously unused. Is it needed?

Not at the moment. It will be if/when we implement better error
handling for external master errors.

Regards
Greg

 
>  arch/m68k/include/asm/m54xxpci.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/include/asm/m54xxpci.h b/arch/m68k/include/asm/m54xxpci.h
> index 6fbf54f72f2e..4687f5aa3741 100644
> --- a/arch/m68k/include/asm/m54xxpci.h
> +++ b/arch/m68k/include/asm/m54xxpci.h
> @@ -72,7 +72,7 @@
>  #define	PCIRFWPR	(CONFIG_MBAR + 0x84d4)	/* RX FIFO write pointer */
>  
>  #define	PACR		(CONFIG_MBAR + 0xc00)	/* PCI arbiter control */
> -#define	PASR		(COFNIG_MBAR + 0xc04)	/* PCI arbiter status */
> +#define	PASR		(CONFIG_MBAR + 0xc04)	/* PCI arbiter status */
>  
>  /*
>   *	Definitions for the Global status and control register.
> 
