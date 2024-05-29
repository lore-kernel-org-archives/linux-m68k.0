Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D441E1C0DCE
	for <linux-m68k@lists.linux-m68k.org>; Wed, 29 May 2024 19:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717010818; cv=none; b=KEiy/inrta7hZuOZDGyNur6XxO0V0MJsa2TkSJQbAdlbZAjNMq5NM1AHXWn99mindsamSOEXcq7ZcsTADJP2imBPbcF0QvwsSSSINq9uH954ge6bJBzY4eflZhAbYuJpAd3/b3qLqGOg7bn/FmTc8WIeRqEYCN7byRrTvlT5R6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717010818; c=relaxed/simple;
	bh=MNkzhVXp/mWMNLEsDq3RUMkw/STIM8e/vIHDobe4zvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=c2Vzq/dW2zk9XCwnryj4vTb6aa/5ls6URj1kWezmEUo/+7bflJVed1RSkzoh8FZsXT23z/nwew2asDfIOF3aF+xUqLTcR0RWsjOQWMFmO236bWeNWrV1cCQQ6Yles5B5BZGZkUiFmFD3FvmoA3KdO2y8Jx9ndNnHDtj1/eywRP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNNkuhnD; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNNkuhnD"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f60a502bb2so899255ad.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 29 May 2024 12:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717010816; x=1717615616; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ms72sGy9TrTEhEBMZyo0P59UElCgovMlJOVIw+KwkDo=;
        b=fNNkuhnDcgVN0c8+XrI0J8Krv8u1qpJ3VNnWcQTotk8onJMfGpNw+AGXNgBV5tsTs+
         yLMe6boAGdIF2q0yAOp4qtLXRRsU3MVbvDFUqKew+Kw8RY7FJG8SQMt5+H4YtN0WS9zd
         lSdE5kK+eGKsz4O9IKMolBLpBSWPp/96FSjIQ552+LXOOmsLkKoXu8vHiDZVaySgfYvg
         60+JUqzLA9OBVsb628VFeKt4XknWO2rwr6kZ265p1S8QZl/D7uBmMehvFQNVLr/5OZ3T
         EIUmXVOQ1Z6WbQySL6yG2l/grs5MyVSEq7BaNZR16UEiv3vxFi2J7Nu7iSfW2knegWqY
         jPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717010816; x=1717615616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ms72sGy9TrTEhEBMZyo0P59UElCgovMlJOVIw+KwkDo=;
        b=oSs3jmm1bhdGfjwzylDMfzSjJleRA3OCERcxI6YOu2p6qKaNQnb4rLj57lGj8qMBy5
         cW/VpmmrxaTZ1vcY+0f/t3M5bnt08I5+CVxB34Cie0NKeO9sj1HDa+qSKKgjA3n8JCsd
         kgvFG6eiQNXb6qKpS2pSYyL+ccD+q5E9n1jJL50yC4f7fmRjaMBPy0q1zEP9OhCu5ni6
         9kAo1vqaVmMeo3h3iXEbCoCiH04aCCJdilSQ/XDNT9a+atBC0En/tU6P09pHCgKPIz+H
         Uqh70hUk1dn1ilnO2JngCGFNwZ9UAyXOe0tlshByPdQTOHsBHFAcFOoHyENEX6c6ydJe
         Tj9g==
X-Forwarded-Encrypted: i=1; AJvYcCUArnVu76JQxIa7MbCDOfaF6whnqnDHab4XmOg0Nxn9LeNYKagqXrmyTegPK1O2UXgiszzYd21IEwXOFKJF4QiWC/mbyFYuEq8Ew1VeB0Y7
X-Gm-Message-State: AOJu0YyuYahZfPrLBe/I+pMajiLMr/Bvb9DBGANW5ObMfPMwuTT79Y7A
	ZgS4by6z3VMiB2BIe7Epl6TEC92A/nJBxI9nc39SF9v9ZW3OzZZf
X-Google-Smtp-Source: AGHT+IEfioGJ5QJ/mtlHaj725XIud0h2oPz31jIqmqe4q23qT77IyHcymqbQ9yAN9YRaBg69Tm1k1A==
X-Received: by 2002:a17:902:db0d:b0:1f4:8bcb:8b01 with SMTP id d9443c01a7336-1f48bcb8ccemr113798495ad.40.1717010815913;
        Wed, 29 May 2024 12:26:55 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:38ee:ff33:e51f:95b2? ([2001:df0:0:200c:38ee:ff33:e51f:95b2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c96791asm104154885ad.143.2024.05.29.12.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 12:26:55 -0700 (PDT)
Message-ID: <fefe8735-2449-46fb-8fe1-295690bbdfa1@gmail.com>
Date: Thu, 30 May 2024 07:26:59 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] amiga: turn off all incoming interrupts from the
 Warp1260
To: Paolo Pisati <p.pisati@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <20240529163118.867333-1-p.pisati@gmail.com>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <20240529163118.867333-1-p.pisati@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Paolo,

just a style comment: For a single patch, --compose is  not necessary. 
Please place the below patch description in the commit message of your 
patch.

You left the commit message itself empty (aside from your 
Signed-off-by:). As a result, your patch would go in without any message 
(unless there's something in b4 that treats single patch submissions 
with introductory message special).

The commit message usually contains a description of the bug you are 
fixing. In your case that would be:

Amiga 1200 boot crashes in local_irq_enable() (or auto_irq_enable()) 
with an interrupt storm. The Warp1260 board interrupts appear to still 
be active at boot time.

Then a description of what your patch does (which you have below).

You also want a

Link: https://lore.kernel.org/r/ZkjwzVwYeQtyAPrL@amaterasu.local

and

Cc: stable<stable@kernel.org>

above your Signed-off-by: tag

Cheers,

     Michael


On 30/05/24 04:31, Paolo Pisati wrote:
> The CS-Lab people told me where to find the interrupt ctrl register (and its
> layout), so here is a patch that turn off all incoming interrupts during
> config.c::amiga_parse_bootinfo().
>
> With this patch applied, Linux finally boots on my Amiga 1200 + Warp 1260 board.
>
> Paolo Pisati (1):
>    m68k: amiga: config: upon boot, turn off all incoming interrupts from
>      the Warp1260
>
>   arch/m68k/amiga/config.c       | 9 +++++++++
>   include/uapi/linux/zorro_ids.h | 3 +++
>   2 files changed, 12 insertions(+)
>
