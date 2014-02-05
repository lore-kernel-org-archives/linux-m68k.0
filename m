From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH 2/3] m68k: Switch to asm-generic/barrier.h
Date: Wed, 05 Feb 2014 10:59:51 +1000
Message-ID: <52F18D07.8020301__18919.7920998142$1391562568$gmane$org@uclinux.org>
References: <1391544954-7422-1-git-send-email-geert@linux-m68k.org> <1391544954-7422-2-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1391544954-7422-2-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On 05/02/14 06:15, Geert Uytterhoeven wrote:
> The generic nop() implementation is fine for m68k.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Greg Ungerer <gerg@uclinux.org>


> ---
>  arch/m68k/include/asm/Kbuild    |    1 +
>  arch/m68k/include/asm/barrier.h |    8 --------
>  2 files changed, 1 insertion(+), 8 deletions(-)
>  delete mode 100644 arch/m68k/include/asm/barrier.h
> 
> diff --git a/arch/m68k/include/asm/Kbuild b/arch/m68k/include/asm/Kbuild
> index df4d46fc321b..6fb9e813a910 100644
> --- a/arch/m68k/include/asm/Kbuild
> +++ b/arch/m68k/include/asm/Kbuild
> @@ -1,3 +1,4 @@
> +generic-y += barrier.h
>  generic-y += bitsperlong.h
>  generic-y += clkdev.h
>  generic-y += cputime.h
> diff --git a/arch/m68k/include/asm/barrier.h b/arch/m68k/include/asm/barrier.h
> deleted file mode 100644
> index 15c5f77c1614..000000000000
> --- a/arch/m68k/include/asm/barrier.h
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -#ifndef _M68K_BARRIER_H
> -#define _M68K_BARRIER_H
> -
> -#define nop()		do { asm volatile ("nop"); barrier(); } while (0)
> -
> -#include <asm-generic/barrier.h>
> -
> -#endif /* _M68K_BARRIER_H */
> 
