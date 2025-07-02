Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C858211F
	for <linux-m68k@lists.linux-m68k.org>; Wed,  2 Jul 2025 13:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464045; cv=none; b=o3GD9regfNBKJ9g0WtKkJBHZ1dvPKACPJS5SnekOL15+MUc7WHSzNGrQ3/8HtctrkKNGdP1hcTAXud69Dhhgw7/xTP0RKDkggwJg042cXX9gSgZDuMEgNYZB+tHf9G8zXzUq3CLWnBPvjJw+QxtFDh23PM91+tTTJRJEnYuVLpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464045; c=relaxed/simple;
	bh=Ayqu69UDY3McTqgeU4i2nBkQtoHzZXEAk6ruxSHzWFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EK15KA7NJCYPlxemfzyCPnbPuSRe/kazRKh8qoVj6JKx0iOwe7A+JoNTrZrqJsV4Zg/r5MyirZwxuOACLX+ERpc1SFKs4xPOVYQGWqAfbCT+8xzNSVY28VCWoKi2H1TSude03eEPRxp3Tv+p+JrJO85uehMEfLbtejd+ityZrCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=noEeFU7t; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="noEeFU7t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751464044; x=1783000044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ayqu69UDY3McTqgeU4i2nBkQtoHzZXEAk6ruxSHzWFU=;
  b=noEeFU7tQEkA4fT/WDR+N6ZML/yBLVARAgcgDt2Za7Z8oUEYCnld62ia
   nHWAx+AX+vdALZNHrduZaX5ev8PLtSkulAZD7ojonoU0iKHyiZTvK4FoY
   CmiHFXPS7nrc2gnSq0TDDmiENWAlnL39lxJF5N2g1SDg4EXcfeCbmwoDV
   EvP9Qt/FJd4RBx9QDWR7BySdCnDaTzKf93WzVWqD9aBZEHQZrI/A53Fs0
   BZTn34EgPWG7i75Q6gkYSTi88u6LxjORlLRMnX441ELB12vX7owJ3JI2r
   6uyrz1O47+6DEfh/c+Ho2o02t08tB9tkzZdIh9p5cNowAvdvc88w1S3uw
   g==;
X-CSE-ConnectionGUID: NkidXq3SSjigTM5RsSiWog==
X-CSE-MsgGUID: noCo1eO4QHyQ02wC55L7Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="52988454"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="52988454"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 06:47:22 -0700
X-CSE-ConnectionGUID: fun671IxQqC/pfULx6dJXQ==
X-CSE-MsgGUID: m0fbdsTJTNSRUMBt5Ny6qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154570015"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Jul 2025 06:47:20 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWxnw-0000gd-1B;
	Wed, 02 Jul 2025 13:47:16 +0000
Date: Wed, 2 Jul 2025 21:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 11/14] drivers/tty/serial/earlycon.c:291:16:
 error: implicit declaration of function 'of_flat_dt_translate_address'
