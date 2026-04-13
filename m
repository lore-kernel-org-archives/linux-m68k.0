Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFDE3CF034
	for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Apr 2026 13:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776087974; cv=none; b=Uar+IvWph0BFVgM5oULLcB2/SCqXkRqnLmPFitcwK4pNdcngv1KmZwX1Hbstdlu0sUP3gEmzgro7HBIxeVRsVTrHxxFejExV//JRHWKWeylU88qXGs2/Yrfv7C8ouWJADjWA7o3KoC37mnZnaBPftI1GuHo1TwG/WJR1tAiAvzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776087974; c=relaxed/simple;
	bh=oJltz7AJrAszH5NkylMptNLavhPpBeWeTGj56+4UuNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8GmSd0j/O4UpeMWVbWBn0r8YwZ7HaNgl7PVUlItqqgNw5iVtNCXbedcrTXLt7rDPTf2I5bthHh3WvX722XermbFi7c0fboIRRvIasW4+ZeDk60CK4jI9M8OLnW9kNombx/NFCvgdZKJj2oBSig5vXxkfHUDMw1YU/aJfvm/6s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1c4yYbX; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1c4yYbX"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0E7F60180;
	Mon, 13 Apr 2026 13:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1BFC2BCAF;
	Mon, 13 Apr 2026 13:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776087971;
	bh=oJltz7AJrAszH5NkylMptNLavhPpBeWeTGj56+4UuNQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W1c4yYbXInfelp0eUQAv9gO8+XT0Sbrv81Gm0Adb5EvlP79aa60vW1qyaRs6863hq
	 ywlFwnEXs2N+Csj1t8AT44QeeKBJG/F49Idi2q4rc2RmYot0SX7HMiTlvtWvn/yDH+
	 7trrgahjvxasFZ1G1mSZHuMwpN/FLXdUKO5A3DE4xduSAFmVqypbzmuyI1rt6S5Skg
	 mnVOocE28OqrI3sV0A1xJA4AMsFJUmV+SiC9+WzESG+evlqCHSH4Q/iOf94U+BkWPk
	 AcZh4PrKZrOg/knioNZ+bkeabHdk27YLf4Gl2MWAVIr2/8lUMYASANuBHtyTuYAsV9
	 CyYJUfeUbdazw==
Message-ID: <ed8cf7e9-4271-48ab-a410-d7c0e2832020@kernel.org>
Date: Mon, 13 Apr 2026 15:45:59 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 14/38] slub: Use prandom instead of get_cycles()
Content-Language: en-US
To: hu.shengming@zte.com.cn, harry@kernel.org
Cc: tglx@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 arnd@arndb.de, x86@kernel.org, baolu.lu@linux.intel.com,
 iommu@lists.linux.dev, m.grzeschik@pengutronix.de, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, dwmw2@infradead.org, bernie@plugable.com,
 linux-fbdev@vger.kernel.org, tytso@mit.edu, linux-ext4@vger.kernel.org,
 akpm@linux-foundation.org, urezki@gmail.com, elver@google.com,
 dvyukov@google.com, kasan-dev@googlegroups.com, ryabinin.a.a@gmail.com,
 t.sailer@alumni.ethz.ch, linux-hams@vger.kernel.org, Jason@zx2c4.com,
 richard.henderson@linaro.org, linux-alpha@vger.kernel.org,
 linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, chenhuacai@kernel.org, loongarch@lists.linux.dev,
 geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, dinguyen@kernel.org,
 jonas@southpole.se, linux-openrisc@vger.kernel.org, deller@gmx.de,
 linux-parisc@vger.kernel.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, pjw@kernel.org,
 linux-riscv@lists.infradead.org, hca@linux.ibm.com,
 linux-s390@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org,
 hao.li@linux.dev, cl@gentwo.org, rientjes@google.com,
 roman.gushchin@linux.dev
References: <20260413210252672ZfdcegJLJtyvlYdFAUBlr@zte.com.cn>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <20260413210252672ZfdcegJLJtyvlYdFAUBlr@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/13/26 15:02, hu.shengming@zte.com.cn wrote:
> Harry wrote:
>> [Resending after fixing broken email headers]
>> 
>> On Fri, Apr 10, 2026 at 02:19:37PM +0200, Thomas Gleixner wrote:
>> > The decision whether to scan remote nodes is based on a 'random' number
>> > retrieved via get_cycles(). get_cycles() is about to be removed.
>> > 
>> > There is already prandom state in the code, so use that instead.
>> > 
>> > Signed-off-by: Thomas Gleixner <tglx@kernel.org>
>> > Cc: Vlastimil Babka <vbabka@kernel.org>
>> > Cc: linux-mm@kvack.org
>> > ---
>> 
>> Acked-by: Harry Yoo (Oracle) <harry@kernel.org>
>> 
>> Is this for this merge window?

I'd say it's not intended for 7.1 as it's not in -next and v1 was posted
just before the merge window.

>> This may conflict with upcoming changes on freelist shuffling [1]
>> (not queued for slab/for-next yet though), but it should be easy to
>> resolve.

Indeed, it's a simple conflict.

> 
> Hi Harry,
> 
> Would you like me to wait for this patch to land linux-next and then
> rebase and send v6 on top?

Just send it now based same as previously so we can finish the reviews, and
we'll deal with it after rc1.

