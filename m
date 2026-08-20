Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7471E9919
	for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Aug 2026 00:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787187133; cv=none; b=hs8RZFD60FuRZD0nMNvdwhJDcQi8qscOY7rl2PeJCDahDid7GlhLRwx8x6Xl0GKkTszYcYqvwz6hJ/9pN+sLE56aQ07pI9sikrdTsmz4pFFFFs1hUJC6Yb8jeXuRUeP3vMYwxT0q3HNWUVk7hrmTMuDbNnSVtSPAtgYtr4SHDDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787187133; c=relaxed/simple;
	bh=IVXPB6aULuiDfiJcSgfZJ4XmoNwBqUI0YtvUhtV7Exk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fJbKlm8o4Uchcv+F2p6RQrL4mVyZDauUdpkSUPvdKWOifEEId1h24lCemDTO3Mi9x25ncWRkKWHCit3jCNgTUkMc9cil7UoVSWGRTkWoMQpa+WDPQrLFBt3RCQ12NFEIVKnggPzpL8SCZ+Ng1Ddwj5iQ60YIlRsdXbIs+hMExD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLL9jJkz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLL9jJkz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787187131; x=1818723131;
  h=date:from:to:cc:subject:message-id;
  bh=IVXPB6aULuiDfiJcSgfZJ4XmoNwBqUI0YtvUhtV7Exk=;
  b=KLL9jJkzeZBqbzQ54tjkamW6w/SIEO/fcYfqDegH3pZgrFoKbNqEMOHl
   yIg9nX9SN/MCFTVi26cFFNRfpK+ttCY4gSLRZjjZi4hM1sG7coWPhu5yq
   gSK0Wx5U0yCAKu4oVO/JCjdIsRP8Ed5QqXqMMO4rduh8Ejf8s4s4rDBJ3
   5gtt8FCH8/DMIg68gf1oFXZwhDQzP6JKWcEv+z5uGJDZIwVx9cpP5FqoT
   xtUvqo60Dzd8fA5XkKHhFYcNpORE7sjI7KqVmTCk6B5LpL22t3EgulTd3
   YTYFSpnR3ejyO0OH+R6z4EAsDFvML5Pv9H4VRGmI3ieg1zqKMQoXW3tJU
   w==;
X-CSE-ConnectionGUID: rdj4IprATaK6gI5D9GZU9A==
X-CSE-MsgGUID: UluyljgzSYK7PYJw2IjT2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="113255237"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="113255237"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 17:52:10 -0700
X-CSE-ConnectionGUID: p9NoNvpZSDiW30Vv0jy4HQ==
X-CSE-MsgGUID: FshwVV88TxmAj33XIJxkQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="267688695"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Aug 2026 17:52:07 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwr0n-00000000hBT-17tE;
	Thu, 20 Aug 2026 00:52:05 +0000
Date: Thu, 20 Aug 2026 08:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 Guenter Roeck <linux@roeck-us.net>,
 Michael Schmitz <schmitzmic@gmail.com>
Subject: [geert-m68k:master 1/2] drivers/usb/host/isp116x.h:419:15:
 sparse: sparse: cast to restricted __le16
Message-ID: <202608200828.PAM94KLo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
head:   430075db163607e33af279ef7e246e1a460c6293
commit: 84fdf8f72e6db3433914e7de7c8e64d95dacaaef [1/2] m68k: atari: Make Atari ROM port I/O write macros return void
config: m68k-randconfig-r113-20260819 (https://download.01.org/0day-ci/archive/20260820/202608200828.PAM94KLo-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608200828.PAM94KLo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608200828.PAM94KLo-lkp@intel.com/

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

4808a1c0261176 Olav Kongas     2005-04-09  414  
4808a1c0261176 Olav Kongas     2005-04-09  415  static inline u16 isp116x_raw_read_data16(struct isp116x *isp116x)
4808a1c0261176 Olav Kongas     2005-04-09  416  {
4808a1c0261176 Olav Kongas     2005-04-09  417  	u16 val;
4808a1c0261176 Olav Kongas     2005-04-09  418  
2f0f9fcd96fa8d Michael Schmitz 2013-04-06 @419  	val = isp_raw_readw(isp116x->data_reg);
4808a1c0261176 Olav Kongas     2005-04-09  420  	isp116x_delay(isp116x, 150);
4808a1c0261176 Olav Kongas     2005-04-09  421  	return val;
4808a1c0261176 Olav Kongas     2005-04-09  422  }
4808a1c0261176 Olav Kongas     2005-04-09  423  

:::::: The code at line 419 was first introduced by commit
:::::: 2f0f9fcd96fa8dbeec54cce98170985f7b384a41 m68k/atari: USB - add ISP1160 USB host controller support

:::::: TO: Michael Schmitz <schmitzmic@gmail.com>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
