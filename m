Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2EC2DF87
	for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Feb 2024 09:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709111471; cv=none; b=U8qbXgl5kzlvMesTgIlv+pNxkb+VqY6Ewp6XljJaCn6BeHpBGsQ8ydkLAENbPsaDyVk5xbe+PEYSxIe+l7J3iKDT+ltwgZ297dD9x2rBVmeL0dgx7mI8/23MNOWSs6Jy51suzBdycphCRJR1LdZEYQIS+K3WbX/yz3YaVBkXUBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709111471; c=relaxed/simple;
	bh=EW0GWBsXyEcrLSZlvNMiWvx+c/9ZWO86Fuqwlv6uzHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B6B6RrplFQVko2QeOhwntQ4RSoNJIQWP7D9engX793yGfZF9IThhYM+auVwrnnn42FDuH3J2ycFF4l9B6jFekuDrnBTg1E3dyS91eOALJSgO6ZgxCtkAX6U5igNo4JO8OVSBqFhUcnlarYMrIRx1Du7WgW5zCibZJKRyji6GMAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a4419683a6bso1805266b.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Feb 2024 01:11:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709111468; x=1709716268;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZfBMx6u2INVAzEtCNKCNCan2Cu8bI6F2+o9gTfudec=;
        b=LF0G0mjddUnuQMyiDAV06hCrXK9pE8EYB9mrUDPeMwxVs697P3A6v7fFWiP7Zu/MFb
         RgxWazgWRyBVpQQE+oTLE0TZvgNjTnYdCIiKAWMMMJHwIdOVhKgRA1YLbnyDAe0kJGXd
         tevebEY9uBLDFkHwkkj5+oH6aAINbfTuk7JdnvPk05RErzzWvEohMmkc04rO8Ly0gxYO
         MTyL13DxePVPEDvUTIwlBQVRylCea1772gmfPIF9yEgfNGBn5ySZcMB2ij55ReqIJq6H
         5lf+ZMFr5/7TWxccWYHoAt8FIi2JK7l4WQ/CJswW9XnwLVNtK1ifQ6BNNt74qt3QVfx3
         cx0g==
X-Forwarded-Encrypted: i=1; AJvYcCUvgj5biyIV8RFohNh7SnqbUY/o1D8rai1qxN3+HJmpXPmRth5Ff43vWJzBaCV/jpp7MXOeK9cM884MCCnHtI3p2QovJiZRoXxEdFVBWSmh
X-Gm-Message-State: AOJu0Yxw9/5Pw/XnNtCtxLOFeepcGB3GE1cAKQ+SbPMr4zGX3Au0iF9R
	3N2J7JQJ8QE4CkobFrp+0h4qQtK2n2FGBqtvrklCZn7F8xuZggYF
X-Google-Smtp-Source: AGHT+IE7FhkIGw0pdKgfVRP0mK/xE4hP9iEilTmh+ynFg/67ANluuCUCsDbpBa7jpqCRuBXB3tPQGA==
X-Received: by 2002:a17:906:3656:b0:a40:eba:4388 with SMTP id r22-20020a170906365600b00a400eba4388mr6939235ejb.49.1709111467797;
        Wed, 28 Feb 2024 01:11:07 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
        by smtp.gmail.com with ESMTPSA id lf7-20020a170907174700b00a4316384159sm1615075ejc.224.2024.02.28.01.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 01:11:07 -0800 (PST)
Message-ID: <754c3acb-538d-45a1-84a1-0bebd02fd945@kernel.org>
Date: Wed, 28 Feb 2024 10:11:05 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mk68k: Fix broken THREAD_SIZE_ORDER
Content-Language: en-US
To: Dawei Li <dawei.li@shingroup.cn>, geert@linux-m68k.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, set_pte_at@outlook.com, stable@vger.kernel.org
References: <20240228085824.74639-1-dawei.li@shingroup.cn>
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20240228085824.74639-1-dawei.li@shingroup.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28. 02. 24, 9:58, Dawei Li wrote:
> Current THREAD_SIZE_ORDER implementation for m68k is incorrect, fix it
> by ilog2().

This is not a good commit log. Incorrect in what way and why is the 
fixed version correct? And what is affected? Note you're referring to a 
change which was done 14 years ago. It definitely must not be that 
incorrect (for everybody).

> Fixes: cddafa3500fd ("m68k/m68knommu: merge MMU and non-MMU thread_info.h")
> Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
> Cc: stable@vger.kernel.org
> ---
>   arch/m68k/include/asm/thread_info.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/include/asm/thread_info.h b/arch/m68k/include/asm/thread_info.h
> index 31be2ad999ca..50faecd6fc5f 100644
> --- a/arch/m68k/include/asm/thread_info.h
> +++ b/arch/m68k/include/asm/thread_info.h
> @@ -19,7 +19,8 @@
>   #else
>   #define THREAD_SIZE	PAGE_SIZE
>   #endif
> -#define THREAD_SIZE_ORDER	((THREAD_SIZE / PAGE_SIZE) - 1)
> +
> +#define THREAD_SIZE_ORDER	ilog2(THREAD_SIZE / PAGE_SIZE)
>   
>   #ifndef __ASSEMBLY__
>   

-- 
js
suse labs

