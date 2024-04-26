Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150057F8
	for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Apr 2024 01:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714094578; cv=none; b=H6et6dF7MRiTyAn5u5/Ai0CgfuhN6Yxq8rwcsGx4BK/zITNHvlnZL4KyXCXTi2b6poUxumkMQbhP1hsNRZV0DrcKB7omgS+0coB2UepeWjoFccPlvTPH0AH6DD/fY8fnenTLW2boiKSv4uAmXQ/QNxIeU0VgcM1rqsf12K8oITM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714094578; c=relaxed/simple;
	bh=DcFRQ2MNm0elSuFT5LwR6mhWhe+XPxsS1Nl4TaPS0tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jNZcNY93tr5kaUtxP80+bSVZCIyQ+pFkRR74AiIB8opAx+UMxHNENwURAg8aUWogOcUwWWC+NxzFbDE7GZkuiyuebQlcQ53tWj8s+4xKcVkkmISNIpi9PdjoyQLynYV6YnLLLsakAbc+RRq3GH/I1+XZz+1dy+iFDvx+EJ1maZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFk+rvkM; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFk+rvkM"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ecff9df447so1645063b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Apr 2024 18:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714094576; x=1714699376; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nVix3I0zVz27NoB5K8uy1rnp1UxHqMqiDhof1hN6AXQ=;
        b=FFk+rvkMSQXrNq/yf3TDZru8+U5paT/js6HAVJpEuLmAyhEL2dN5+OuAxdUwYaCAYy
         fqn2FZVtAhvIqe8nNqJ9sB9jA3FwcQltpwOcDKnC/aYyJIdaDNtzg/2jLU5fdomIkx8W
         FnqfV8MpwcIo+L/Ub1zzjZquKLWrIlqaTEJ2NMRAPG+jS0E0hY7FCGHz05kAhjRzM6A5
         EKwaaT2To9ifX1FHfOFybRg2WUpGcPMURCuMeGBtJInxrjXAahdfeiySQ5rndNpg9nq/
         sB6k09Gee304JikoXO3EPMggtFPEFpIpogjcBlfuU74oRWQaAjajy7/KEa1PcigsjcWz
         V/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714094576; x=1714699376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nVix3I0zVz27NoB5K8uy1rnp1UxHqMqiDhof1hN6AXQ=;
        b=FeB3WLdjy+nO07r5qBZoKOYdMFdDfgNvvzKDg5j0f05jOGtyTpv68mKAITNTCrl+Es
         47V6hmUUAFGx0X8+zD645DmPHOHsbdDSFMweYRhkXHCeHV9Lz5WmiPtWpZDS+O/Twb6l
         GEjTd7lHEQY/NF6H2SQlwAoRHVY6tLaeanHnmUaiJ/2831ZANcjvCNxlnp6rzSn5IMxT
         O9fbv82Wcu3MT1slpSi4tq5BAjzwYnVssxtyI9++5ep8MaLKY+UEbGSmczs2uDySTdxX
         3+8aheCP2qAtMetxVM6Wj/LBOOKP/fHnp7+1rlWq2oIDDzSP5Ar2l/6m7rsEvOBR7xYm
         qAdA==
X-Forwarded-Encrypted: i=1; AJvYcCXbmpk/A7QO3QojrRjsGNdNQWVs3cZzNHfBwogjVKhhtobeGyo2SIF93K8GbxxJTmFL/BwWPGw79K5aEM14OtzG55tvwTu/sYtEIyWQRShN
X-Gm-Message-State: AOJu0YwqVCLnLqyhb2vlX+YJMHxssQk3Z1hOHrIzdnEs84IuN1K4INfW
	YNDdLPRVYaO3CtjDst9XUSn6suTk2ig3K7iJSR9mmkj+FKa0Rbbp
X-Google-Smtp-Source: AGHT+IH80s1WrnyiSpXomke3ltS/DzunLg8SAu7R+LE2D/jDPKLN0BeL86dKU/1D+Nl6beT97aMTSw==
X-Received: by 2002:a05:6a00:a1d:b0:6ed:434f:e73a with SMTP id p29-20020a056a000a1d00b006ed434fe73amr1796647pfh.30.1714094576077;
        Thu, 25 Apr 2024 18:22:56 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id r16-20020a056a00217000b006ed87983f95sm13744042pff.52.2024.04.25.18.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 18:22:55 -0700 (PDT)
Message-ID: <1b49c8a1-c753-428d-b526-06b6eb3e551c@gmail.com>
Date: Fri, 26 Apr 2024 13:22:54 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/2] m68k: Handle __generic_copy_to_user faults
 more carefully
To: Finn Thain <fthain@linux-m68k.org>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
References: <20240422022943.13775-1-schmitzmic@gmail.com>
 <20240422022943.13775-2-schmitzmic@gmail.com>
 <6fbf4809-dec2-84b9-3b83-86084ed19a20@linux-m68k.org>
 <57b70e03-2672-4f27-87f9-481208173a20@gmail.com>
 <b9d281db-c06e-0eb3-0f49-b95f576a9891@linux-m68k.org>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <b9d281db-c06e-0eb3-0f49-b95f576a9891@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Finn,

yes, that would explain that.

Using a start address of badpage-4 and path '/tmp' or '/temp' in order 
to use either the movesw or movesb branches of the code (and force a 
fault on the first byte in the movesw case), I see no more Oops. Still 
have to test forcing the fault on the second byte of a movesw (making it 
a misaligned access again).

Cheers,

     Michael

On 26/04/24 13:00, Finn Thain wrote:

> On Fri, 26 Apr 2024, Michael Schmitz wrote:
>
>> Not sure you noticed this - the 040 passed __clear_user without fault.
>> We managed to test this one without meaning to. Exception handling in
>> there appears to work OK (for the cases we're testing).
>>
>> No idea why you have the __clear_user call occur within
>> __generic_copy_to_user - it does not appear in my disassembly.
>>
> I'm afraid I neglected to mention that I added the patch below in order to
> exercise that code path.
>
> diff --git a/arch/m68k/lib/uaccess.c b/arch/m68k/lib/uaccess.c
> index ef761fc10981..1c9a24a0b554 100644
> --- a/arch/m68k/lib/uaccess.c
> +++ b/arch/m68k/lib/uaccess.c
> @@ -58,6 +58,8 @@ unsigned long __generic_copy_to_user(void __user *to, const void *from,
>   {
>   	unsigned long tmp, res;
>   
> +	__clear_user(to, n);
> +
>   	asm volatile ("\n"
>   		"	tst.l	%0\n"
>   		"	jeq	5f\n"
