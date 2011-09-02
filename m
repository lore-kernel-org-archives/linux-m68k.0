From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: remove dead definition from thread-info.h
Date: Fri, 2 Sep 2011 22:48:45 +1000
Message-ID: <4E60D0AD.905@snapgear.com>
References: <1314941497-32136-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:31916 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751845Ab1IBMxt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 2 Sep 2011 08:53:49 -0400
In-Reply-To: <1314941497-32136-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org

On 09/02/2011 03:31 PM, gerg@snapgear.com wrote:
> From: Greg Ungerer<gerg@uclinux.org>
>
> The conditional definition of the task_thread_info() macro based on
> ASM_OFFSETS_C being defined is not used. Remove it.

No, scratch this. From a clean build you need this
in place, before asm-offsets.h has been generated.

Regards
Greg


> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
> ---
>   arch/m68k/include/asm/thread_info.h |    6 +-----
>   1 files changed, 1 insertions(+), 5 deletions(-)
>
> diff --git a/arch/m68k/include/asm/thread_info.h b/arch/m68k/include/asm/thread_info.h
> index e4e2159..6140b48 100644
> --- a/arch/m68k/include/asm/thread_info.h
> +++ b/arch/m68k/include/asm/thread_info.h
> @@ -53,13 +53,9 @@ struct thread_info {
>   #include<asm/current.h>
>   #endif
>
> -#ifdef ASM_OFFSETS_C
> -#define task_thread_info(tsk)	((struct thread_info *) NULL)
> -#else
>   #include<asm/asm-offsets.h>
> -#define task_thread_info(tsk)	((struct thread_info *)((char *)tsk+TASK_INFO))
> -#endif
>
> +#define task_thread_info(tsk)	((struct thread_info *)((char *)tsk+TASK_INFO))
>   #define init_thread_info	(init_task.thread.info)
>   #define task_stack_page(tsk)	((tsk)->stack)
>   #define current_thread_info()	task_thread_info(current)


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
