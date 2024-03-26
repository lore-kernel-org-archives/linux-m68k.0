Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F167713D265
	for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Mar 2024 19:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711483159; cv=none; b=tLvxGlYiUJxcfrh6Iko/WAIXdVusPlLnN4irpoXCd13XVs9n2r+yQa+lqS9ZVdnfj1EZOqNRrxdPHV1OeYrCuM7rc+q3FpfjboKNy64FlpLOCRNpL31ovKeBrTUwEu9lVp/H7F8wUB9XJBx5aqTSHBSHorfZx+M7HoPkd7ImPvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711483159; c=relaxed/simple;
	bh=0sOgoYcZUpIm5+twlxqKgfGdkatDzKsQhtyVug8K5X4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hilO2ilckdXSNJ47fdKZ5o+l5QfL6oVDPlu7ob32LsTctaW0bY1BLo8pMnxP//zSxda5P17pjl0viSEtTkR/Q2Lejqj3IHUtPdAPe+F3ga1GbJswne0OMCZZ/Daur1thp9yuzSdYZVBppjM6FuCrnie8cpsPP+KOxfw+1OIElao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IS4aAyGb; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IS4aAyGb"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e6082eab17so4587733b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Mar 2024 12:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711483157; x=1712087957; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c71PUbJrAHd/2ue83FI2zRvkq44OZurlLnrxkXokuXw=;
        b=IS4aAyGbBa3jID8n8r5F4nppCFyXIwIsWeO4yGF58LAun8yhy3IsDIXjR5avg2d8+X
         qYpHGKJGMnFBScxXsZLBaiyj4uiTzenENlqXGL2HuMh4ke8fvj44XproshUPJBVJTLG8
         uGK2p5vWMZOTBMtKD6NCzQi77en3YmKAfJsUhQh7Sty9xjt5iIUQGsSd0h4PccTh3r+x
         dVfNShSwfASUwOj7D/28H6EQmxj+eMf2KZSXrAPJYUf1v8QZaEdbFOvnX9IdUNFMeaib
         c+voLsgV94KJH33ayoWWrUCxEJGgeg7m1Ifr2+T0Ke2C+CgIgE5zS4fWoN+9d7EIiT2D
         5hVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711483157; x=1712087957;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c71PUbJrAHd/2ue83FI2zRvkq44OZurlLnrxkXokuXw=;
        b=O0LGOFPxXwxINz46vXQeZxqwgTz2eWE4uILiIm7AHrDa39wQ/0UtiaqwqY2m7AGN6M
         5KD0aiOlmJkawdOJD62Yq2hDZtdLK7A7w4Vr4T0fqcVCSQ3tZ+XT6PKIIVR9lMbgS68k
         0SSxDyyVNPyPwbejSyRGrRIlsyhDHFwgAGOQYSZo/34dZoCtuiBo7TpYlB5+2H9NDNRZ
         HErT0jm7G9iazQnPTCgAlGF5VBJKNI21lRzr8j4w9RxRXWtWJHTTAew4khrvvjXrFR4w
         B7jiYUQvA59qA6GnW7IPvrnDano98rs5oQReuA9JyXGeiwY2f4fXd2K6xjMUexp+Eotl
         Du5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2WsGF5K3U4yRDftO2bnuVsMOBM/XNTqIVsirHD4oQSi+W1l4dafjjp34mfsyHcpxvAhf0OCZm7BL6LckVhKUdTfe60HUA1BXs6fpfQucy
X-Gm-Message-State: AOJu0Yzr+lbSqDaaVEWoWzcbxaCe3ZCGb8QOnZuXP3LS7TlUGXnzZ5J2
	KQsT+QSEtaP2U1/xEjSi5LLLO2kFArxxqSGpQ7kJzoA96cRCI5Iy
X-Google-Smtp-Source: AGHT+IHugOtJvgVgFC7el1G9nie8NO2m6EyUsZGBtI7quEO8C3uyf9r5rncFvCATtur47lVdM2GTLw==
X-Received: by 2002:a05:6a20:43a9:b0:1a3:a7f1:78d3 with SMTP id i41-20020a056a2043a900b001a3a7f178d3mr3725205pzl.56.1711483157055;
        Tue, 26 Mar 2024 12:59:17 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id o29-20020a637e5d000000b005dc816b2369sm7875198pgn.28.2024.03.26.12.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 12:59:16 -0700 (PDT)
