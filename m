Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6157D55E48
	for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Feb 2024 22:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709074464; cv=none; b=O6J3pWMgmz8wrOM6NwN+jqB5efgyMOJR8TbsRASvouA1teAEh1h2sMQe9yJFAf/OBfm9nESrmaYVGwWH+EQfpeJrgEWLtwu7kWpiwWqB4WBDTlcr1oI+0J1qEViKFuLKiC+ZDC8ppHokXI9jaHrS4QylriZyT+dznXRk1i/YgbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709074464; c=relaxed/simple;
	bh=N6s5EM24N8uwVBdLY6ldG9C2KcTOtR96Pk5bivdRrxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DsDw/Zbu18b7dqkg3ykuK4HELkd26QY2Zl3O2miD6RUaDa9ssC6ol1bCerHqwo1KHTPQGuskM3Wv658KEGryWX6z5Z7ggSAzxQnWdsIupnOiLLvuaHmpWqaTd+vFlycYJSYQGZMCRio1KINa9yi+LlIE+DfsflxpuBP0xl3wEtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/X1/LX7; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/X1/LX7"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-299b818d63aso243371a91.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Feb 2024 14:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709074463; x=1709679263; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2DNGpzMTJVgXPXUid5ciEjp2iP/gKTG74Iv3lSZDFEw=;
        b=b/X1/LX7pyUvbgSt13qVkUzEzOhTjOutBjbRx/hYpT+pVRse/8N/nUkrl47S8Q7nr8
         V6vDPMkSZjP0afREH94jLYIKtIu/Ua2jzTjSZavY+ijdUwswBYLe2jzOyMvkvLmz822a
         MVLrkKLKgxbonfrnJJ/5abn/Qfr8FTAWyMRrJDsqlh/d/KGbg5Z1xKgIGENm1WdeDPj/
         kaKjdzwJRpzkLH9vLC0MIQe4DUcQSWEl6c53EFvR6Wx8pE5v9zWRkw3ORRRuTnYaYHD1
         DXG+B2KUdunYWSIRQj3LC7p/axkeb5aNH2ArLLx2Jyaz0tbE9UizjyTHSnqCyhioVITf
         S2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709074463; x=1709679263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2DNGpzMTJVgXPXUid5ciEjp2iP/gKTG74Iv3lSZDFEw=;
        b=C/cogamY2op1taqlMhx+6fE/PI5iOdWuPIF46wBB5gH80jP8a0qM82Pq56Mb/42/WL
         w3SWRsMdqbWdfyonteK7Y2HRQ2UI1CQOTjY90kihMocrx+kUCn5tYgVSqbm/GSo/tud5
         68MrZ3FRhFXxzVq3lnVhHi57gB6+cbDfbuZ4aiLYvZA4wnheL0Ykm2lZVgAuDbmPJiCZ
         jiG3N30wGkIQXSZrZTXpNqc0ynXkMokU0Uua/mJg3yZUfslspIM4rQWZ7qgCPqiRRKb5
         PqE73OXPatLPlJUSERm3iJvI+VB88SAjE4gTiwHMYpYj6OtLj/HrpaNLwsSpykl1mLYz
         YD9w==
X-Forwarded-Encrypted: i=1; AJvYcCUe987DEsndF3gX9CenvRQGbsMH6UFdw3KvWe4Oia04zEcP7YP0e9p1XGvnVFxPP3pk8sj/l1FAiufuLT2it5vE1emJCyax7eXF5s7ziIbj
X-Gm-Message-State: AOJu0YzsgY0sxkqSL5shoVtvUXFsNXbERIiME16qfMln8kYWibKWJw4n
	rlYaobEhVdKRXCgv/BKtC8JxENmqB50VpbO352Jw5pA5pZHTRNq9
X-Google-Smtp-Source: AGHT+IGXX2BhoWZ6SCxXPH8NT7GN5baXJV0gB6TtbEvc5Bz/mGxOiVGHzCRqfvvjVaqnLCP1wXLDFg==
X-Received: by 2002:a17:90a:983:b0:29a:c992:198e with SMTP id 3-20020a17090a098300b0029ac992198emr973142pjo.15.1709074462484;
        Tue, 27 Feb 2024 14:54:22 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p16-20020a17090b011000b00299e946b9cdsm71952pjz.20.2024.02.27.14.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 14:54:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <06c6f8b8-49ba-4b99-9483-0e4e5364bb1b@roeck-us.net>
Date: Tue, 27 Feb 2024 14:54:20 -0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: stackinit unit test failures on m68k
Content-Language: en-US
To: Finn Thain <fthain@linux-m68k.org>, Kees Cook <keescook@chromium.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <a0d10d50-2720-4ecd-a2c6-c2c5e5aeee65@roeck-us.net>
 <CAMuHMdXMsxRRMV8g6+9vTy_4o8HF49SUh2deNdFjgKwDLEWrxQ@mail.gmail.com>
 <202402271401.CB43AB2E8@keescook>
 <1278e7aa-135b-0919-340a-788b9be6b5da@linux-m68k.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <1278e7aa-135b-0919-340a-788b9be6b5da@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/27/24 14:33, Finn Thain wrote:
> 
> On Tue, 27 Feb 2024, Kees Cook wrote:
> 
>>
>> I'll send a patch!
>>
> 
> Or you could just not run the test on m68k. It's said that, "What the eye
> does not see, the heart does not grieve over." Is that not true for bugs?

Yes, that is exactly what I am doing now. Problem "solved".

Guenter

