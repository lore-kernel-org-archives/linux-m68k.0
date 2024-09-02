Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E839A381AA
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Sep 2024 02:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725243044; cv=none; b=tooYl0B+zV0QM6hi97Ol96xq+RK938pf+AGHL8NHzpIiEgq5aW8Fy4OAuSKhfzv69juwwMJbANPXevcpqrsE5LHcTw5Pj7hi1+s/pEFnfpw5Ai0PUvvOfQi/7iBscLbhLrQqeMG9ZoJlZmOMjPkjFd63efpiKT1g712iyK8209g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725243044; c=relaxed/simple;
	bh=NywgQX5uVanACwXn0eOYKwiWw3QHEo8iwJBzG8PXgfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WtaBxhN71tQ+Ss9fR9yx75D93rAmKJTxxEDwKK/HLiBKdJdA92pS5fGXrUAGU5xG0IWhBXBaB/uML5lw+ujqUvyc+sSlBTuh33LBbASdb1WD0ZT+hsnq2xJtVZ7CDulQKPkF0w6MdlfVGXVRzXrk1M4mq/F1iyzGOlS+45QkHBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 112A2A4162C;
	Mon,  2 Sep 2024 02:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B817C4CEC3;
	Mon,  2 Sep 2024 02:10:38 +0000 (UTC)
Message-ID: <9bc18998-821b-42d1-8c6b-abc528be33f2@linux-m68k.org>
Date: Mon, 2 Sep 2024 12:10:35 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] m68k: remove trailing space after \n newline
To: Colin Ian King <colin.i.king@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240901155846.142816-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20240901155846.142816-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Colin,

On 2/9/24 01:58, Colin Ian King wrote:
> There is a extraneous space after a newline in a pr_debug message.
> Remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks, looks good.
I have applied to for-next branch of m68knommu git tree.

Regards
Greg


> ---
>   arch/m68k/kernel/setup_no.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
> index 37fb663559b4..c926da9d5ec2 100644
> --- a/arch/m68k/kernel/setup_no.c
> +++ b/arch/m68k/kernel/setup_no.c
> @@ -138,7 +138,7 @@ void __init setup_arch(char **cmdline_p)
>   
>   	pr_debug("KERNEL -> TEXT=0x%p-0x%p DATA=0x%p-0x%p BSS=0x%p-0x%p\n",
>   		 _stext, _etext, _sdata, _edata, __bss_start, __bss_stop);
> -	pr_debug("MEMORY -> ROMFS=0x%p-0x%06lx MEM=0x%06lx-0x%06lx\n ",
> +	pr_debug("MEMORY -> ROMFS=0x%p-0x%06lx MEM=0x%06lx-0x%06lx\n",
>   		 __bss_stop, memory_start, memory_start, memory_end);
>   
>   	memblock_add(_rambase, memory_end - _rambase);
