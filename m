Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233080;
	b=fYAlIhKz3FkaZwDvaIFDNjG0IJlzhEmj9ZgrnzR5sUcI8RGRRGa7aCDNVck+F3k0U02t
	 SNj/g2gA+mYlfrFQElJMqiIUlVwoLzI/mjDn4awiGq9n2plpWUNjGDisJ+pzGfBX/mCRi
	 uIYagWivD5em3eRne8BmoX/qb1EdqpR+cAkwivtrpAaYvEXXT6oIfoeqpknxtkjKA8EuB
	 +VXo4VwFTOPhYl7iHShN1ilsQqdH2hG1pKR6wHzrNm5nYBee7HKt433wLKHvab6a2Wj5V
	 AcKiko04P+HPNkFOSaNlBvcRUE5G5ZOyrfoCbYasPcjExnfhnltxXBNIenu3/5J+r+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233080;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jVich8nvMx7lDX/pvruqVV2kTjm69QuzoBabY2+rHJM=;
	b=AUIvm1sNUeUMEg1V1ZC+U1sqqzodmb0Y6ioybAbLRqzlQuwfKigaAQMXvBudzpz6vtPK
	 X2Yg3hce0aNcgHMOZb8ogoYZezkofhSEltzDCphnSY82dsYkIPHCDerywLL7dBsfGAXz0
	 d9eSPQPZnMZYPAPOsU7DSM6XgSO7bB117fXYMhR+SCof6wJvCRQo7ar6dt91Z8MrRm+oN
	 jwIW7d2pMNmXkH6apS8EA1O7YuGZjiWr4CSnhNLnXhQEtaB8cT3x2P3CjsaoHCoe0rrRq
	 98MxSgMly6m85G9uARyQV3Tpebau7IULWz2bj0ZuZusxk/v/JuKQAOfPw8qi0KtwALA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dZ5s8tEn;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94AA606A31C
	for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Nov 2026 14:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C94AA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dZ5s8tEn
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 881AE40C27;
	Mon,  9 Nov 2026 14:04:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E7B1F0089F;
	Mon,  9 Nov 2026 14:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794233079;
	bh=jVich8nvMx7lDX/pvruqVV2kTjm69QuzoBabY2+rHJM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dZ5s8tEnCgkuCLHe+AvywXX9fW5er432fE+hmxcoFDxYSHquXibvyFXJr0HhTu9mF
	 4QwK5+xM7VcwmJHm57PdFgBD2B6we8ooMUXjiECMKfp3miAjqB2dGJQ85D0lrF2W73
	 BVdCrPfmMAhxOj8HZ6D0aZDvDiVX4Vvc7O/VQYV5M51wgVphwJPlc0j3N97zSSXeWh
	 J70K2BmPVXxWZ8W6uCFLEnmTBW8/1QQ86Y1sm08JygPoGON0OUdoifusd7BpxxwrF4
	 zfR3Upx2a3JvDlQ7m7+DvOseZuSCgYltHiqYyFIT/aQ2/TLqF1/omtYplSjvqnaC3E
	 pL9rVav96wRxg==
Message-ID: <763bd31e-789a-4cf5-9e84-d57a375d2d93@kernel.org>
Date: Mon, 9 Nov 2026 15:04:33 +0100
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mm/memory: use pmdp_get_lockless() for the pmd read in
 do_fault_around()
To: Greg Ungerer <gerg@linux-m68k.org>, Hui Zhu <hui.zhu@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Sam Creasey <sammy@sammy.net>
Cc: Hui Zhu <zhuhui@kylinos.cn>, stable+noautosel@kernel.org,
 linux-m68k@lists.linux-m68k.org
References: <20261104091050.117076-1-hui.zhu@linux.dev>
 <dec26f4a-138a-4cd7-b000-4bda7c61af82@kernel.org>
 <88a6bf17-2189-44a8-8255-50b7ee1d80f2@linux.dev>
 <e6ed4165-03fd-4204-b25a-bafc37c3930c@polyxeno.com>
 <f03d8a2f-7803-4503-9485-54a9ddcaf332@linux.dev>
 <6f01317a-1536-4747-ba11-23e27461a694@linux-m68k.org>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <6f01317a-1536-4747-ba11-23e27461a694@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/9/26 15:02, Greg Ungerer wrote:
