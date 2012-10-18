From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: Wire up kcmp
Date: Fri, 19 Oct 2012 09:51:42 +1000
Message-ID: <5080960E.2080501__46814.9591972635$1350617724$gmane$org@snapgear.com>
References: <1350581535-29428-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1350581535-29428-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On 19/10/12 03:32, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Looks good Geert.

Acked-by: Greg Ungerer <gerg@uclinux.org>

Rgeards
Greg



> ---
>   arch/m68k/include/asm/unistd.h      |    2 +-
>   arch/m68k/include/uapi/asm/unistd.h |    1 +
>   arch/m68k/kernel/syscalltable.S     |    1 +
>   3 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
> index c004dfd..5fc7f7b 100644
> --- a/arch/m68k/include/asm/unistd.h
> +++ b/arch/m68k/include/asm/unistd.h
> @@ -4,7 +4,7 @@
>   #include <uapi/asm/unistd.h>
>
>
> -#define NR_syscalls		347
> +#define NR_syscalls		348
>
>   #define __ARCH_WANT_OLD_READDIR
>   #define __ARCH_WANT_OLD_STAT
> diff --git a/arch/m68k/include/uapi/asm/unistd.h b/arch/m68k/include/uapi/asm/unistd.h
> index fdeb341..b94bfbf 100644
> --- a/arch/m68k/include/uapi/asm/unistd.h
> +++ b/arch/m68k/include/uapi/asm/unistd.h
> @@ -352,5 +352,6 @@
>   #define __NR_setns		344
>   #define __NR_process_vm_readv	345
>   #define __NR_process_vm_writev	346
> +#define __NR_kcmp		347
>
>   #endif /* _UAPI_ASM_M68K_UNISTD_H_ */
> diff --git a/arch/m68k/kernel/syscalltable.S b/arch/m68k/kernel/syscalltable.S
> index ce827b3..4fc2e29 100644
> --- a/arch/m68k/kernel/syscalltable.S
> +++ b/arch/m68k/kernel/syscalltable.S
> @@ -367,4 +367,5 @@ ENTRY(sys_call_table)
>   	.long sys_setns
>   	.long sys_process_vm_readv	/* 345 */
>   	.long sys_process_vm_writev
> +	.long sys_kcmp
>
>


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
