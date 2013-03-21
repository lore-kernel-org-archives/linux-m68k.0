From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] m68k: clean up unused "config ROMVECSIZE"
Date: Thu, 21 Mar 2013 15:33:59 +1000
Message-ID: <514A9BC7.2010201__3329.4606408619$1363844168$gmane$org@uclinux.org>
References: <1363775886.1390.90.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1363775886.1390.90.camel@x61.thuisdomein>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Paul,

On 20/03/13 20:38, Paul Bolle wrote:
> Kconfig symbol ROMVECSIZE is unused since commit
> f84f52a5c15db7d14a534815f27253b001735183 ("m68knommu: clean up linker
> script"). Let's clean up its Kconfig entry too.
>
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>

Thanks, I'll add it to the m68knommu git tree.

Regards
Greg


> ---
> Untested.
>
>   arch/m68k/Kconfig.machine | 9 ---------
>   1 file changed, 9 deletions(-)
>
> diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
> index 7240584..28ec0c0 100644
> --- a/arch/m68k/Kconfig.machine
> +++ b/arch/m68k/Kconfig.machine
> @@ -539,15 +539,6 @@ config ROMVEC
>   	  68000 type variants the vectors are at the base of the boot device
>   	  on system startup.
>
> -config ROMVECSIZE
> -	hex "Size of ROM vector region (in bytes)"
> -	default "0x400"
> -	depends on ROM
> -	help
> -	  Define the size of the vector region in ROM. For most 68000
> -	  variants this would be 0x400 bytes in size. Set to 0 if you do
> -	  not want a vector region at the start of the ROM.
> -
>   config ROMSTART
>   	hex "Address of the base of system image in ROM"
>   	default "0x400"
>
