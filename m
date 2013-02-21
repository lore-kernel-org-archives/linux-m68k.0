From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] Add CPU_NAME for 68000
Date: Thu, 21 Feb 2013 23:27:25 +1000
Message-ID: <512620BD.6050608@uclinux.org>
References: <1360876714-6675-1-git-send-email-ljalvs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outbound-mail03.westnet.com.au ([203.10.1.244]:58254 "EHLO
	outbound-mail03.westnet.com.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751822Ab3BUN1j (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 21 Feb 2013 08:27:39 -0500
In-Reply-To: <1360876714-6675-1-git-send-email-ljalvs@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Luis Alves <ljalvs@gmail.com>
Cc: uclinux-dev@uclinux.org, linux-m68k@vger.kernel.org

Hi Luis,

On 15/02/13 07:18, Luis Alves wrote:
> This patch adds the correct CPU name.
> Without this, it just displays UNKNOWN at boot time and at '/proc/cpuinfo'.

Thanks. I'll add this to the m68knommu git tree. Though you won't
see it publicly until after the current 3.9 merge window closes.

Regards
Greg


> Signed-off-by: Luis Alves <ljalvs@gmail.com>
> ---
>   arch/m68k/kernel/setup_no.c |    3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
> index 71fb299..911ba47 100644
> --- a/arch/m68k/kernel/setup_no.c
> +++ b/arch/m68k/kernel/setup_no.c
> @@ -57,6 +57,9 @@ void (*mach_reset)(void);
>   void (*mach_halt)(void);
>   void (*mach_power_off)(void);
>
> +#ifdef CONFIG_M68000
> +#define CPU_NAME	"MC68000"
> +#endif
>   #ifdef CONFIG_M68328
>   #define CPU_NAME	"MC68328"
>   #endif
>
