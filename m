Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766FA42A141
	for <linux-m68k@vger.kernel.org>; Mon, 17 Aug 2026 19:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786993889; cv=none; b=Nv9VnJFQImLUvC8AKkWdItrGBImHi2Wom/u8GAwFxAkX6xuChbTwuLDEkSmwKYwV+N8yjA7c9Jp9+7qdusQeh4faa+8/GiX5W6Dlj3Ibl1yIr7S1TC1rm8Ad+Bq23NywgNL0jiHJ9hH6h00i+LptzlcH2gLSHEAtV1JT+CFb52I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786993889; c=relaxed/simple;
	bh=PFznSusuAxwRsCwydTQw2s/fj8NtxgMl05ZErA3OYGc=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=elWJVk3fOxirEYqxtgAh6Y0MOhJvzZyqrkBQGnz0KUKofz0fSiWKzWaHIPUlNJGWHG4s8H0Sea0iehaUOlwlLxCjWJP81Ee4O+o34xshgr/CoS6Ms+ybALwbByVwIstOV43fY+VutbkI109E+z0XvDssoivfcRYw9I/7NsfNZN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nogU4YRL; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nogU4YRL"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38759bcd877so4458752a91.2
        for <linux-m68k@vger.kernel.org>; Mon, 17 Aug 2026 12:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786993888; x=1787598688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kgpBXaPbKe1BHFYzjio5DXVI45Z37nWkkPcEL9YDavM=;
        b=nogU4YRLvh22eK0Z98bb6JgovUTFNTQ5FdDCHDRPH5Um16zKjPJ2RRBpZcMxT0Jb8O
         ioweJxYET2JyB9oGiMwKpa0ySlhTU28jcppdSxbzP89d+dNxeEM3NJYYfyKY0oCrLOpN
         Kk0wDKnH9QB2nmO/R52hliWYWiMtfV3uMMqx4bg6y4eXBMvL/EwaGN+NvTb697BRIt7d
         9ase3nJpvSe8B81ou7mmq7LjI6FusIwOXj5CMrxRHhspvrby0bdbxMQBrl38oVJMi/ar
         gMLr6m0lhdfanJYkrSfEEv+Su+ohV7nkStzdNyHwDjuLM1Wo3SlxUoMXnL0fFv7rEeEJ
         +HUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786993888; x=1787598688;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgpBXaPbKe1BHFYzjio5DXVI45Z37nWkkPcEL9YDavM=;
        b=qYoGg4SwzwZZt7X5iCPEi7CeJyMNY5FAmZ/ReH0QKR1HaA9yjEAiVfyAvi/9f6fnma
         zB4TovJgTztxF6gInmKfxpVI9TeF43zeTac75hldvAdJ3c2oF20UGZpk2wekKXKhyGbc
         peJhC3ZaphbTQCJQlfWeo5JIFqZ/Y0ClOKbEARLKi+ygnNDkTzdl8fNABFJwedOeMRc0
         GwX5JiPLBsv7/yCqeHsnY3nNCqgyIvYoOx3OohcPB3X7YklRvuMjDNbZ2dFNmlxONdiZ
         A5G2oNkbARY1jJnanCvtDFkYRCHQc4fPSNRLW7Wxtw1ueHcV+LiJvT4FN4pjGB54wJ/m
         ByHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqDP9WqR5lfSOcVmv3Y3jbiMz0IAVGc+q4XpqXsh8vyT9vhgsl5TufkOZ2nHa/f7OOJtZKMS3MQuBqA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2kBzDJnriw9rEWCIZKAfF3EwnARgi8Ye56twB+gQn+4jTJWke
	HqGw98kDmDlmFAwR0w1v6v+iWO3Byo1nJtsw6PcTf6c+UndYmKrr/85K
X-Gm-Gg: AR+sD11X3Yzbb98G+yRP9BA3bf+8jc6Hsy0ktgX6UV1iyBJt/pqBEcdVC5Ha+68tW+j
	fSMWv9kz6vG5ydl1eJCDgU95P3/cyaDRfg5xDGAYCqwK8t6/tIhbI6NMcqyd8JSaFjw0n0KV5EG
	ugzlsrmJ2KCTv/x7iApBkJUht0OHNaRRGPYd6ogcAKFE8vzejn/HRRXtu1bAvCJMRQLmOwCAaJf
	gLMHmjXHcFEd6qORjR9hyD3DGIZO87IiLQ1bAXQiV9fodGMfjxgeQxeQ6m07vYmyIZFJ7XbIRYm
	ZxdqYijo1L6Jh4FJGYvHxqK/4tWFZ8lTrdxWZuixeitx0V51YXTuS7YiFDNV1bMv7KuFK9A25va
	x/snLycWHU9bs853bm/i3UdFRBMifcC4Cw/NaSKl3P1GLOR9VZ7ngyUbaVxVyFoFK4pdLCZWwWo
	5N2Q5pzZzS+j1TXEUOyvF2E2tP/jF5Ojjt8y+pcPJqXosaN8fETV8MOrbQG8AKAOycNz9rCOaYG
	CeE67LGByE4QNadT6CeoAG4
