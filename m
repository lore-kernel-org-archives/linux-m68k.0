Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793056906;
	b=Y9Ca2bPzoGTFDRnvRE+rYv0h5Kc6IFFVn9tI4aO/x9ZRBOZnALZaTIbhxkqEwNM6pb9K
	 TEcLUgueu9QueUq6JnZdzuO2ZnpfWiJorNOkCaP5/F/tU4At9gzfU3b/JSezf7xopp5Yg
	 0Lw0PycnajWKJEt8GH1uK/oj+bBy5hKFvYq2+fCB/ytuMOm4iOrw8BGDKCggGzeuyp0u1
	 wlaleRh/5dzqSfyOSKIiXupx4IojpQMhhwCK3tHWFDKooTg7UEzKAnhVv7ayV0khGZl0j
	 ACYidgLuICX+p6fdkLu9wCT+xC3GxvmdqVngjI3lCXAlEcMx6VtszbinkrF7Ydra9rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793056906;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=lUXtFRQhqiPepqkTKyLBRNYdBodXoTDi9P3S5dFT9PI=;
	b=JssEo78bXM70EGVT3OZiAAwIUnAkoSAP3GzvAGEe8F0yVQoIhYUKUPb1Vwo8V9jXV7Sr
	 NNMAbT76MwVWKgzfF4LKLLzf8cLLMCXXs9nbCrNEj1uFQZjxzD9liu6IhzhpPUsagTShu
	 VW2CwTXUo6O7tv1kSXchVRKLUob2OoypyENFq5ZoQbijYW7f4xGrktkyJ6LUNJKrYAOxB
	 YPeGmLXhmysi+p0tf1EWioRBvLTY2mPe5RxZkfSyxOn9csHi5IK2WKn4pQrY99BJPLA5A
	 2Vpq4ItunXwzI/ax8GXM9TaAIOsw+cyH7PgrEOAtRDir+qa4k+5wxxx0yezafB0uhiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BcoAmBU1;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711A3606A324
	for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Oct 2026 23:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 711A3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BcoAmBU1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793056904; x=1824592904;
  h=date:from:to:cc:subject:message-id;
  bh=xA0f7Jm3ixTeFfZFbKUz/Tscnuzkq+YL3Cl4VyaWsHw=;
  b=BcoAmBU1umt7fRoSFV9oocluDSq87XYo61CxtNJujwQ4AdKpNvU14HSE
   gvS1Hx0TRE21M50et2jn8G7cz98uHq8bHkeBP020XNrjYEumikTa4VPnO
   /fk85XFv+uKFrqLABxii9sJXd7046GOhR90q/9PXrfULbWRULGK1WjsyG
   4CJ4yY9Y1WjKzbWFcLvEUTd8SkzWCz+xIKcqP1+ykDMRCZvjYCUdHhwl8
   8d2Q9v4VPSItuVSAWj8FZUzAi+oPP68Di2bzbu2/5MLWbGzYdegeT6KFJ
   aRPhjBWqsM+yHh0w0asUY2OqfEaQRUuqMKU48uRjxxdp1OviDmd+lHo/G
   A==;
X-CSE-ConnectionGUID: Idw0S2nGSe2ijCnAcbkX1w==
X-CSE-MsgGUID: VU040EYBQ3GS5mVFaEQiFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1754511"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1754511"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 16:21:42 -0700
X-CSE-ConnectionGUID: ZZklRfkARNCj5AEBZz/tpQ==
X-CSE-MsgGUID: w3zXR+c+QMG8XQEa7amkYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4375404"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 26 Oct 2026 16:21:41 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLU0Y-000000004H5-1s8B;
	Mon, 26 Oct 2026 23:21:38 +0000
Date: Tue, 27 Oct 2026 00:21:23 +0100
From: kernel test robot <lkp@intel.com>
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [geert-m68k:m68k-v7.3 7/9]
 drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space
 '__iomem' of expression
Message-ID: <202610270050.HTmXvbun-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v7.3
head:   6f00fb3766acd32f628e484f407e8830cfe4e190
commit: e77b2e8535f06ce131f87d40b500ba4b9316c92f [7/9] m68k: atari: usb: Add ISP1160 USB host controller support
config: m68k-randconfig-r2302-20261026 (https://download.01.org/0day-ci/archive/20261027/202610270050.HTmXvbun-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270050.HTmXvbun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610270050.HTmXvbun-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/host/isp116x-hcd.c:135:55: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/usb/host/isp116x-hcd.c:135:55: sparse:     expected unsigned short [usertype] val
   drivers/usb/host/isp116x-hcd.c:135:55: sparse:     got restricted __le16 [usertype]
   drivers/usb/host/isp116x-hcd.c:181:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c:181:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c:181:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c:181:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c: note: in included file:
>> drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
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
>> drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
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
>> drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +410 drivers/usb/host/isp116x.h

   405	
   406	static inline u16 isp116x_read_data16(struct isp116x *isp116x)
   407	{
   408		u16 val;
   409	
 > 410		val = isp_readw(isp116x->data_reg);
   411		isp116x_delay(isp116x, 150);
   412		return val;
   413	}
   414	
   415	static inline u16 isp116x_raw_read_data16(struct isp116x *isp116x)
   416	{
   417		u16 val;
   418	
 > 419		val = isp_raw_readw(isp116x->data_reg);
   420		isp116x_delay(isp116x, 150);
   421		return val;
   422	}
   423	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
