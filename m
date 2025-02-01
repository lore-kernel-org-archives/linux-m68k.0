Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16FC18870C
	for <linux-m68k@lists.linux-m68k.org>; Sat,  1 Feb 2025 11:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738410371; cv=none; b=IyOewDN8bTV0DC7NvZP6jdpMR6dco21p7DpBtS6qQjpx1EEHDrJlmxDQF2IVUDXfRSdU/YQA4V3mWQrZZ3ndPvp1kB5dKt1TRoi5ygB/Uezt2tYiGs0CGqvHm1eD/EB19D4QtoZ432jhB0mNl/ByhZ+gTc3LyVmQQq5AATZUB1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738410371; c=relaxed/simple;
	bh=cOdNtiTx/Mp1wAyFJr/UZjYnBL9yvifLP6FLpeE0ANk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m9xxmhXfz2DlrdJD1i5kYyncg7pvsuqg4Jyfdy58uqbFCr4PyQoEkVbLK5q0HyC5TvqS2Sq78x2e5KI2mQS01sMJHf78Kwk367CmmErI++ly4+o/uXt+fPHHjQI/F/qY1+8o9IZVHA9mPOtLwUNhxm2ow0PgXVJehWfZ5/oCbrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 53FA4A408EB;
	Sat,  1 Feb 2025 11:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A24C4CED3;
	Sat,  1 Feb 2025 11:46:06 +0000 (UTC)
Message-ID: <49ae4ee5-459d-40b6-8723-5cfa91a0777a@linux-m68k.org>
Date: Sat, 1 Feb 2025 21:46:03 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: Do not include <linux/fb.h>
To: Thomas Zimmermann <tzimmermann@suse.de>, geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <20250131144026.310672-1-tzimmermann@suse.de>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20250131144026.310672-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Thomas,

On 1/2/25 00:40, Thomas Zimmermann wrote:
> The m68k architecture's source files does not require <linux/fb.h>.
> Remove the include statements.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Looks good, thanks. I will apply to the m68knommu git tree, for-next branch,
after the current merge window closes.

Regards
Greg


> ---
>   arch/m68k/kernel/setup_no.c | 1 -
>   arch/m68k/kernel/uboot.c    | 1 -
>   2 files changed, 2 deletions(-)
> 
> diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
> index c926da9d5ec28..f9872098f5ca5 100644
> --- a/arch/m68k/kernel/setup_no.c
> +++ b/arch/m68k/kernel/setup_no.c
> @@ -21,7 +21,6 @@
>   #include <linux/sched.h>
>   #include <linux/delay.h>
>   #include <linux/interrupt.h>
> -#include <linux/fb.h>
>   #include <linux/module.h>
>   #include <linux/mm.h>
>   #include <linux/console.h>
> diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
> index 8bb1cb3a7490e..5e52ea150d5cb 100644
> --- a/arch/m68k/kernel/uboot.c
> +++ b/arch/m68k/kernel/uboot.c
> @@ -10,7 +10,6 @@
>   #include <linux/sched.h>
>   #include <linux/delay.h>
>   #include <linux/interrupt.h>
> -#include <linux/fb.h>
>   #include <linux/module.h>
>   #include <linux/mm.h>
>   #include <linux/console.h>

