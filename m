Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C2F19580F
	for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Jan 2025 07:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738135983; cv=none; b=m1wHYkwLNPkrto8R6Sryle+FKqACjaB4NeiIXrSWJePmEuLGI4MpryHOrO/5VRO6uamzIH7zyAInufthMUqqcHm/ffGZf4/Ugdk5xkYewfJVp4QNO5e2k2hs9ANkDBzu21QtfMq6JRXGVjtokELRqsOpGd4E+ipoWXTde1IoOr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738135983; c=relaxed/simple;
	bh=f0+9+yO9M89au6JtXbxvZcdnFcNdanMeNmGX3PCneoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oQTiha3tnvoIaMZoMPG1wuLpU+MSMG8To7YQbBm2nzQsATQNy1Sj76yfAaTfJ4gfxgwIezaMs6r7v4I3/+wnVAcVlKiBW+hxOWJNFc1H9QRhb27LUKKUqLs30XboWbqdMQjhUhms/VHJ/Jn/OhpUNpo08HBpvbjSfCzNZeMYsi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=hba9Kq0Z; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="hba9Kq0Z"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77AE744175;
	Wed, 29 Jan 2025 07:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1738135973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZR222ki/Tx1uXqbRNs3W05RIIUx6kLjKSuiqC8heoQ=;
	b=hba9Kq0ZrVsQOaaDD+E6FYtxgF5KH2BwHcf7cYAZY9skW/WvkekFNordMgciQqcXBaZFYS
	XYZxS5s4UGY5Gb5AdUDAsDF1K2D9i1cNw3TDd5qYktLDi/125TZ/+JYib206i6zFZNheUB
	i1AQ/mdjwqAYrZZ8ChpAIXsvi3MpPjdjRJas7YmCwrDbZBkUzxQnuoSQpYuz07Pk/grs1g
	7JwQst6k9Uk79cwMz7yAEeHxnN3b3PBLeiyeBiLOLUoGu0bE89bTN9w4dI0gzFCU5tylX8
	LcgF9oSJUWujSYQ3u6HcGUXrdyMa7J0zmOIMtp+qLxDTANm6Xn8ILEHa6Z9gGA==
Message-ID: <44398a86-cf85-4c7b-85f1-de9beedc72fc@yoseli.org>
Date: Wed, 29 Jan 2025 08:32:52 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arch: m68k: Add DMA mapping operations for Coldfire
 M5441x
To: Christoph Hellwig <hch@infradead.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
References: <20250121-coldfire-global-pool-v1-0-382a7235c2aa@yoseli.org>
 <20250121-coldfire-global-pool-v1-2-382a7235c2aa@yoseli.org>
 <Z5h0vvL0B5ktd3sM@infradead.org>
 <ba7ea0f0-be38-49a7-b416-3dc62c7e7425@yoseli.org>
 <Z5h70TL6lSWzGA4f@infradead.org>
 <8b453664-13b6-430c-a865-9675edcdf369@yoseli.org>
 <Z5h9ZySKFwHRjg0O@infradead.org>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <Z5h9ZySKFwHRjg0O@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheplfgvrghnqdfoihgthhgvlhcujfgruhhtsghoihhsuceojhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgqeenucggtffrrghtthgvrhhnpeefieetgeehvdeggffgffetheehhfetkeefhefhgeeuheetueffueeikefgffffteenucfkphepledurdduieehrdduieehrdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledurdduieehrdduieehrdduleejpdhhvghloheplgduledvrdduieekrddurdeingdpmhgrihhlfhhrohhmpehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdpnhgspghrtghpthhtohephedprhgtphhtthhopehhtghhsehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepghgvrhhgsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhin
 hhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Christoph,

On 28/01/2025 07:47, Christoph Hellwig wrote:
> On Tue, Jan 28, 2025 at 07:43:23AM +0100, Jean-Michel Hautbois wrote:
>>> It really should not be hard.  The dynamic mappings already work fine
>>> as m68k is using the generic code.  So the only thing you want is
>>> to dip into the glonal pool for coherent allocations. For that you
>>> need to select the DMA_GLOBAL_POOL config option and fill the pool
>>> with dma_init_global_coherent().
>>>
>>
>> Isn't it done in patch 1/2 ? Or did I miss something ?
> 
> The point is that this is all you need.  No need for new dma ops.
> 

Indeed, I tested it and it works fine.
I have removed the test in fec_main to be certain, but I think it would 
be better to change the COLDFIRE_COHERENT_DMA conditional ?
What sounds like the most efficient way ?
I can' do:

- #if defined(CONFIG_COLDFIRE) && !defined(CONFIG_COLDFIRE_COHERENT_DMA)
+ #if defined(CONFIG_COLDFIRE) && !defined(CONFIG_COLDFIRE_COHERENT_DMA) 
&& !defined(CONFIG_DMA_GLOBAL_POOL)

I suppose it would be better to modify it in the Kconfig, but I can't 
find a nice way to do it without having a circular dependency:
arch/m68k/Kconfig.cpu
@@ -555,6 +555,7 @@ config COLDFIRE_COHERENT_DMA
         default y
         depends on COLDFIRE
         depends on !HAVE_CACHE_CB && !CACHE_D && !CACHE_BOTH
+       depends on DMA_GLOBAL_POOL

=>
error: recursive dependency detected!
         symbol DMA_DIRECT_REMAP is selected by M68K_NONCOHERENT_DMA
         symbol M68K_NONCOHERENT_DMA depends on COLDFIRE_COHERENT_DMA
         symbol COLDFIRE_COHERENT_DMA depends on DMA_GLOBAL_POOL
         symbol DMA_GLOBAL_POOL depends on DMA_DIRECT_REMAP


I will send a v2 with the global pool.

Thanks !
JM
