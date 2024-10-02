Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6237194A6C
	for <linux-m68k@lists.linux-m68k.org>; Wed,  2 Oct 2024 22:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727907616; cv=none; b=Vxi5cx11EEN7yLx4IbfdH8dMC+K6U4J6yJsBfByLmzTk6GzOF3kQk/+6Ijxk++xO/XPzdkCZr+IXeo1yewKw+MwSrCaY1X5VC0ZvBsI0wAhopmBK5kTO4RpCrjpzZpSDgoe11pjsj3fegq9PiNScg0DNQKzRldUsdsM45H8iXvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727907616; c=relaxed/simple;
	bh=7H/c8DqDGeUoVTEzBDQsVvgIhMXeNGZTH6mYdkdgwlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CCxP2P2VinD7fX9npzuUNy63KOYzCZKwNqyBxtBZpVEZ/zbi5Sj3l1TBIwFrM/qLQ1PeOvP1KUDS94KwrgSQaciZOOZk7q9Y5CmuFJQJRqAxHp0dES8cGs/oAdFIP/BGEP1KHMtTOa29yyb6JnpLQdT/CERasYcFLw/Av0i6NRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iFOrchIk; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iFOrchIk"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-37636c3872bso1202475ab.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 02 Oct 2024 15:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727907614; x=1728512414; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42cqLii5n03T3fFdLU4Qhg/rBYfKHFULaZudW4b+uhQ=;
        b=iFOrchIkN7qSKd128uNJyCD63GEJQ1ll8SXctusU74WEJy+dEEo2rmtLNf+UcAhXP6
         FvtuWcUSG7O64fC5ttrwTsD/cbpU2uZKwXv0UTfgrTWJt9vf77gQIV7KZa5QKBIQXCBZ
         fIi67qrOmD49m9OSZVX9E50ea5z8OMLo+2ZJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727907614; x=1728512414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42cqLii5n03T3fFdLU4Qhg/rBYfKHFULaZudW4b+uhQ=;
        b=ew4kXLH8zTlFlOHRVUFgVE2PIAu1b+f35fdPK0DAvhS+2QxR9pxv5pypCQt/FrWC/5
         ejX7lzbKv7IdTwYtS7EZ2jI2l/Im4oj2pEKWZ2UR3QBmPwpKaVp0WWQ3muXB1iA1vgxe
         /4tfSjlIRdkvLcx9aN2smhR9kbjhjYUtcLITc46tvXfdE7o/E3epyVIAjeKk7CqV5MCC
         nch6x/JA0uZx4oM1YOyqcJkpBJdy2PHV7JFWYzFWpPLodWPx8CENjO/fm/qG5rXxthnH
         e7w7+cgBZ8H4nF6yTOQUN2fbSHjU3IPisUBcK/xZGUSqb+bVYe92fX8DN0VD3AjI6XSQ
         ERKw==
X-Forwarded-Encrypted: i=1; AJvYcCXmvgV81ki513Abll35ipPrDIlK2IZNQXmX07POSgP8FDHTyuexhnJqXiOpDfZvhwvxdCxv7hL9HszF@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxshwKcNZadIrUFffgfEi4nAp8tC09+zZoD9u03UnCgK2ohcopo
	LKaBdYXG4pUaxNZmZ5bHNy13OKa5pNyoXx3Ou1/p2MJp8NxSmiqtlHr4vC1j2co=
X-Google-Smtp-Source: AGHT+IHwsCbAAEg4Kr6kLUMguFm045nL6BAzdQbO9TWhucfeSaitKihVVV9tZ/9qE2fEK2XfKBJ+PA==
X-Received: by 2002:a05:6e02:1a01:b0:3a2:e9ff:255a with SMTP id e9e14a558f8ab-3a365953d85mr44775055ab.22.1727907613802;
        Wed, 02 Oct 2024 15:20:13 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4db55969146sm7135173.70.2024.10.02.15.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 15:20:13 -0700 (PDT)
Message-ID: <6a403ccb-1d77-4c90-8e7d-35cbafdf5633@linuxfoundation.org>
Date: Wed, 2 Oct 2024 16:20:12 -0600
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drivers: nubus: Fix coding style issues in nubus.c
To: Sayyad Abid <sayyad.abid16@gmail.com>, linux-m68k@lists.linux-m68k.org
Cc: fthain@linux-m68k.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241002132820.402583-1-sayyad.abid16@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241002132820.402583-1-sayyad.abid16@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/24 07:28, Sayyad Abid wrote:
> This patch series addresses coding style improvements in
> the Nubus subsystem, specifically in `nubus.c`. These changes
> aim to enhance readability and maintainability of the code.
> 
> These coding style inconsistencies were found using checkpatch.pl
> 
> Changes include:
>   1. Improved comment block formatting by aligning `*` in
>      multi-line comments.
>   2. Fixing assignments inside conditional statements to improve clarity.
>   3. Correcting the use of tabs for indentation in specific functions.
> 
> Each commit focuses on a specific aspect, as detailed below.
> 
> 
> Sayyad Abid (3):
>    Fix use of tabs in nubus_get_vendorinfo and nubus_add_board
>    Fix use of assignment in if condition in nubus_add_board()
>    Fix use of * in comment block in nubus.c
> 
>   drivers/nubus/nubus.c | 94 ++++++++++++++++++++++++-------------------
>   1 file changed, 53 insertions(+), 41 deletions(-)
> 
> --
> 2.39.5
> 

Why are you sending 3 patches for these changes in one single
file?

thanks,
-- Shuah