X-Received: by 2002:a17:90b:2b8f:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-3933cadeefdmr28541596a91.5.1786993887659;
        Mon, 17 Aug 2026 12:11:27 -0700 (PDT)
Received: from [10.1.1.24] (222-152-170-159-fibre.sparkbb.co.nz. [222.152.170.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d2b8080sm3481920a91.4.2026.08.17.12.11.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2026 12:11:26 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] fbdev: Give atafb proper parent
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-m68k@vger.kernel.org,
 geert@linux-m68k.org
References: <20260816073752.16656-1-schmitzmic@gmail.com>
 <20260816073752.16656-3-schmitzmic@gmail.com>
 <a486820d-8500-41b1-bc32-a23d908c9f86@suse.de>
 <5a2d0139-84db-cab8-c7fb-7806a71c53b2@gmail.com>
 <3347106a-f0f9-415a-94e4-94bc9b8182ef@suse.de>
Cc: Miro Kropacek <miro.kropacek@gmail.com>, linux-fbdev@vger.kernel.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <badcf850-5e4d-40cb-11df-ff15f23e4983@gmail.com>
Date: Tue, 18 Aug 2026 07:11:20 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <3347106a-f0f9-415a-94e4-94bc9b8182ef@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Thomas,

Am 17.08.2026 um 19:57 schrieb Thomas Zimmermann:
>>>> The atafb fb device registers no parent, causing a missing symlink
>>>> (/sys/class/graphics/fb0/device). Xorg fbdevhw driver looks for that
>>>> symlink when scanning for devices, so add a parent node for atafb.
>>>
>>> Do you really have these devices to test with?
>>
>> Not the particular hardware that patches 3 and 4 add support for, but
>> the 'normal' Videl that is found in every Falcon, yes.

N.B.: actual hardware won't be essential to test - an emulator such as 
ARAnyM will do fine.

>>
>>> If so, could you also replace the hard coded fb_info with a call to
>>> framebuffer_alloc()?
>>
>> Can't see how that would work - fb_info isn't passed to all functions
>> that need to use it, especially in the hardware detection phase (hence
>> the use of a static fb_info struct)?

On second thought, depending on how early in driver init fb_info is 
needed, I may get away with turning it into a struct *fb_info and using 
that where it can't easily be passed.

>
> You'd have to modify the driver to pass the allocated instance, of
> course. It's not a trivial oneliner, but if this driver is still
> relevant, it might be worth improving it.

Your point is taken - I'll take a look at what would be required to pass 
fb_info to all users. It's been nineteen years since rewrote atafb so 
getting my head around the call sequences may take awhile.

Cheers,

	Michael

>
> Best regards
> Thomas
>
>>
>> Cheers,
>>
>>     Michael
>>
>>>>
>>>> Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
>>>> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
>>>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>>>> Cc: <linux-fbdev@vger.kernel.org>
>>>> Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
>>>> ---
>>>>   drivers/video/fbdev/atafb.c | 5 +++++
>>>>   1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
>>>> index b8ed1c537293..3d540803dc2b 100644
>>>> --- a/drivers/video/fbdev/atafb.c
>>>> +++ b/drivers/video/fbdev/atafb.c
>>>> @@ -3101,6 +3101,11 @@ static int __init atafb_probe(struct
>>>> platform_device *pdev)
>>>>   #endif /* ATAFB_EXT */
>>>>     //    strcpy(fb_info.mode->name, "Atari Builtin ");
>>>> +    /* Parent the fb device properly: without this fb0 registers as a
>>>> +     * virtual sysfs device with no /sys/class/graphics/fb0/device
>>>> link,
>>>> +     * which makes Xorg's fbdevhw reject it ("No devices detected").
>>>> +     */
>>>> +    fb_info.device = &pdev->dev;
>>>
>>> Because this is supposed to happen in framebuffer_alloc() and keeping it
>>> there would be preferable.
>>>
>>> Best regards
>>> Thomas
>>>
>>>>       fb_info.fbops = &atafb_ops;
>>>>       // try to set default (detected; requested) var
>>>>       do_fb_set_var(&atafb_predefined[default_par - 1], 1);
>>>
>>
>
