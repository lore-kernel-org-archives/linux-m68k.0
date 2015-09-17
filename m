From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH v2 3/4] m68k: Wire up direct ipc calls
Date: Thu, 17 Sep 2015 16:34:42 +0200
Message-ID: <mvma8slm7wd.fsf@hawking.suse.de>
References: <1442221006-2027-1-git-send-email-geert@linux-m68k.org>
	<1442221006-2027-4-git-send-email-geert__19660.9066486873$1442221083$gmane$org@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1442221006-2027-4-git-send-email-geert__19660.9066486873$1442221083$gmane$org@linux-m68k.org>
	(Geert Uytterhoeven's message of "Mon, 14 Sep 2015 10:56:45 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v2:
>   - New.
> ---
>  arch/m68k/include/asm/unistd.h      |  2 +-
>  arch/m68k/include/uapi/asm/unistd.h | 11 +++++++++++
>  arch/m68k/kernel/syscalltable.S     | 11 +++++++++++
>  3 files changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
> index d25d5a5c83cb6d6b..887667ad6a2f9536 100644
> --- a/arch/m68k/include/asm/unistd.h
> +++ b/arch/m68k/include/asm/unistd.h
> @@ -4,7 +4,7 @@
>  #include <uapi/asm/unistd.h>
>  
>  
> -#define NR_syscalls		374
> +#define NR_syscalls		385
>  
>  #define __ARCH_WANT_OLD_READDIR
>  #define __ARCH_WANT_OLD_STAT
> diff --git a/arch/m68k/include/uapi/asm/unistd.h b/arch/m68k/include/uapi/asm/unistd.h
> index 0eebb28488eced36..98298206127d0930 100644
> --- a/arch/m68k/include/uapi/asm/unistd.h
> +++ b/arch/m68k/include/uapi/asm/unistd.h
> @@ -379,5 +379,16 @@
>  #define __NR_recvmmsg		371
>  #define __NR_sendmmsg		372
>  #define __NR_userfaultfd	373
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

It would be nice if the direct syscalls would drop the use of
ipc_parse_version.  Currently, apart from going through the ipc
multiplexer, the semctl, shmctl and msgctl wrappers in libc need to add
the IPC_64 bit to the cmd operand.  If that would be implied then no
special wrappers would be needed any more for direct syscalls.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
