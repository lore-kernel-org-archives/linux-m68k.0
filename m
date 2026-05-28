Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8248332FA2B
	for <linux-m68k@lists.linux-m68k.org>; Thu, 28 May 2026 19:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779997085; cv=none; b=QUOF5xOf9sp6HUmT8Q6h/Uywqf0R4Zs7TsQZ8AwKS4TWsZngVTKlKbjR+9rL+Eu1WNchdPnBVBn7DeW/NWMvDX/lncLS2ORkjkcZhPbDlClJ8JAqsHfp0A/nP+WGJb5qcJpPL3nrBbKLlIrxvXGoXr9iBYy+aXGTTxacEDo1pHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779997085; c=relaxed/simple;
	bh=c7+pl6QxfMtGMl0ZkVNfpI1IUBq9Vv3pjKnZg0ak/vs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qwj5Ob2Ynhgs/BFozqje1Pg8erFzWL9tyEdER8PPQrRVNvopVW9hfrFtTQE07H/RkB+UGQwYMgYVnMUtHfzNvGNIeC3Nk1DegdkXagn9m0d6jVwMOYJN38oTN+i+2U+lCTCWjHp9Kd8YdgRRbOKtM7/G/TqOmklpsA6wGZA94SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIT+nFC7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIT+nFC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779997084; x=1811533084;
  h=date:from:to:cc:subject:message-id;
  bh=c7+pl6QxfMtGMl0ZkVNfpI1IUBq9Vv3pjKnZg0ak/vs=;
  b=nIT+nFC7SFWSK/dPFdp4m8/Jgzpxpon0ZRJtvlxtEOpHxExm8Aa+qKX6
   AwqU2O+VwY0MGgI6sa1hZqwFZb7hro6jtF7yrv75GXBP9ApWtOzBRcPex
   pSuoWkFKsQyJ43Oicr5sVyfbM2fGWhGEMMgZhBPwo2b/4GfqlcR2j1D3e
   WWxjRpqmmQP3mG90L7V1AtZYjIaSOaIwdefnj52jTzZuS8lV+pxGy35Xn
   AOQpuerKh9hk1xlQGTHPhW4wExCQ81ekHiFhmETcxk0ywdm+LsZz7TgB/
   70PMFiazG0pDC7gtYrnbLYIkql4Wp7lcGRwieuh4UlyduWem8XrB2TyFO
   A==;
X-CSE-ConnectionGUID: 44Fa+KakTVaV2Hleo2fivQ==
X-CSE-MsgGUID: dfOvnMpUR/65cHBYHGXtGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80748607"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80748607"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 12:38:03 -0700
X-CSE-ConnectionGUID: eFFXwZVqR9WII+7BCaJF8w==
X-CSE-MsgGUID: nkxOJ0pvSEWLMd8WUwdpsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="238448992"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 May 2026 12:38:00 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSgYH-000000006NS-3r3O;
	Thu, 28 May 2026 19:37:57 +0000
Date: Fri, 29 May 2026 03:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 Guenter Roeck <linux@roeck-us.net>,
 Michael Schmitz <schmitzmic@gmail.com>
Subject: [geert-m68k:master 1/2] drivers/usb/host/isp116x.h:419:15:
 sparse: sparse: cast to restricted __le16
Message-ID: <202605290352.rNIsypVC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
head:   26b3f6c06bb2e4c5e933736324b70b732c06ba64
commit: 84fdf8f72e6db3433914e7de7c8e64d95dacaaef [1/2] m68k: atari: Make Atari ROM port I/O write macros return void
config: m68k-randconfig-r132-20260528 (https://download.01.org/0day-ci/archive/20260529/202605290352.rNIsypVC-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290352.rNIsypVC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605290352.rNIsypVC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/host/isp116x-hcd.c:137:55: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/usb/host/isp116x-hcd.c:137:55: sparse:     expected unsigned short [usertype] val
   drivers/usb/host/isp116x-hcd.c:137:55: sparse:     got restricted __le16 [usertype]
   drivers/usb/host/isp116x-hcd.c:184:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c:184:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c:184:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c:184:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c: note: in included file:
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:436:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:436:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:438:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:438:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:426:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:426:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:428:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:428:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:402:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:402:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:402:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:402:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:402:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:402:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:402:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:402:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:402:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression

vim +419 drivers/usb/host/isp116x.h

4808a1c0261176f Olav Kongas     2005-04-09  393  
4808a1c0261176f Olav Kongas     2005-04-09  394  static inline void isp116x_write_data16(struct isp116x *isp116x, u16 val)
4808a1c0261176f Olav Kongas     2005-04-09  395  {
2f0f9fcd96fa8db Michael Schmitz 2013-04-06 @396  	isp_writew(val, isp116x->data_reg);
4808a1c0261176f Olav Kongas     2005-04-09  397  	isp116x_delay(isp116x, 150);
4808a1c0261176f Olav Kongas     2005-04-09  398  }
4808a1c0261176f Olav Kongas     2005-04-09  399  
4808a1c0261176f Olav Kongas     2005-04-09  400  static inline void isp116x_raw_write_data16(struct isp116x *isp116x, u16 val)
4808a1c0261176f Olav Kongas     2005-04-09  401  {
2f0f9fcd96fa8db Michael Schmitz 2013-04-06  402  	isp_raw_writew(val, isp116x->data_reg);
4808a1c0261176f Olav Kongas     2005-04-09  403  	isp116x_delay(isp116x, 150);
4808a1c0261176f Olav Kongas     2005-04-09  404  }
4808a1c0261176f Olav Kongas     2005-04-09  405  
4808a1c0261176f Olav Kongas     2005-04-09  406  static inline u16 isp116x_read_data16(struct isp116x *isp116x)
4808a1c0261176f Olav Kongas     2005-04-09  407  {
4808a1c0261176f Olav Kongas     2005-04-09  408  	u16 val;
4808a1c0261176f Olav Kongas     2005-04-09  409  
2f0f9fcd96fa8db Michael Schmitz 2013-04-06  410  	val = isp_readw(isp116x->data_reg);
4808a1c0261176f Olav Kongas     2005-04-09  411  	isp116x_delay(isp116x, 150);
4808a1c0261176f Olav Kongas     2005-04-09  412  	return val;
4808a1c0261176f Olav Kongas     2005-04-09  413  }
4808a1c0261176f Olav Kongas     2005-04-09  414  
4808a1c0261176f Olav Kongas     2005-04-09  415  static inline u16 isp116x_raw_read_data16(struct isp116x *isp116x)
4808a1c0261176f Olav Kongas     2005-04-09  416  {
4808a1c0261176f Olav Kongas     2005-04-09  417  	u16 val;
4808a1c0261176f Olav Kongas     2005-04-09  418  
2f0f9fcd96fa8db Michael Schmitz 2013-04-06 @419  	val = isp_raw_readw(isp116x->data_reg);
4808a1c0261176f Olav Kongas     2005-04-09  420  	isp116x_delay(isp116x, 150);
4808a1c0261176f Olav Kongas     2005-04-09  421  	return val;
4808a1c0261176f Olav Kongas     2005-04-09  422  }
4808a1c0261176f Olav Kongas     2005-04-09  423  

:::::: The code at line 419 was first introduced by commit
:::::: 2f0f9fcd96fa8dbeec54cce98170985f7b384a41 m68k/atari: USB - add ISP1160 USB host controller support

:::::: TO: Michael Schmitz <schmitzmic@gmail.com>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
