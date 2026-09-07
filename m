Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563E161FCE
	for <linux-m68k@lists.linux-m68k.org>; Mon,  7 Sep 2026 05:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788757750; cv=none; b=l8aMbGAAsQAqFHHXRWUkCvGtfEfbsuUQchhr15g0775Zs/0AwB4IdRFJWrgPGu1p2On9UqiBLC5fAfm8cXLGa8RXdY1lu0dctcPj/gAK2FYL433wYvA0UNn2k5gjDG9zMLleoQ5GKcAd2ILUVQSXDR0dVIvSP9nFGsYKaDTVC1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788757750; c=relaxed/simple;
	bh=aegAgGrgZYW4K0GvKRNriugYJVkaljJLt2KcfkmmOSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=trNkC7OiL5khE2IkBEcDRW/DuSTd7HQb3r9K20+cC/VTM6Ad1llRsLTnjqluuQW2/enG8Cb3UEdnK4mCy4mzUL7C1EEU2N8nPvfSCVELROgyKDK3QdxI5cPsU6c4hrUW4vaJIP1i0Q1+edgjwoJRsGzsEPf1ji202iT6tnb/UFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 34C9E60A96;
	Mon,  7 Sep 2026 05:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033D11F00A3A;
	Mon,  7 Sep 2026 05:09:05 +0000 (UTC)
Message-ID: <a0844255-193a-41fe-9f58-40c1508ea72e@linux-m68k.org>
Date: Mon, 7 Sep 2026 15:08:44 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] m68k: coldfire: fix typos in reset.c comment
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <20260907044545.6187-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260907044545.6187-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hemanth,

On 7/9/26 14:45, Hemanth Selam wrote:
> Correct "reseting" to "resetting" and "ColdFure" to "ColdFire".
> 
> v1 fixed only "reseting", which checkpatch had flagged, and left
> "ColdFure" two words earlier untouched.  Josh Juran spotted it.
> 
> Only touches a comment, no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Thanks for updating with the suggested fix to "ColdFire".
Applied to for-next branch of m68knommu git tree.

Regards
Greg



> ---
>  arch/m68k/coldfire/reset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/coldfire/reset.c b/arch/m68k/coldfire/reset.c
> index 6e5f8ab39f32..079c92593eff 100644
> --- a/arch/m68k/coldfire/reset.c
> +++ b/arch/m68k/coldfire/reset.c
> @@ -16,7 +16,7 @@
>  #include <asm/mcfsim.h>
>  
>  /*
> - *	There are 2 common methods amongst the ColdFure parts for reseting
> + *	There are 2 common methods amongst the ColdFire parts for resetting
>   *	the CPU. But there are couple of exceptions, the 5272 and the 547x
>   *	have something completely special to them, and we let their specific
>   *	subarch code handle them.

