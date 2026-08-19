Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB5447A896
	for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Aug 2026 16:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157514; cv=none; b=q6RD2vxGNJ1vi3+wFudi3SCwiGKesVJgtLjdanEW0VTc6flW7gQBrj6OTkCtjILHe2tlhK/Op21SOkVkCX6qLqJ7EBMe8Os36xzADDruM25LB9stRUlHa98E382ef8W7p6cBwiujyKpsPo1+XEseb2uwq9ozy4vpRf7dIk4MyDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157514; c=relaxed/simple;
	bh=wUF8AfVP3BQhMQpaxhV1uASfzgC4O3gmQhhmd2lT7so=;
	h=Date:From:Cc:Subject:Message-ID; b=FtaLgVP2kYghg+CTWyEN02C2oOI/p+IBMgoiuMXdtjbvJZFaF8+X6VLxXfT/EqYGHdgXo/BTuHcPX1JbxEcfVF5ohRu8Ys4vEUE4ha5l/jNfdPj0TMA66nsSAjcAOxPnwLroXvdnE0cJmB1291nG9ablywXGXintbwmNNiIU2Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nj2Vs6zx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nj2Vs6zx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787157513; x=1818693513;
  h=date:from:cc:subject:message-id;
  bh=wUF8AfVP3BQhMQpaxhV1uASfzgC4O3gmQhhmd2lT7so=;
  b=nj2Vs6zx2kHkauGpxq4qNBRLutAplYLmBqfjYIODnq4DGqsoYY1XNjdp
   Fd8ktKIbcgaJ5rJ306S9rfHalmN1ryD4aWrFXsUxIVPVbG9OX7L/4qOTc
   KMxb+oIIAZ3OFycEgbrTPJuEmXyuW5YYAGF2my1w5jjcX9X/idJMVPjqW
   HWovJoju604RsnSz+Fu+J0tHIU4OKNE8A0OvAHH9DJ1hBuxZcJ7mzUnkA
   kWBK7iKxVl0wRvEZkEF5RmTuoOtIY0VKooMyeh1TsDiB5hy0zn0gJlPQP
   KwKubaJ2xNjX7vcI71jTzEJm2lFusaHLvdujMjv6D3SyDv78Sd0w1uRay
   Q==;
X-CSE-ConnectionGUID: tQTcUfQuT/u9ZKBHyMA1EA==
X-CSE-MsgGUID: GqO5k2vARYSkMSWUO+rB+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87442103"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87442103"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 09:38:32 -0700
X-CSE-ConnectionGUID: 6fWOPkW2RdepTMG6Pk9qlw==
X-CSE-MsgGUID: Cj8eP7jNRtyBJ9ewAl/uwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="290397345"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Aug 2026 09:38:30 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwjJ5-00000000fnS-30lW;
	Wed, 19 Aug 2026 16:38:27 +0000
Date: Thu, 20 Aug 2026 00:38:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [geert-m68k:master 1282/1440]
 drivers/usb/host/isp116x.h:411:15: sparse: sparse: cast removes address space
 '__iomem' of expression
Message-ID: <202608200042.if81217K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
head:   430075db163607e33af279ef7e246e1a460c6293
commit: b971c823ecb945e93fbe49e98884e4ef9ee5e859 [1282/1440] Merge tag 'v5.8-rc2'
config: m68k-randconfig-r113-20260819 (https://download.01.org/0day-ci/archive/20260820/202608200042.if81217K-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608200042.if81217K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608200042.if81217K-lkp@intel.com/

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

4808a1c0261176f Olav Kongas     2005-04-09  406  
4808a1c0261176f Olav Kongas     2005-04-09  407  static inline u16 isp116x_read_data16(struct isp116x *isp116x)
4808a1c0261176f Olav Kongas     2005-04-09  408  {
4808a1c0261176f Olav Kongas     2005-04-09  409  	u16 val;
4808a1c0261176f Olav Kongas     2005-04-09  410  
2f0f9fcd96fa8db Michael Schmitz 2013-04-06 @411  	val = isp_readw(isp116x->data_reg);
4808a1c0261176f Olav Kongas     2005-04-09  412  	isp116x_delay(isp116x, 150);
4808a1c0261176f Olav Kongas     2005-04-09  413  	return val;
4808a1c0261176f Olav Kongas     2005-04-09  414  }
4808a1c0261176f Olav Kongas     2005-04-09  415  

:::::: The code at line 411 was first introduced by commit
:::::: 2f0f9fcd96fa8dbeec54cce98170985f7b384a41 m68k/atari: USB - add ISP1160 USB host controller support

:::::: TO: Michael Schmitz <schmitzmic@gmail.com>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
