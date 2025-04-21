Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C11F20C490
	for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Apr 2025 21:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745269261; cv=none; b=e0KIgBTAvyjXuqYM1hXZav+VqmlPnCdVZZzBZUBmIHWjAzJc5Cqr4gHUk0yfC+vZG4yY0Q6AO6+Z6g8JmdemU86fv3JyDI0J3l/LoeIplpvK3NUcP1gzwwGIKwzKUiJo4ChiRg2rSxZN6ir52Q/X7RqKHQ/bukhu7Lg3z8T6T6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745269261; c=relaxed/simple;
	bh=kNaW6SU9dDfZC1Y1PIKeJzi4RgfeaqswCoLBdmAG9CI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HYvXx/MmCc37X4nMCHsH6q0PFWP85jNoXAYe2XfWez2OBu8jNGrT6FLGDfwpuBdhR/8ekdw6StSYVGWVPiQym3WqYjHmDf88yifrSghssqiHvgL6nf08ytN7dxLmWO1hPPFeWO+pn3lk276o3i0rIkEz9Se8BgZf4ETiPgOrGWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=jOz0H0fR; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="jOz0H0fR"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9649439DD;
	Mon, 21 Apr 2025 21:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1745269251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nZj+D4+qbevMFyufeYR48bmevE6NQo637+FsH1uutMc=;
	b=jOz0H0fRApAwxrmuyPfcq1tE9/nT6TOHYhL7WaULNS4fnNxT/MmfzvktyfGw7Yo+WFRrLG
	QQfOEI1akc53blM/U3bER8UpxvZrBz8TLoYsZWTrwHzICw5Vu27Kb5g2IiPoPEfxJZp3tT
	0F1NltxAaf4CjbUj77hMgTARisqiaDchu53KLNZfPs087dvsvYFTTa8WXf/IczrZffIryB
	WmJ0WET1biCI89K0XUA0yAYaR3/wc0KM3torGhyTL2raXh58/kuob2jqwam7NKHxMvnmDb
	41KB1yN2m0jyvwUGgsrVBq3rsHf17yIrAG0NWLg50mYF0HOsiW4lZZFM9w06pA==
Message-ID: <c7d62b1a-14a2-49f4-aaf9-5e235c8465db@yoseli.org>
Date: Mon, 21 Apr 2025 23:00:50 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: replace deprecated strncpy with strscpy
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: Shankari02 <shankari.ak0208@gmail.com>, linux-m68k@lists.linux-m68k.org
Cc: geert@linux-m68k.org
References: <20250417201013.46384-1-shankari.ak0208@gmail.com>
 <808bf053-9e29-4336-94f9-29bcb22c097b@yoseli.org>
Content-Language: en-US
In-Reply-To: <808bf053-9e29-4336-94f9-29bcb22c097b@yoseli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedukeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffhvfevfhgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflvggrnhdqofhitghhvghlucfjrghuthgsohhishcuoehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgheqnecuggftrfgrthhtvghrnhephfejfeeljeetveeujeeftdffgfelkeelgfekleegvdefteeifeevheeluedvueetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledurdduieehrdduieehrdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledurdduieehrdduieehrdduleejpdhhvghloheplgduledvrdduieekrddurdeingdpmhgrihhlfhhrohhmpehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdpnhgspghrtghpthhtohepfedprhgtphhtthhopehshhgrnhhkrghrihdrrghktddvtdeksehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrgh
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi,

On 21/04/2025 15:01, Jean-Michel Hautbois wrote:
> Hi Shankari,
> 
> On 17/04/2025 22:10, Shankari02 wrote:
>> The use of strncpy() does not guarantee NUL-termination and is deprecated
>> in the Linux kernel. This code manually terminates the buffer afterward,
>> but using strscpy() is simpler and safer.
> 
> This assumption is true, but adding a link to the explanation could be 
> better ?
> https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy
> 
>>
>> This change replaces the strncpy() + NUL termination pattern with 
>> strscpy().
>>
>> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
>> ---
>>   arch/m68k/kernel/setup_mm.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
>> index 15c1a595a1de..48ce67947678 100644
>> --- a/arch/m68k/kernel/setup_mm.c
>> +++ b/arch/m68k/kernel/setup_mm.c
>> @@ -243,8 +243,7 @@ void __init setup_arch(char **cmdline_p)
>>       setup_initial_init_mm((void *)PAGE_OFFSET, _etext, _edata, _end);
>>   #if defined(CONFIG_BOOTPARAM)
>> -    strncpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
>> -    m68k_command_line[CL_SIZE - 1] = 0;
>> +    strscpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
>>   #endif /* CONFIG_BOOTPARAM */
>>       process_uboot_commandline(&m68k_command_line[0], CL_SIZE);
>>       *cmdline_p = m68k_command_line;
> 
> As we are not using the return value, I think it is a safe replacement.
> 
> With the link added:
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Sorry for this one:
s/Signed-off-by/Reviewed-by/

JM
