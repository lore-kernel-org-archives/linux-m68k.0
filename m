Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D48D2D77E6
	for <linux-m68k@vger.kernel.org>; Wed, 19 Aug 2026 01:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787103363; cv=none; b=NJ2ibf1ksDpqdEcHr0UINDhfOSX+fleezQX1ptYF5OrK1yrayn7kCVeOytoERVhlPTSgHd+pTTgtUbVdVLKlCA2Ih7inU3KpiQlU4xy3NEMQiANU6wQe3Ihd9OOTyzyRW+AP+JYJAWtjJI7MgMvy1Bdu6gZj7pOwU9ToPVtK4Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787103363; c=relaxed/simple;
	bh=c4DgkPkL0O1RvnIC56+UnsEDbQXeHgXgajlT3dEacgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mIY2hXTXQKyeRRgjn39me4EfKRAAjBhji+KxxkLq4ULKFOmaKovhRmY78oP6a8uV7szYph7CplO3icowBsiXuy3H+Z9FQQOI2jn/g5tCvFszAf2jrOmSuXkqv4SHTNGWGD4UZbYTloMVXTgPYjM23JHp+1gObR5ZMOtLHyM5s5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0pB2oht; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0pB2oht"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d032846c95so6046655ad.1
        for <linux-m68k@vger.kernel.org>; Tue, 18 Aug 2026 18:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787103361; x=1787708161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owKCVUF/nyGQlzMiSHiL1o+6oXm0PiyeDQIC8x4f2D8=;
        b=E0pB2ohtfYc2UqPah4afWb1RL3xV7dFX1nmMqhne8VDjZYa8e9ikPhSyGKuEnMW3SE
         5tss4CEJzr423yG1zI4t13uAih1BnRUfrY7nqLeEMFKNfdK5Uhsu/4mJtieuNhCRM1tF
         yBIakn7fKJS47Irmd+WvPUj1esSQWrQVjO/SfLfsx2DjS43We4j9hG3QTIjIExlTKK9D
         C0Ts/l65vqyrp+UcW3bUbKEz+Qr/nxn6c6E9COupt2852yEuu7l2g7pQ8Vp0Fm2EsAr0
         +0189pFhCEvCW9U64sppCPpgkm6mebjmBrOmdBnPHW6Bi6/X7arpLV89AQMl3jQuRhpF
         dcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787103361; x=1787708161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=owKCVUF/nyGQlzMiSHiL1o+6oXm0PiyeDQIC8x4f2D8=;
        b=f4mIfuj+NcmUjRM/qeKknMo99tfB/3+eq69xGd0G5SXFiPcyykfHHKaKNBFm93cifb
         giqcNpygojvuMDA8HM2CwiSLmlMuaTU56PGhVugomoBsyopw96v9u/6CDBksr7osY14v
         bRkjXnUfFk4lAtFjnyo5efu2LQO7gcZnBG0YN+nCZP/z3bIDdP2e9dlyZLP85KhXY31Y
         ew25jKchRjqfMjM6+JAhDaaG9U49NVnMkBQkxS5kyn1kTLh16WLkpUlLg1dYsumiL++/
         NQC3rrJsv4rIxORNNvIcU+ybSvEpTmcVDy0Qx7Pz/b04OuMoQMETUtcqkw59HEKlf6gf
         Yu1g==
X-Forwarded-Encrypted: i=1; AHgh+RpkrqBkhpJhSeCMDNvCLJIO+LY/88DKoxPKtrw424Ewn1/FyxG40+yZehMs9dP2l2tIOB1Hh387cm5y@vger.kernel.org
X-Gm-Message-State: AOJu0YxHs4vQiZOOp5d8Fwazz7Fg/RXbl7XxE+XCHSkHOUm+o/xwV4cm
	N0xaTxuJDn1rkEhnqOoDaebuiRE7HhAl3/wNRP5exsNbASBteYqCd6cV
