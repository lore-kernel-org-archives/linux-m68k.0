From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH v2] m68k: remove 16 unused boards in Kconfig.machine
Date: Tue, 21 May 2013 22:42:27 +1000
Message-ID: <519B6BB3.4070700@uclinux.org>
References: <1363868258.1390.129.camel@x61.thuisdomein>  <514FF226.3050507@uclinux.org> <1368735111.1350.211.camel@x61.thuisdomein> <1368777557.1350.221.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1368777557.1350.221.camel@x61.thuisdomein>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

Hi Paul,

On 17/05/13 17:59, Paul Bolle wrote:
> The Kconfig entries for 16 boards are unused. Remove these, together
> with the 6 entries that these boards select, but are also unused.
>
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
> 0) If double checking your commits is an art I'm no artist! I didn't
> notice that v1 (called "m68k: remove 15 unused boards in
> Kconfig.machine") depended on an older commit in my local stack of
> changes. This commit combines both into one.
>
> 1) Still only tested by (extensive) grepping of the tree.

I don't have a problem with removing these, though I'd like to do
some build tests on them before acking them.

Regards
Greg


>   arch/m68k/Kconfig.machine | 134 ----------------------------------------------
>   1 file changed, 134 deletions(-)
>
> diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
> index b9ab0a6..61dc643 100644
> --- a/arch/m68k/Kconfig.machine
> +++ b/arch/m68k/Kconfig.machine
> @@ -150,18 +150,6 @@ config XCOPILOT_BUGS
>   	help
>   	  Support the bugs of Xcopilot.
>
> -config UC5272
> -	bool "Arcturus Networks uC5272 dimm board support"
> -	depends on M5272
> -	help
> -	  Support for the Arcturus Networks uC5272 dimm board.
> -
> -config UC5282
> -	bool "Arcturus Networks uC5282 board support"
> -	depends on M528x
> -	help
> -	  Support for the Arcturus Networks uC5282 dimm board.
> -
>   config UCSIMM
>   	bool "uCsimm module support"
>   	depends on M68EZ328
> @@ -205,23 +193,15 @@ config UCQUICC
>   	help
>   	  Support for the Lineo uCquicc board.
>
> -config ARNEWSH
> -	bool
> -
>   config ARN5206
>   	bool "Arnewsh 5206 board support"
>   	depends on M5206
> -	select ARNEWSH
>   	help
>   	  Support for the Arnewsh 5206 board.
>
> -config FREESCALE
> -	bool
> -
>   config M5206eC3
>   	bool "Motorola M5206eC3 board support"
>   	depends on M5206e
> -	select FREESCALE
>   	help
>   	  Support for the Motorola M5206eC3 board.
>
> @@ -231,88 +211,24 @@ config ELITE
>   	help
>   	  Support for the Motorola M5206eLITE board.
>
> -config M5208EVB
> -	bool "Freescale M5208EVB board support"
> -	depends on M520x
> -	select FREESCALE
> -	help
> -	  Support for the Freescale Coldfire M5208EVB.
> -
>   config M5235EVB
>   	bool "Freescale M5235EVB support"
>   	depends on M523x
> -	select FREESCALE
>   	help
>   	  Support for the Freescale M5235EVB board.
>
>   config M5249C3
>   	bool "Motorola M5249C3 board support"
>   	depends on M5249
> -	select FREESCALE
>   	help
>   	  Support for the Motorola M5249C3 board.
>
> -config M5271EVB
> -	bool "Freescale (Motorola) M5271EVB board support"
> -	depends on M5271
> -	select FREESCALE
> -	help
> -	  Support for the Freescale (Motorola) M5271EVB board.
> -
> -config M5275EVB
> -	bool "Freescale (Motorola) M5275EVB board support"
> -	depends on M5275
> -	select FREESCALE
> -	help
> -	  Support for the Freescale (Motorola) M5275EVB board.
> -
>   config M5272C3
>   	bool "Motorola M5272C3 board support"
>   	depends on M5272
> -	select FREESCALE
>   	help
>   	  Support for the Motorola M5272C3 board.
>
> -config senTec
> -	bool
> -
> -config COBRA5272
> -	bool "senTec COBRA5272 board support"
> -	depends on M5272
> -	select senTec
> -	help
> -	  Support for the senTec COBRA5272 board.
> -
> -config AVNET
> -	bool
> -
> -config AVNET5282
> -	bool "Avnet 5282 board support"
> -	depends on M528x
> -	select AVNET
> -	help
> -	  Support for the Avnet 5282 board.
> -
> -config M5282EVB
> -	bool "Motorola M5282EVB board support"
> -	depends on M528x
> -	select FREESCALE
> -	help
> -	  Support for the Motorola M5282EVB board.
> -
> -config COBRA5282
> -	bool "senTec COBRA5282 board support"
> -	depends on M528x
> -	select senTec
> -	help
> -	  Support for the senTec COBRA5282 board.
> -
> -config SOM5282EM
> -	bool "EMAC.Inc SOM5282EM board support"
> -	depends on M528x
> -	help
> -	  Support for the EMAC.Inc SOM5282EM module.
> -
>   config WILDFIRE
>   	bool "Intec Automation Inc. WildFire board support"
>   	depends on M528x
> @@ -328,14 +244,12 @@ config WILDFIREMOD
>   config ARN5307
>   	bool "Arnewsh 5307 board support"
>   	depends on M5307
> -	select ARNEWSH
>   	help
>   	  Support for the Arnewsh 5307 board.
>
>   config M5307C3
>   	bool "Motorola M5307C3 board support"
>   	depends on M5307
> -	select FREESCALE
>   	help
>   	  Support for the Motorola M5307C3 board.
>
> @@ -345,30 +259,9 @@ config SECUREEDGEMP3
>   	help
>   	  Support for the SnapGear SecureEdge/MP3 platform.
>
> -config M5329EVB
> -	bool "Freescale (Motorola) M5329EVB board support"
> -	depends on M532x
> -	select FREESCALE
> -	help
> -	  Support for the Freescale (Motorola) M5329EVB board.
> -
> -config COBRA5329
> -	bool "senTec COBRA5329 board support"
> -	depends on M532x
> -	help
> -	  Support for the senTec COBRA5329 board.
> -
> -config M5373EVB
> -	bool "Freescale M5373EVB board support"
> -	depends on M537x
> -	select FREESCALE
> -	help
> -	  Support for the Freescale M5373EVB board.
> -
>   config M5407C3
>   	bool "Motorola M5407C3 board support"
>   	depends on M5407
> -	select FREESCALE
>   	help
>   	  Support for the Motorola M5407C3 board.
>
> @@ -402,39 +295,12 @@ config NETtel
>   	help
>   	  Support for the SnapGear NETtel/SecureEdge/SnapGear boards.
>
> -config SNAPGEAR
> -	bool "SnapGear router board support"
> -	depends on NETtel
> -	help
> -	  Special additional support for SnapGear router boards.
> -
> -config SNEHA
> -	bool
> -
> -config CPU16B
> -	bool "Sneha Technologies S.L. Sarasvati board support"
> -	depends on M5272
> -	select SNEHA
> -	help
> -	  Support for the SNEHA CPU16B board.
> -
>   config MOD5272
>   	bool "Netburner MOD-5272 board support"
>   	depends on M5272
>   	help
>   	  Support for the Netburner MOD-5272 board.
>
> -config SAVANT
> -	bool
> -
> -config SAVANTrosie1
> -	bool "Savant Rosie1 board support"
> -	depends on M523x
> -	select SAVANT
> -	help
> -	  Support for the Savant Rosie1 board.
> -
> -
>   if !MMU || COLDFIRE
>
>   comment "Machine Options"
>
