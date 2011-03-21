From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: m68k,m68knommu: Wire up name_to_handle_at, open_by_handle_at,
 clock_adjtime
Date: Mon, 21 Mar 2011 17:16:12 +1000
Message-ID: <4D86FB3C.8030504@snapgear.com>
References: <alpine.DEB.2.00.1103201310110.6574@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1103201310110.6574@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, uClinux list <uclinux-dev@uclinux.org>

On 20/03/11 22:11, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>

Looks good:

Acked-by: Greg Ungerer <gerg@uclinux.org>

Regards
Greg



> ---
>   arch/m68k/include/asm/unistd.h       |    5 ++++-
>   arch/m68k/kernel/entry.S             |    3 +++
>   arch/m68knommu/kernel/syscalltable.S |    3 +++
>   3 files changed, 10 insertions(+), 1 deletions(-)
>
> diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
> index 26d851d..f69f7ce 100644
> --- a/arch/m68k/include/asm/unistd.h
> +++ b/arch/m68k/include/asm/unistd.h
> @@ -343,10 +343,13 @@
>   #define __NR_fanotify_init	337
>   #define __NR_fanotify_mark	338
>   #define __NR_prlimit64		339
> +#define __NR_name_to_handle_at	340
> +#define __NR_open_by_handle_at	341
> +#define __NR_clock_adjtime	342
>
>   #ifdef __KERNEL__
>
> -#define NR_syscalls		340
> +#define NR_syscalls		343
>
>   #define __ARCH_WANT_IPC_PARSE_VERSION
>   #define __ARCH_WANT_OLD_READDIR
> diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
> index 1559dea..8f9524a 100644
> --- a/arch/m68k/kernel/entry.S
> +++ b/arch/m68k/kernel/entry.S
> @@ -750,4 +750,7 @@ sys_call_table:
>   	.long sys_fanotify_init
>   	.long sys_fanotify_mark
>   	.long sys_prlimit64
> +	.long sys_name_to_handle_at	/* 340 */
> +	.long sys_open_by_handle_at
> +	.long sys_clock_adjtime
>
> diff --git a/arch/m68knommu/kernel/syscalltable.S b/arch/m68knommu/kernel/syscalltable.S
> index 79b1ed1..605bbbe 100644
> --- a/arch/m68knommu/kernel/syscalltable.S
> +++ b/arch/m68knommu/kernel/syscalltable.S
> @@ -358,6 +358,9 @@ ENTRY(sys_call_table)
>   	.long sys_fanotify_init
>   	.long sys_fanotify_mark
>   	.long sys_prlimit64
> +	.long sys_name_to_handle_at	/* 340 */
> +	.long sys_open_by_handle_at
> +	.long sys_clock_adjtime
>
>   	.rept NR_syscalls-(.-sys_call_table)/4
>   		.long sys_ni_syscall


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
