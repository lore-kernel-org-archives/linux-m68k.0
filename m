Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2E426C385
	for <linux-m68k@lists.linux-m68k.org>; Tue, 19 May 2026 08:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178383; cv=none; b=SngTT1y5lX54ZdtWCeQ3fIDIm333rw1YWESPVuJHmkrUaykFDPesAjIKtC/Yv+DF/btKkvOE7BipbO+Dl8CD+esWgEgGAIetc66WM8406RF0+KVhZLXxAvlspcSsSN1WB4UV5rK/IraDgEjxsvpSwBLzwA1fXrGLX8zmmNjwfi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178383; c=relaxed/simple;
	bh=840uzFk5HKRk7tR1S9ASyE4WYgEWxMolCqHkxThi7ew=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LSfIc3Dl+NI5+EnfvtdNaLNL4t2bLGZ21mOt2Xy3MOQJBChR5uK2BBNUb1oGJLcxQqDY6fcS79d5RADkHfCGUp0N8wD1L+Sf2PRiWAXaCYBldWqlL/WTN+UojuVncRze5V5OpPPfL1FzQ+fr7DwV7QFgYA77wgXYpQm/+6HBWK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRThunTA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRThunTA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779178379; x=1810714379;
  h=date:from:to:cc:subject:message-id;
  bh=840uzFk5HKRk7tR1S9ASyE4WYgEWxMolCqHkxThi7ew=;
  b=cRThunTAYwfm+ie4l3tmFV+xh2qMBXfJulVNCl+77xim13r9ey5F+Ilh
   tORRQRuXE/vbsMLaw8uZ4FIjT8LUGDDEycMalTVaIOXz8TJogsw8lZ0Ze
   SP6gNKqiU0BgPxHar1gkSrd0qqGE2/oShc8jMP2B989lEksKQGPFdLcfB
   v2gl9/DP8WTRnNUOhTKEk3us/JI0zwgjSwnT2iukcxnLURQhYo/biVIui
   l16cp/uSW3G5PbSZ5irJ/yxpJozzLFeMsfJrgJUAGGdBVDgFHzAvE1lv1
   8mwYy/Hta5NdY35icxsdqvEEPbDjweIhElvBJVkRYjAuVlM1paNu2toOM
   w==;
X-CSE-ConnectionGUID: YSrnJmTsTcSB1eVwBd9cOQ==
X-CSE-MsgGUID: H9WCEaeoT1efx1zxs4hrLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79072348"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79072348"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 01:12:58 -0700
X-CSE-ConnectionGUID: 29fAtikTSo2uXVIEd8GfQQ==
X-CSE-MsgGUID: 3AfgtoFIQiOJOc9HECl2iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="244679408"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 19 May 2026 01:12:55 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPFYC-000000000hZ-2o3u;
	Tue, 19 May 2026 08:12:07 +0000
Date: Tue, 19 May 2026 16:10:29 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 11/14]
 drivers/tty/serial/earlycon.c:291:9: error: implicit declaration of function
 'of_flat_dt_translate_address'; did you mean 'of_flat_dt_read_addr_size'?
