Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8820C33987F
	for <linux-m68k@lists.linux-m68k.org>; Fri, 29 May 2026 22:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780095141; cv=none; b=OJIUDtQnHrEF3F7ygrS4XFxWqEQdrjlNpWC9xXfoX/sWmObcFb1v1DTAp+yr/PwIN4BnMyQGZ3+eigVSrv/Qp6mylbLa8qyLinuDuzIUy2/SBSXQE9VZxjjUKHI60GzYG7yM3UQcjdOonI4v/JRLsKDGUmOBiwy419qlA+BRW14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780095141; c=relaxed/simple;
	bh=KOrCsV2fKh1r+rvZPT7KOZRwmPVgROf3TXWpHr2xKk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DHoibz1O/sfFemGJ/S6F6ZxsCWDlElvGvjdQ5VP1uRtW72YHmT56WEw7EvLTu/ZbMOTBUUWCgZB9ZpiySig5ypfTHYXxAeyQXot7TYgbUMoiL3m4f6JZd+We5MRVIJzpkJiziwYrRdiHbabqwsWHeOEy71KckcHJIIiKxoV/iuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQ9yzdRj; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQ9yzdRj"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8422871b42dso116175b3a.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 May 2026 15:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780095140; x=1780699940; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V186EnSLti8SxGAZ1+QKYuznjNd7l+Uc3OOZ9x+fjs8=;
        b=LQ9yzdRjQpf/ulFrjQnBSljVG3ggqxN6C3kD/FfYZ34dvs7qJQ+NudvyA94mJFVbnz
         J2x68w7A8UkyGw9F2B8T8OsLXLif2ilMRvAoMkcphbunxeDe7okI7mNoLIFwzwa5rxPR
         p/guKyRlmU1YVrbNJMYvmGQp+hnL8JXsZMx+4zprzkiYHIsjwiq4b6wyz6apJK9qB/qV
         rlbFlXXcuvzOlmLmM+iTxWHg77JdPYK8OaiskDohQTweDU75ITL5h4O/GIKX+WIxPG5D
         /lwCBMwBfsSZ7iwjW2s9vxTE6cRkh7Fxhb/0DQwAv0ErdmMI/PqP6GT9qC6OEF5YXZ2S
         ujZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780095140; x=1780699940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V186EnSLti8SxGAZ1+QKYuznjNd7l+Uc3OOZ9x+fjs8=;
        b=WQ5EpPQIuGQRPCK/b46Y3lEsv3cLHaPZX755AoOORPOLLtzhaOuc9dLvMpFKUp9yap
         unxhdPyl7Mks9xl2YBQVarpZwspupYquyZGFXIDTs9GKfYgw3kL4uptefWkWNLzhXcRe
         sSpffuulncaMVF1TRZGEZfBeB5ioWbXDbS/LeZFB9FoqsvrONtBKVkvI+3M+CjXY+uBx
         CxWisY3iqAsJEd2wSyM+nJr0z75R37eaFPVi+++tUWCHsHJ49rv1Kv9i0FjkQzKg3cKk
         FCwXsSbOVSlSwBjQ0RFYHnPk7tKpXahuZCy0Z6fnMveEvjj3gAUkfts6KrcuGB7HvUqt
         jE0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8ms8uHX2yS86utySiAFnav3nviRY7WuY1rppfpQbfsc+yx0v4LcZLpj7YdNOK+nH5BZ/gphY1/7Gt+@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwRtLlRrt40DiFK3IjI4RD9V9aPOKe9dDu7w8FWLfwLp92+n9ls
	5fm9zriaNE8UGKTUWM/78FSBb+VVftMWpxtj/HDXjhtI4GLatxUpyFqe
