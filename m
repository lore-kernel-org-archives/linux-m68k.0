From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] kexec: distribute kexec/arch/m68k/bootinfo.h
Date: Tue, 14 Oct 2014 07:06:40 +0200
Message-ID: <20141014050640.GA7738@verge.net.au>
References: <1381859460-13645-1-git-send-email-geert@linux-m68k.org>
 <1381859460-13645-4-git-send-email-geert@linux-m68k.org>
 <87tx39w042.fsf_-_@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87tx39w042.fsf_-_@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, kexec@lists.infradead.org

Thanks, applied. Sorry for missing this earlier.

On Sun, Oct 12, 2014 at 09:37:17PM +0200, Andreas Schwab wrote:
> Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
> ---
>  kexec/arch/m68k/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kexec/arch/m68k/Makefile b/kexec/arch/m68k/Makefile
> index 7b13564..eeaacbd 100644
> --- a/kexec/arch/m68k/Makefile
> +++ b/kexec/arch/m68k/Makefile
> @@ -10,5 +10,6 @@ m68k_ADD_SEGMENT =
>  m68k_VIRT_TO_PHYS =
>  
>  dist += kexec/arch/m68k/Makefile $(m68k_KEXEC_SRCS)			\
> +	kexec/arch/m68k/bootinfo.h					\
>  	kexec/arch/m68k/kexec-m68k.h					\
>  	kexec/arch/m68k/include/arch/options.h
> -- 
> 2.1.2
> 
> -- 
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
> "And now for something completely different."
> 