Message-ID: <202605191633.AWVZSr2U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   3173490642db7ab3c9f15b139b19a633a2ac2d5e
commit: f39ca69b9539fbc15fc68adf47ba721cb9c6a6e1 [11/14] m68k: implement a builtin devicetree for nonmmu
config: m68k-randconfig-r051-20260519 (https://download.01.org/0day-ci/archive/20260519/202605191633.AWVZSr2U-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191633.AWVZSr2U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191633.AWVZSr2U-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/earlycon.c: In function 'of_setup_earlycon':
>> drivers/tty/serial/earlycon.c:291:9: error: implicit declaration of function 'of_flat_dt_translate_address'; did you mean 'of_flat_dt_read_addr_size'? [-Werror=implicit-function-declaration]
     addr = of_flat_dt_translate_address(node);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
            of_flat_dt_read_addr_size
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_EARLY_FLATTREE
   Depends on [n]: OF [=n]
   Selected by [y]:
   - BUILTIN_DTB [=y]


vim +291 drivers/tty/serial/earlycon.c

8477614d9f7c5ce Peter Hurley       2016-01-16  275  
c90fe9c0394b068 Peter Hurley       2016-01-16  276  int __init of_setup_earlycon(const struct earlycon_id *match,
088da2a17619cf0 Peter Hurley       2016-01-16  277  			     unsigned long node,
4d118c9a8665908 Peter Hurley       2016-01-16  278  			     const char *options)
b0b6abd34c1b508 Rob Herring        2014-03-27  279  {
b0b6abd34c1b508 Rob Herring        2014-03-27  280  	int err;
b0b6abd34c1b508 Rob Herring        2014-03-27  281  	struct uart_port *port = &early_console_dev.port;
088da2a17619cf0 Peter Hurley       2016-01-16  282  	const __be32 *val;
088da2a17619cf0 Peter Hurley       2016-01-16  283  	bool big_endian;
c90fe9c0394b068 Peter Hurley       2016-01-16  284  	u64 addr;
b0b6abd34c1b508 Rob Herring        2014-03-27  285  
6e35d977fa1e284 John Ogness        2022-11-16  286  	if (console_is_registered(&early_con))
65e20e8cbbccaf0 Michael Walle      2022-06-28  287  		return -EALREADY;
65e20e8cbbccaf0 Michael Walle      2022-06-28  288  
e1dd3bef6d03c90 Geert Uytterhoeven 2015-11-27  289  	spin_lock_init(&port->lock);
b0b6abd34c1b508 Rob Herring        2014-03-27  290  	port->iotype = UPIO_MEM;
c90fe9c0394b068 Peter Hurley       2016-01-16 @291  	addr = of_flat_dt_translate_address(node);
c90fe9c0394b068 Peter Hurley       2016-01-16  292  	if (addr == OF_BAD_ADDR) {
c90fe9c0394b068 Peter Hurley       2016-01-16  293  		pr_warn("[%s] bad address\n", match->name);
c90fe9c0394b068 Peter Hurley       2016-01-16  294  		return -ENXIO;
c90fe9c0394b068 Peter Hurley       2016-01-16  295  	}
b0b6abd34c1b508 Rob Herring        2014-03-27  296  	port->mapbase = addr;
b0b6abd34c1b508 Rob Herring        2014-03-27  297  
088da2a17619cf0 Peter Hurley       2016-01-16  298  	val = of_get_flat_dt_prop(node, "reg-offset", NULL);
088da2a17619cf0 Peter Hurley       2016-01-16  299  	if (val)
088da2a17619cf0 Peter Hurley       2016-01-16  300  		port->mapbase += be32_to_cpu(*val);
1f66dd36bb18437 Greentime Hu       2018-02-13  301  	port->membase = earlycon_map(port->mapbase, SZ_4K);
1f66dd36bb18437 Greentime Hu       2018-02-13  302  
088da2a17619cf0 Peter Hurley       2016-01-16  303  	val = of_get_flat_dt_prop(node, "reg-shift", NULL);
088da2a17619cf0 Peter Hurley       2016-01-16  304  	if (val)
088da2a17619cf0 Peter Hurley       2016-01-16  305  		port->regshift = be32_to_cpu(*val);
088da2a17619cf0 Peter Hurley       2016-01-16  306  	big_endian = of_get_flat_dt_prop(node, "big-endian", NULL) != NULL ||
088da2a17619cf0 Peter Hurley       2016-01-16  307  		(IS_ENABLED(CONFIG_CPU_BIG_ENDIAN) &&
088da2a17619cf0 Peter Hurley       2016-01-16  308  		 of_get_flat_dt_prop(node, "native-endian", NULL) != NULL);
088da2a17619cf0 Peter Hurley       2016-01-16  309  	val = of_get_flat_dt_prop(node, "reg-io-width", NULL);
088da2a17619cf0 Peter Hurley       2016-01-16  310  	if (val) {
088da2a17619cf0 Peter Hurley       2016-01-16  311  		switch (be32_to_cpu(*val)) {
088da2a17619cf0 Peter Hurley       2016-01-16  312  		case 1:
088da2a17619cf0 Peter Hurley       2016-01-16  313  			port->iotype = UPIO_MEM;
088da2a17619cf0 Peter Hurley       2016-01-16  314  			break;
088da2a17619cf0 Peter Hurley       2016-01-16  315  		case 2:
088da2a17619cf0 Peter Hurley       2016-01-16  316  			port->iotype = UPIO_MEM16;
088da2a17619cf0 Peter Hurley       2016-01-16  317  			break;
088da2a17619cf0 Peter Hurley       2016-01-16  318  		case 4:
088da2a17619cf0 Peter Hurley       2016-01-16  319  			port->iotype = (big_endian) ? UPIO_MEM32BE : UPIO_MEM32;
088da2a17619cf0 Peter Hurley       2016-01-16  320  			break;
088da2a17619cf0 Peter Hurley       2016-01-16  321  		default:
088da2a17619cf0 Peter Hurley       2016-01-16  322  			pr_warn("[%s] unsupported reg-io-width\n", match->name);
088da2a17619cf0 Peter Hurley       2016-01-16  323  			return -EINVAL;
088da2a17619cf0 Peter Hurley       2016-01-16  324  		}
088da2a17619cf0 Peter Hurley       2016-01-16  325  	}
088da2a17619cf0 Peter Hurley       2016-01-16  326  
31cb9a8575ca04f Eugeniy Paltsev    2017-08-21  327  	val = of_get_flat_dt_prop(node, "current-speed", NULL);
31cb9a8575ca04f Eugeniy Paltsev    2017-08-21  328  	if (val)
31cb9a8575ca04f Eugeniy Paltsev    2017-08-21  329  		early_console_dev.baud = be32_to_cpu(*val);
31cb9a8575ca04f Eugeniy Paltsev    2017-08-21  330  
814453adea7d081 Michal Simek       2018-04-10  331  	val = of_get_flat_dt_prop(node, "clock-frequency", NULL);
814453adea7d081 Michal Simek       2018-04-10  332  	if (val)
814453adea7d081 Michal Simek       2018-04-10  333  		port->uartclk = be32_to_cpu(*val);
814453adea7d081 Michal Simek       2018-04-10  334  
4d118c9a8665908 Peter Hurley       2016-01-16  335  	if (options) {
31cb9a8575ca04f Eugeniy Paltsev    2017-08-21  336  		early_console_dev.baud = simple_strtoul(options, NULL, 0);
eb9e109d010cb79 Wolfram Sang       2022-08-18  337  		strscpy(early_console_dev.options, options,
4d118c9a8665908 Peter Hurley       2016-01-16  338  			sizeof(early_console_dev.options));
4d118c9a8665908 Peter Hurley       2016-01-16  339  	}
05d961320ba624c Peter Hurley       2016-01-16  340  	earlycon_init(&early_console_dev, match->name);
4d118c9a8665908 Peter Hurley       2016-01-16  341  	err = match->setup(&early_console_dev, options);
f28295cc8ce14b7 Hsin-Yi Wang       2020-09-15  342  	earlycon_print_info(&early_console_dev);
b0b6abd34c1b508 Rob Herring        2014-03-27  343  	if (err < 0)
b0b6abd34c1b508 Rob Herring        2014-03-27  344  		return err;
b0b6abd34c1b508 Rob Herring        2014-03-27  345  	if (!early_console_dev.con->write)
b0b6abd34c1b508 Rob Herring        2014-03-27  346  		return -ENODEV;
b0b6abd34c1b508 Rob Herring        2014-03-27  347  
b0b6abd34c1b508 Rob Herring        2014-03-27  348  
b0b6abd34c1b508 Rob Herring        2014-03-27  349  	register_console(early_console_dev.con);
b0b6abd34c1b508 Rob Herring        2014-03-27  350  	return 0;
b0b6abd34c1b508 Rob Herring        2014-03-27  351  }
8477614d9f7c5ce Peter Hurley       2016-01-16  352  

:::::: The code at line 291 was first introduced by commit
:::::: c90fe9c0394b068ceca16f66e9f35bcd8d948295 of: earlycon: Move address translation to of_setup_earlycon()

:::::: TO: Peter Hurley <peter@hurleysoftware.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
