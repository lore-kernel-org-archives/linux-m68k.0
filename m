Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021689;
	b=zeJZ5drnzis9i81blwLleqcCroyD7D55gdNzReVuCVYQk7XYpVrcOzEpfYdHlSyd6xDY
	 42Wx69vKuksdqcwbibcs6hjuvLqH34gAX+cxo9uwA4JKJ11bHzricK0RyVcrOkpcYf3XW
	 rFAhklAhwyCbAV5nmsEKhLC7F+c0b3YdR6kDy3H/LHPxAz/Is36mvdCsLGA7ycSJ0hZps
	 P3fsND9uX3dY+Ublsp8ymvVeJ4SFStqOvfKsC06D4yZEgXzxW0/HT8K62F9E7iQMdGKAA
	 htb37bacX+RTsaYaLCx/y6sikLcipc2I3zutiIaeo1W26GRgE7OicREpKQi0fQph/+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021689;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5qdZ509piUO/S/uiKnDFmYOHN2q1I1q9DQIkaG3h59c=;
	b=zxXcYa/AvFKX/eGnyrnZ8COPVoKoG39NyYlq/djbMvGyHjE1+1GCuvocbDLRVz/AP91y
	 byTClwEEmG3+6P8l1nbfy627nAw531fRTgFvQtOICsWMQc8hJgt4ulcyfFI2EJU+g6ioV
	 pdt2i4mwOank61uza6poWo1w6HzvdVGfdCyGZ+DmQI/6qJnZ1X3ZIJ/Gu3WrsITYXjgqI
	 oCKy9R1Yr80bnE6vIfPp2gNw/QqJ8Rx2esEV8qEy3Gc3+6MbgXVQLcv0x6UD1JWL1y2x2
	 o0m0dWyVwHvyn7ZxKepD2MfFP8YbM6gxRy4hZW21te1+cpyUhilT9Td2fRWAIJLOiMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mu+rQwTc;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EEA606A31C
	for <linux-m68k@lists.linux-m68k.org>; Wed, 18 Nov 2026 17:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85EEA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mu+rQwTc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795021689; x=1826557689;
  h=date:from:to:cc:subject:message-id;
  bh=Fxl024xaDYL+sNQZ3+7ANf8tZrhLY9A1oBdwHG7chtg=;
  b=mu+rQwTcTZkKy9LR42aL3kVZaeiYERz+BCHpjpfsOYJUNPesPr1AQxgC
   1A6e46Cmbo0KoVp5p2VS9kasCHv68pLrm4CZ56C2Z6iu55XXIg+F/rPaq
   FSGNmwYWQD79zm9JWg9/NLl9/Rxp4sA7JqLDnNUcuptqO2ivBvZiUI/PA
   73pfiehxN6tD9YXDpUxp7snMvuhgQvrmBVJF0S3zE8ErRcAMF2bG29aRS
   6rhbxC7sEl4tjLusjFwEfyX71GWBx1cBXjRz7TOevvaqFQDSx9aAT0wc2
   2SPoxz7K4aEA57HRmNxxnDFyVmNQKg1s11dv9XpSxYcaPruZalIuI2xVn
   w==;
X-CSE-ConnectionGUID: sqiACIugRiC5CQeFSD8iVw==
X-CSE-MsgGUID: DzFVy/U6RYyQP8mGf6DRcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3724758"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3724758"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 09:08:08 -0800
X-CSE-ConnectionGUID: nlj89pvNSiaOe25t7znl2Q==
X-CSE-MsgGUID: eUiMOmXxRxqfZNYBahvUaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12140047"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 18 Nov 2026 09:08:06 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTj8e-000000003Qu-1yrc;
	Wed, 18 Nov 2026 17:08:04 +0000
Date: Wed, 18 Nov 2026 18:07:24 +0100
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:cf-serial 1/4]
 drivers/tty/serial/mcf.c:586:25: sparse: sparse: unsigned value that used to
 be signed checked against zero?
Message-ID: <20261118180432.L0Epe9wF-lkp@intel.com>
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
config: m68k-randconfig-r2310-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118180432.L0Epe9wF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118180432.L0Epe9wF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261118180432.L0Epe9wF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/tty/serial/mcf.c:513:30: sparse: sparse: Using plain integer as NULL pointer
>> drivers/tty/serial/mcf.c:586:25: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/tty/serial/mcf.c:585:37: sparse: signed value source

vim +586 drivers/tty/serial/mcf.c

   501	
   502	static int __init mcf_console_setup(struct console *co, char *options)
   503	{
   504		struct uart_port *port;
   505		int baud = CONFIG_SERIAL_MCF_BAUDRATE;
   506		int bits = 8;
   507		int parity = 'n';
   508		int flow = 'n';
   509	
   510		if ((co->index < 0) || (co->index >= MCF_MAXPORTS))
   511			co->index = 0;
   512		port = &mcf_ports[co->index].port;
 > 513		if (port->membase == 0)
   514			return -ENODEV;
   515	
   516		if (options)
   517			uart_parse_options(options, &baud, &parity, &bits, &flow);
   518	
   519		return uart_set_options(port, co, baud, parity, bits, flow);
   520	}
   521	
   522	/****************************************************************************/
   523	
   524	static struct uart_driver mcf_driver;
   525	
   526	static struct console mcf_console = {
   527		.name		= "ttyS",
   528		.write		= mcf_console_write,
   529		.device		= uart_console_device,
   530		.setup		= mcf_console_setup,
   531		.flags		= CON_PRINTBUFFER,
   532		.index		= -1,
   533		.data		= &mcf_driver,
   534	};
   535	
   536	static int __init mcf_console_init(void)
   537	{
   538		register_console(&mcf_console);
   539		return 0;
   540	}
   541	
   542	console_initcall(mcf_console_init);
   543	
   544	#define	MCF_CONSOLE	&mcf_console
   545	
   546	/****************************************************************************/
   547	#else
   548	/****************************************************************************/
   549	
   550	#define	MCF_CONSOLE	NULL
   551	
   552	/****************************************************************************/
   553	#endif /* CONFIG_SERIAL_MCF_CONSOLE */
   554	/****************************************************************************/
   555	
   556	/*
   557	 *	Define the mcf UART driver structure.
   558	 */
   559	static struct uart_driver mcf_driver = {
   560		.owner		= THIS_MODULE,
   561		.driver_name	= "mcf",
   562		.dev_name	= "ttyS",
   563		.major		= TTY_MAJOR,
   564		.minor		= 64,
   565		.nr		= MCF_MAXPORTS,
   566		.cons		= MCF_CONSOLE,
   567	};
   568	
   569	/****************************************************************************/
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
