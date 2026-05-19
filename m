Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B004D8D9D
	for <linux-m68k@lists.linux-m68k.org>; Tue, 19 May 2026 12:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779192936; cv=none; b=jKnSfuJR6J3SQvztNl04Sluy0yavdlifd5pYCRA+nbdu1ETzSDCRA7sNJeF6/ZWcbDmYvvNDcAWq08v9wdjKTVxJPNCjTG5H1B68Uz8PlNKWc5qLhkrUOxu7d1BZzUPgtbuwttpzF2DROTVUdclBNxttM7m6QBpPDyM2dcKu9rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779192936; c=relaxed/simple;
	bh=aswxU6s+SgfKFBFINk4sY4ktrjstM3oMdzI7VGmOJbY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aAMPIFFDbrRE+knhu8fMPmKMtzLM+JRIf4XOCLrGcdd29huOpkeKD9VBsMZPiAf9s6gdaMkpBVImTK44vAymoB+AhLgU4FHdiB23K3IplTTuZZ9dGwCNQDN2wlPcVcL6VTiv6siWhtuKunP7YflSwU4t7gDHNkyXfT5IVkmS0lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6EpHLI7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6EpHLI7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779192933; x=1810728933;
  h=date:from:to:cc:subject:message-id;
  bh=aswxU6s+SgfKFBFINk4sY4ktrjstM3oMdzI7VGmOJbY=;
  b=I6EpHLI7/Xod0y+rPejF8W41q/Dn6/Z2z/IwT2CIqE3prKj0FaIaWL1k
   +7k5YV0Cz39Nvu4n+1Rho9PvMij2V4/IxG0ZhA+stAXh+b2wZD3Pg2AQJ
   CLYabWPrxo0bGbwI+o32S7VaWIJEuuvjY4rJIwicr+fXFo8hNnXNxX7hL
   OYatjb5E8MpvStB5V36Q/tlTYo6h+NFTeQ+wqs3IjI5gYvHLTm7Yf372p
   d/9N3nrsuQyOHIFYpTrAp9MRUdCo8KhV4F+VHYGzV191nk0ildSL4Z8Ub
   axznKM0m0MpFFfXGZDGIbQenSPiL5jx6fAyI9pn9k8syzD2Xs6f90D7Mw
   w==;
X-CSE-ConnectionGUID: f2DVNuufRMOTrCMaByhTiQ==
X-CSE-MsgGUID: SF9vOEWuQ9OYOmAP3Os0vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91461886"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91461886"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:15:31 -0700
X-CSE-ConnectionGUID: 7eEQkJjlS3uYjHG1n6F3RQ==
X-CSE-MsgGUID: Ox6nLmLvQpWFUCLmx3BuJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="263257965"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 May 2026 05:15:29 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPJLi-0000000011o-23iW;
	Tue, 19 May 2026 12:15:15 +0000
Date: Tue, 19 May 2026 20:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@uclinux.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3]
 drivers/mtd/maps/physmap-ixp4xx.c:47:9: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202605192043.FdeJc20I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   b9d1c6c54795dbb93bb9f68f60a4da071e2ad418
commit: b9d1c6c54795dbb93bb9f68f60a4da071e2ad418 [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-r133-20260519 (https://download.01.org/0day-ci/archive/20260519/202605192043.FdeJc20I-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605192043.FdeJc20I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605192043.FdeJc20I-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/mtd/maps/physmap-ixp4xx.c:42:16: sparse: sparse: cast to restricted __be16
   drivers/mtd/maps/physmap-ixp4xx.c:42:16: sparse: sparse: cast to restricted __be16
   drivers/mtd/maps/physmap-ixp4xx.c:42:16: sparse: sparse: cast to restricted __be16
   drivers/mtd/maps/physmap-ixp4xx.c:42:16: sparse: sparse: cast to restricted __be16
>> drivers/mtd/maps/physmap-ixp4xx.c:47:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile @@     got restricted __be16 [usertype] @@
   drivers/mtd/maps/physmap-ixp4xx.c:47:9: sparse:     expected unsigned short volatile
   drivers/mtd/maps/physmap-ixp4xx.c:47:9: sparse:     got restricted __be16 [usertype]

vim +47 drivers/mtd/maps/physmap-ixp4xx.c

2aba2f2a704d368 Linus Walleij 2019-10-21  39  
2aba2f2a704d368 Linus Walleij 2019-10-21  40  static inline u16 flash_read16(void __iomem *addr)
2aba2f2a704d368 Linus Walleij 2019-10-21  41  {
2aba2f2a704d368 Linus Walleij 2019-10-21 @42  	return be16_to_cpu(__raw_readw((void __iomem *)((unsigned long)addr ^ 0x2)));
2aba2f2a704d368 Linus Walleij 2019-10-21  43  }
2aba2f2a704d368 Linus Walleij 2019-10-21  44  
2aba2f2a704d368 Linus Walleij 2019-10-21  45  static inline void flash_write16(u16 d, void __iomem *addr)
2aba2f2a704d368 Linus Walleij 2019-10-21  46  {
2aba2f2a704d368 Linus Walleij 2019-10-21 @47  	__raw_writew(cpu_to_be16(d), (void __iomem *)((unsigned long)addr ^ 0x2));
2aba2f2a704d368 Linus Walleij 2019-10-21  48  }
2aba2f2a704d368 Linus Walleij 2019-10-21  49  

:::::: The code at line 47 was first introduced by commit
:::::: 2aba2f2a704d368583e832555b25d88265e62b6d mtd: physmap_of: add a hook for Intel IXP4xx flash probing

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Miquel Raynal <miquel.raynal@bootlin.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
