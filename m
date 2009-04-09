From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k,
	m68knommu: Wire up preadv and pwritev
Date: Fri, 10 Apr 2009 08:38:55 +1000
Message-ID: <49DE78FF.4030002@snapgear.com>
References: <Pine.LNX.4.64.0904092226330.29544@anakin>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <Pine.LNX.4.64.0904092226330.29544@anakin>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, uClinux list <uclinux-dev@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Greg Ungerer <gerg@uclinux.org>


> ---
>  arch/m68k/include/asm/unistd.h       |    4 +++-
>  arch/m68k/kernel/entry.S             |    2 ++
>  arch/m68knommu/kernel/syscalltable.S |    2 ++
>  3 files changed, 7 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
> index 3c19027..aa29a86 100644
> --- a/arch/m68k/include/asm/unistd.h
> +++ b/arch/m68k/include/asm/unistd.h
> @@ -332,10 +332,12 @@
>  #define __NR_dup3		326
>  #define __NR_pipe2		327
>  #define __NR_inotify_init1	328
> +#define __NR_preadv		329
> +#define __NR_pwritev		330
>  
>  #ifdef __KERNEL__
>  
> -#define NR_syscalls		329
> +#define NR_syscalls		331
>  
>  #define __ARCH_WANT_IPC_PARSE_VERSION
>  #define __ARCH_WANT_OLD_READDIR
> diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
> index 5c332f2..8744f60 100644
> --- a/arch/m68k/kernel/entry.S
> +++ b/arch/m68k/kernel/entry.S
> @@ -753,4 +753,6 @@ sys_call_table:
>  	.long sys_dup3
>  	.long sys_pipe2
>  	.long sys_inotify_init1
> +	.long sys_preadv
> +	.long sys_pwritev		/* 330 */
>  
> diff --git a/arch/m68knommu/kernel/syscalltable.S b/arch/m68knommu/kernel/syscalltable.S
> index 1017e76..c0b8782 100644
> --- a/arch/m68knommu/kernel/syscalltable.S
> +++ b/arch/m68knommu/kernel/syscalltable.S
> @@ -347,6 +347,8 @@ ENTRY(sys_call_table)
>  	.long sys_dup3
>  	.long sys_pipe2
>  	.long sys_inotify_init1
> +	.long sys_preadv
> +	.long sys_pwritev		/* 330 */
>  
>  	.rept NR_syscalls-(.-sys_call_table)/4
>  		.long sys_ni_syscall


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
