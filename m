Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1B23750B6
	for <linux-m68k@lists.linux-m68k.org>; Tue, 31 Mar 2026 12:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774958995; cv=none; b=tRaNyVa9AbCtuhcys4TOIScX/ly0Yr0obh8M0ZHLPWgpb/vouR13UNvRBeNgfBJ/n0+9HkjniMoQbqTzP0GShfRM8xwe7E6P44YpMaMLZApVWdQGfVOjXbcnfvahGt30gBdrv1J6/hp2Q+Jr3E+2P1t28nvkWi4sfcBcoak1rGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774958995; c=relaxed/simple;
	bh=tpQkr5aKuz1OYQnLGdJR7b3LTyzufTwobzPxwe52qVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nT1v8lukGOUb40fZESlU3oLxh9nu+BqgbNhtYL4vxVi1Rbod7zpF5S9WrwxRwYKmFQwF0F62pHEEzgLeofaFBeLIp/qqy8RYByMMAf5TAfkYAi4CIpeNCTgkA6lAZUJ5a3rDDeeGYOFE0rmimVPCxhNsKZpw0bjB4H2pd2WcIX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34E1D42E10;
	Tue, 31 Mar 2026 12:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD75AC19423;
	Tue, 31 Mar 2026 12:09:51 +0000 (UTC)
Message-ID: <4f3e2ce0-9cf2-40d8-bc9a-f0e5614113fb@linux-m68k.org>
Date: Tue, 31 Mar 2026 22:09:46 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: Fix task info flags handling for 68000
To: Daniel Palmer <daniel@0x0f.com>
Cc: geert@linux-m68k.org, christoph.plattner@gmx.at,
 linux-m68k@lists.linux-m68k.org, sashal@kernel.org
References: <20260312115832.835968-1-daniel@0x0f.com>
 <10efa219-f7d7-4655-9a48-b4094bf97d47@linux-m68k.org>
 <CAFr9PXnO7y=PUPELb78qA1nN+4qsYqmk036PqXPLogk+L3Sv+A@mail.gmail.com>
 <c31b5288-7b1c-4139-8ae2-fbcb93411be5@linux-m68k.org>
 <CAFr9PXnWuvAi_OWzf=XRtoYAMkowVgnsB-Y2hmRuk2TtwQZWzw@mail.gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <CAFr9PXnWuvAi_OWzf=XRtoYAMkowVgnsB-Y2hmRuk2TtwQZWzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 31/3/26 08:09, Daniel Palmer wrote:
> Hi Greg,
> 
> On Wed, 25 Mar 2026 at 20:25, Greg Ungerer <gerg@linux-m68k.org> wrote:
>> Yeah, agreed. The more I look at the ColdFire version the more I think it
>> may not be totally correct. Its flow here doesn't match the comments from
>> arch/m68k/include/asm/thread_info.h. The legacy MMU m68k code does appear
>> to do as the comments say with respect to the TINFO flag bits.
>>
>> The ColdFire code was forked from the original arch/m68k/kernel/entry.S
>> a very long time back - there was some differences that needed to be dealt
>> with.
>>
>> Anyway what I am looking more closely at is if the higher TINFO flag bits
>> are actually not being checked at all - so things like single stepping.
> 
> For now would it be ok to just fix the reschedule flag for 68000 (i.e.
> I send a v2 that loads a single byte instead as you suggested). That
> would at least make it usable for me and the other few strange people
> using it. :)
> I have poked around at converting 68000 to the generic entry stuff. I
> think that would make most of this custom asm go away... but it'll
> take a while before its ready.

Yes, lets do that. Send a v2 and I will push into the m68knommu git tree.

Regards
Greg

