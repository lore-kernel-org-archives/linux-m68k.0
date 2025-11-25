Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B923016F7
	for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Nov 2025 18:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764095138; cv=none; b=T3eajU5UF/tQl0spwzjeS1oLPUBRgcQcLeFB33reECMFUyF1qMODNa26vbm4+jwBO7kmyUeZ4PD3ANU4d/l1bd065nj18LaFVmSr6X8wHVWYBn8DT6PEAtgeb9klXhA4O8svihd4oU3Am8glP7P0DS9EcMrsOQGXDZ19GSBwqQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764095138; c=relaxed/simple;
	bh=4BWYIXM7gMUADX+WYXcQ/AiGeBV9gP9uOMI0BEVzLZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgYhmox4lzr8JoNGduO/J+GOh5WudzXuaWWSkXXVdAZpOmU6uxb/0lpu2a+9GNWcHF49273Y1elLh2XVd3PMqmJr0kcWpUGqWZovG2Naqgin4/J9vptXwwnOpoabosqOzspgwxi3+xltbeB4FuEmfU5vpLZ/ilDpe2wYhwr/BXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=pass smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=KneGVY3P; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="KneGVY3P"
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 55DCD58A8D0
	for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Nov 2025 07:53:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B4CF43AA6;
	Tue, 25 Nov 2025 07:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1764057207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iqRqCK4rs9Q1IMwj7iTmtoWcpWNcNdp7HNUySR+q5Z4=;
	b=KneGVY3Puoqf0Rvj9nDxDabG/UNWWRnzfAtjo+uVfGfzImpELfAFw6tFC8p6BOOCnnz8mO
	ULbM7eE6kCknKDnWQEOKEHIGHns7L6sxMxmGipNHcg/nmDUNOkhHeHUoHbyt+Grp3iLNbx
	Z0GOE7lpy9D3qoyCeCOG+Pyt1KAScshhNRCZwGEj/ExC3rE29R88WPMAGRpwta74c2loFz
	pUnC8XMIr1B4grD3uZZ1+ROXUOSvIuBKy++EatIFv78PLtO+bLc7JfPTDBSD6qykRNo+YV
	XrWDoCiXEW4V5kMge+qCqlnxMiToyIJH3iANoNUtpcCJM3wd93arEF+nXH8AtQ==
Date: Tue, 25 Nov 2025 08:53:22 +0100
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, oe-kbuild-all@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] m68k: coldfire: Mark platform device resource
 arrays as const
Message-ID: <aSVgcoNNeLJshwvU@yoseli-yocto.yoseli.org>
References: <20251124-b4-m5441x-add-rng-support-v3-1-f447251dad27@yoseli.org>
 <202511250103.RMNoU3xH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511250103.RMNoU3xH-lkp@intel.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgedtledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpeflvggrnhdqofhitghhvghlucfjrghuthgsohhishcuoehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgheqnecuggftrfgrthhtvghrnhepudfhuedvtdetgfefveekvddvjeehfeeffffhleeludejleefudefkefhudfhuddunecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgpddtuddrohhrghenucfkphepvdgrtddumegvtdgrmeduieelmeejudegtdemkegvtdgumeekrgguudemvggvvgelmeelhegsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmeduieelmeejudegtdemkegvtdgumeekrgguudemvggvvgelmeelhegspdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdpnhgspghrtghpthhtohepudehpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtohepghgvrhhgsehlihhnuhigqdhmieekkhdrohhrg
 hdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopeholhhivhhirgesshgvlhgvnhhitgdrtghomhdprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

On Tue, Nov 25, 2025 at 01:48:24AM +0800, kernel test robot wrote:
> Hi Jean-Michel,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Jean-Michel-Hautbois/m68k-coldfire-Mark-platform-device-resource-arrays-as-const/20251124-210737
> base:   ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
> patch link:    https://lore.kernel.org/r/20251124-b4-m5441x-add-rng-support-v3-1-f447251dad27%40yoseli.org
> patch subject: [PATCH v3 1/3] m68k: coldfire: Mark platform device resource arrays as const
> config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251125/202511250103.RMNoU3xH-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250103.RMNoU3xH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511250103.RMNoU3xH-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> arch/m68k/coldfire/device.c:141:35: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>      141 |         .resource               = mcf_fec0_resources,
>          |                                   ^~~~~~~~~~~~~~~~~~
> 
> 
> vim +/const +141 arch/m68k/coldfire/device.c

Frank, I mentionned this warning in v2, do you have a suggestion ?

Thanks !
JM

> 
> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  136  
> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  137  static struct platform_device mcf_fec0 = {
> bea8bcb12da09b arch/m68k/platform/coldfire/device.c Steven King       2012-06-06  138  	.name			= FEC_NAME,
> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  139  	.id			= 0,
> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  140  	.num_resources		= ARRAY_SIZE(mcf_fec0_resources),
> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24 @141  	.resource		= mcf_fec0_resources,
> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  142  	.dev = {
> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  143  		.dma_mask		= &mcf_fec0.dev.coherent_dma_mask,
> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  144  		.coherent_dma_mask	= DMA_BIT_MASK(32),
> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  145  		.platform_data		= FEC_PDATA,
> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  146  	}
> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  147  };
> 63a24cf8cc330e arch/m68k/coldfire/device.c          Antonio Quartulli 2024-10-29  148  #endif /* MCFFEC_BASE0 */
> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  149  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