X-Gm-Gg: AR+sD10iHZ8QVahQvOmjlbOSLLd6HfGlgYG1QKuvofB5bHnrPoRWe+94esX9XA0KoHH
	Y3Syc5M7sjWzZoTDERTWYOnOMbTzQr201jn056b4gST3XQlX7uFuTo1TRo/r2OackMBY7j3VEYD
	WwetVH1A+2q8tSgamFrSkZC/jGzfR2RTYd55n8mVrog0VqRSHbgE4es1Riks2cSw5YykKRHnvwP
	hrMyPFvzd9iJij6XuylNhDFu/mZyQUR24iiHy2j883IaZ/5xOZ+p7VkNhWlEDllKvAl2SWHcROr
	xUZWyHETAR0JzTx4D5YCGbkyyXJmW8IxkzkDyKeA8HUjWmX08i9mfjP7mnFYA3e/QOcGYMvL0cz
	g3RBNLF5kSRA6CBobySVejs3wAe1VH1KgVOG4NY+1muyj4TRvRt7aPhRTzpDKoyCyz6aw8HelnX
	DhOriNosYkXVD0/HbN3ew3QHxPhWq3v8CMyHQY5ASRAOf59APf+w6/9qXZUt1GXHt6OXWLAXpBH
	iy50/k695DgrO0M1taVdKCFqjR/dqOAR68FVhbLloI0xWz6S7yxcCgiH3ANXDwijT4RjvmQwYOU
	WefhOoM=
X-Received: by 2002:a17:902:f687:b0:2d3:2e86:647a with SMTP id d9443c01a7336-2d5fd6b24camr18144275ad.5.1787103361348;
        Tue, 18 Aug 2026 18:36:01 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:b984:9fe3:5dce:f291? ([2001:df0:0:200c:b984:9fe3:5dce:f291])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77fc0sm1727889eec.8.2026.08.18.18.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 18:36:00 -0700 (PDT)
Message-ID: <6b9e3cc6-8534-4dde-b2cc-505f1576a7f2@gmail.com>
Date: Wed, 19 Aug 2026 13:35:54 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] fbdev: Give atafb proper parent
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-m68k@vger.kernel.org,
 geert@linux-m68k.org, Helge Deller <deller@gmx.de>
Cc: Miro Kropacek <miro.kropacek@gmail.com>, linux-fbdev@vger.kernel.org
References: <20260816073752.16656-1-schmitzmic@gmail.com>
 <20260816073752.16656-3-schmitzmic@gmail.com>
 <a486820d-8500-41b1-bc32-a23d908c9f86@suse.de>
 <5a2d0139-84db-cab8-c7fb-7806a71c53b2@gmail.com>
 <3347106a-f0f9-415a-94e4-94bc9b8182ef@suse.de>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <3347106a-f0f9-415a-94e4-94bc9b8182ef@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

On 17/08/26 19:57, Thomas Zimmermann wrote:
>
>>
>>> If so, could you also replace the hard coded fb_info with a call to
>>> framebuffer_alloc()?
>>
>> Can't see how that would work - fb_info isn't passed to all functions 
>> that need to use it, especially in the hardware detection phase 
>> (hence the use of a static fb_info struct)?
>
> You'd have to modify the driver to pass the allocated instance, of 
> course. It's not a trivial oneliner, but if this driver is still 
> relevant, it might be worth improving it.

Wasn't all that hard after all - do you want that patch on top of the 
current series or replacing Miro's patch 2, Helge?

Cheers,

     Michael


>
> Best regards
> Thomas
>
>>
>> Cheers,
>>
>>     Michael
>>
>>>>
>>>> Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
>>>> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
>>>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>>>> Cc: <linux-fbdev@vger.kernel.org>
>>>> Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
>>>> ---
>>>>   drivers/video/fbdev/atafb.c | 5 +++++
>>>>   1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
>>>> index b8ed1c537293..3d540803dc2b 100644
>>>> --- a/drivers/video/fbdev/atafb.c
>>>> +++ b/drivers/video/fbdev/atafb.c
>>>> @@ -3101,6 +3101,11 @@ static int __init atafb_probe(struct
>>>> platform_device *pdev)
>>>>   #endif /* ATAFB_EXT */
>>>>     //    strcpy(fb_info.mode->name, "Atari Builtin ");
>>>> +    /* Parent the fb device properly: without this fb0 registers as a
>>>> +     * virtual sysfs device with no /sys/class/graphics/fb0/device 
>>>> link,
>>>> +     * which makes Xorg's fbdevhw reject it ("No devices detected").
>>>> +     */
>>>> +    fb_info.device = &pdev->dev;
>>>
>>> Because this is supposed to happen in framebuffer_alloc() and 
>>> keeping it
>>> there would be preferable.
>>>
>>> Best regards
>>> Thomas
>>>
>>>>       fb_info.fbops = &atafb_ops;
>>>>       // try to set default (detected; requested) var
>>>>       do_fb_set_var(&atafb_predefined[default_par - 1], 1);
>>>
>>
>
