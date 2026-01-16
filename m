Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66636307AE9
	for <linux-m68k@lists.linux-m68k.org>; Fri, 16 Jan 2026 11:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768561427; cv=none; b=r60ifSc+zf/+xZg6eCSQaKl/fk0ocgKqvBCxwmaHhIx370Ku97UdcMCr/8Aj5XmpvZP4bmxt93TJTNoKpOSXxbres9wQXX0YWZCiMaayotqi7AFnEkhAJzkSEl22O1wcc+q7vR6c2lmvS5r/85ZKa2FBA3uCPeqAgEzkDs7ECpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768561427; c=relaxed/simple;
	bh=KT7sSpPOVFq1dLJRYLfBJmzOQvCC3qG5DvqQjKnk6RY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=IyctjMFR11PiiYMuzaCDU3z0wtIbJjQD/OoYIZ/jC5DBgl2ENhnf6o7gw7BH5in1LWihSOPMvd+ZwBhTMmTUgU+tIfnNmj1gtv9iSyiltdoAq0H8L0TuJm3tO2OFQXjiO+Y967C8MXIvjh9bHS6LPyHaoIqUUGntw7vcwBDAXw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A681160160;
	Fri, 16 Jan 2026 11:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 645A2C116C6;
	Fri, 16 Jan 2026 11:03:39 +0000 (UTC)
Message-ID: <5c2730c2-d969-44af-85f9-4d57c0ad387d@linux-m68k.org>
Date: Fri, 16 Jan 2026 21:03:26 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: nommu: fix memmove() with differently aligned src
 and dest for 68000
From: Greg Ungerer <gerg@linux-m68k.org>
To: Daniel Palmer <daniel@thingy.jp>, geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <20251213120401.3992567-1-daniel@thingy.jp>
 <d36788e2-52be-42b1-bb99-e2a18f99f7ce@linux-m68k.org>
Content-Language: en-US
In-Reply-To: <d36788e2-52be-42b1-bb99-e2a18f99f7ce@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Daniel,

I'll add this to the m68knommu git tree, for-next branch.

Thanks
Greg



On 19/12/25 21:58, Greg Ungerer wrote:
> Hi Daniel,
> 
> On 13/12/25 22:04, Daniel Palmer wrote:
>> 68000 has different alignment needs to 68020+.
>> memcpy() checks if the destination is aligned and does a smaller copy
>> to fix the alignment and then critically for 68000 it checks if the
>> source is still unaligned and if it is reverts to smaller copies.
>>
>> memmove() does not currently do the second part and malfunctions if
>> one of the pointers is aligned and the other isn't.
> 
> What is the nature of the failure, is it a trap?
> 
> 
>> This is apparently getting triggered by printk. If I put breakpoints
>> into the new checks added by this commit the first hit looks like this:
>>
>> memmove (n=205, src=0x2f3971 <printk_shared_pbufs+205>, dest=0x2f3980 <printk_shared_pbufs+220>) at arch/m68k/lib/memmove.c:82
>>
>> Signed-off-by: Daniel Palmer <daniel@thingy.jp>
> 
> Seems to make sense from what we have in memcpy.c.
> 
> Acked-by: Greg Ungerer <gerg@linux-m68k.org>
> 
> Geert: if you are ok with this I can take it via the m68knommu tree?
> 
> Regards
> Greg
> 
> 
> 
>> ---
>>
>> This is from my "make 68000 work again" backlog.
>>
>> I have had this fix for years and I think the few other people that
>> have various 68000 hobby builds must have something similar.
>>
>> /root # uname -a
>> uClinux buildroot 6.18.0-12420-gdc1a468a2724 #120 Sat Dec 13 20:42:45 JST 2025 m68k GNU/Linux
>> /root # cat /proc/cpuinfo
>> CPU:            68000
>> MMU:            none
>> FPU:            none
>> Clocking:       1179.1MHz
>> BogoMips:       1758.00
>> Calibration:    879001600 loops
>> /root #
>>
>>   arch/m68k/lib/memmove.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/m68k/lib/memmove.c b/arch/m68k/lib/memmove.c
>> index 6519f7f349f6..e33f00b02e4c 100644
>> --- a/arch/m68k/lib/memmove.c
>> +++ b/arch/m68k/lib/memmove.c
>> @@ -24,6 +24,15 @@ void *memmove(void *dest, const void *src, size_t n)
>>               src = csrc;
>>               n--;
>>           }
>> +#if defined(CONFIG_M68000)
>> +        if ((long)src & 1) {
>> +            char *cdest = dest;
>> +            const char *csrc = src;
>> +            for (; n; n--)
>> +                *cdest++ = *csrc++;
>> +            return xdest;
>> +        }
>> +#endif
>>           if (n > 2 && (long)dest & 2) {
>>               short *sdest = dest;
>>               const short *ssrc = src;
>> @@ -66,6 +75,15 @@ void *memmove(void *dest, const void *src, size_t n)
>>               src = csrc;
>>               n--;
>>           }
>> +#if defined(CONFIG_M68000)
>> +        if ((long)src & 1) {
>> +            char *cdest = dest;
>> +            const char *csrc = src;
>> +            for (; n; n--)
>> +                *--cdest = *--csrc;
>> +            return xdest;
>> +        }
>> +#endif
>>           if (n > 2 && (long)dest & 2) {
>>               short *sdest = dest;
>>               const short *ssrc = src;
> 

