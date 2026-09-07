Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB35833F589
	for <linux-m68k@lists.linux-m68k.org>; Mon,  7 Sep 2026 05:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788758017; cv=none; b=rcFdUk6pjHiV04dzLfvOR/3iC6h4M9yxZdFZcwGzrPSRqxRg1wRxEPamSl7267CvYxbBE/S/KdB+zwHumQ5B6/T6tpYXgZh6vwF6LvO/F3K6nxvHodOZX9ouynCBegvVKGBcoPb++/EE/LCj/tLvxnxPg3ttcPA0G7mZbUEwgew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788758017; c=relaxed/simple;
	bh=t4U0Jc1prbLxYSkEeJam5m7mHYjxnvcC+aOU88zRphg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eliKGk1huIGGAM822ILoScKgm3wfbzIZVXX8WVceVYnZFyAPOYpGabRTmk7KXIeZJXyv22l3zjvFoT/DVW7+/LUEznZbpHn0li+JoJ3vI7l6r58Rsp/C2x4XQYfbYPbz5rzSgc515k/rSo/KUpD0RczIwJH0zD7+f1CzmLWWM3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 672244096B;
	Mon,  7 Sep 2026 05:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D21A1F00A3A;
	Mon,  7 Sep 2026 05:13:34 +0000 (UTC)
Message-ID: <347c0282-4cc0-4583-8aa3-7c7fbd59b14d@linux-m68k.org>
Date: Mon, 7 Sep 2026 15:13:29 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: fix typo "eanble" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org
References: <20260904112245.37109-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260904112245.37109-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hemanth,

On 4/9/26 21:22, Hemanth Selam wrote:
> Correct "eanble" to "Enable", reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

This is related to ColdFire support, so I will apply to for-next branch of
m68knommu git tree.

Thanks
Greg


> ---
>  arch/m68k/include/asm/m53xxacr.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/include/asm/m53xxacr.h b/arch/m68k/include/asm/m53xxacr.h
> index 692f90e7fecc..a29ad33aaf05 100644
> --- a/arch/m68k/include/asm/m53xxacr.h
> +++ b/arch/m68k/include/asm/m53xxacr.h
> @@ -32,7 +32,7 @@
>  #define CACR_DCM_PRE	0x00000200	/* Cache inhibited, precise */
>  #define CACR_DCM_IMPRE	0x00000300	/* Cache inhibited, imprecise */
>  #define CACR_WPROTECT	0x00000020	/* Write protect*/
> -#define CACR_EUSP	0x00000010	/* Eanble separate user a7 */
> +#define CACR_EUSP	0x00000010	/* Enable separate user a7 */
>  
>  /*
>   * Define the Access Control register flags.

