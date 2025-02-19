Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E1C1E25EB
	for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Feb 2025 13:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739971528; cv=none; b=OACDTQ2yMR1sbfU66Q9OSRxpTJ93aEg9FkICvbiqpmHLCwfkh0UIhP3lTsoLh7UW9CD7HGdBriCxjppTqSSSUqs1gH9FSSgm6bkJgz0crgMqNv/lxVRUNSjPQuoLhVVAfZtUEd6DWSB1G6/RBEFI4PrWkWX8EcI90Of+n38/TOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739971528; c=relaxed/simple;
	bh=G+Ivr72+J1uzW2BzvUPfwTtnFdKFHX7x+87gCeaMp2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=g1W67nrgmcLtiQqfVlu7YZ6z7L0sY/vVg1OQwXxmWeTKJ7+XvKAk4/xG3QEXgwBY5M0IX37A47C2Mj/IgbX7D6cv8lBUJh2SRFXgTj9mtTWh7vt6U/KPIU6Y+MXAPLLwXoEhV1H/RnOtG4KrYZbw3ZYZ0zNCLpTGvNlF6kt5Xjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 87A2B5C57CA
	for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Feb 2025 13:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6CAC4CED1;
	Wed, 19 Feb 2025 13:25:24 +0000 (UTC)
Message-ID: <611a4c02-5200-410b-98c0-a4c586ba67bd@linux-m68k.org>
Date: Wed, 19 Feb 2025 23:25:22 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] net: fec: add device tree support for ColdFire FEC
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-m68k@lists.linux-m68k.org
References: <20250218125124.2692982-1-gerg@linux-m68k.org>
 <20250218125124.2692982-4-gerg@linux-m68k.org>
 <624f666f-6b97-4afe-821a-8fbc57a408c4@kernel.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <624f666f-6b97-4afe-821a-8fbc57a408c4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 19/2/25 17:05, Krzysztof Kozlowski wrote:
> On 18/02/2025 13:46, Greg Ungerer wrote:
>> The FEC hardware module used in most Freescale ColdFire SoC parts is a
>> simpler version of that used on the iMX family of parts. Add a devicetree
>> compatible entry they can use.
>>
>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
>> ---
>>   Documentation/devicetree/bindings/net/fsl,fec.yaml | 1 +
> 
> Please run scripts/checkpatch.pl and fix reported warnings. After that,
> run also `scripts/checkpatch.pl --strict` and (probably) fix more

I did. I chose to ignore the documentation and frivolous formatting
warnings for now. See cover letter for reasoning.

Regards
Greg


> warnings. Some warnings can be ignored, especially from --strict run,
> but the code here looks like it needs a fix. Feel free to get in touch
> if the warning is not clear.
> 
> 
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.
> </form letter>
> 
> Best regards,
> Krzysztof