X-Gm-Gg: Acq92OHeTY9dKfnmO/AuNTaFozsds4bif3cbbyuFC8IJZAb9zM87zVLF2ZnOzQoZX8w
	KQP4X28Wj//LOscaRMxSW/mlAc7nZdExJHnBKOk3YQCkfRlckzqeJ3WPDNT1E8enBxPJp32bHaB
	AQeHMK+jBgELKjSjdQh9ln8x6GlnUzs4J5WSGvaXaxPPpJjRf33g4788p5n0bAauGEdzgPDJ/HJ
	X+shj4RcYKZldreXa5DWHdpyEmuVHtMBo4KzWbVcZhdLGdqvx7AG+LBUxAYhCLjW7BKRbIjuJsN
	eqcZViuutSLCtXC4lKFHAIztwY3qL9hIghpCzJThBs07AGqt72pBK8lu15Nek5EQ6WvaWFz8Nfe
	A9JlmwOsTrNIC6lT97Hx4+DRFKOmR1lnM6B6gNFPB/aUhvg2VVAd9fu7SxAyK6X1jIXdMBiy2uS
	meDIx9zx8FkkErjnM8/jHkzJ5J/q/cuidYTYO/2bQfMzqueUFiAiyQDVOY3M5SH/cOYB42gL9TO
	z2uR8O/r1eXUw==
X-Received: by 2002:a05:6a00:a908:b0:836:3f6a:3e77 with SMTP id d2e1a72fcca58-8422578c834mr1440989b3a.17.1780095139715;
        Fri, 29 May 2026 15:52:19 -0700 (PDT)
Received: from [10.1.1.100] (222-152-170-159-fibre.sparkbb.co.nz. [222.152.170.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84228bd6fadsm388672b3a.0.2026.05.29.15.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 15:52:19 -0700 (PDT)
Message-ID: <34630106-60ab-4894-8512-f1bfe21039a3@gmail.com>
Date: Sat, 30 May 2026 10:52:15 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: syscall: fix syscall_get_arguments() argument
 mapping
To: Yiqi Sun <sunyiqixm@gmail.com>, linux-m68k@lists.linux-m68k.org,
 geert@linux-m68k.org
Cc: linux-kernel@vger.kernel.org
References: <20260529094023.1428008-1-sunyiqixm@gmail.com>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <20260529094023.1428008-1-sunyiqixm@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Yiqi,

thanks for your patch!

On 29/05/2026 9:40 PM, Yiqi Sun wrote:
> On m68k, syscall_get_arguments() currently returns orig_d0 as args[0],
> followed by d1-d5 as args[1..5].

 From my reading of other arch's syscall.h code at the time the patch 
was written, the syscall nr passed in d0 appeared to be considered the 
first argument to be returned. It now appears that that was incorrect - 
I don't suppose the semantics of this function changed over the past 
three years?

m68k seccomp support was rather incomplete back then, and I've seen more 
contributions recently. Does this cause any regressions or improvements 
to the seccomp_bpf tests or other test results?

>
> However, syscall arguments are passed in d1-d5 and a0, so args[0]
> should reflect d1, and the full argument set should include a0.
>
> Fix the mapping by copying all six arguments from the saved register
> block starting at d1.
>
> Fixes: 6baaade15594 ("m68k: Add kernel seccomp support")
> Signed-off-by: Yiqi Sun <sunyiqixm@gmail.com>
> ---
>   arch/m68k/include/asm/syscall.h | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/m68k/include/asm/syscall.h b/arch/m68k/include/asm/syscall.h
> index bf84b160c2eb..2e268eeedad3 100644
> --- a/arch/m68k/include/asm/syscall.h
> +++ b/arch/m68k/include/asm/syscall.h
> @@ -52,10 +52,7 @@ static inline void syscall_get_arguments(struct task_struct *task,
>   					 struct pt_regs *regs,
>   					 unsigned long *args)
>   {
> -	args[0] = regs->orig_d0;
> -	args++;
> -
> -	memcpy(args, &regs->d1, 5 * sizeof(args[0]));
> +	memcpy(args, &regs->d1, 6 * sizeof(args[0]));
>   }
>   
>   static inline void syscall_set_arguments(struct task_struct *task,

Any reason for not applying the same change to syscall_set_arguments() here?

Cheers,

     Michael


