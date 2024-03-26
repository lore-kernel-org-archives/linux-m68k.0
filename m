Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D72F1CAAE
	for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Mar 2024 22:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711492561; cv=none; b=QIm5L29Dwz89SdYwSTaVwnxnHzO4yMEulFkRWpAYAbqp50+Uu9tCyiKzhOvrifa/oY5sBvMVLCvduF4uOWebw5n1HzGi2y9vjPFR3F4WqI3sM9J5MOqNQwxeGn16AVIHPXDPHsMppT7yjFx7X8wbLlhHZO5G02TNCuESlcePIx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711492561; c=relaxed/simple;
	bh=hDu2vqPiAe61dRBPcBgvy08gNsbxvglr2+d1pIAa3Rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jTphEw3KnCnliPcJOUaT3ppnnq37uehzMoVwAuvnVmXF3W8J0z7HHaMlcM4J+FrffPTr0KYkkgSd7FSjLi4Zj+K+5NMPTc4QjCaYe/tLVFj0OD3XeqghJnrJPNta1tvdkO5apEIGVdQmLauUDtxzLeT0sTxSv+EAy/ICCwFLqfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJqbyo9Y; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJqbyo9Y"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5dbcfa0eb5dso4657137a12.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Mar 2024 15:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711492559; x=1712097359; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0QlfYRO2A1hVKlJ5wfpRCmc15lAV+xnbFpMVgTYGnGU=;
        b=nJqbyo9Yf3s7RmjyYyAar7fvIW2+eovoKpNdOLwniJPKLyqHPdxINSZ/TjkSAh6l6q
         LCGluCV3+db0v8Zne5Az9D1lo++DrVnzamRFMstF+f5b3TXduYjNKCCxWnvjznRoAfU2
         gwpFSpSRb/jBZme25TzBoMRP8OUuVni861rZ5sJarYMZ6Ga4491sl45t8hc6ae6ToEtX
         pAXGUuDELpyf82wiC0Q+qLP2p6nwvox0wgb1Mp35S2XaL8rSLdj1FFtUFtYsx4b4htiS
         3dnGEBPO3CxWoxP46LDzofOhbLH6gglfbgk1b9YcfTDcE3j0GGmDl4ZanQjb6CNy+iU+
         Wuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711492559; x=1712097359;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0QlfYRO2A1hVKlJ5wfpRCmc15lAV+xnbFpMVgTYGnGU=;
        b=MdJY+whtOSxGi/z1Hqavdw8h/qfxsDBPpDxyHUqtYLwXqkg1xjMkggluSAmxoSdjFb
         hW+VvYA6jSQu4fCI3MaCK8W6VTezRNcax3w9z/LYqNrW56Yqc7e5WBTasx6nz25QDFp5
         rKRvBU9CUSgpPV4gCsxhg10Op6modcFlt5tMo83+W37MI9biK8GkReloUKOXZjssV3z+
         rpiy+AgCjQVv4ovBAKK1zJ+6zaJ+pQA6P5ffJh819j8/IZYTGGb0e3Fy7iatOvQK26Sb
         yM6MxEH6L7JxB1tgd1igh+83PDAkdBSI7am0FHs22oY6gjamThwRRNzP8GWmAot3V5rN
         pPKA==
X-Forwarded-Encrypted: i=1; AJvYcCUXSIMxfeuSaATIvAE9eOqqMZQBOj7UAmS9HexkTf39G963gb8ZNj3V7sj3lOmcBPf0pk7bEZI/1LvatkdmCMxzpu5SZxBYOrE786AZSGe6
X-Gm-Message-State: AOJu0Yy5vhoKxUHqHRhBfuBk417zzPPLydSwJhL8Eb5FNvhuuKCoCJOT
	PCtCXzspwqnmwonZhDGW4WEI3pGwi3ATxv2Bxa1m4wMCwEqUTNTSHs6LDnLt
X-Google-Smtp-Source: AGHT+IEg9uxErgJRxR3j94uLUbAfljHtdCGnf6NSvxrqaeZAQbPTt7Ztd4nPa/eHLgeHcypuA9a1VA==
X-Received: by 2002:a17:902:7844:b0:1dd:2eed:52a5 with SMTP id e4-20020a170902784400b001dd2eed52a5mr3498739pln.37.1711492559353;
        Tue, 26 Mar 2024 15:35:59 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id k15-20020a170902c40f00b001ddc0bc5934sm7396074plk.249.2024.03.26.15.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 15:35:58 -0700 (PDT)
Message-ID: <570d4e69-e73c-4d35-8538-b5530c714c55@gmail.com>
Date: Wed, 27 Mar 2024 11:35:57 +1300
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
 <546b3960-7a1d-4989-82ee-2d7d56a9d609@gmail.com>
 <fb93b00e-6cfd-f2a8-7937-1266d7bbfc23@linux-m68k.org>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <fb93b00e-6cfd-f2a8-7937-1266d7bbfc23@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Finn,

yes, that would be the end goal, but it might be easier for Geert to 
merge the two patches (or a single one) on top of his preempt branch if 
they come in the usual git format.

Cheers,

     Michael

On 27/03/24 11:03, Finn Thain wrote:
> On Wed, 27 Mar 2024, Michael Schmitz wrote:
>
>> thanks - I'm pretty sure tried that early on but botched it by excessive
>> locking (i.e., keeping preemption disabled when calling
>> get_zeroed_page()!).
>>
>> So I don't think you do use too much locking here.
>>
>> I'm running stress tests for a while now, without any trouble so far.
>> Need to add a few other stressors back in, and repeat all that on a
>> slower ARAnyM instance but I'm quite confident you found the solution.
>>
>> Geert: with this data race fixed, it does appear my RFC patch is no
>> longer needed. Finn or I probably ought to prepare a new RFC patch to go
>> on top of your preemption patch. There is no commit ID to use in a
>> Fixes: tag for that one, correct?
>>
> I don't think we need a formal fix. I'd be content for Geert to simply
> roll your free_pointer_table() changes and my get_pointer_table() changes
> into his own commit. That way, bisection won't produce an unstable build.
