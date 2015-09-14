From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH v2 3/4] m68k: Wire up direct ipc calls
Date: Mon, 14 Sep 2015 22:14:06 +1000
Message-ID: <55F6BA0E.5080004@uclinux.org>
References: <1442221006-2027-1-git-send-email-geert@linux-m68k.org>
 <1442221006-2027-4-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1442221006-2027-4-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Geert,

On 14/09/15 18:56, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Both new patches look fine to me,

Acked-by: Greg Ungerer <gerg@uclinux.org>

Regards
Greg


> ---
> v2:
>    - New.
> ---
>   arch/m68k/include/asm/unistd.h      |  2 +-
>   arch/m68k/include/uapi/asm/unistd.h | 11 +++++++++++
>   arch/m68k/kernel/syscalltable.S     | 11 +++++++++++
>   3 files changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
> index d25d5a5c83cb6d6b..887667ad6a2f9536 100644
> --- a/arch/m68k/include/asm/unistd.h
> +++ b/arch/m68k/include/asm/unistd.h
> @@ -4,7 +4,7 @@
>   #include <uapi/asm/unistd.h>
>   
>   
> -#define NR_syscalls		374
> +#define NR_syscalls		385
>   
>   #define __ARCH_WANT_OLD_READDIR
>   #define __ARCH_WANT_OLD_STAT
> diff --git a/arch/m68k/include/uapi/asm/unistd.h b/arch/m68k/include/uapi/asm/unistd.h
> index 0eebb28488eced36..98298206127d0930 100644
> --- a/arch/m68k/include/uapi/asm/unistd.h
> +++ b/arch/m68k/include/uapi/asm/unistd.h
> @@ -379,5 +379,16 @@
>   #define __NR_recvmmsg		371
>   #define __NR_sendmmsg		372
>   #define __NR_userfaultfd	373
> +#define __NR_msgget		374
> +#define __NR_msgctl		375
> +#define __NR_msgrcv		376
> +#define __NR_msgsnd		377
> +#define __NR_semget		378
> +#define __NR_semctl		379
> +#define __NR_semtimedop		380
> +#define __NR_shmget		381
> +#define __NR_shmctl		382
> +#define __NR_shmat		383
> +#define __NR_shmdt		384
>   
>   #endif /* _UAPI_ASM_M68K_UNISTD_H_ */
> diff --git a/arch/m68k/kernel/syscalltable.S b/arch/m68k/kernel/syscalltable.S
> index 7b5a315f6df2c770..dd6de8bb9b7c7aa4 100644
> --- a/arch/m68k/kernel/syscalltable.S
> +++ b/arch/m68k/kernel/syscalltable.S
> @@ -394,3 +394,14 @@ ENTRY(sys_call_table)
>   	.long sys_recvmmsg
>   	.long sys_sendmmsg
>   	.long sys_userfaultfd
> +	.long sys_msgget
> +	.long sys_msgctl		/* 375 */
> +	.long sys_msgrcv
> +	.long sys_msgsnd
> +	.long sys_semget
> +	.long sys_semctl
> +	.long sys_semtimedop		/* 380 */
> +	.long sys_shmget
> +	.long sys_shmctl
> +	.long sys_shmat
> +	.long sys_shmdt