Message-ID: <546b3960-7a1d-4989-82ee-2d7d56a9d609@gmail.com>
Date: Wed, 27 Mar 2024 08:59:14 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] m68k: skip kernel premption if interrupts were
 disabled
Content-Language: en-US
To: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
References: <20240322014805.30606-1-schmitzmic@gmail.com>
 <fcabda73-4b16-ee2c-e993-2bfcf392a26a@linux-m68k.org>
 <e89bf618-2fa8-7cbd-16ed-d021a9a7f740@gmail.com>
 <948c12e4-e85f-a86c-ae95-a1eb03ca026d@gmail.com>
 <40928e38-0de7-75a6-d5f7-8c913155da03@linux-m68k.org>
 <5e344842-0b19-1f83-dc77-51210a8880c7@gmail.com>
 <1b9ae156-9dac-b11f-5ddb-fb5878b3c9a9@gmail.com>
 <acd34add-27af-24a5-9af5-d40cab71c651@linux-m68k.org>
 <597ab0b3-ac1d-443c-95f7-4f1bbcccae1f@gmail.com>
 <c8a063a1-c72c-9aed-65fc-b2d87f8c7a9b@linux-m68k.org>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <c8a063a1-c72c-9aed-65fc-b2d87f8c7a9b@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Finn,

thanks - I'm pretty sure tried that early on but botched it by excessive 
locking (i.e., keeping preemption disabled when calling 
get_zeroed_page()!).

So I don't think you do use too much locking here.

I'm running stress tests for a while now, without any trouble so far. 
Need to add a few other stressors back in, and repeat all that on a 
slower ARAnyM instance but I'm quite confident you found the solution.

Geert: with this data race fixed, it does appear my RFC patch is no 
longer needed. Finn or I probably ought to prepare a new RFC patch to go 
on top of your preemption patch. There is no commit ID to use in a 
Fixes: tag for that one, correct?

Cheers,

     Michael

On 26/03/24 22:58, Finn Thain wrote:
> On Tue, 26 Mar 2024, Michael Schmitz wrote:
>
>> see below (hopefully not whitespace-damaged).
>>
> Following your approach, I added mutual exclusion to the other candidate
> in the same file, namely get_pointer_table(). Together with your patch,
> that seems to be sufficient to make stress-ng happy. I don't know the real
> extent of the data race here so I've probably used too much locking in
> this experiment (?)
>
> diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
> index 068ad7c9bb5c..d1ad55ee1b60 100644
> --- a/arch/m68k/mm/motorola.c
> +++ b/arch/m68k/mm/motorola.c
> @@ -140,10 +140,14 @@ void __init init_pointer_table(void *table, int type)
>   
>   void *get_pointer_table(int type)
>   {
> -	ptable_desc *dp = ptable_list[type].next;
> -	unsigned int mask = list_empty(&ptable_list[type]) ? 0 : PD_MARKBITS(dp);
> +	ptable_desc *dp;
> +	unsigned int mask;
>   	unsigned int tmp, off;
>   
> +	preempt_disable();
> +
> +	dp = ptable_list[type].next;
> +	mask = list_empty(&ptable_list[type]) ? 0 : PD_MARKBITS(dp);
>   	/*
>   	 * For a pointer table for a user process address space, a
>   	 * table is taken from a page allocated for the purpose.  Each
> @@ -154,8 +158,13 @@ void *get_pointer_table(int type)
>   		void *page;
>   		ptable_desc *new;
>   
> -		if (!(page = (void *)get_zeroed_page(GFP_KERNEL)))
> +		sched_preempt_enable_no_resched();
> +
> +		if (!(page = (void *)get_zeroed_page(GFP_KERNEL))) {
>   			return NULL;
> +		}
> +
> +		preempt_disable();
>   
>   		if (type == TABLE_PTE) {
>   			/*
> @@ -171,6 +180,7 @@ void *get_pointer_table(int type)
>   		PD_MARKBITS(new) = ptable_mask(type) - 1;
>   		list_add_tail(new, dp);
>   
> +		sched_preempt_enable_no_resched();
>   		return (pmd_t *)page;
>   	}
>   
> @@ -181,6 +191,7 @@ void *get_pointer_table(int type)
>   		/* move to end of list */
>   		list_move_tail(dp, &ptable_list[type]);
>   	}
> +	sched_preempt_enable_no_resched();
>   	return page_address(PD_PAGE(dp)) + off;
>   }
>   