Message-ID: <202507022104.Pt7tEhtc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   75854a8e4c844c7e580832b48c15b9929572832e
commit: 48223fada1202eb4e6a2eefed4aaa440454494df [11/14] m68k: implement a builtin devicetree for nonmmu
config: m68k-randconfig-r112-20250702 (https://download.01.org/0day-ci/archive/20250702/202507022104.Pt7tEhtc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250702/202507022104.Pt7tEhtc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507022104.Pt7tEhtc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/earlycon.c: In function 'of_setup_earlycon':
>> drivers/tty/serial/earlycon.c:291:16: error: implicit declaration of function 'of_flat_dt_translate_address' [-Wimplicit-function-declaration]
     291 |         addr = of_flat_dt_translate_address(node);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_EARLY_FLATTREE
   Depends on [n]: OF [=n]
   Selected by [y]:
   - BUILTIN_DTB [=y]


vim +/of_flat_dt_translate_address +291 drivers/tty/serial/earlycon.c

8477614d9f7c5c Peter Hurley       2016-01-16  275  
c90fe9c0394b06 Peter Hurley       2016-01-16  276  int __init of_setup_earlycon(const struct earlycon_id *match,
088da2a17619cf Peter Hurley       2016-01-16  277  			     unsigned long node,
4d118c9a866590 Peter Hurley       2016-01-16  278  			     const char *options)
b0b6abd34c1b50 Rob Herring        2014-03-27  279  {
b0b6abd34c1b50 Rob Herring        2014-03-27  280  	int err;
b0b6abd34c1b50 Rob Herring        2014-03-27  281  	struct uart_port *port = &early_console_dev.port;
088da2a17619cf Peter Hurley       2016-01-16  282  	const __be32 *val;
088da2a17619cf Peter Hurley       2016-01-16  283  	bool big_endian;
c90fe9c0394b06 Peter Hurley       2016-01-16  284  	u64 addr;
b0b6abd34c1b50 Rob Herring        2014-03-27  285  
6e35d977fa1e28 John Ogness        2022-11-16  286  	if (console_is_registered(&early_con))
65e20e8cbbccaf Michael Walle      2022-06-28  287  		return -EALREADY;
65e20e8cbbccaf Michael Walle      2022-06-28  288  
e1dd3bef6d03c9 Geert Uytterhoeven 2015-11-27  289  	spin_lock_init(&port->lock);
b0b6abd34c1b50 Rob Herring        2014-03-27  290  	port->iotype = UPIO_MEM;
c90fe9c0394b06 Peter Hurley       2016-01-16 @291  	addr = of_flat_dt_translate_address(node);
c90fe9c0394b06 Peter Hurley       2016-01-16  292  	if (addr == OF_BAD_ADDR) {
c90fe9c0394b06 Peter Hurley       2016-01-16  293  		pr_warn("[%s] bad address\n", match->name);
c90fe9c0394b06 Peter Hurley       2016-01-16  294  		return -ENXIO;
c90fe9c0394b06 Peter Hurley       2016-01-16  295  	}
b0b6abd34c1b50 Rob Herring        2014-03-27  296  	port->mapbase = addr;
b0b6abd34c1b50 Rob Herring        2014-03-27  297  
088da2a17619cf Peter Hurley       2016-01-16  298  	val = of_get_flat_dt_prop(node, "reg-offset", NULL);
088da2a17619cf Peter Hurley       2016-01-16  299  	if (val)
088da2a17619cf Peter Hurley       2016-01-16  300  		port->mapbase += be32_to_cpu(*val);
1f66dd36bb1843 Greentime Hu       2018-02-13  301  	port->membase = earlycon_map(port->mapbase, SZ_4K);
1f66dd36bb1843 Greentime Hu       2018-02-13  302  
088da2a17619cf Peter Hurley       2016-01-16  303  	val = of_get_flat_dt_prop(node, "reg-shift", NULL);
088da2a17619cf Peter Hurley       2016-01-16  304  	if (val)
088da2a17619cf Peter Hurley       2016-01-16  305  		port->regshift = be32_to_cpu(*val);
088da2a17619cf Peter Hurley       2016-01-16  306  	big_endian = of_get_flat_dt_prop(node, "big-endian", NULL) != NULL ||
088da2a17619cf Peter Hurley       2016-01-16  307  		(IS_ENABLED(CONFIG_CPU_BIG_ENDIAN) &&
088da2a17619cf Peter Hurley       2016-01-16  308  		 of_get_flat_dt_prop(node, "native-endian", NULL) != NULL);
088da2a17619cf Peter Hurley       2016-01-16  309  	val = of_get_flat_dt_prop(node, "reg-io-width", NULL);
088da2a17619cf Peter Hurley       2016-01-16  310  	if (val) {
088da2a17619cf Peter Hurley       2016-01-16  311  		switch (be32_to_cpu(*val)) {
088da2a17619cf Peter Hurley       2016-01-16  312  		case 1:
088da2a17619cf Peter Hurley       2016-01-16  313  			port->iotype = UPIO_MEM;
088da2a17619cf Peter Hurley       2016-01-16  314  			break;
088da2a17619cf Peter Hurley       2016-01-16  315  		case 2:
088da2a17619cf Peter Hurley       2016-01-16  316  			port->iotype = UPIO_MEM16;
088da2a17619cf Peter Hurley       2016-01-16  317  			break;
088da2a17619cf Peter Hurley       2016-01-16  318  		case 4:
088da2a17619cf Peter Hurley       2016-01-16  319  			port->iotype = (big_endian) ? UPIO_MEM32BE : UPIO_MEM32;
088da2a17619cf Peter Hurley       2016-01-16  320  			break;
088da2a17619cf Peter Hurley       2016-01-16  321  		default:
088da2a17619cf Peter Hurley       2016-01-16  322  			pr_warn("[%s] unsupported reg-io-width\n", match->name);
088da2a17619cf Peter Hurley       2016-01-16  323  			return -EINVAL;
088da2a17619cf Peter Hurley       2016-01-16  324  		}
088da2a17619cf Peter Hurley       2016-01-16  325  	}
088da2a17619cf Peter Hurley       2016-01-16  326  
31cb9a8575ca04 Eugeniy Paltsev    2017-08-21  327  	val = of_get_flat_dt_prop(node, "current-speed", NULL);
31cb9a8575ca04 Eugeniy Paltsev    2017-08-21  328  	if (val)
31cb9a8575ca04 Eugeniy Paltsev    2017-08-21  329  		early_console_dev.baud = be32_to_cpu(*val);
31cb9a8575ca04 Eugeniy Paltsev    2017-08-21  330  
814453adea7d08 Michal Simek       2018-04-10  331  	val = of_get_flat_dt_prop(node, "clock-frequency", NULL);
814453adea7d08 Michal Simek       2018-04-10  332  	if (val)
814453adea7d08 Michal Simek       2018-04-10  333  		port->uartclk = be32_to_cpu(*val);
814453adea7d08 Michal Simek       2018-04-10  334  
4d118c9a866590 Peter Hurley       2016-01-16  335  	if (options) {
31cb9a8575ca04 Eugeniy Paltsev    2017-08-21  336  		early_console_dev.baud = simple_strtoul(options, NULL, 0);
eb9e109d010cb7 Wolfram Sang       2022-08-18  337  		strscpy(early_console_dev.options, options,
4d118c9a866590 Peter Hurley       2016-01-16  338  			sizeof(early_console_dev.options));
4d118c9a866590 Peter Hurley       2016-01-16  339  	}
05d961320ba624 Peter Hurley       2016-01-16  340  	earlycon_init(&early_console_dev, match->name);
4d118c9a866590 Peter Hurley       2016-01-16  341  	err = match->setup(&early_console_dev, options);
f28295cc8ce14b Hsin-Yi Wang       2020-09-15  342  	earlycon_print_info(&early_console_dev);
b0b6abd34c1b50 Rob Herring        2014-03-27  343  	if (err < 0)
b0b6abd34c1b50 Rob Herring        2014-03-27  344  		return err;
b0b6abd34c1b50 Rob Herring        2014-03-27  345  	if (!early_console_dev.con->write)
b0b6abd34c1b50 Rob Herring        2014-03-27  346  		return -ENODEV;
b0b6abd34c1b50 Rob Herring        2014-03-27  347  
b0b6abd34c1b50 Rob Herring        2014-03-27  348  
b0b6abd34c1b50 Rob Herring        2014-03-27  349  	register_console(early_console_dev.con);
b0b6abd34c1b50 Rob Herring        2014-03-27  350  	return 0;
b0b6abd34c1b50 Rob Herring        2014-03-27  351  }
8477614d9f7c5c Peter Hurley       2016-01-16  352  

:::::: The code at line 291 was first introduced by commit
:::::: c90fe9c0394b068ceca16f66e9f35bcd8d948295 of: earlycon: Move address translation to of_setup_earlycon()

:::::: TO: Peter Hurley <peter@hurleysoftware.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
