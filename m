Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042ED23505B
	for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Jun 2025 07:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749627557; cv=none; b=tCh+mL4CXwH0vOgzEneWkJW5Tmw1i//2BX148fQ6PmOfAHR/WOAe1PpI/Ejye1EwEXtseaqE7I/JqDkbQEEeJrJlrG7qNk+rq5hqHCJ9W+JVi6r/XwAATv3i5W1aOdaeNJ5fbvMcXaUWA2Se7x8gq7lpWzcxILWWeDM4uTlC9R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749627557; c=relaxed/simple;
	bh=V1OQ2chymJXxPZQAsJHT5N4Qh9kOnoWNeonjn8SC8ic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a5TH8mFJLGpHT2rUCPPnYuI+Bbhbly3ezW9IyPofbfq0p2r9i+k2TFASspHl3kldtf58SLknDEG3EHTguaYVy1azTH00p5ABucg8YFW4TwkNMawP1T5SRSio16IoCAwVMHLUshihGLBjRvkbTgXrGGZx1rSCgaTv81Y36sjuY9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KiTzxyRf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KiTzxyRf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749627556; x=1781163556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V1OQ2chymJXxPZQAsJHT5N4Qh9kOnoWNeonjn8SC8ic=;
  b=KiTzxyRf7h9A15uy41ODxQCrKiq+VkDi2cLYqmmKW/D7gn6+rc196Tov
   LshALUcyIG7U7us4CPSGRpXcHyNPtuZ/Fj8fmfLIqkIv1qvxLmdvatIY2
   /S4XBfkXYtoUzchv969P1/ss+w3QnmVHtQ0JP+6wskmJwleHTyIFjDyrk
   Oa/LpL5OAIr2RG9gUIuvcKPojnPLWXrt2m9HFiGsPgSC+0rG1Bb0IIPby
   Puh/sNq0wNM8gVsf1S1gZdE2vvIYcVIICiBczPMn91dpvnCU3O8bKAXsq
   EYleB399O4x3AiI8k8pdJ8voFTar1gDTbmP5mCrWPAqoC5e0RE6bwqEaP
   w==;
X-CSE-ConnectionGUID: 5DD6jPJCQoGb66pyNS045w==
X-CSE-MsgGUID: mcRS2N78RReHWE7FNFAzxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="77165950"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="77165950"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 00:39:14 -0700
X-CSE-ConnectionGUID: mAlBKfFeQC+BYfbajPRBIw==
X-CSE-MsgGUID: bRfK5qTGTfiP+Qqg6fvnpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="184268137"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Jun 2025 00:39:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPG3C-000A8u-1x;
	Wed, 11 Jun 2025 07:39:10 +0000
Date: Wed, 11 Jun 2025 15:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 1/14] drivers/tty/serial/mcf.c:586 mcf_probe()
 warn: unsigned 'port->irq' is never less than zero.
Message-ID: <202506111514.txSKxqO9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   a227d3c7914f7e7059bba92fc8a99e4be11b0abf
commit: b2003b0b32e6f27f160e4ace887dcab10e266999 [1/14] serial: mcf: convert to use proper platform resources
config: m68k-randconfig-r071-20250611 (https://download.01.org/0day-ci/archive/20250611/202506111514.txSKxqO9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506111514.txSKxqO9-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/mcf.c:586 mcf_probe() warn: unsigned 'port->irq' is never less than zero.

Old smatch warnings:
arch/m68k/include/asm/io_no.h:50 __cf_internalio() warn: always true condition '(addr <= 3758096384 + 536870912 - 1) => (0-u32max <= u32max)'

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
