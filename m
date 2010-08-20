From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [uClinux-dev] [PATCH] m68k, m68knommu: Wire up fanotify_init,
 fanotify_mark, and prlimit64
Date: Fri, 20 Aug 2010 13:38:36 +1000
Message-ID: <4C6DF8BC.8060803@snapgear.com>
References: <alpine.DEB.2.00.1008191804480.16652@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1008191804480.16652@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uClinux development list <uclinux-dev@uclinux.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Greg Ungerer <gerg@uclinux.org>


> ---
>  arch/m68k/include/asm/unistd.h       |    5 ++++-
>  arch/m68k/kernel/entry.S             |    3 +++
>  arch/m68knommu/kernel/syscalltable.S |    3 +++
>  3 files changed, 10 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
> index 60b15d0..b43b36b 100644
> --- a/arch/m68k/include/asm/unistd.h
> +++ b/arch/m68k/include/asm/unistd.h
> @@ -340,10 +340,13 @@
>  #define __NR_set_thread_area	334
>  #define __NR_atomic_cmpxchg_32	335
>  #define __NR_atomic_barrier	336
> +#define __NR_fanotify_init	337
> +#define __NR_fanotify_mark	338
> +#define __NR_prlimit64		339
>  
>  #ifdef __KERNEL__
>  
> -#define NR_syscalls		337
> +#define NR_syscalls		340
>  
>  #define __ARCH_WANT_IPC_PARSE_VERSION
>  #define __ARCH_WANT_OLD_READDIR
> diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
> index 2391bdf..6360c43 100644
> --- a/arch/m68k/kernel/entry.S
> +++ b/arch/m68k/kernel/entry.S
> @@ -765,4 +765,7 @@ sys_call_table:
>  	.long sys_set_thread_area
>  	.long sys_atomic_cmpxchg_32	/* 335 */
>  	.long sys_atomic_barrier
> +	.long sys_fanotify_init
> +	.long sys_fanotify_mark
> +	.long sys_prlimit64
>  
> diff --git a/arch/m68knommu/kernel/syscalltable.S b/arch/m68knommu/kernel/syscalltable.S
> index b30b3eb..79b1ed1 100644
> --- a/arch/m68knommu/kernel/syscalltable.S
> +++ b/arch/m68knommu/kernel/syscalltable.S
> @@ -355,6 +355,9 @@ ENTRY(sys_call_table)
>  	.long sys_set_thread_area
>  	.long sys_atomic_cmpxchg_32	/* 335 */
>  	.long sys_atomic_barrier
> +	.long sys_fanotify_init
> +	.long sys_fanotify_mark
> +	.long sys_prlimit64
>  
>  	.rept NR_syscalls-(.-sys_call_table)/4
>  		.long sys_ni_syscall


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
