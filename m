Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9543BBE3
	for <linux-m68k@lists.linux-m68k.org>; Tue,  2 Apr 2024 07:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712042311; cv=none; b=izze+94LbjuqxLwzw5UGTpQhvaLgMx+07H3Rm9eudPDEpGR2Kg2PuR+fDbqMgDHN3lJFfRjYwDV5wmwwgqdRm511wEWnSs10nE2ehxmLun5MnX6shWIa+KHyLfj4ssXKxxScEaYLjBnj1hTSoJpY92NMYx7LxH2Un8xHdqmNYtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712042311; c=relaxed/simple;
	bh=Z+zJUqfPOF+jbZ01WAERHLtrTeG63ePwxKaJCB3WiPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A598a/+plPJC6uTlxtKwervWEOr418+bkMePVM9nX9/RUuT9LGkHw2kvfej4XBrEyJQ5v8V9Fzh942Je+W3v567vZOIsuhzZagibEKIxoN7ng5LKDygZspPa15MMF0lgChrQClSrihCJ9VeYS589zpdjS9TNDKxqmV4tFZLiHTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AD0ADCE0F54;
	Tue,  2 Apr 2024 07:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF319C433C7;
	Tue,  2 Apr 2024 07:18:25 +0000 (UTC)
Message-ID: <dd659c33-59ed-4a39-a260-aac45cd5b408@linux-m68k.org>
Date: Tue, 2 Apr 2024 17:18:23 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] m68k: Avoid CONFIG_COLDFIRE switch in uapi header
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>
References: <20240219160126.510498-1-thuth@redhat.com>
 <6f3b246e-7417-4455-abe4-ca3b42fdda4c@linux-m68k.org>
 <4824192b-5573-4246-a47c-ad6249e2900e@app.fastmail.com>
 <c2832612-9a67-4dc1-a8c2-4cc026b14567@redhat.com>
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <c2832612-9a67-4dc1-a8c2-4cc026b14567@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

On 23/2/24 18:13, Thomas Huth wrote:
> On 20/02/2024 16.09, Arnd Bergmann wrote:
>> On Tue, Feb 20, 2024, at 15:13, Greg Ungerer wrote:
>>> On 20/2/24 02:01, Thomas Huth wrote:
>>>> We should not use any CONFIG switches in uapi headers since these
>>>> only work during kernel compilation; they are not defined for
>>>> userspace. Fix it by moving the struct pt_regs to the kernel-internal
>>>> header instead - struct pt_regs does not seem to be required for
>>>> the userspace headers on m68k at all.
>>>>
>>>> Suggested-by: Greg Ungerer <gerg@linux-m68k.org>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>    v2: Move the struct instead of changing the #ifdef
>>>>
>>>>    See previous discussion here:
>>>>    https://lore.kernel.org/lkml/6e3f2a2e-2430-4b4f-9ead-d9a4d5e42713@linux-m68k.org/
>>>
>>> I am fine with this. FWIW the following architectures do
>>> not define pt_regs in their uapi/ptrace.h header either:
>>> arc, arm64, loongarch, nios2, openrisc, riscv, s390, xtensa
>>> Though quite a few of them have a user_pt_regs instead.
>>>
>>> So for me:
>>>
>>> Acked-by: Greg Ungerer <gerg@linux-m68k.org>
>>>
>>> Geert, Arnd, do you have any thoughts on this?
>>
>> It clearly doesn't change the ABI, so that part is fine.
>>
>> If asm/ptrace.h is included by some userspace tool to
>> get the definition, it might cause a compile-time error
>> that needs a trivial source change.
>>
>> This could be needed for ptrace (gdb, strace) or signal
>> handling and setjmp (libc), though it's more likely that these
>> already have their own copies.
> 
> If we still feel unsure, we should maybe rather go with v1:
> 
>   https://lore.kernel.org/lkml/20231110103120.387517-1-thuth@redhat.com/
> 
> ?

We have not had much movement on this.
So... I am confidant that v2 is good, but lets err on the side of caution first up.
I have applied v1 to the m68knommu git tree, for-next branch.

Thanks
Greg


