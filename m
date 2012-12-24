From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH] m68k: Wire up finit_module
Date: Mon, 24 Dec 2012 21:31:01 +1000
Message-ID: <50D83CF5.7090202__41053.535269066$1356348704$gmane$org@westnet.com.au>
References: <1356254998-13380-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1356254998-13380-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>, linux-kernel@vger.kernel.org

On 12/23/2012 07:29 PM, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Greg Ungerer <gerg@uclinux.org>


>   arch/m68k/include/asm/unistd.h      |    2 +-
>   arch/m68k/include/uapi/asm/unistd.h |    1 +
>   arch/m68k/kernel/syscalltable.S     |    1 +
>   3 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
> index 847994c..f9337f6 100644
> --- a/arch/m68k/include/asm/unistd.h
> +++ b/arch/m68k/include/asm/unistd.h
> @@ -4,7 +4,7 @@
>   #include <uapi/asm/unistd.h>
>
>
> -#define NR_syscalls		348
> +#define NR_syscalls		349
>
>   #define __ARCH_WANT_OLD_READDIR
>   #define __ARCH_WANT_OLD_STAT
> diff --git a/arch/m68k/include/uapi/asm/unistd.h b/arch/m68k/include/uapi/asm/unistd.h
> index b94bfbf..625f321 100644
> --- a/arch/m68k/include/uapi/asm/unistd.h
> +++ b/arch/m68k/include/uapi/asm/unistd.h
> @@ -353,5 +353,6 @@
>   #define __NR_process_vm_readv	345
>   #define __NR_process_vm_writev	346
>   #define __NR_kcmp		347
> +#define __NR_finit_module	348
>
>   #endif /* _UAPI_ASM_M68K_UNISTD_H_ */
> diff --git a/arch/m68k/kernel/syscalltable.S b/arch/m68k/kernel/syscalltable.S
> index c30da5b..3f04ea0 100644
> --- a/arch/m68k/kernel/syscalltable.S
> +++ b/arch/m68k/kernel/syscalltable.S
> @@ -368,4 +368,5 @@ ENTRY(sys_call_table)
>   	.long sys_process_vm_readv	/* 345 */
>   	.long sys_process_vm_writev
>   	.long sys_kcmp
> +	.long sys_finit_module
>
>
