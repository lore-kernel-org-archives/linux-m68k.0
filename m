Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B13E207A0C
	for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Apr 2025 23:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745797362; cv=none; b=H7zKwLL2NEayjSGoV4caDFlngS4nrx8fALCFgYRRJy5+GBHkb9BBYtTLQxCfFf4vLM+3lxcvQDIKrtF8g4C5RBABnMQGUY11aUg9A5+xoDk4ML8S9CcTkslylg59OmMprBy83MESwskupUZLbb2IHf96M7VWlvrIBTV0OADPLjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745797362; c=relaxed/simple;
	bh=y7YGvbxfyiNsmyzwbd6N3ByyL66XkY8J2RjbfDSZwjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhkR0I6vlfvLWieVz49wVL+lsYfuwvVSgpLTy3A+Ai4i/O7oQ+9fQm+VQBDnIFSoIk/xvuX2JeJa6A1hi81Dc/oDQmWjF9tOG0e/CDF6Q9zwE5a1ewwaIEun9p7mMBZxVSVHypzF9fXAtmD84y9aHFO3pOF69kG7awobgZ6HzNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B4C6443A2B;
	Sun, 27 Apr 2025 23:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97765C4CEE3;
	Sun, 27 Apr 2025 23:42:38 +0000 (UTC)
Message-ID: <8c474cf7-87ba-424b-a7da-dab917d0a305@linux-m68k.org>
Date: Mon, 28 Apr 2025 09:42:36 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] m68k/kernel: replace strncpy() with strscpy()
To: Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>, geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <20250403181200.34418-1-m.mahdianbaraki@gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20250403181200.34418-1-m.mahdianbaraki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Homammad,

On 4/4/25 04:11, Mohammad Mahdi Anbaraki wrote:
> Swapped out strncpy() for strscpy() in parse_uboot_commandline() while
> copying to commandp. strscpy() makes sure the string is properly null-
> terminated and gives a more useful return value so it's just a safer
> choice overall.
> 
> Link: https://github.com/KSPP/linux/issues/90
> Signed-off-by: Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>

Thanks. Seeing as this only affects nommu/coldfire I will apply this
to the m68knommu git tree, for-next branch.

Regards
Greg


> ---
> Changes in v2:
> - s/m64/m68
> 
>   arch/m68k/kernel/uboot.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
> index 5e52ea150..fa7c279ea 100644
> --- a/arch/m68k/kernel/uboot.c
> +++ b/arch/m68k/kernel/uboot.c
> @@ -73,7 +73,7 @@ static void __init parse_uboot_commandline(char *commandp, int size)
>   	uboot_cmd_end = sp[5];
>   
>   	if (uboot_cmd_start && uboot_cmd_end)
> -		strncpy(commandp, (const char *)uboot_cmd_start, size);
> +		strscpy(commandp, (const char *)uboot_cmd_start, size);
>   
>   #if defined(CONFIG_BLK_DEV_INITRD)
>   	uboot_initrd_start = sp[2];

