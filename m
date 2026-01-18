Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7B131AAAA
	for <linux-m68k@lists.linux-m68k.org>; Sun, 18 Jan 2026 23:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768778600; cv=none; b=hbXYETBBjB3XvuRfrpIABL2lUM+JX86YZhfevB2Wu3Q+xtZuv4o2zr9W/nYnqXimMOTz3w86Qzj5+W6jjfWnAj+FdLSHYznZa6hrSleSIKgWAO7/mHQBq/9H0N6GY6WaPoTJzthsLXiPsrYvecULqwkUh+oa19xEfJsz2x3mrIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768778600; c=relaxed/simple;
	bh=SxSuGDkkfdaFlcw0f/gAXaelcBTfHHqeVzYfNdVzysU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QKuYDwP4uyGe7T9zZVJ5s1p5CdImyKJmin/ybKDP+vhvV9pY7TMHoqUQfNrDYlxXnLDLEpvbKzFX2rGDCzXb6dCmNZ26jIOdSHeWi38JvzZI8auw/aTqZ2mEVLS85mcZxJ95u+hiQmBYkVL4VXS4VVPxgYiQmxhCaKCdXnKZK+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB55B43E66;
	Sun, 18 Jan 2026 23:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0800C116D0;
	Sun, 18 Jan 2026 23:23:16 +0000 (UTC)
Message-ID: <7e3e6aa7-9d9b-424a-8964-d18d26df1f06@linux-m68k.org>
Date: Mon, 19 Jan 2026 09:23:13 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68knommu: Replace deprecated strcpy with strscpy in
 init_ucsimm
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <20260118173349.1197500-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260118173349.1197500-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Thorsten,

On 19/1/26 03:33, Thorsten Blum wrote:
> strcpy() has been deprecated [1] because it performs no bounds checking
> on the destination buffer, which can lead to buffer overflows. Replace
> it with the safer strscpy().
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks, applied to m68knommu git tree, for-next branch.

Regards
Greg



> ---
> Compile-tested only.
> ---
>   arch/m68k/68000/ucsimm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/68000/ucsimm.c b/arch/m68k/68000/ucsimm.c
> index c54fde75eae8..6b84e826040f 100644
> --- a/arch/m68k/68000/ucsimm.c
> +++ b/arch/m68k/68000/ucsimm.c
> @@ -9,6 +9,7 @@
>    * for more details.
>    */
>   #include <linux/init.h>
> +#include <linux/string.h>
>   #include <asm/bootstd.h>
>   #include <asm/machdep.h>
>   #include <asm/MC68VZ328.h>
> @@ -31,7 +32,7 @@ void __init init_ucsimm(char *command, int size)
>   	pr_info("uCsimm/uCdimm hwaddr %pM\n", p);
>   	p = getbenv("APPEND");
>   	if (p)
> -		strcpy(p, command);
> +		strscpy(p, command, size);
>   	else
>   		command[0] = 0;
>   }

