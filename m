Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D01134A9
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Mar 2024 01:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709600811; cv=none; b=aegkmLIwOSkvTUItmjmb7Fa4TKrlgH6oUM4eNz3Hy9dpMXRYENMK0hNMaYnnhKc5Q9AxkiiWf3s/OdDBpZ8D9osIk7zHdDmXxD8fAqzLFzHV3Z1ZEq+yILmN6WRrCdOVl1J8qh9LmN14/GRgdofdCz/ZH9dPXpkHnA7C5tHHVKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709600811; c=relaxed/simple;
	bh=TzF1TOaMrrkTn5n5pIwKwXhEc/ZbwlSupFohTvjF9E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e0VLomNGIM4hEDtqOdxA6v86d1AY65Wwulf89LWQQ2RqpTxTCAIJAaOMovOje8ojbYrWF6BPcx+X5qRgS4PjAJi4j5mPlArZvU7KvR/iXpxPmpxZGistdZTkav5R5SiWGi6gKi5/Z6Q3XaNNdFp/60egYSY/knU411YV01GSUKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YK4Us/s0; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YK4Us/s0"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e56da425b5so194079b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Mar 2024 17:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709600809; x=1710205609; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drbucYWeVvv6Is4Np9qVH/EuaGcvXfhOgTQUhqj8fms=;
        b=YK4Us/s0EJ3qhki7oLt0HZCq3WkFnxTfUcGqqMZz2XtaL50dlzujlW8JcvcLVES2v4
         r2gABJNDQCIW4L9tZymKw6MwhmW822HMbwQeXz3wi6BPsRQzyG9p1SPW4pcbGYD1lHb8
         YlFqK2bSSCLqo2c3ch9Nt5sch0xY/KIzCyHE6uDzl8eSVuvYCGhDUm2F7d19ExlZ4Uni
         Jzj7oQEKdLHrK3RXdQCd2rMrrrLlRvEvGGhNNFxFPCHZjQPMK5JviuA73CyvZ6QiUqEg
         9eCuygIYiBUSgYgJ84YFa8O1URNFuLxaPDe1LudgVy/tsAfKwzFOjsSD/l7fmgtIyD3f
         0S9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709600809; x=1710205609;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=drbucYWeVvv6Is4Np9qVH/EuaGcvXfhOgTQUhqj8fms=;
        b=Hp956cdQSRw8kmESpGHU4zSrmyJ/mRXYFdgLndnxxkaoeCqCumQ2eA4Gnw+zkCtQqe
         7udqFstUHjQmI8xMUSD2vUQRJBXBnnrFkhmqe3ywsTnE4wI+dmAtc4hLC/JYFNTGUDIT
         IiNKd3lTYfrKpEr4OyTEjNpadGcjDJSKG0pAf3zLIZM4gcTrdfgoj+aZc5YPzcjX/W02
         aIkiTbSFAqrVcPdn+3fD4ChN2ywnIUfAOBmpSAO1BD5BxhYuYnl5dxmA4n3Teh/fNllH
         MA9VfXvOg4iZibd7IN5kv3RUztR73dVP7t1aJ2RDUKlpuwbDjVJmqYuGUrLyOhYobATh
         3oLA==
X-Forwarded-Encrypted: i=1; AJvYcCU947ZTPVBuYdgMGQ+0i1aeoc4d5KydqEEZkl4JHAfYSSQ9VfnpwsRfZmnhir/gU34bVfT0rVOGExAk6dCAijT87ep3gIXEFJNtycY5IYNp
X-Gm-Message-State: AOJu0YzbNB4ifN6MPeZkyKZwXFYQpStexZPjhc9Cxy2mFSPBLN4HbvqQ
	ucyL3dMKCk+a70Zj7Zn6W5zzjhyYQ/BCjvHO3MjL+HBqPOi2Pk8e8o/GVcuZ
X-Google-Smtp-Source: AGHT+IFyGnnEnTZPfB6Ze1IxbyFTBM/ie1p10jAoh8UtSVmtzAdbOI6zu68nFNl+aj7WtAyvmjSqbg==
X-Received: by 2002:a05:6a00:98d:b0:6e6:1712:c79f with SMTP id u13-20020a056a00098d00b006e61712c79fmr5357282pfg.16.1709600808860;
        Mon, 04 Mar 2024 17:06:48 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:adb8:c71:a09c:347f? ([2001:df0:0:200c:adb8:c71:a09c:347f])
        by smtp.gmail.com with ESMTPSA id fh8-20020a056a00390800b006e55530067bsm7846199pfb.167.2024.03.04.17.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 17:06:48 -0800 (PST)
Message-ID: <29677f11-5e2f-4928-854d-b62a758e9fed@gmail.com>
Date: Tue, 5 Mar 2024 14:06:45 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: spinlock recursion when running q800 emulation in qemu
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
 <2ec644e8-f0e0-ee4b-f866-c27ff531aa3a@linux-m68k.org>
 <fcb506f2-523d-4efc-ae3d-fe3c79c6f09e@gmail.com>
 <6ba36077-004c-427a-a641-e30e550235cb@roeck-us.net>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <6ba36077-004c-427a-a641-e30e550235cb@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Guenter,

On 5/03/24 13:58, Guenter Roeck wrote:
> On 3/4/24 16:47, Michael Schmitz wrote:
>> Hi Guenter,
>>
>> On 5/03/24 13:33, Finn Thain wrote:
>>> On Mon, 4 Mar 2024, Guenter Roeck wrote:
>>>
>>>> when running the q800 qemu emulation, am seeing random "spinlock
>>>> recursion" messages every few test runs. Some examples are below. This
>>>> is not a new problem, but it keeps popping up.
>>>>
>>> You have to enable CONFIG_DEBUG_SPINLOCK to see it. I have logs from 10
>>> years ago that show it. Those logs have the VIA timer driver in the
>>> backtrace, like yours. That was v3.17 running on a PowerBook 180.
>>>
>>>> Is this a potential problem or just noise ?
>>> Maybe the locking validation is not compatible with nested 
>>> interrupts (?)
>> Seeing as m68k is the only architecture that allows nesting of 
>> interrupts, I'd rate that as quite likely. At least that's how I 
>> understood the situation a few years back when that weird access past 
>> end of RAM during interrupt accounting bug was discussed.
>>> Does "spinlock recursion" show up in Aranym as well? I would check for
>>> that myself but I don't have a reproducer.
>>
>> If you can give me a hint on what kind of workload that happens at, 
>> I'd be happy to run something similar (if not the same) on my 030 
>> hardware.
>>
>> I've never set CONFIG_DEBUG_SPINLOCK, so would have missed these 
>> messages, too.
>>
>
> No workload in my case, just boot into the qemu q800 emulation.
>
> Looking into statistics, for example at
> https://kerneltests.org/builders/qemu-m68k-master,
> it is seen every ~5-10 boot attempts.

I can certainly do that ...

Cheers,

     Michael


>
> Guenter
>
