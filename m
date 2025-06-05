Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799FE2566
	for <linux-m68k@vger.kernel.org>; Thu,  5 Jun 2025 06:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749104658; cv=none; b=ctz7sDAACseHlMYxLTNexesbwNhcudwc/2KDhXDqsutmoZPj3Co9ncE4WBzz1ou24Iu5aSXggc6dcnuP8FJsr8TBg9gD+R/azCfHsTHhaKRz9BbPa32fiUznQ7BmwS64Se0b6gV7zDw0Ka5UaEkt7CVnZ6b1WUHyX+rEOc7agOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749104658; c=relaxed/simple;
	bh=a2nTQMVt7GfxdoF0soifLOcFp0kddrQJv+8PAzd4beE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=He/bQLBsXnTRikLDSO+OK5c58iyw2bYKtE3Y7tw+7cMZrTFvFG4/aDjYsp/dNQt5ROltgDqXWkaD/yjsFj9cH2BmbZSL0DVxDKw0MKXGBH1M8i3zfBnbb3d5tuKLPneR7KI9A7MxLWaxLBHnZM/EDTgTlzQGyddOOoFrfytbQ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=pass smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=EZaaAHGj; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="EZaaAHGj"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D04E3439C2;
	Thu,  5 Jun 2025 06:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1749104653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XNX6U6MBYdSwJFYn/GncVjvlBumCu3B2muhOIksb1hc=;
	b=EZaaAHGjmFfrhCnK39aPbQO0fGQhGvenlCpdQ/cAgttK0z6XmntR09ryVhp9doTaizaVsX
	/SaaCh3Ct1N1Ck+f6Z5mxwE5VpNI80HwthHLg2/ipe4J8Sa38I8GzBUFycathohRbMd9JS
	HkVtLB9zTXDyNI/r/D/ymtKaexd+jwfCRlhSCquRKEvpqEpIJR3eN9zaX5KJ62xs+ci4bg
	LauyriP+q8ojmMg9qMOEZM/MNQnmh+ZKWyU3gMTuSMNE7dXCxc7roLT1PgU+qAbIzXez7M
	eXZrS2qumGzNwtlhtGhZGDXWg6cRZkoT7SgSgtMJbO5ziqcYvm5vUqaGe07nUw==
Message-ID: <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
Date: Thu, 5 Jun 2025 08:24:11 +0200
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
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdefvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheplfgvrghnqdfoihgthhgvlhcujfgruhhtsghoihhsuceojhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgqeenucggtffrrghtthgvrhhnpeehuefgfedujeeiieeuffduleefgeevjeehvdefgeeghfffleekheejkefhgeffjeenucfkphepledurdduieehrdduieehrdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledurdduieehrdduieehrdduleejpdhhvghloheplgduledvrdduieekrddurdejgegnpdhmrghilhhfrhhomhepjhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepghhlrghusghithiisehphhihshhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtohepphhorhhtqdhmieekkhesnhgvthgsshgurdhorhhgpdhrtghpthhtohepuggvsghirghnqdeikehksehlihhsthhsrdguvggsihgrnhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghrrdhkvghrnhgvl
 hdrohhrgh
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Adrian,

On 26/05/2025 17:05, John Paul Adrian Glaubitz wrote:
> Hi,
> 
> I'm currently testing enabling 4 bytes alignment and first started looking into
> what NetBSD does (gcc/config/m68k/linux.h in the GCC source). Surprisingly, this
> is set to 64 and not 32 bits for the largest possible alignment.
> 
> The explanation is as follows:
> 
> /* No data type wants to be aligned rounder than this.
>     For m68k/SVR4, some types (doubles for example) are aligned on 8 byte
>     boundaries */
> 
> #undef BIGGEST_ALIGNMENT
> #define BIGGEST_ALIGNMENT 64
> 
> BIGGEST_ALIGNMENT is what's being toggled with the -malign-int option
> in gcc/config/m68k/m68k.h:
> 
> /* No data type wants to be aligned rounder than this.
>     Most published ABIs say that ints should be aligned on 16-bit
>     boundaries, but CPUs with 32-bit busses get better performance
>     aligned on 32-bit boundaries.  */
> #define BIGGEST_ALIGNMENT (TARGET_ALIGN_INT ? 32 : 16)
> 
> In order to test GCC on Linux/m68k with 32-bit alignment, I just copied
> the definitions from netbsd-elf.h into linux.h above which eventually
> failed with:
> 
> free(): invalid pointer
> during GIMPLE pass: slp
> ../../../../../src/libstdc++-v3/src/c++17/floating_from_chars.cc: In function 'std::from_chars_result std::from_chars(const char*, const char*, double&, chars_format)':
> ../../../../../src/libstdc++-v3/src/c++17/floating_from_chars.cc:1243:1: internal compiler error: Aborted
> 
> Now I'm wondering whether why some types on NetBSD such as double have 8 bytes
> alignment on a 32-bit system. Does anyone know the reasoning for that?
> 
> And does libstdc++ have an additional codepath on NetBSD to deal with the
> largest possible alignment to be 8 bytes so that the error above does not
> occur?
> 
> Or could it just be a result of the ABI mismatch because glibc needs to be
> patched as well?

I tried to patch gcc-13 with this BIGGEST_ALIGNMENT set to 64. I am 
using buildroot+uclibc-ng on a Coldfire (mcf54418).

Everything build fine, except the kernel:

In function ‘siginfo_build_tests’,
     inlined from ‘restore_sigcontext’ at arch/m68k/kernel/signal.c:684:2,
     inlined from ‘do_sigreturn’ at arch/m68k/kernel/signal.c:775:9:
././include/linux/compiler_types.h:542:45: error: call to 
‘__compiletime_assert_351’ declared with attribute error: BUILD_BUG_ON 
failed: offsetof(siginfo_t, si_lower) != 0x12
   542 |         _compiletime_assert(condition, msg, 
__compiletime_assert_, __COUNTER__)
       |                                             ^
././include/linux/compiler_types.h:523:25: note: in definition of macro 
‘__compiletime_assert’
   523 |                         prefix ## suffix(); 
         \
       |                         ^~~~~~
././include/linux/compiler_types.h:542:9: note: in expansion of macro 
‘_compiletime_assert’
   542 |         _compiletime_assert(condition, msg, 
__compiletime_assert_, __COUNTER__)
       |         ^~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:39:37: note: in expansion of macro 
‘compiletime_assert’
    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), 
msg)
       |                                     ^~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:50:9: note: in expansion of macro 
‘BUILD_BUG_ON_MSG’
    50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " 
#condition)
       |         ^~~~~~~~~~~~~~~~
arch/m68k/kernel/signal.c:621:9: note: in expansion of macro ‘BUILD_BUG_ON’
   621 |         BUILD_BUG_ON(offsetof(siginfo_t, si_lower) != 0x12);
       |         ^~~~~~~~~~~~
make[5]: *** [scripts/Makefile.build:207: arch/m68k/kernel/signal.o] Error 1
make[4]: *** [scripts/Makefile.build:465: arch/m68k/kernel] Error 2
make[4]: *** Waiting for unfinished jobs....

This is a 6.14.
Any idea about this ?

Thanks,
JM
