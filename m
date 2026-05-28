Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCFB26E70E
	for <linux-m68k@lists.linux-m68k.org>; Thu, 28 May 2026 15:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982117; cv=none; b=JKKTjuwQxASN4gzBtiQpXdp5gA9p48Uk/kceZ8NPtDDilrcES8EP+TCWiBLjgsZ2crBkF+tAuQgpLSsCno+TsdjVLqqgafaMF/FnpjO1eQM8Ca/48GAusiZ1HxgvWAqCW1dblghLJM4ay4jEa41Riwa64TB+XLg1e8U3WQWNQQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982117; c=relaxed/simple;
	bh=vdHJI+EMjLxZD/QaMi7GqZ8jwR8Jf+ewiX6tUNrtCyU=;
	h=Date:From:Cc:Subject:Message-ID; b=L80QB0cg3D9hy2UbRO9Gy+oHG5AMPHAN1zzjsaCyqbhnYKkPt9t1R1IZF35SYb+O0nbYIBTD3bxqY4DygU8GsR5Uuf4wKJcYfck+RJn9McjzL4zV20k+UaK0diNHA2iv+bzM6XLGxswJJDPgQ+FP+nbXsuBdmoWMkf8AePr9KCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EQeQfw5F; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQeQfw5F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779982117; x=1811518117;
  h=date:from:cc:subject:message-id;
  bh=vdHJI+EMjLxZD/QaMi7GqZ8jwR8Jf+ewiX6tUNrtCyU=;
  b=EQeQfw5FjmlT1LdPCzeVww4fp7fjosu7DaLGjtda71VIeC+Fl/mGZwfR
   pHTVpBG6NkvMwMSEHEnrc97BJyPQpvGqkzfwLup+eklvuZz24RmNtUaLi
   3hp2MYGI1lp6UTGEawZzjHaHk+3grXjkiDLyhZFX7/1T44RXxAaQlqsQ+
   B7yqu2Z225jcKcAv0B79gYA4Rp8uNJOGsSzgNGdYjpFtT/bsqkCAkvsZ1
   dOAGQd5qJm0boLo07QWSovVBmdkkI55vsm3JFENQh+IjOCpAhl15bck50
   ejW2EhrKqUUGpBuRpgnPaxg24qTRY7fg4xR2u9gsbDVJiJnoSmO2bO679
   Q==;
X-CSE-ConnectionGUID: u8K7TQr8QiK/+pvnabCzVg==
X-CSE-MsgGUID: YJrW3QNpRQ2zA4x+sAUViQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80550568"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80550568"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 08:28:36 -0700
X-CSE-ConnectionGUID: vcBNx5zxQQq2ScMdzb3kAA==
X-CSE-MsgGUID: ak2IMtUWT5Wv1NSCLHI+fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="239565937"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 May 2026 08:28:34 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSceu-0000000064i-0YNE;
	Thu, 28 May 2026 15:28:32 +0000
Date: Thu, 28 May 2026 23:28:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [geert-m68k:master 1282/1440]
 drivers/usb/host/isp116x.h:411:15: sparse: sparse: cast removes address space
 '__iomem' of expression
Message-ID: <202605282355.uB9GDd2J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
head:   26b3f6c06bb2e4c5e933736324b70b732c06ba64
commit: b971c823ecb945e93fbe49e98884e4ef9ee5e859 [1282/1440] Merge tag 'v5.8-rc2'
config: m68k-randconfig-r132-20260528 (https://download.01.org/0day-ci/archive/20260528/202605282355.uB9GDd2J-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605282355.uB9GDd2J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605282355.uB9GDd2J-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/host/isp116x-hcd.c:137:55: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/usb/host/isp116x-hcd.c:137:55: sparse:     expected unsigned short [usertype] val
   drivers/usb/host/isp116x-hcd.c:137:55: sparse:     got restricted __le16 [usertype]
   drivers/usb/host/isp116x-hcd.c:184:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c:184:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c:184:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c:184:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c: note: in included file:
>> drivers/usb/host/isp116x.h:411:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:411:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:391:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:391:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:391:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:391:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:391:9: sparse:    void
   drivers/usb/host/isp116x.h:391:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:391:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:391:9: sparse:    void
   drivers/usb/host/isp116x.h:391:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:391:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:391:9: sparse:    void
   drivers/usb/host/isp116x.h:397:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:397:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:397:9: sparse:    void
   drivers/usb/host/isp116x.h:391:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:391:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:391:9: sparse:    void
   drivers/usb/host/isp116x.h:427:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:427:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:427:9: sparse:    void
   drivers/usb/host/isp116x.h:429:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:429:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:429:9: sparse:    void
   drivers/usb/host/isp116x.h:403:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:403:9: sparse:    int
   drivers/usb/host/isp116x.h:403:9: sparse:    void
   drivers/usb/host/isp116x.h:403:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:403:9: sparse:    int
   drivers/usb/host/isp116x.h:403:9: sparse:    void
   drivers/usb/host/isp116x.h:397:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:397:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:397:9: sparse:    void
   drivers/usb/host/isp116x.h:397:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:397:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:397:9: sparse:    void
   drivers/usb/host/isp116x.h:403:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:403:9: sparse:    int
   drivers/usb/host/isp116x.h:403:9: sparse:    void
   drivers/usb/host/isp116x.h:391:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:391:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:391:9: sparse:    void
   drivers/usb/host/isp116x.h:397:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:397:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:397:9: sparse:    void
   drivers/usb/host/isp116x.h:397:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:397:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:397:9: sparse:    void
   drivers/usb/host/isp116x.h:397:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:397:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:397:9: sparse:    void
   drivers/usb/host/isp116x.h:397:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:397:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:397:9: sparse:    void
   drivers/usb/host/isp116x.h:391:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:391:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:391:9: sparse:    void

vim +/__iomem +411 drivers/usb/host/isp116x.h

4808a1c0261176 Olav Kongas     2005-04-09  406  
4808a1c0261176 Olav Kongas     2005-04-09  407  static inline u16 isp116x_read_data16(struct isp116x *isp116x)
4808a1c0261176 Olav Kongas     2005-04-09  408  {
4808a1c0261176 Olav Kongas     2005-04-09  409  	u16 val;
4808a1c0261176 Olav Kongas     2005-04-09  410  
2f0f9fcd96fa8d Michael Schmitz 2013-04-06 @411  	val = isp_readw(isp116x->data_reg);
4808a1c0261176 Olav Kongas     2005-04-09  412  	isp116x_delay(isp116x, 150);
4808a1c0261176 Olav Kongas     2005-04-09  413  	return val;
4808a1c0261176 Olav Kongas     2005-04-09  414  }
4808a1c0261176 Olav Kongas     2005-04-09  415  

:::::: The code at line 411 was first introduced by commit
:::::: 2f0f9fcd96fa8dbeec54cce98170985f7b384a41 m68k/atari: USB - add ISP1160 USB host controller support

:::::: TO: Michael Schmitz <schmitzmic@gmail.com>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
