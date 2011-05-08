From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: Really wire up sys_pselect6 and sys_ppoll
Date: Mon, 9 May 2011 08:45:50 +1000
Message-ID: <4DC71D1E.5030407@snapgear.com>
References: <alpine.DEB.2.00.1105062107290.23969@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1105062107290.23969@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, uClinux list <uclinux-dev@uclinux.org>, Greg Ungerer <gerg@uclinux.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On 07/05/11 05:08, Geert Uytterhoeven wrote:
> We reserved the numbers a long time ago, but never wired them up in the
> syscall table as they need TIF_RESTORE_SIGMASK, which we only got last year
> in commit cb6831d5d3099e772a510eb3e1ed0760ccffb45e ("m68k: Switch to saner
> sigsuspend()")
>
> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>

Acked-by: Greg Ungerer <gerg@uclinux.org>


> ---
> I'll move this before "m68k: unistd - Comment out definitions for unimplemented
> syscalls", and will update the latter.
>
>   arch/m68k/kernel/syscalltable.S |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/m68k/kernel/syscalltable.S b/arch/m68k/kernel/syscalltable.S
> index cb3bc1b..6f7b091 100644
> --- a/arch/m68k/kernel/syscalltable.S
> +++ b/arch/m68k/kernel/syscalltable.S
> @@ -321,8 +321,8 @@ ENTRY(sys_call_table)
>   	.long sys_readlinkat
>   	.long sys_fchmodat
>   	.long sys_faccessat		/* 300 */
> -	.long sys_ni_syscall		/* Reserved for pselect6 */
> -	.long sys_ni_syscall		/* Reserved for ppoll */
> +	.long sys_pselect6
> +	.long sys_ppoll
>   	.long sys_unshare
>   	.long sys_set_robust_list
>   	.long sys_get_robust_list	/* 305 */


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
