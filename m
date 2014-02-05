From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH 1/3] m68k: Sort arch/m68k/include/asm/Kbuild
Date: Wed, 05 Feb 2014 10:59:33 +1000
Message-ID: <52F18CF5.40301@uclinux.org>
References: <1391544954-7422-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1391544954-7422-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On 05/02/14 06:15, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Greg Ungerer <gerg@uclinux.org>

> ---
>  arch/m68k/include/asm/Kbuild |    5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/m68k/include/asm/Kbuild b/arch/m68k/include/asm/Kbuild
> index 7cc8c364924d..df4d46fc321b 100644
> --- a/arch/m68k/include/asm/Kbuild
> +++ b/arch/m68k/include/asm/Kbuild
> @@ -1,4 +1,3 @@
> -
>  generic-y += bitsperlong.h
>  generic-y += clkdev.h
>  generic-y += cputime.h
> @@ -6,6 +5,7 @@ generic-y += device.h
>  generic-y += emergency-restart.h
>  generic-y += errno.h
>  generic-y += exec.h
> +generic-y += hash.h
>  generic-y += hw_irq.h
>  generic-y += ioctl.h
>  generic-y += ipcbuf.h
> @@ -18,6 +18,7 @@ generic-y += local.h
>  generic-y += mman.h
>  generic-y += mutex.h
>  generic-y += percpu.h
> +generic-y += preempt.h
>  generic-y += resource.h
>  generic-y += scatterlist.h
>  generic-y += sections.h
> @@ -31,5 +32,3 @@ generic-y += trace_clock.h
>  generic-y += types.h
>  generic-y += word-at-a-time.h
>  generic-y += xor.h
> -generic-y += preempt.h
> -generic-y += hash.h
> 
