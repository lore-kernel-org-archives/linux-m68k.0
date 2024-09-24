Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ECF4C83
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Sep 2024 01:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727139767; cv=none; b=CzobS0WFjvweDHFdHxOXxpJjDS+W1O/MuX0wNE4fP1dpgFhZkqcbNQL4D+OUfeuDj2q3dEjhrmoXk4PAcSMkG5liIMxObV37RpJqyohGgspCpZ+qYRmAR8rzgj3s6+J5BHrHgVBrcL+aOU0A5AqLYoLQMLu4vI33zLMwLaoxWWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727139767; c=relaxed/simple;
	bh=Kq+VmnEeqvl7biV9vbaDWGtyKSNSACjriF5EG+LPhxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JA64F4OVl+R1wnyhzggqScXPByAzcyMAPKHh6hckke1T0P0NySDPzN0zp1rLYQUGRwvDI+vf1u88kXSQr1tv1lMY0k6y3mUsusBrdPq+SI3gIsopzV4FmoeNe8yKwZCM7RxOvFWOzW8zbL7KMNfhS145NkdbI8ICCBie+yZheQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpPNxnkM; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpPNxnkM"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2053616fa36so59799055ad.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Sep 2024 18:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727139765; x=1727744565; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c08FS4U7FYHr2DFhFogjZetrIN9aBXfvq2eAQUAVOjw=;
        b=FpPNxnkMiv7bA3BsiNzDlmtOgVxC1PNNbrhvOJBfbfQZG4ik0lp56YxDHhSzSd2zyA
         s208nNJk5BV+lXIURjnp+VcX+4yNMn6TOrrz6/bbcbsUizmqCIvgZtc2WWELfgooNBHl
         0S2fwP14BY2kMTDfEIIuy9CRHoGj2mLIDsEkkJ2EPGgzSuxtScxEepk97dATehYYf9Yz
         QU2LaDlex97GuW/JJ7+kqlVYbqyTaRiMUPbUGo8/x5Jg0xcLkBsxbRLKvkBotI+eoc+S
         xM/jRIdHu5oh5LRmDc9LCSONXXVKyPrztWfDC4nDKP1A8s1K034UXK9uVNkwDStbkLIv
         l/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727139765; x=1727744565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c08FS4U7FYHr2DFhFogjZetrIN9aBXfvq2eAQUAVOjw=;
        b=Pu1y87FQSQAmUlqLlioX12J1VxekFA/UVCDS99+CaCA/6Qza0GV7oT73Bmv9lSa0V4
         HJBFRvWS/lB9fQgfVR6y6qhFygyPUbMrZNQegmJ/jsOSqvkdUTRYq6lp7+5BoYf+Besg
         V+LRHVSpKd4v9tdl++KwTDGRiYdIT1HrZo/R3b7Ug5pVp20fC61X0rYpf/5jftkx9cQS
         D9XYTOxpLB/O/bcU9T8HaS6Fsc+ZVkRa1qGicOYn11dsdn0BZxeM4aiubeL9bnzJVu7Y
         RLR2Eu5VyG3kV1jbYc5+mA8CIRCHkETG4Y4hrBMLXRFNeDgDa9x8yFoQHBNW6DW7pRab
         rfpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgv2YLGMKgmXf8/R3278QE+qWu5mKbap7to8mnduFtBGif1NlNBcTzC5GBv2e6Rv5/1r92A7y5FkyS@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yzg6cdbaODexcl2VSa9M98ZSrXJljrjOCFocp5+Xe6DBsUHmQuk
	h9jVArUzoByWuSBhBDajbzC5uokcds5DPQcsqILjhrKxIXg4A+1iLjNm7w==
X-Google-Smtp-Source: AGHT+IGsbHaPQz3WFZHPurmU28AHrv5JP5IwI4Jj4Ww2Ct4+PxY+NbKIEUMo4Yo9oXxwI1Pdo/X4Jw==
X-Received: by 2002:a17:902:d503:b0:206:8c4a:7b73 with SMTP id d9443c01a7336-208d8423a80mr172702245ad.50.1727139764916;
        Mon, 23 Sep 2024 18:02:44 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:95aa:de8c:5e49:8d4c? ([2001:df0:0:200c:95aa:de8c:5e49:8d4c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af1857caesm1365715ad.275.2024.09.23.18.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 18:02:44 -0700 (PDT)
Message-ID: <4540348c-84f6-4993-97b5-f007771be444@gmail.com>
Date: Tue, 24 Sep 2024 13:03:05 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] m68k: Drop Atari EtherNAT support when it's not
 configured in
To: Eero Tamminen <oak@helsinkinet.fi>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20240922214821.16818-1-oak@helsinkinet.fi>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <20240922214821.16818-1-oak@helsinkinet.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Eero,

thanks for your patch!

On 23/09/24 09:48, Eero Tamminen wrote:
> Not having it configured, but crash backtraces going through its IRQ
> handling code, is confusing (found while debugging issues in Atari

I don't see how backtraces could go through the EtherNAT interrupt code 
- the interrupt only gets enabled if the hardware has been detected.

Maybe you meant you see the generic IRQ handling code called for the 
EtherNAT's interrupt controller?

> emulation).
>
> Signed-off-by: Eero Tamminen <oak@helsinkinet.fi>
> ---
>   arch/m68k/atari/ataints.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/m68k/atari/ataints.c b/arch/m68k/atari/ataints.c
> index 0465444ce..fa189eeb7 100644
> --- a/arch/m68k/atari/ataints.c
> +++ b/arch/m68k/atari/ataints.c
> @@ -179,6 +179,7 @@ static struct irq_chip atari_mfptimer_chip = {
>   };
>   
>   
> +#ifdef CONFIG_ATARI_ETHERNAT

I believe we now use

#if IS_ENABLED(CONFIG_ATARI_ETHERNAT)

but that's perhaps a matter of taste (CONFIG_ATARI_ETHERNAT can't take 
the value 'm').

OK by me if it helps with your debugging ...

Cheers,

     Michael


>   /*
>    * EtherNAT CPLD interrupt handling
>    * CPLD interrupt register is at phys. 0x80000023
> @@ -251,6 +252,7 @@ static struct irq_chip atari_ethernat_chip = {
>   	.irq_enable	= atari_ethernat_enable,
>   	.irq_disable	= atari_ethernat_disable,
>   };
> +#endif
>   
>   /*
>    * void atari_init_IRQ (void)
> @@ -343,12 +345,13 @@ void __init atari_init_IRQ(void)
>   			stmfp_base.name, &stmfp_base))
>   		pr_err("Couldn't register %s interrupt\n", stmfp_base.name);
>   
> +#ifdef CONFIG_ATARI_ETHERNAT
>   	/*
>   	 * EtherNAT ethernet / USB interrupt handlers
>   	 */
> -
>   	m68k_setup_irq_controller(&atari_ethernat_chip, handle_simple_irq,
>   				  139, 2);
> +#endif
>   }
>   
>   
