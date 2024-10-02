Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86B88F40
	for <linux-m68k@lists.linux-m68k.org>; Wed,  2 Oct 2024 22:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727907503; cv=none; b=m7vAXM91j2xBSfjUZ+wKF0KIEheoQAwf0o1sKn4+1ofl3Zq5B99sHF7kf0ioHmsCucd35VB+A0v7JW98xZiZ14XpAGPnvH1WetH75ZQz557ygnhb5kMSWPO8qWqJa29hFddomqTpgnYj/Hl2FOnm3orrrPO7eAfG7Q2a8k4jNJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727907503; c=relaxed/simple;
	bh=8uPfWG19yF3aqQFsnZan4s+bbE6R/wlH9vxN4ljOZHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pb9dTnd3QlW3ZuU3aY9mZto0OQZw0krTOizZpDnd3NOjdIGYc5Fynq9ixBHiYV/U7iRLov3VzrK3C0np0xWbGfrlxzswX7WNDhwQu88K4jax9OTDNoM+nz+JHgnoFC5XUy8kCQ/j67a2Q4UOteb3MeER5xekk98diovFmSLH8co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OoCNpiMw; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OoCNpiMw"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3a2761f1227so1103085ab.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 02 Oct 2024 15:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727907501; x=1728512301; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8TBiC3q4b6RD/UIruMuT+TcjVgJIbtpp7M65coVbxT4=;
        b=OoCNpiMwTfwa+9251XrQxCjwBJGRV8Axr/5HXXVZAfoAVLlDgeaBIOpJztA1p0PyIE
         bBhqcRAgA9Xq4QS2GBAPJ+Pgw83czH8qknckxCo//OWxW/9ijQ8T5Dea37QzCsHkjxEj
         5VPQjhOveLGSUYhJVbx1grMp2tbmm9jkD6IME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727907501; x=1728512301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8TBiC3q4b6RD/UIruMuT+TcjVgJIbtpp7M65coVbxT4=;
        b=tVSWK1EjIgGg70ynbel/5KiKbuZeDgs2v6unhvHrNgGeAKKbLohcnNezIl8QkLVjJY
         c/PAVh81lMkP+cr1mjQW1cODIHeUbyHr63XOlzhq2EojhUgRNeX5BsdZ0CGhLmwOMqnc
         Xiop3FcfIDTAjqXkksOezPHplHg72ctZ02drjXPUjeLzm94XO1ORRG2xflfSpjNsvKuV
         pvcZcMchHTxD3rsfTcay6YOcNDTy+2RIEqjcQCJu8oKLNZk+jfrLCQNIVlZxZ5kN+c7w
         NrdFnay1gS6d+84rfERhwt81P/ioGSKv2noWTAB8eeEY5GZNBnZJCJkWeh3aLocDjDh+
         BUUg==
X-Forwarded-Encrypted: i=1; AJvYcCXPASQpOsb63ryRQhqJ1XME84UnaITYTgLQcPE1EDqL9XACOXGW2Q3K4PK6g3GgjygyCocFpiEVGszD@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyCqQRtQRyRt3mxzecgdFQ9DebRVeLqqCV7wvVZIdb1yWKvRjGY
	cxGSckgiLL6kDNDptZsCNrB9OCgtKXMqjFqyopqAL7wA5ltwKCYgNxEJfx7Ml9Y=
X-Google-Smtp-Source: AGHT+IEi4wRMzDqdGUEXEyTO3MQ7pCS5rfjx+lNwgmbv85uzhSg1zpHPPXkArmrG0qOpWYWAo83a8w==
X-Received: by 2002:a05:6e02:1386:b0:3a0:92e5:af68 with SMTP id e9e14a558f8ab-3a36594a26emr43209945ab.15.1727907500818;
        Wed, 02 Oct 2024 15:18:20 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a370901108sm10395ab.31.2024.10.02.15.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 15:18:20 -0700 (PDT)
Message-ID: <2d4550f1-7097-4b97-94c4-b1c8a50e6946@linuxfoundation.org>
Date: Wed, 2 Oct 2024 16:18:19 -0600
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drivers: nubus: Fix use of assignment in if condition
 in nubus_add_board() in nubus.c
To: Sayyad Abid <sayyad.abid16@gmail.com>, linux-m68k@lists.linux-m68k.org
Cc: fthain@linux-m68k.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241002132820.402583-1-sayyad.abid16@gmail.com>
 <20241002132820.402583-3-sayyad.abid16@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241002132820.402583-3-sayyad.abid16@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/24 07:28, Sayyad Abid wrote:
> This change help improve code readabaility by
> shifting the assignment statement just above the if statment,
> which was earlier inside the condition.
> This makes the code clear and easy to read.
> 
> Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
> ---
>   drivers/nubus/nubus.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
> index 08cf585cb471..77da1d14a1db 100644
> --- a/drivers/nubus/nubus.c
> +++ b/drivers/nubus/nubus.c
> @@ -735,7 +735,8 @@ static void __init nubus_add_board(int slot, int bytelanes)
>   	nubus_rewind(&rp, FORMAT_BLOCK_SIZE, bytelanes);
> 
>   	/* Actually we should probably panic if this fails */
> -	if ((board = kzalloc(sizeof(*board), GFP_ATOMIC)) == NULL)
> +	board = kzalloc(sizeof(*board), GFP_ATOMIC)
> +	if (board == NULL)
>   		return;

The code is consistent with coding guidelines. There is no
need to change it.

>   	board->fblock = rp;
> 
> --
> 2.39.5
> 

thanks,
-- Shuah