> Hi Hui,
> 
> On 9/11/26 15:50, Hui Zhu wrote:
>> 2026/11/6 20:08, Greg Ungerer:
>>
>> Hi Greg,
>>
>>> Hi Hui,
>>>
>>> The m5475evb_defconfig is supposed to have MMU enabled:
>>>
>>>       $ ARCH=m68k CROSS_COMPILE=m68k-linux-uclibc- make m5475evb_defconfig
>>>         HOSTCC  scripts/basic/fixdep
>>>         [snip]
>>>         HOSTLD  scripts/kconfig/conf
>>>       #
>>>       # configuration written to .config
>>>       #
>>>       $
>>>       $ grep CONFIG_MMU .config
>>>       CONFIG_MMU=y
>>>       CONFIG_MMU_COLDFIRE=y
>>>       CONFIG_MMU_GATHER_NO_RANGE=y
>>>       CONFIG_MMU_GATHER_MERGE_VMAS=y
>>>       CONFIG_MMU_LAZY_TLB_REFCOUNT=y
>>>
>>> But something ends up disabling it when you compile.
>>> I'll fix this.
>>>
>>>
>>> You should not be able to set MMU=y if configured for the M5208.
>>> It doesn't have an MMU. You want the 5475, 5485 or 54418 to test
>>> valid MMU=y configurations.
>>>
>>> Regards
>>> Greg
>>>
>>>
>>>
>>
>> You are right on both counts, and that mail of mine had three things
>> wrong.
>>
>> 1. "No m52xx/m54xx defconfig enables CONFIG_MMU" - wrong.  I grepped the
>> defconfig fragments for CONFIG_MMU=y, but MMU is 'default y', so an
>> enabled MMU never appears in the fragment.  m5475evb and m54418evb
>> both give CONFIG_MMU=y, as you show.
>>
>> 2. My "m5208evb + CONFIG_MMU=y" test config was not a valid config.
>> M520x is 'depends on !MMU', so forcing MMU on leaves the SoC choice
>> unsatisfiable and olddefconfig silently drops it:
>>
>> before:  # CONFIG_MMU is not set / CONFIG_M520x=y
>> after:   CONFIG_MMU=y / CONFIG_MMU_COLDFIRE=y / CONFIG_M520x gone
>>
>> Please disregard the m5208evb row in my codegen numbers.
>>
>> 3. The "red herring" I flagged was my own doing, not a pre-existing
>> problem.  mm/Makefile has 'mmu-$(CONFIG_MMU) := ... memory.o', so a
>> NOMMU config never builds mm/memory.o at all; I asked for a target
>> that config does not have.  Sorry for the noise on that one.
>>
>> Retested with the configs you named (7.4-rc1 plus the do_fault_around
>> change plus David's cleanup, gcc-m68k-linux-gnu 13.3.0):
>>
>> m5475evb_defconfig   without David's patch: mm/memory.o fails at
>> mcf_pgtable.h:134 with it: full -j24 build ok, vmlinux 4215344
>> bytes, 0 warnings
>>
>> m54418evb_defconfig  without David's patch: same mcf_pgtable.h:134
>> failure
>>
>> So the Tested-by I sent covers amiga, sun3 and m5475evb.  It is
>> build-tested only - I have no m68k hardware here to boot.
> 
> Thanks for retesting. Looks good.
> 
> 
>> On MMU being disabled when you compile: I cannot reproduce that. Here
>> m5475evb_defconfig gives CONFIG_MMU=y, olddefconfig reports no change,
>> two consecutive defconfig runs produce an identical .config, and a full
>> build finishes with CONFIG_MMU=y and CONFIG_M547x=y still set and
>> .config untouched.  Two differences from your setup that might matter:
>> I am on a glibc toolchain rather than uclibc, and building out of tree
>> with O= rather than in tree.
> 
> I can't reproduce either now. I must have done something silly when
> quickly double checking that config. Multiple configures and builds
> and I think it is all doing the right things at configuration and build.
> 
> 
>> One observation, which may well be unrelated.  m5475evb_defconfig never
>> sets CONFIG_M547x - it only ends up with it because the "ColdFire SoC
>> type" choice defaults to M520x, which is unavailable under MMU=y, so
>> kconfig falls back to the first usable member. m54418evb_defconfig sets
>> CONFIG_M5441x=y explicitly.  If that fallback is what breaks on your
>> side, making m5475evb explicit would sidestep it.
> 
> FWIW, running "make savedefconfig" on a fully built m5475evb configuration
> results in an identical defconfig to arch/m68k/configs/m5475evb_defconfig.
> 
> Anyway, I applied both changes and tested on real hardware. All seems to
> work fine. So for ColdFire:
> 
>     Tested-by: Greg Ungerer <gerg@linux-m68k.org>

Thanks!

-- 
Cheers,

David
