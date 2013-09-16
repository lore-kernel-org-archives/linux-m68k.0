From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH] m68k: remove unused Kconfig parameters
Date: Tue, 17 Sep 2013 09:48:13 +1000
Message-ID: <523798BD.9010108__45592.0003391386$1379382596$gmane$org@westnet.com.au>
References: <1378468779-3289-1-git-send-email-michael.opdenacker@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1378468779-3289-1-git-send-email-michael.opdenacker@free-electrons.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Michael,

On 06/09/13 21:59, Michael Opdenacker wrote:
> This patch proposes to remove the UC5282 and UC5272 kernel configuration
> parameters defined in arch/m68k/Kconfig.machine,
> but used nowhere in the makefiles and source code.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@free-electrons.com>

This change is a subset of c065edde ("remove 16 unused boards in
Kconfig.machine") by Pauk Bolle. And that is in 3.12-rc1.

Thanks
Greg



> ---
>  arch/m68k/Kconfig.machine | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
> index b9ab0a6..a10516b 100644
> --- a/arch/m68k/Kconfig.machine
> +++ b/arch/m68k/Kconfig.machine
> @@ -150,18 +150,6 @@ config XCOPILOT_BUGS
>  	help
>  	  Support the bugs of Xcopilot.
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
>  config UCSIMM
>  	bool "uCsimm module support"
>  	depends on M68EZ328
> 
