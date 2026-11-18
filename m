Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794971304;
	b=DnTn4gSH6kX0QkEgEkx/wXk4af0/LA1O07K46oduygj683WwaN4w+xQCY1m/iHXttm11
	 F1cAAyuUrTtyKjEx8k9SkBTVSES2Igrtgo8GVVJxCj2+QOMQdo92HYQe4qJiVqZMHsDhT
	 HDs34Ac6pcHE62VmYKgCgnDnAkcHekuqRZQc4IvaZG33GRfqEqRvWT/shM5HTeOZVdNgT
	 xEbDkrip4L+Ep/6+rmFCmB3WOZnTeWWK0ARIJb+O7bRl0FP1rB/VRWyFgN0PD8P5K6YJU
	 mQxeqftgSvs3hMwBZYgVb3BrdCwT5fOWgUwHc8VKDKjhmKNCuyou0Xu1KGyfIt5rjhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971304;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AU3qt+EL/+CSZxwUvF61zs7wOL+rwjAYzL7U5imcl84=;
	b=NExDphtoMgTCwcd2Nmwofzn/+gwq2TTJ8ULBaageCa+iq9edHc3HcI4NEGmRHdOsFLxR
	 rRC7MxI9tp9w3G4BzekpGvuQ7ysBHKVTPDwTwUIMG7Sy27RRDD14VoRTOqBLqKFxIgugG
	 y4fFb80MzWocJRWdvszLlfaJLgs7JyScqF61YGCfBEodm9SbsHfTvvVSrJYvuXlsYPELB
	 0TiU9HhG3Ma7pXYvWyPexe6BhF3Acx7GovlV2J4Sd7yngFXLvwXXEXpk3xROFbJ92ejF2
	 kejKbcKmI+/S//V5eUkvFbZ93/4sQ3wlRkFdtD2yOlC2sSACKCz/I6RAKB8YRVM/tug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fz0pzUr5;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D737606A325
	for <linux-m68k@lists.linux-m68k.org>; Wed, 18 Nov 2026 03:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D737606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fz0pzUr5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794971303; x=1826507303;
  h=date:from:to:cc:subject:message-id;
  bh=5NcY/NjGbmg6ZzLYwiwEzfhjWn5EUpb+vT9IxncB3wo=;
  b=Fz0pzUr5LipPP65VLkJzRj/0sANQSwPwuFfQYZ2GR2cr/Dhqxe1D6iI9
   8TWDAPGbf8tST8yegDwX+u8QrurDDoqP/6fv93eehX0huX/S4voRYXtuq
   ffoyL/+ux3M+VBr1LO+0+x6DCH2NWfBOTvttfMxwWgp6I84Z1cXKsCDXa
   SOd+/nviY63H++K51GkmQbjuxD8V03yEFsfFqV4z6If4K15jUd/V/tam/
   QGi2zlxCIUyOltMMB0CmFxVv/STmzSoKS7oo5QKcNlDwIKBdjQsaw3QnX
   7BJMVmd4oPqhp+mVFS1uK4AWWLOyrN9pfLqew3EI843ogfucuqKMRxdmA
   Q==;
X-CSE-ConnectionGUID: C1spkBITRXCRyWtTCpjcSg==
X-CSE-MsgGUID: 21GEm3m7Ty6sNW7t3Afsgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3844317"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3844317"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 19:08:23 -0800
X-CSE-ConnectionGUID: VJzecCxMQmmT3mC0LV7xoQ==
X-CSE-MsgGUID: 3E3tDQnOTtO0164YMINAKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9995972"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 17 Nov 2026 19:08:21 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTW1w-000000003JU-38xQ;
	Wed, 18 Nov 2026 03:08:16 +0000
Date: Wed, 18 Nov 2026 04:07:29 +0100
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:cf-serial 1/4] drivers/tty/serial/mcf.c:586
 mcf_probe() warn: unsigned 'port->irq' is never less than zero.
Message-ID: <20261118040014.eslSkj4U-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git cf-serial
head:   13e7fc3bb9e0e6b9de008260d6925af530c79882
commit: 93cb854f633956fd1e5df8744a9e27695b2e8cd8 [1/4] serial: mcf: convert to use proper platform resources
config: m68k-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118040014.eslSkj4U-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261118040014.eslSkj4U-lkp@intel.com/

smatch warnings:
drivers/tty/serial/mcf.c:586 mcf_probe() warn: unsigned 'port->irq' is never less than zero.

vim +586 drivers/tty/serial/mcf.c

   570	
   571	static int mcf_probe(struct platform_device *pdev)
   572	{
   573		struct uart_port *port;
   574		struct resource *res;
   575	
   576		if (pdev->id >= MCF_MAXPORTS)
   577			return -ENODEV;
   578		port = &mcf_ports[pdev->id].port;
   579	
   580		port->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
   581		if (IS_ERR(port->membase))
   582			return PTR_ERR(port->membase);
   583		port->mapbase = res->start;
   584	
   585		port->irq = platform_get_irq(pdev, 0);
 > 586		if (port->irq < 0)
   587			return port->irq;
   588	
   589		port->line = pdev->id;
   590		port->type = PORT_MCF;
   591		port->dev = &pdev->dev;
   592		port->iotype = SERIAL_IO_MEM;
   593		port->uartclk = MCF_BUSCLK;
   594		port->ops = &mcf_uart_ops;
   595		port->flags = UPF_BOOT_AUTOCONF;
   596		port->rs485_config = mcf_config_rs485;
   597		port->rs485_supported = mcf_rs485_supported;
   598		port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_MCF_CONSOLE);
   599	
   600		uart_add_one_port(&mcf_driver, port);
   601		return 0;
   602	}
   603	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
