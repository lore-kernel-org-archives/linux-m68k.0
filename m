Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557B64772B1
	for <linux-m68k@lists.linux-m68k.org>; Fri, 11 Sep 2026 13:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131846; cv=none; b=EhPvNg+vSXcB+SIe2bxk7DqlmCYT3I2PD6cedd1y/o9mRdlcFFBRBKsB0ztr9ukkk8VGbldcXHoER6KKnWCwcsSZc0uJQq8iBYW4pZ7+I9j1cXi2qVbXwG0JFsvLA5ni8cC6j8J5aF6NJG60IiRG29y8ScSl6hCHPGMb/kyfVTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131846; c=relaxed/simple;
	bh=crelH9CKz5xACPL/P0w+99JDuKyVYM00a9c1QE+DN+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jOCvvrx4rJD0e1Osiy9xIqdWMqZGJnwR71ZX8h6M7zkteNMmZla141W3MzSqFrgTEM+EPt4KtHMcuf98I2tgp6UrnO9PsRMF0jJGIkPXuNZAmeAMoU26pRwRxl79ATC2UtZ3yETrpFDkd0POcDgX7rq4ScFOXOCAWrIBVZXGAGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 64BA641819;
	Fri, 11 Sep 2026 13:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A30EA1F000FF;
	Fri, 11 Sep 2026 13:03:59 +0000 (UTC)
Message-ID: <92ef814f-c207-44c1-9b7b-575980e29525@linux-m68k.org>
Date: Fri, 11 Sep 2026 23:03:56 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 1/3] net: fec: do not use readl()/writel() for ColdFire
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 arnd@kernel.org, wei.fang@nxp.com, frank.li@nxp.com, shenwei.wang@nxp.com,
 imx@lists.linux.dev, netdev@vger.kernel.org, nico@fluxnic.net,
 linux-can@vger.kernel.org, linux-spi@vger.kernel.org, olteanv@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, Andrew Lunn <andrew@lunn.ch>
References: <20260907134037.1855408-1-gerg@linux-m68k.org>
 <20260907134037.1855408-2-gerg@linux-m68k.org>
 <20260910174210.0f8a4ad2@kernel.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260910174210.0f8a4ad2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jakub,

On 11/9/26 10:42, Jakub Kicinski wrote:
> On Mon,  7 Sep 2026 23:37:09 +1000 Greg Ungerer wrote:
>> The FEC driver works today because the m68k architecture io.h has a
>> kludge in the definitions of the readl() and writel() functions for
>> ColdFire that allow big-endian access if the address of the register to
>> access is within the SoC's internal peripheral registers. This is being
>> fixed in the near future to define readl() and writel() correctly - with
>> no byte swapping. Thus the motivation for this fix here.
> 
> What is the motivation for this cleanup?

Sorry, maybe you were not in the CC list of the cover email. From that:

  This collection of patches is aimed at fixing the non-standard ColdFire
  set of readX()/writeX() IO access functions. Instead switching to using the
  asm-generic definitions in include/asm-generic/io.h. The difficulty comes
  in trying not to break any drivers with this change.

  The implementation of the readX()/writeX() family of IO access functions
  is non-standard on ColdFire platforms. They either return big-endian (that
  is native endian) data, or on platforms with PCI bus support check the
  supplied address and return either big or little endian data based on that
  check. This is non-standard, they are expected to always return
  little-endian byte ordered data. Unfortunately this behavior also means
  that ioreadX()/iowroteX() and their big-endian counter parts
  ioreadXbe()/iowriteXbe() are currently broken because they are implemented
  using the readX()/writeX() functions.

  Patches 1 and 2 in this series are specific net driver changes that can be
  applied independently of the final ColdFire readX()/writeX() change.


> Is someone still making
> new SKUs of Coldfire boards? Or (and please don't take this the wrong
> way) it was a long standing TODO that was tempting to feed to an LLM?

It is a long standing todo/fix, but there is nothing LLM anywhere here.
This was all manually coded and tested. This patch is 95% textual
substitution, so it wasn't exactly very difficult.


> IMO keeping the hacks in m68k is a better choice. FEC was used on more
> modern SoCs, definitely on PPC ones. So we'll be able to get rid of
> m68k before we can get rid of FEC. Sprinkling m68k workarounds in 
> the FEC driver is backwards.

These changes are not work arounds, they are made to make the FEC driver
explicitly aware of endianess of the underlying processor and FEC hardware
block. The code as it is now, that is carrying hacks inside readX and writeX
for m68k, is trying to hide that from the driver.

Regards
Greg



