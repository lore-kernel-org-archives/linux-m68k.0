Received: from welho-filter1.welho.com (welho-filter1b.welho.com [83.102.41.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E321531C3
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Sep 2024 15:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.41.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727365306; cv=none; b=ipHrmjo7OIkKR/sa9dyJraO7wMpHiiYDESeP0I1Uk9UzHxYq+HRgK/GfPDYcd9yq6t73P+VEok5O8sgIDKBxClLG7pKZ4XwuW6D3WGiY2ItEUhbwCFni8AgdSTJRNdfSQUZen6OVIhoUeCxEc7cLzo7UI5C+YpsICR7kvanJXjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727365306; c=relaxed/simple;
	bh=aEyxJFVU4le/9fytLYCX69m6JEBzYttgPehO4MOBEdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eXGYtz/vmkGODyv4zDaQs1PP/cFcyIUow0zAjW3AvBCKSGKE5Cz0ItWJIUuV5O6wR/jGWpqrdimtRFhJgXlfxEY8WnS5AWw9rGSz6VkuZXPe/pw3IiEgECEF5VOzl/FpgQJkqkDwvvlt5oD0Wh7Ss7JaM3B82QayMVSvb/Zgm+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; arc=none smtp.client-ip=83.102.41.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Received: from localhost (localhost [127.0.0.1])
	by welho-filter1.welho.com (Postfix) with ESMTP id 726FE1E347;
	Thu, 26 Sep 2024 18:41:34 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp1.welho.com ([IPv6:::ffff:83.102.41.84])
	by localhost (welho-filter1.welho.com [::ffff:83.102.41.23]) (amavisd-new, port 10024)
	with ESMTP id XCCo6QGZjfjG; Thu, 26 Sep 2024 18:41:34 +0300 (EEST)
Received: from [192.168.101.100] (87-94-156-238.rev.dnainternet.fi [87.94.156.238])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by welho-smtp1.welho.com (Postfix) with ESMTPSA id 39A2B28B;
	Thu, 26 Sep 2024 18:41:32 +0300 (EEST)
Message-ID: <87652f3d-34c0-40f6-89a2-87dd37c8d3bf@helsinkinet.fi>
Date: Thu, 26 Sep 2024 18:41:31 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] m68k: Drop Atari EtherNAT support when it's not
 configured in
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <20240922214821.16818-1-oak@helsinkinet.fi>
 <4540348c-84f6-4993-97b5-f007771be444@gmail.com>
 <eed880a2-8c02-40d7-813b-c6e8f1b8c197@helsinkinet.fi>
 <877cb03gju.fsf@igel.home>
 <fff20dd3-d82b-4095-b367-1aaf118ef8a0@helsinkinet.fi>
 <87y13f3bdd.fsf@igel.home>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <87y13f3bdd.fsf@igel.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25.9.2024 20.13, Andreas Schwab wrote:
> On Sep 25 2024, Eero Tamminen wrote:
> 
>> Hatari debugger backtrace does not rely on frame pointers or stack content
>> unwinding, i.e. it's immune to stack corruption.
> 
> That has nothing to do with stack corruption.  Valid user-space
> addresses can very well happen to match kernel adresses, since the
> address spaces overlap.

Hatari profiler & debugger (currently) support only physical addresses, 
so that's not the case.


	- Eero

Lack of MMU / address translation support in them is not a problem for 
what they're normally used [1], as neither TOS, nor 99.9% of the stuff 
run under it, use/need that.

However, with Linux, it means them being mainly useful for debugging 
what happens on kernel side.  I do not think that to be too much of a 
problem though, as kernel side is the hard part and there are good 
alternatives for debugging user-space.

---

[1] E.g. optimizations in latest ScummVM upstream releases that make it 
work OK on original Atari TT & Falcon HW, and (enhanced) Doom I version 
that runs OK on original Atari Falcon.
