Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2398619E839
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 11:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777548155; cv=none; b=ejf4kccOBP1gCIqXKxG4QXJVdjMPK7r2y1gIVyny61NnoJpWQyU1Ck9IFo/j28jUUj5ss7o03uvWQNTSdDIKB1M4CncE9j2tcpUPOgxkOf3DyrHLR4rqpmUOgiaNukr24uuVPhXfc42Bt7gAq/Ldl9Te0mzNxk7/fx2STCF23Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777548155; c=relaxed/simple;
	bh=8qMQ72Ed9RdflETlICS/1G+Gfjomo0MmW5SIY8+R4iE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=s2sB4hP1zz+nKSS/BqzewIwow+JyLM10+dNXySZewkiyTIhIKsvhHM/1QOYW9BYNFvjAAKEE+0yPj0qO092agunjnkJKQ3bSrKh9NACRSa2RBl8IuCdqjmdTnv8urUeIxbINdevLXuVyA0yKr8r1se6SdHCndOzSgfsQFtXc1M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 039B560142
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 11:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276EAC2BCB3;
	Thu, 30 Apr 2026 11:22:31 +0000 (UTC)
Message-ID: <476d1913-b9dd-4462-956a-a2f2fe8c9a24@linux-m68k.org>
Date: Thu, 30 Apr 2026 21:22:29 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: m68k: coldfire: create internal register access defines
To: Arnd Bergmann <arnd@kernel.org>, linux-m68k@lists.linux-m68k.org
References: <20260430052047.1827575-1-gerg@linux-m68k.org>
 <18b7cda0-98b5-46fc-8a6b-926138853b6a@app.fastmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <18b7cda0-98b5-46fc-8a6b-926138853b6a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 30/4/26 17:39, Arnd Bergmann wrote:
> On Thu, Apr 30, 2026, at 07:19, Greg Ungerer wrote:
>> The readx/writex family of IO access functions for ColdFire are
>> non-standard. They return native endian data for multi-byte access,
>> which on m68k/ColdFire is big-endian byte order. A number of places
>> need fixing to change readx/writex to be more standard - a lot of
>> the CPU/SoC architecture specific code and a number of drivers.
>>
>> The existing ColdFire CPU/SoC architecture code is inconsistent in
>> how it accesses SoC hardware module registers. Both readx/writex
>> and __raw_readx/__raw_writex are used across the code base. To clean
>> this up this set of patches moves to an internal set of access
>> defines for the CPU/SoC architecture code. The following are defined
>> and used for all internal register access:
>>
>>      8 bit read  -->  mcf_read8
>>      8 bit write -->  mcf_write8
>>     16 bit read  -->  mcf_read16
>>     16 bit write -->  mcf_write16
>>     32 bit read  -->  mcf_read32
>>     32 bit write -->  mcf_write32
>>
>> To ease review I have broken the changes up a little, grouping major
>> blocks together instead of one huge patch.
> 
> These all look good to me,
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Thanks.


> There are still open questions about how to continue from here
> to change the existing readl() and ioread32be() style helpers
> to have normal endianess and type characteristics without
> breaking things, but this is a good step in that direction.

I have been playing with one idea. I have been working through the affected
drivers and changing them to use raw primitives only for their IO access
on ColdFire (so only the __raw_readx/__raw_writex macros). My thinking is
that these can then be pushed via driver subsystem maintainers if and when
they are ready. When all are affected drivers are fixed then we can correct
the definitions in arch/m68k/include/asm/io_no.h. At a later time if we choose
we can then make changes to effected drivers again to use the now corrected
readx/writex family.

At least this way we can keep everything working and avoid a single patch that
makes changes to io_no.h and drivers across multiple subsystems in one go.
What do you think?

So far I have modified the fec and smc91x ethernet drivers in this way.
That was strait forward, though I may get a little resistance in the fec
driver since I abstracted the IO access from readl/writel to local internal
functions to keep it clean and avoid redefining readl/wrtel. But the change
is simple in concept. I am working through the handful of other drivers
that we identified.

Regards
Greg


