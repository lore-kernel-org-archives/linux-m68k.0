Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8F62E401
	for <linux-m68k@lists.linux-m68k.org>; Wed, 25 Mar 2026 11:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437953; cv=none; b=Yb9XjZr0S0uf6QdegdWFQwFv/SMcX9eyrYhNkm1XgxF1plLjK9oU2qSPZJ5ErsrZKuTjpvXYPupTQ5IaoB6xWpPvWZItGdQ3fO5vX9iXo0To8rLXMIxtUFmVlZX3Zcc+3SLknVeUeoCvz6qMwA03Mp7qswW+O5A2h1RCaBHrQTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437953; c=relaxed/simple;
	bh=ihSFBqegysCkqTbv155gSYJA1ImxRZIlMeZc6pyFR4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KwJuC3h0IgaCLBlgwGwDTX8ihAuJAHTQXDmlzDZpgdPf6iMgv/w1D2ERZa+jl8179J7QtDR1D7lP+xW7LiDAjBlUm+tLLOhiA+gb97iZhFB6BKIpBPG7P69uK3lai9L9dVUOxWFFEeJIW0iJAiJSCEX/YG76JMVT0gksRPZKnGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9EE260123;
	Wed, 25 Mar 2026 11:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A69C4CEF7;
	Wed, 25 Mar 2026 11:25:49 +0000 (UTC)
Message-ID: <c31b5288-7b1c-4139-8ae2-fbcb93411be5@linux-m68k.org>
Date: Wed, 25 Mar 2026 21:25:31 +1000
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
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <CAFr9PXnO7y=PUPELb78qA1nN+4qsYqmk036PqXPLogk+L3Sv+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 17/3/26 08:05, Daniel Palmer wrote:
> Hi Greg,
> 
> On Mon, 16 Mar 2026 at 23:08, Greg Ungerer <gerg@linux-m68k.org> wrote:
>>
>> The comments from arch/m68k/include/asm/thread_info.h are this:
>>
>> /* entry.S relies on these definitions!
>>    * bits 0-7 are tested at every exception exit
>>    * bits 8-15 are also tested at syscall exit
>>    */
>>
>> So looking at what check is in arch/m68k/coldfire/entry.S:
>>
>>       moveb   %a0@(TINFO_FLAGS+3),%d1 /* thread_info->flags (low 8 bits) */
>>
>> In arch/m68k/kernel/entry.S it looks to be doing basically the same thing:
>>
>>       moveb   %a1@(TINFO_FLAGS+3),%d0
>>
>> So they do really only check bits 0-7 here.
>>
>> If you code the check like that do you still get correct running behavior?
> 
> That seems to work.

Thanks for the confirmation.


> One thing I'm unsure about is this in the coldfire version:
> 
> Luser_return:
> movel %sp,%d1 /* get thread_info pointer */
> andl #-THREAD_SIZE,%d1 /* at base of kernel stack */
> movel %d1,%a0
> moveb %a0@(TINFO_FLAGS+3),%d1 /* thread_info->flags (low 8 bits) */
> 
> ^^^^^^
> So the bottom 8 bits are in d1
> 
> jne Lwork_to_do /* still work to do */
> 
> Lreturn:
> RESTORE_USER
> 
> Lwork_to_do:
> movel %a0@(TINFO_FLAGS),%d1 /* get thread_info->flags */
> 
> ^^^^^^^
> Now the whole value is loaded into d1 to do the bit test.. but the
> value needed is already in d1 as we'll be testing bit 7?

Yeah, agreed. The more I look at the ColdFire version the more I think it
may not be totally correct. Its flow here doesn't match the comments from
arch/m68k/include/asm/thread_info.h. The legacy MMU m68k code does appear
to do as the comments say with respect to the TINFO flag bits.

The ColdFire code was forked from the original arch/m68k/kernel/entry.S
a very long time back - there was some differences that needed to be dealt
with.

Anyway what I am looking more closely at is if the higher TINFO flag bits
are actually not being checked at all - so things like single stepping.

Regards
Greg



> move #0x2000,%sr /* enable intrs again */
> btst #TIF_NEED_RESCHED,%d1
> jne reschedule
> 
> 
> Thanks,
> 
> Daniel

