Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B29F2F7F02
	for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Jun 2026 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782425753; cv=none; b=h0UrQaD5qITZCMjfJJM8/xh4jnlPxRPPt/XbMakUKCfNEB1UOZjQYF+YtNNoqTnlySI9hNJpH+9q42t1SimV/k6zKpt5TgQot1NOE9zWOMmrGLtq1KM+NnhnvMXwVsqdpaWxz1kNkCB5osfZGrA6vGbwnbWHBHuFqFNaMzzY7XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782425753; c=relaxed/simple;
	bh=gDxW/SjKUUq+rjJG9W40OLKuF1SD7j9+bM1j7XQBoig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IrGNIWSJmsfW42zuUDiolHGZX3xbqs9RF8UID9s4IEtCz4MQZlVSbweM8bVqcPc+QmGhrf+L61U/li6ZwC9dF55AAb029W9ExURUTPTlN68g9luPFZo6Xa0hOTsmFZPOR/NnPtZiGXo7Bs2hDYmV03yZBa+kaNB5ri/1hdGHCEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C440540888;
	Thu, 25 Jun 2026 22:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25AFF1F000E9;
	Thu, 25 Jun 2026 22:15:47 +0000 (UTC)
Message-ID: <5dd8cf26-533f-4a32-8885-3eaad7c57ed6@linux-m68k.org>
Date: Fri, 26 Jun 2026 08:15:42 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mtd: maps: remove uclinux map driver
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>
References: <20260526103227.3152003-1-arnd@kernel.org>
 <20260526103227.3152003-2-arnd@kernel.org>
 <b55ac37f-4523-46d0-8e77-3a17d7235ffe@westnet.com.au>
 <f3e984cd-0614-48d1-b03f-e0670b87e282@app.fastmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <f3e984cd-0614-48d1-b03f-e0670b87e282@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 26/6/26 00:10, Arnd Bergmann wrote:
> On Thu, Jun 25, 2026, at 14:07, Greg Ungerer wrote:
>> On 26/5/26 20:32, Arnd Bergmann wrote:
>>
>> It is used on some ColdFire platforms, and was working all the way up
>> to being removed in the current merge window.
>>
>> The ColdFire platform startup code (arch/m68k/coldfire/head.S) has a
>> somewhat unusual setup that can copy an attached filesystem blob to
>> _bss_stop, and this is one of the places the uclinux.c map driver can
>> use as the filesystem memory address. From uclinux.c
>>
>>       static int __init uclinux_mtd_init(void)
>>       {
>>           struct mtd_info *mtd;
>>           struct map_info *mapp;
>>
>>           mapp = &uclinux_ram_map;
>>
>>           if (physaddr == -1)
>>                   mapp->phys = (resource_size_t)__bss_stop;
>>           else
>>                   mapp->phys = physaddr;
>>
>> No out of tree code is required. Most of the ColdFire defconfigs have
>> CONFIG_MTD_UCLINUX enabled, since it is commonly used.
> 
> I see, this is surprising from reading the source and
> git history, but I can see exactly how it got there.

The early, and probably more interesting history, predates git.
It has always "just worked" on ColdFire platforms, so it really hasn't
needed alot of change over the years for this use case.


> So this is not actually a device but rather a replacement
> for CONFIG_BLK_DEV_INITRD that does can work with CONFIG_BLOCK=y,
> right?

Yes, that is true. Typical use means adding "root=/dev/mtdblock0" to
kernel boot arguments.


>> Can we get this reverted?
> 
> Yes, of course. Miquel/Richard/Vignesh, should I send a revert or
> can you just apply one with Greg's explanation and my Ack?

Thanks
Greg

