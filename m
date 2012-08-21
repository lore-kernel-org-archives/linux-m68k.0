From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH] m68k: drop unused parts of 68VZ328 Makefile
Date: Tue, 21 Aug 2012 23:21:37 +1000
Message-ID: <50338B61.8050101__35585.8526229442$1345555328$gmane$org@westnet.com.au>
References: <1345399091.1771.12.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1345399091.1771.12.camel@x61.thuisdomein>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Paul,

On 08/20/2012 03:58 AM, Paul Bolle wrote:
> DRAGEN2 should obviously be CONFIG_DRAGEN2, but the screen.h entry it
> triggers only references files that are nowhere to be found in the
> current tree. Besides, nothing uses screen.h. So just drop all that.
>
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>

Thanks, I'll take this through the m68knommu git tree.
Applied to for-next branch.

Regards
Greg


> ---
> 0) Entirely untested. It's hard to see what could break, though.
>
> 1) These lines got added to the tree with a patch called "m68k-nommu:
> change build process to use common head code". That patch predates the
> mainline git repository by a month. That patch did not add screen.xbm or
> xbm2lcd.pl.
>
> 2) For what it's worth: screen.xbm and xbm2lcd.pl can be found at
> http://cvs.uclinux.org/cgi-bin/cvsweb.cgi/uClinux-2.4.x/arch/m68knommu/platform/68VZ328/de2/ .
>
>   arch/m68k/platform/68VZ328/Makefile |    8 +-------
>   1 files changed, 1 insertions(+), 7 deletions(-)
>
> diff --git a/arch/m68k/platform/68VZ328/Makefile b/arch/m68k/platform/68VZ328/Makefile
> index a49d75e..8166741 100644
> --- a/arch/m68k/platform/68VZ328/Makefile
> +++ b/arch/m68k/platform/68VZ328/Makefile
> @@ -1,11 +1,5 @@
>   #
> -# Makefile for arch/m68knommu/platform/68VZ328.
> +# Makefile for arch/m68k/platform/68VZ328.
>   #
>
>   obj-y		:= config.o
> -extra-$(DRAGEN2):= screen.h
> -
> -$(obj)/screen.h: $(src)/screen.xbm $(src)/xbm2lcd.pl
> -	perl $(src)/xbm2lcd.pl < $(src)/screen.xbm > $(obj)/screen.h
> -
> -clean-files := $(obj)/screen.h
>
