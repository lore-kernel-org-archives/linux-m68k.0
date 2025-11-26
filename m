Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACBF3233EE
	for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Nov 2025 11:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764156780; cv=none; b=Vol1iucAS/3zfgw9ApUKSy75LY0rLM1mltK7+2nxkHY45WpZqKGxHvYOJ7+/JRp5wNjv5BVcA9rJPL1gvonsBLr1/j2VUsMDkKhlCnwHrkbik+J8rKPKpg+ETD8uFZHDeO/XMIFJ+fY1Ecwwzi//kgepVjxiy2GyuRIni5C9c6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764156780; c=relaxed/simple;
	bh=qn5Z1g0gkgsNk6LVbQCdS0GUcSxzvUQ5WoXhDcN4fq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fz9rTnWqAAs4zy5FiPa5dkv1mt5N1NvMe81jGkMBG9wMN9FlIgmWlKlh6dj4NsyvYmN/43cRTic9ln1wzL/P9Hww1ayn1CRijLailYETy1AUvWQTxJf/Qc4u5OYcDKPh6qzy6PUeO42A12Siifpu2nPuKzTp66GdUTeKGREeJXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A7987601DE;
	Wed, 26 Nov 2025 11:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FB3C113D0;
	Wed, 26 Nov 2025 11:32:53 +0000 (UTC)
Message-ID: <7d85ed0e-c551-44d4-9d4f-ec72d9da5c45@linux-m68k.org>
Date: Wed, 26 Nov 2025 21:32:49 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] m68k: coldfire: Mark platform device resource
 arrays as const
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, oe-kbuild-all@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20251124-b4-m5441x-add-rng-support-v3-1-f447251dad27@yoseli.org>
 <202511250103.RMNoU3xH-lkp@intel.com>
 <aSVgcoNNeLJshwvU@yoseli-yocto.yoseli.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <aSVgcoNNeLJshwvU@yoseli-yocto.yoseli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jean-Michel,

On 25/11/25 17:53, Jean-Michel Hautbois wrote:
> On Tue, Nov 25, 2025 at 01:48:24AM +0800, kernel test robot wrote:
>> Hi Jean-Michel,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Jean-Michel-Hautbois/m68k-coldfire-Mark-platform-device-resource-arrays-as-const/20251124-210737
>> base:   ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
>> patch link:    https://lore.kernel.org/r/20251124-b4-m5441x-add-rng-support-v3-1-f447251dad27%40yoseli.org
>> patch subject: [PATCH v3 1/3] m68k: coldfire: Mark platform device resource arrays as const
>> config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251125/202511250103.RMNoU3xH-lkp@intel.com/config)
>> compiler: m68k-linux-gcc (GCC) 15.1.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250103.RMNoU3xH-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202511250103.RMNoU3xH-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> arch/m68k/coldfire/device.c:141:35: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>>       141 |         .resource               = mcf_fec0_resources,
>>           |                                   ^~~~~~~~~~~~~~~~~~
>>
>>
>> vim +/const +141 arch/m68k/coldfire/device.c
> 
> Frank, I mentionned this warning in v2, do you have a suggestion ?

FWIW, I looked at other similar use cases - that is platform drivers specifying
constant resources like this - and it seems they mostly do not use const for
them. There is quite a few cases throughout superh and arm architecture code.

Regards
Greg



> Thanks !
> JM
> 
>>
>> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  136
>> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  137  static struct platform_device mcf_fec0 = {
>> bea8bcb12da09b arch/m68k/platform/coldfire/device.c Steven King       2012-06-06  138  	.name			= FEC_NAME,
>> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  139  	.id			= 0,
>> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  140  	.num_resources		= ARRAY_SIZE(mcf_fec0_resources),
>> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24 @141  	.resource		= mcf_fec0_resources,
>> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  142  	.dev = {
>> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  143  		.dma_mask		= &mcf_fec0.dev.coherent_dma_mask,
>> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  144  		.coherent_dma_mask	= DMA_BIT_MASK(32),
>> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  145  		.platform_data		= FEC_PDATA,
>> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  146  	}
>> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  147  };
>> 63a24cf8cc330e arch/m68k/coldfire/device.c          Antonio Quartulli 2024-10-29  148  #endif /* MCFFEC_BASE0 */
>> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  149
>>
>> -- 
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki

