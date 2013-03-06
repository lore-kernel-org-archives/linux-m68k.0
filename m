From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH] m68k: drop "select EMAC_INC"
Date: Wed, 06 Mar 2013 16:10:07 +1000
Message-ID: <5136DDBF.8090000@westnet.com.au>
References: <1362504650.16460.95.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1362504650.16460.95.camel@x61.thuisdomein>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Paul,

On 06/03/13 03:30, Paul Bolle wrote:
> Somehow this select statement managed to squeeze itself between commit
> 0e152d80507b75c00aac60f2ffc586360687cd52 ("m68k: reorganize Kconfig
> options to improve mmu/non-mmu selections") and commit
> 95e82747d6e2abc513bfae416e6009968985d05b ("m68k: drop unused Kconfig
> symbols"). Whatever happened, there is no Kconfig symbol named EMAC_INC.
> The select statement for that symbol is a nop. Drop it.
>
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>

Thanks, I'll add that to the m68knommu git tree, since it is a non-mmu
target.

Regards
Greg


> Untested, but it's hard to see what can got wrong here.
>
>   arch/m68k/Kconfig.machine | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
> index 7cdf6b0..7240584 100644
> --- a/arch/m68k/Kconfig.machine
> +++ b/arch/m68k/Kconfig.machine
> @@ -310,7 +310,6 @@ config COBRA5282
>   config SOM5282EM
>   	bool "EMAC.Inc SOM5282EM board support"
>   	depends on M528x
> -	select EMAC_INC
>   	help
>   	  Support for the EMAC.Inc SOM5282EM module.
>
>
