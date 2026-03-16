Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20837231A41
	for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Mar 2026 14:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773670118; cv=none; b=HzyvkUWXp74Ee3Z/IKJE6lgXzTv9SZEagrwC7/ea5t9AoWKORY3lYVZRvyBxoTo03YM7QFSsTbE+Vn/b2V/JJojHIPabT1hplgMHcSzLh46gldK7HPQ3MTT/GRfC/1laNi2TbWE11YhDNH1A9p6iBlE2XF+dQp5yogqGhMC4nm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773670118; c=relaxed/simple;
	bh=3OPXg7dF8vrTaBd/eoJUZdLOe+u0w5RNcHHK5ytecBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSeRhtKENpYC0GrsKngZbDTC4Y6fE801rwxFoaNq58iHPgQt4xC0m74xa7ec0LfN7PaafsNiJiGHXvDWcLAvkUVZErQCE6TVe0RjCpLg+l5VmUHkKzyK1Tn2uh2Qoqp+59MOIBKkEcpYyyOqssaWN61YS+I3yQ6BQlkfWHrtj6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 951A843A21;
	Mon, 16 Mar 2026 14:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF7CC19421;
	Mon, 16 Mar 2026 14:08:35 +0000 (UTC)
Message-ID: <10efa219-f7d7-4655-9a48-b4094bf97d47@linux-m68k.org>
Date: Tue, 17 Mar 2026 00:08:25 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: Fix task info flags handling for 68000
To: Daniel Palmer <daniel@0x0f.com>, geert@linux-m68k.org,
 christoph.plattner@gmx.at, linux-m68k@lists.linux-m68k.org
Cc: sashal@kernel.org
References: <20260312115832.835968-1-daniel@0x0f.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260312115832.835968-1-daniel@0x0f.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 12/3/26 21:58, Daniel Palmer wrote:
> The logic for deciding what to do after a syscall should be checking
> if any of the lower word bits are set and then checking if the reschedule
> bit is set.
> 
> Currently we are loading the top word, checking if any bits are set
> (which never seems to be true) and thus jumping over loading the
> whole long and checking if the reschedule bit is set.
> 
> We get the thread info in two places so split that logic out in
> a macro and then fix the code so that it just loads the whole
> of the flags, checks if anything is set and then checks if
> the reschedule bit in particular is set.
> 
> Reported-by: Christoph Plattner <christoph.plattner@gmx.at>
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
> 
> I have had a variation of this patch for ages and haven't
> gotten around to sending it. Christoph e-mailed us (Greg, Sasha and me)
> to report this issue with a similar patch. Apparently this is an
> issue all the way back to 5.15.
> 
> Christoph, can you check this works for you? I took this out of my
> personal branch and made sure it built but I have a bunch of other
> junk I need to actually boot it on the things I have.
> 
>   arch/m68k/68000/entry.S | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/m68k/68000/entry.S b/arch/m68k/68000/entry.S
> index 72e95663b62f..cd193fd34c19 100644
> --- a/arch/m68k/68000/entry.S
> +++ b/arch/m68k/68000/entry.S
> @@ -18,6 +18,13 @@
>   
>   .text
>   
> +/* get thread_info pointer into a2 */
> + .macro getthreadinfo
> +	movel	%sp,%d1
> +	andl	#-THREAD_SIZE,%d1
> +	movel	%d1,%a2
> + .endm
> +
>   .globl system_call
>   .globl resume
>   .globl ret_from_exception
> @@ -70,9 +77,8 @@ ENTRY(system_call)
>   
>   	movel	%sp@(PT_OFF_ORIG_D0),%d0
>   
> -	movel	%sp,%d1			/* get thread_info pointer */
> -	andl	#-THREAD_SIZE,%d1
> -	movel	%d1,%a2
> +	/* Doing a trace ? */
> +	getthreadinfo
>   	btst	#(TIF_SYSCALL_TRACE%8),%a2@(TINFO_FLAGS+(31-TIF_SYSCALL_TRACE)/8)
>   	jne	do_trace
>   	cmpl	#NR_syscalls,%d0
> @@ -96,16 +102,15 @@ Luser_return:
>   	/* heavy interrupt load*/
>   	andw	#ALLOWINT,%sr
>   
> -	movel	%sp,%d1			/* get thread_info pointer */
> -	andl	#-THREAD_SIZE,%d1
> -	movel	%d1,%a2
> +	getthreadinfo
>   1:
> -	move	%a2@(TINFO_FLAGS),%d1	/* thread_info->flags */
> +	/* check if any of the flags are set */
> +	movel	%a2@(TINFO_FLAGS),%d1	/* thread_info->flags */

The comments from arch/m68k/include/asm/thread_info.h are this:

/* entry.S relies on these definitions!
  * bits 0-7 are tested at every exception exit
  * bits 8-15 are also tested at syscall exit
  */

So looking at what check is in arch/m68k/coldfire/entry.S:

     moveb   %a0@(TINFO_FLAGS+3),%d1 /* thread_info->flags (low 8 bits) */

In arch/m68k/kernel/entry.S it looks to be doing basically the same thing:

     moveb   %a1@(TINFO_FLAGS+3),%d0

So they do really only check bits 0-7 here.

If you code the check like that do you still get correct running behavior?

Regards
Greg



>   	jne	Lwork_to_do
>   	RESTORE_ALL
>   
>   Lwork_to_do:
> -	movel	%a2@(TINFO_FLAGS),%d1	/* thread_info->flags */
> +	/* check if reschedule needs to be called */
>   	btst	#TIF_NEED_RESCHED,%d1
>   	jne	reschedule
>   

