From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH 3/3] m68k: Wire up sched_setattr and sched_getattr
Date: Wed, 05 Feb 2014 11:00:27 +1000
Message-ID: <52F18D2B.4030501@uclinux.org>
References: <1391544954-7422-1-git-send-email-geert@linux-m68k.org> <1391544954-7422-3-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1391544954-7422-3-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On 05/02/14 06:15, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Greg Ungerer <gerg@uclinux.org>


> ---
>  arch/m68k/include/asm/unistd.h      |    2 +-
>  arch/m68k/include/uapi/asm/unistd.h |    2 ++
>  arch/m68k/kernel/syscalltable.S     |    2 ++
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
> index 014f288fc813..9d38b73989eb 100644
> --- a/arch/m68k/include/asm/unistd.h
> +++ b/arch/m68k/include/asm/unistd.h
> @@ -4,7 +4,7 @@
>  #include <uapi/asm/unistd.h>
>  
>  
> -#define NR_syscalls		349
> +#define NR_syscalls		351
>  
>  #define __ARCH_WANT_OLD_READDIR
>  #define __ARCH_WANT_OLD_STAT
> diff --git a/arch/m68k/include/uapi/asm/unistd.h b/arch/m68k/include/uapi/asm/unistd.h
> index 625f321001dc..b932dd470041 100644
> --- a/arch/m68k/include/uapi/asm/unistd.h
> +++ b/arch/m68k/include/uapi/asm/unistd.h
> @@ -354,5 +354,7 @@
>  #define __NR_process_vm_writev	346
>  #define __NR_kcmp		347
>  #define __NR_finit_module	348
> +#define __NR_sched_setattr	349
> +#define __NR_sched_getattr	350
>  
>  #endif /* _UAPI_ASM_M68K_UNISTD_H_ */
> diff --git a/arch/m68k/kernel/syscalltable.S b/arch/m68k/kernel/syscalltable.S
> index 3f04ea0ab802..b6223dc41d82 100644
> --- a/arch/m68k/kernel/syscalltable.S
> +++ b/arch/m68k/kernel/syscalltable.S
> @@ -369,4 +369,6 @@ ENTRY(sys_call_table)
>  	.long sys_process_vm_writev
>  	.long sys_kcmp
>  	.long sys_finit_module
> +	.long sys_sched_setattr
> +	.long sys_sched_getattr		/* 350 */
>  
> 
