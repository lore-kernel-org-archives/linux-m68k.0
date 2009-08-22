From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k,m68knommu: Wire up rt_tgsigqueueinfo and perf_counter_open
Date: Sat, 22 Aug 2009 14:16:45 +1000
Message-ID: <4A8F712D.6090205@snapgear.com>
References: <alpine.DEB.2.00.0908212205300.15620@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0908212205300.15620@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, uClinux list <uclinux-dev@uclinux.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>


On 08/22/2009 06:07 AM, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>
> Cc: Greg Ungerer<gerg@uclinux.org>

Acked-by: Greg Ungerer <gerg@uclinux.org>


>   arch/m68k/include/asm/unistd.h       |    4 +++-
>   arch/m68k/kernel/entry.S             |    2 ++
>   arch/m68knommu/kernel/syscalltable.S |    2 ++
>   3 files changed, 7 insertions(+), 1 deletions(-)
>
> diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
> index aa29a86..946d869 100644
> --- a/arch/m68k/include/asm/unistd.h
> +++ b/arch/m68k/include/asm/unistd.h
> @@ -334,10 +334,12 @@
>   #define __NR_inotify_init1	328
>   #define __NR_preadv		329
>   #define __NR_pwritev		330
> +#define __NR_rt_tgsigqueueinfo	331
> +#define __NR_perf_counter_open	332
>
>   #ifdef __KERNEL__
>
> -#define NR_syscalls		331
> +#define NR_syscalls		333
>
>   #define __ARCH_WANT_IPC_PARSE_VERSION
>   #define __ARCH_WANT_OLD_READDIR
> diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
> index 8744f60..c3735cd 100644
> --- a/arch/m68k/kernel/entry.S
> +++ b/arch/m68k/kernel/entry.S
> @@ -755,4 +755,6 @@ sys_call_table:
>   	.long sys_inotify_init1
>   	.long sys_preadv
>   	.long sys_pwritev		/* 330 */
> +	.long sys_rt_tgsigqueueinfo
> +	.long sys_perf_counter_open
>
> diff --git a/arch/m68knommu/kernel/syscalltable.S b/arch/m68knommu/kernel/syscalltable.S
> index c0b8782..0ae123e 100644
> --- a/arch/m68knommu/kernel/syscalltable.S
> +++ b/arch/m68knommu/kernel/syscalltable.S
> @@ -349,6 +349,8 @@ ENTRY(sys_call_table)
>   	.long sys_inotify_init1
>   	.long sys_preadv
>   	.long sys_pwritev		/* 330 */
> +	.long sys_rt_tgsigqueueinfo
> +	.long sys_perf_counter_open
>
>   	.rept NR_syscalls-(.-sys_call_table)/4
>   		.long sys_ni_syscall

-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
