Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B413CF03F
	for <linux-m68k@lists.linux-m68k.org>; Wed, 15 Apr 2026 13:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261151; cv=none; b=AB3JTHAVXfA6Lr1q5ip0YMKDsHbEP2JPEKIAvso3UQumCpFzbA0Bd6ED+dc/inCS0Z+WFm/96TjOlvoam5bJSGhbRug5qM9ElZULzm691MJqWVCyEuB/En1ibNGczKMvQvGuy7hFl2cOaRq8NbGb1yko8yvX+3ywk3/CqhwzYc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261151; c=relaxed/simple;
	bh=p3Zg8v3oezdHZzuUCBSbYPc+6DH07gyew07cGOO6ys8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XnM+4ZEKBgIMvXoTUoANZjmGzK7gX7WG9KMn8CJ1Oxn15/nLTJy1CVPwoBc5e6jr7QACF0cZhaTK9Br8kMhzu4Y836rZtjaDT2o6lSzbKBsz/QDqXFv1al7Xr6r48XIdNDgwzp/UdYGyxudjtBoLDq/sTVNAm00oWKz7l4M0jnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A8F0600AE;
	Wed, 15 Apr 2026 13:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC21C19424;
	Wed, 15 Apr 2026 13:52:26 +0000 (UTC)
Message-ID: <25448303-a816-429d-851b-d827fc8f26fb@linux-m68k.org>
Date: Wed, 15 Apr 2026 23:52:09 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] m68k: nommu: Fix behaviour of io macros on non-CF
To: Arnd Bergmann <arnd@kernel.org>, Daniel Palmer <daniel@0x0f.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, christoph.plattner@gmx.at,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <20260404024658.2496519-1-daniel@0x0f.com>
 <ec4945ec-84fd-4462-b35d-79a04673107d@linux-m68k.org>
 <CAFr9PXnfh6p_ajGSGX-MnKgToEdAW-3rPgOLKgaDXziKXNGfFQ@mail.gmail.com>
 <0ca82015-820d-4002-a65d-0888804db3cc@app.fastmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <0ca82015-820d-4002-a65d-0888804db3cc@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 14/4/26 23:24, Arnd Bergmann wrote:
> On Tue, Apr 14, 2026, at 14:55, Daniel Palmer wrote:
>>
>> On Tue, 14 Apr 2026 at 21:18, Greg Ungerer <gerg@linux-m68k.org> wrote:
>>> This change, in this form at least, breaks most of the non-MMU ColdFire targets.
>>> Try compiling any of m5208evb, m5249evb, m5272c3, m5275evb, m5307c3 or
>>> m5407c3 defconfigs and you get build failures. Targets that do not have
>>> a PCI bus and so do not define IOMEMBASE will fail, which is most of them.
> 
> Indeed, I had assumed that coldfire just uses the regular semantics
> here since it has PCI support, but I see now that it actually relies
> on both the big-endian access and on passing a physical address as
> an integer instead of an '__iomem' pointer into writel(), which
> is something we should probably fix.

Yeah, it feels like a real kludge.


>> Oof, that's the second time I broke coldfire this week (I broke it
>> trying to make virtio work for m68k in u-boot too).
>> Your patch works for my mc68000 virt and dragonball builds. I will
>> build/boot test nommu CF in QEMU.
> 
> Right, this is hopefully fine as a quick fix.
> 
> In order to have coldfire behave more like other targets
> (now including 68000/68328), I would suggest removing the
> custom readl/writel helpers for coldfire as well, and changing
> the few callers to something else. A new set of helpers that
> takes a phys_addr_t would work, or possibly just using
> the existing __raw_readl()/__raw_writel() or
> ioread32be()/iowrite32be() where appropriate, see the patch
> below for the arch/m68k portion of that.

I like the idea of a specific set if internal register read/write helpers.
I would like to move in that direction.


> There are other coldfire specific drivers (fec, spi, ...)
> that would need a similar change.

Right, and this is really the work that needs to be done first before
we will be able to remove the io_no.h specific readl/write code.
This is what I see:

Drivers that are used on ColdFire targets that use some of
readb/readw/readl and writeb/writew/writel:

     drivers/net/ethernet/freescale/fec*
     drivers/net/ethernet/smsc/smc9x.[hc]
     drivers/net/ethernet/davicom/dm9000.c
     drivers/spi/spi-coldfire-qspi.c

Obviously spi-coldfire-qspi.c is ColdFire specific, so easy to change
and not affect anything else. The FEC ethernet driver is widely used on
ARM and ColdFire, though the change to a register reading helper looks
pretty strait forward but will be a largish patch. Changing the smc91x
driver looks easy enough, the ColdFire multi-byte access macros in the
header are specific to ColdFire. Need to give some thought to changes
to the dm9000 driver.

Drivers that are used on ColdFire that use only 8-bit readb and writeb:

     drivers/tty/serial/mcf.c
     drivers/i2c/busses/i2c-imx.c

We could ignore these for now I guess, since readb and writeb will always
work the same. Though it might be nice to clean them up with proper helpers.
mcf.c is only used on ColdFire so won't affect anything else.

Drivers that are used on ColdFire that use iowrite32/iowrite32be:

     drivers/net/can/flexcan/flexcan-core.c

Although this driver has support for differentiating big and little endian
access I think for ColdFire it is relying on the kludgy overrides in io_no.h
to actually work right. So will need a fix too.

Did I miss any?

Regards
Greg


