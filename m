Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D86263F3F
	for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Apr 2025 13:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745240494; cv=none; b=GyoOXuXn+fb0x0OgToEvpJNxVKgV4FpSO4zMo+joP7QHSTwFfxUzTMVqf5HMYaRBpWAH61Zfx4DMYhphgFg8YZG7T1Ib2XfqqVg5NIcggi82hHvr+eWayL3qE8QZvLQNW9IGnubJZZ15vncLV3Z0fFUepAqX4GPJP3NJ+xxIzko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745240494; c=relaxed/simple;
	bh=4i1c55rUNA71b5M06CzUFYamXKiBN3C+hyynBXcJZ+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gM/W+b5o26e/Bwk2xBIDJ3Y934Kw0chAw/4XlNkkDHP2aeLgwcLbm8l/65JNe0if6TXGinZu62RklwgeYHyfu6ALjD3Fzzaa5UEu6MAzaqvmqKllDUA1wACYpsK9z+NbzkWA1vJLPwK60GyJMiwKDWLDmYuZxYtd0vboF1sOkg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=EvDZsETE; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="EvDZsETE"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B2F143B5C;
	Mon, 21 Apr 2025 13:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1745240489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EYps2HRoxyHTjjb+vO467vxPEr3fkE6//isgs39lOYM=;
	b=EvDZsETEhY/vrAgIyH2NXFakawyfS7RnL5RzqlnCAP7SLNF1raztizBujexDZ6lpjwRnBJ
	aaxBsTG2q10Blc8h1ZhH24bN0akNA2UVi7IeWUbhGsLaWKLflVUlOBBRgpy9Kh3yLUGT4L
	hKBlvd++rb5338AEbZFzLJ7DCqJomM4bcqcuo/qfKSKsrdNQhQr3BU1844Rq7PbptnMBYK
	PSSSaNeHmfx7dHcZlrzPU0n2PuTBSDkajZu2DXpDPwojgs+Nkwu0V2x3wViqa1EkmNzgDf
	5GCDcAyrzZClQuJ0vWC49F/dWzMCCvq6SrHlRBKu+HHGp2LoBcy2/Ui7B6rcBw==
Message-ID: <808bf053-9e29-4336-94f9-29bcb22c097b@yoseli.org>
Date: Mon, 21 Apr 2025 15:01:28 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: replace deprecated strncpy with strscpy
To: Shankari02 <shankari.ak0208@gmail.com>, linux-m68k@lists.linux-m68k.org
Cc: geert@linux-m68k.org
References: <20250417201013.46384-1-shankari.ak0208@gmail.com>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <20250417201013.46384-1-shankari.ak0208@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeflvggrnhdqofhitghhvghlucfjrghuthgsohhishcuoehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgheqnecuggftrfgrthhtvghrnhepveekhffgueejvdehudegveetkeelueetieelhfegveejudektdeuhefggeejtefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledurdduieehrdduieehrdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledurdduieehrdduieehrdduleejpdhhvghloheplgduledvrdduieekrddurdeingdpmhgrihhlfhhrohhmpehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdpnhgspghrtghpthhtohepfedprhgtphhtthhopehshhgrnhhkrghrihdrrghktddvtdeksehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrgh
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Shankari,

On 17/04/2025 22:10, Shankari02 wrote:
> The use of strncpy() does not guarantee NUL-termination and is deprecated
> in the Linux kernel. This code manually terminates the buffer afterward,
> but using strscpy() is simpler and safer.

This assumption is true, but adding a link to the explanation could be 
better ?
https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy

> 
> This change replaces the strncpy() + NUL termination pattern with strscpy().
> 
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> ---
>   arch/m68k/kernel/setup_mm.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
> index 15c1a595a1de..48ce67947678 100644
> --- a/arch/m68k/kernel/setup_mm.c
> +++ b/arch/m68k/kernel/setup_mm.c
> @@ -243,8 +243,7 @@ void __init setup_arch(char **cmdline_p)
>   	setup_initial_init_mm((void *)PAGE_OFFSET, _etext, _edata, _end);
>   
>   #if defined(CONFIG_BOOTPARAM)
> -	strncpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
> -	m68k_command_line[CL_SIZE - 1] = 0;
> +	strscpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
>   #endif /* CONFIG_BOOTPARAM */
>   	process_uboot_commandline(&m68k_command_line[0], CL_SIZE);
>   	*cmdline_p = m68k_command_line;

As we are not using the return value, I think it is a safe replacement.

With the link added:
Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

