Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E7C2114
	for <linux-m68k@vger.kernel.org>; Thu,  5 Jun 2025 06:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749106258; cv=none; b=P4jNrvxG13pc3XtOHdAJngWS6dXy/DSE59/1EPTRMqVgh7wE2wckdsUfpaMyg0XLB8mUVsM1UNCrRoTZeXdgQLJQbowyyRQj96UQ+OtHBrb8CznlgVytp3Z/vYI/nYS1DwlMc6ZcpIzEOsJg802qpVAmOs8pX//3x0Epc7SE1xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749106258; c=relaxed/simple;
	bh=CuVnF7mckI4BUBhy9jITqFMgDvLpiknhNM4pp7FQDUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WVRON1m2ZBr1MMeafefPo2aino6mTLawYnBoIejcOv1KUtTJzV0VLVdChJjsnOihna7O5ZEcuksViIbuVUwWddcyUsP5clZkdgVNCnLCTYW9jddBjAV+M6wWYU3Qn/CpCaq3jT2BAWeR/aXNjwkvH+kO5at/aDGqSqA2nLf077s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=pass smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=BRCkWW3I; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="BRCkWW3I"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8548343A11;
	Thu,  5 Jun 2025 06:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1749106253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dRgzUpGFoEjRO3HTmN+HNCO6Dp1QP2JSaqzUAiT8NCg=;
	b=BRCkWW3I+U8uj6xJvvjtAwXvtpZsWfJJ16PzCrZujxzvqA8AjmsmVKWOhn0zfavw6w7qAz
	xdQDfllPz0VrZ8S4o59R+vrpI3KoHeL1ZmXchTNEiJ3rUsGZ8KNFgJTvA1zVu1t0e+6qy2
	HwcDz8aAKe+uUWXD6utyfNG6R0vQ48xa5iIrlXOrXjDLbVL3iskyAXnhYja5xqJxiouwBx
	7kpyh9oqqcDWY9dZZphMh8fbbE2FY1lwz497Md+jhMi9j1R+mN6xICmYfbxoJWDfk2NfGE
	BPWLvFeQFz/GezXmmekSQBbUhl+2drDF/4pvX4M1jedUevXv59iDUkXMyL/3lA==
Message-ID: <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
Date: Thu, 5 Jun 2025 08:50:53 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 port-m68k <port-m68k@netbsd.org>
Cc: debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdefvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheplfgvrghnqdfoihgthhgvlhcujfgruhhtsghoihhsuceojhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgqeenucggtffrrghtthgvrhhnpeehuefgfedujeeiieeuffduleefgeevjeehvdefgeeghfffleekheejkefhgeffjeenucfkphepledurdduieehrdduieehrdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledurdduieehrdduieehrdduleejpdhhvghloheplgduledvrdduieekrddurdejgegnpdhmrghilhhfrhhomhepjhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepghhlrghusghithiisehphhihshhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtohepphhorhhtqdhmieekkhesnhgvthgsshgurdhorhhgpdhrtghpthhtohepuggvsghirghnqdeikehksehlihhsthhsrdguvggsihgrnhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghrrdhkvghrnhgvl
 hdrohhrgh
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Adrian,

On 05/06/2025 08:39, John Paul Adrian Glaubitz wrote:
> Hi Jean-Michel,
> 
> On Thu, 2025-06-05 at 08:24 +0200, Jean-Michel Hautbois wrote:
>> I tried to patch gcc-13 with this BIGGEST_ALIGNMENT set to 64. I am
>> using buildroot+uclibc-ng on a Coldfire (mcf54418).
> 
> Thanks a lot for testing! Such contributions are highly appreciated.
> 
>> Everything build fine, except the kernel:
>>
>> In function ‘siginfo_build_tests’,
>>       inlined from ‘restore_sigcontext’ at arch/m68k/kernel/signal.c:684:2,
>>       inlined from ‘do_sigreturn’ at arch/m68k/kernel/signal.c:775:9:
>> ././include/linux/compiler_types.h:542:45: error: call to
>> ‘__compiletime_assert_351’ declared with attribute error: BUILD_BUG_ON
>> failed: offsetof(siginfo_t, si_lower) != 0x12
>>     542 |         _compiletime_assert(condition, msg,
>> __compiletime_assert_, __COUNTER__)
>>         |                                             ^
>> ././include/linux/compiler_types.h:523:25: note: in definition of macro
>> ‘__compiletime_assert’
>>     523 |                         prefix ## suffix();
>>           \
>>         |                         ^~~~~~
>> ././include/linux/compiler_types.h:542:9: note: in expansion of macro
>> ‘_compiletime_assert’
>>     542 |         _compiletime_assert(condition, msg,
>> __compiletime_assert_, __COUNTER__)
>>         |         ^~~~~~~~~~~~~~~~~~~
>> ./include/linux/build_bug.h:39:37: note: in expansion of macro
>> ‘compiletime_assert’
>>      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond),
>> msg)
>>         |                                     ^~~~~~~~~~~~~~~~~~
>> ./include/linux/build_bug.h:50:9: note: in expansion of macro
>> ‘BUILD_BUG_ON_MSG’
>>      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: "
>> #condition)
>>         |         ^~~~~~~~~~~~~~~~
>> arch/m68k/kernel/signal.c:621:9: note: in expansion of macro ‘BUILD_BUG_ON’
>>     621 |         BUILD_BUG_ON(offsetof(siginfo_t, si_lower) != 0x12);
>>         |         ^~~~~~~~~~~~
>> make[5]: *** [scripts/Makefile.build:207: arch/m68k/kernel/signal.o] Error 1
>> make[4]: *** [scripts/Makefile.build:465: arch/m68k/kernel] Error 2
>> make[4]: *** Waiting for unfinished jobs....
>>
>> This is a 6.14.
>> Any idea about this ?
> 
> It looks like this check needs to be patched:
> 
> 	BUILD_BUG_ON(offsetof(siginfo_t, si_lower) != 0x12);
> 
> The source code in arch/m68k/kernel/signal.c contains a lot of hard-wired offsets
> which will probably have to be adjusted.
> 
> You can try changing 0x12 to 0x14 and see if that fixes it.

I had to change three offsets:
diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
index e628b859ef21..5b8ef98565c2 100644
--- a/arch/m68k/kernel/signal.c
+++ b/arch/m68k/kernel/signal.c
@@ -618,11 +618,11 @@ static inline void siginfo_build_tests(void)
         BUILD_BUG_ON(offsetof(siginfo_t, si_addr_lsb) != 0x10);

         /* _sigfault._addr_bnd */
-       BUILD_BUG_ON(offsetof(siginfo_t, si_lower) != 0x12);
-       BUILD_BUG_ON(offsetof(siginfo_t, si_upper) != 0x16);
+       BUILD_BUG_ON(offsetof(siginfo_t, si_lower) != 0x14);
+       BUILD_BUG_ON(offsetof(siginfo_t, si_upper) != 0x18);

         /* _sigfault._addr_pkey */
-       BUILD_BUG_ON(offsetof(siginfo_t, si_pkey) != 0x12);
+       BUILD_BUG_ON(offsetof(siginfo_t, si_pkey) != 0x14);

         /* _sigfault._perf */
         BUILD_BUG_ON(offsetof(siginfo_t, si_perf_data) != 0x10);
-- 
2.39.5

The kernel is booting, so, I suppose it is working :-).
Now, I can't send a patch fixing the offsets like that, as it depends on 
the BIGGEST_ALIGNMENT value...

Thanks,
JM
