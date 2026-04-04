Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF94F345CDD
	for <linux-m68k@lists.linux-m68k.org>; Sat,  4 Apr 2026 11:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775303873; cv=none; b=Y2j5gK2W2PSpzNur4HfU/tMt0kFOGBXRfA3z8Xm3EmDTEDX9WHmX7WWXFviU4PqLJ9GDArnaz9WZVl1U9a95VBt2QX16kDxENJYGq6x3Ag5bsKpx38UAMt4TE2XuGo/fJkyQKA9D8p0CGvRmQHTG+jktDhiYn2MvwD3rdni8/e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775303873; c=relaxed/simple;
	bh=fi7rFBbPm49SQkw6U68prWnAgp4VnRU2zETrTEZJrew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FHtTxg4mczwncrH6KO+fbn5HcxNFaGmNZT+yODl9NqiPqFiQHSQEtheLcz6iPMFEaAhHcgBLUI9005yzQTRfvitWcA+HYSIZi5+fGnxyZrL1Z9Bm1ePmdmaUFniAYNkgTiYxQ06azMhXYds01x01I+MJJt46hq1/mE/qz9JWRVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0679860008;
	Sat,  4 Apr 2026 11:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B5FC19421;
	Sat,  4 Apr 2026 11:57:47 +0000 (UTC)
Message-ID: <88b36f8b-1e70-4c4c-9351-c545e59c256a@linux-m68k.org>
Date: Sat, 4 Apr 2026 21:57:30 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] m68k: Fix task info flags handling for 68000
To: Daniel Palmer <daniel@0x0f.com>, christoph.plattner@gmx.at
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, sashal@kernel.org
References: <20260404023108.2495351-1-daniel@0x0f.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260404023108.2495351-1-daniel@0x0f.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 4/4/26 12:31, Daniel Palmer wrote:
> The logic for deciding what to do after a syscall should be checking
> if any of the lower byte bits are set and then checking if the reschedule
> bit is set.
> 
> Currently we are loading the top word, checking if any bits are set
> (which never seems to be true) and thus jumping over loading the
> whole long and checking if the reschedule bit is set.
> 
> We get the thread info in two places so split that logic out in
> a macro and then fix the code so that it loads the byte of the flags
> we need to check, checks if anything is set and then checks if
> the reschedule bit in particular is set.
> 
> Reported-by: Christoph Plattner <christoph.plattner@gmx.at>
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
> v2: Only load the lower byte of the flags as that's all we need.
>      This change was suggested by Greg and I tested it still works.

Thanks for taking care of this.
I have pushed into the m68knommu git tree for-next branch.

Regards
Greg



>   arch/m68k/68000/entry.S | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/m68k/68000/entry.S b/arch/m68k/68000/entry.S
> index 72e95663b62f..c257cc415c47 100644
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
> +	moveb	%a2@(TINFO_FLAGS + 3),%d1	/* thread_info->flags (low 8 bits) */
>   	jne	Lwork_to_do
>   	RESTORE_ALL
>   
>   Lwork_to_do:
> -	movel	%a2@(TINFO_FLAGS),%d1	/* thread_info->flags */
> +	/* check if reschedule needs to be called */
>   	btst	#TIF_NEED_RESCHED,%d1
>   	jne	reschedule
>   

