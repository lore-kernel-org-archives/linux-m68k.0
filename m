Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B84351C041
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Oct 2026 14:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072880; cv=none; b=ofQ/lkHrVa2adOaNwdPgnywermS133ANbnsSSHxsVXvL0ooxFapb6Oe6w2blnx9AEj36K1uQz0V8X11FTXbayaDapuJGSfRfyBSsdIRsp8I4V6ZEMw5K+InwLo1J8ESJSIk1rLSUftAeXdCXdvzUSMm+l14Cu2iGgVXWJQDH8qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072880; c=relaxed/simple;
	bh=zDxFmt3scrfMr8b7HQ54TJ3/C2LowqndhuRANO1c0SI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MPiE+pqXmaL4xPmCKgo7zq97iRkyNu0XqY66rNo6/ihykGHPF25iCGQEahZmRjcr/MMUXDXTy+jh/+tHL+aThBJXCiNC20OScgLXfARYqdfKjGf7RkT9Pd0xXyr+9xbYJgK/bQxfootVrZlkHLl9JLO9JpLSCh+PM6dBunncGN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D730341406;
	Thu, 15 Oct 2026 14:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890851F000C4;
	Thu, 15 Oct 2026 14:01:16 +0000 (UTC)
Message-ID: <7c56a26a-d438-4f8e-9147-b34bcf0e6b0b@linux-m68k.org>
Date: Fri, 16 Oct 2026 00:01:13 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] dt-bindings: serial: create binding for mcf-uart
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-m68k@lists.linux-m68k.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org
References: <20261013120831.1046590-1-gerg@linux-m68k.org>
 <20261013120831.1046590-5-gerg@linux-m68k.org>
 <20261014-expensive-shrewd-nautilus-abcab6@quoll>
 <d256f39c-6ed5-409a-a7ed-224165d00521@linux-m68k.org>
 <20261015-adamant-realistic-bettong-a24c4f@quoll>
 <4e9b365b-7c5a-44f4-bfaf-d24e9162fd94@linux-m68k.org>
 <CAMuHMdW84xXV=msd7Sc3BY+50e-gxFxc5dKL7anhrU893NFVaw@mail.gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <CAMuHMdW84xXV=msd7Sc3BY+50e-gxFxc5dKL7anhrU893NFVaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Geert,

On 15/10/26 23:06, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Thu, 15 Oct 2026 at 14:53, Greg Ungerer <gerg@linux-m68k.org> wrote:
>> On 15/10/26 18:56, Krzysztof Kozlowski wrote:
>>> But as proven already on the lists, no it WAS NOT tested. You have clear
>>> a warning.
>>>
>>> Otherwise you claim that tests shown errors and then you decided to
>>> still send it with errors, so then th enext question: why do you send
>>> code which your tests tell it is wrong?
>>
>> Sorry, I have no idea what you are talking about.
>>
>> This series of 5 patches was tested before sending, on multiple targets
>> that use this code (obviously all m68k/ColdFire platforms).
>>
>> Just in case I missed something I re-ran testing with a fresh 7.3-rc7
>> code base. All 5 patches applied cleanly, with a clean compile. My testing
>> showed no new problems in normal operation. Granted sashkio did find a
>> couple of error case checking issues that you just do not normally encounter
>> in practice (but I will of course fix those for v2).
> 
> make dt_binding_check dtbs_check

I wasn't aware of that. Thanks for pointing it out!  Makes more sense now.

I can see that running it throws up the same 2 errors that sashiko found,
so easily fixed for v2.

Regards
Greg


