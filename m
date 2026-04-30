Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0659837B03F
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 10:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777545736; cv=none; b=th+fr7CdV2y2AmNww9ktolqg0gviJENtIrDkEmBV7RzHO5VVoFQ1RLJCHzNm4iXRV/co0InvgCOqHVJk5eavI41nTcbCe5abavsdf/P1M5+IG/0knDbhq8H9e3oKTEI87HV5Uo9gwKinaUimais2NplLSKxnHyELK1sgNn0cDpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777545736; c=relaxed/simple;
	bh=se6CaQEg5P9h/Of+cF00Dej9Vq8Xx6D+viwDM/HA4Wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AhaddQp4U28NbFipM1lsBdhXviD4Whtyn4mPspfNObT3TG7i2QYKqZfOja0EE8D9N6fQCNDBTsayy6+ZvCvzbihagrtvghK6/6j4n7tBhkhTIxYg12ViW0LWV9Wj6p/nfJGV4Y43E746lw2QKytJKpNigZaFKhD+M9Mqvq+59c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9ACE4408DC;
	Thu, 30 Apr 2026 10:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1633C2BCB3;
	Thu, 30 Apr 2026 10:42:13 +0000 (UTC)
Message-ID: <85975a4a-e0f9-4925-821b-194776236d9e@linux-m68k.org>
Date: Thu, 30 Apr 2026 20:42:10 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] m68k: defconfig: add config for M5329EVB board
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@kernel.org>
References: <20260429142452.1200856-1-gerg@linux-m68k.org>
 <20260429142452.1200856-2-gerg@linux-m68k.org>
 <CAMuHMdW25fL+SHCH=kK3dRHCoa0HWDWa4EMBfGsH9NWWS7psPQ@mail.gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <CAMuHMdW25fL+SHCH=kK3dRHCoa0HWDWa4EMBfGsH9NWWS7psPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,

On 30/4/26 17:04, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Wed, 29 Apr 2026 at 16:27, Greg Ungerer <gerg@linux-m68k.org> wrote:
>> From: Greg Ungerer <gerg@kernel.org>
>>
>> Add a default configuration file for the Freescale M5329EVB board.
>> Although the SoC type has been supported for a long time there has been
>> no defconfig for the base platform. Create one to give better build
>> and test coverage.
>>
>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> 
> Thanks for your patch!
> 
>> --- /dev/null
>> +++ b/arch/m68k/configs/m5329evb_defconfig
> 
> [...]
> 
>> +CONFIG_FB=y
>> +CONFIG_FRAMEBUFFER_CONSOLE=y
>> +CONFIG_LOGO=y
>> +CONFIG_LOGO_LINUX_MONO=y
>> +CONFIG_LOGO_LINUX_VGA16=y
> 
> [...]
> 
>> +CONFIG_FONTS=y
>> +CONFIG_FONT_8x8=y
>> +CONFIG_FONT_8x16=y
>> +CONFIG_FONT_MINI_4x6=y
> 
> Given you don't enable any fbdev drivers, there is no point in
> enabling CONFIG_FB and derivatives...

The original config this came from had an out of tree fb driver for this device.
So I left these on when importing this. But really probably nothing gained
by leaving them enabled. Will remove.


>> +CONFIG_FRAME_WARN=1024
> 
> Better stick to the default?

Sure, yep.

Regards
Greg


