Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B92820DD50
	for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Apr 2025 23:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745797970; cv=none; b=fMMePSU5c+phluhU+V+6G54sitFbHFpGUbjSJaKNkbUsMKqSmnnGAIw0LNkawacSszays48xrvOQwgFRcLbmBCoGwlXyfr0vxEvIzKIc24jQwzorlrQPuXTHFPviRIOy0RnVsvvxrDR1pPLviPKAaHvdYzMTL9eiT91p/1o6c+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745797970; c=relaxed/simple;
	bh=Blf2oY+040PZ8xuTRe4ED2+TJCxrPdGmdNIzr1Xdpec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ag4aYQ3aA3GizdibCj4VdSQGQ5PtMwxJSh669B+HszcDrLMl9BK80ZK6YgtqIjhQhbnEA37iZr+Q3FwtqvW6NGwodf71m5Kh0vIVRyzmKM3RtKPVHrXAysLW+uei7exfJHc1zrioJw1OtN5qWCV6FvAhlKephiAXOhgXEJdAfVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F11E25C5832;
	Sun, 27 Apr 2025 23:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F618C4CEE3;
	Sun, 27 Apr 2025 23:52:45 +0000 (UTC)
Message-ID: <8e6f3ad3-393b-4777-a4d0-24a524aad5aa@linux-m68k.org>
Date: Mon, 28 Apr 2025 09:52:43 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: Replace memcpy() + manual NUL-termination with
 strscpy()
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <20250415072433.75505-1-thorsten.blum@linux.dev>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20250415072433.75505-1-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Thorsten,

On 15/4/25 17:24, Thorsten Blum wrote:
> Use strscpy() to safely copy the command-line string instead of memcpy()
> followed by a manual NUL-termination.
> 
> The source string is also NUL-terminated and meets the __must_be_cstr()
> requirement of strscpy().
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks, applied to m68knommu git tree, for-next branch.

Regards
Greg


> ---
>   arch/m68k/kernel/setup_no.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
> index f9872098f5ca..f724875b15cc 100644
> --- a/arch/m68k/kernel/setup_no.c
> +++ b/arch/m68k/kernel/setup_no.c
> @@ -145,8 +145,7 @@ void __init setup_arch(char **cmdline_p)
>   
>   	/* Keep a copy of command line */
>   	*cmdline_p = &command_line[0];
> -	memcpy(boot_command_line, command_line, COMMAND_LINE_SIZE);
> -	boot_command_line[COMMAND_LINE_SIZE-1] = 0;
> +	strscpy(boot_command_line, command_line, COMMAND_LINE_SIZE);
>   
>   	/*
>   	 * Give all the memory to the bootmap allocator, tell it to put the

