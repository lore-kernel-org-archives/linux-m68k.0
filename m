Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096415;
	b=rnpIjWzO0q5M6pN2cI66qFy5ps34f7D4xisXhWFlDNt2+CG6ODd0QgJU68Zh6dB+gLsT
	 Gh747HbjOYcBrD7Vxsr6bXPk8EbTIlyX3LrEBAeEH0BrrjupleVHhQPZboqRg1TJhPKm3
	 AxNkPu0ezgIAEHW3wfPqHtS4KiV4D2BA3N+shnNCzNCmO/2eX+Q0/7v2X8EodmzAjXs7C
	 O/CyUMzEtBeMNyrn6XnBl8fCdDu+UGxbGRjLbuRl/4kktk+7Vpph3QYdyH6TEmGU78AXH
	 wqPoK6eDlodb/sYMfkilsu70UQO2e2p1Al4mfvpX9S1LIncGvQgVkjCBI3K70OCPFnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096415;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9oe/JBtKKj7SocfDrjrIX3ii6dLDKm+aV9t1tB4LABw=;
	b=4SFIJznaMoigsw7iISdQHk4PbHiNts5ODyPtwWgQlK/6poaQj8Pv9Gg3uuKhLFaDOWbo
	 ed0Xv7H6eNp+29/PKmKs9LmPoX4EBEDNN+69PEkZF2kMcGe5jXu61GA9nJPJgPn1eSHlm
	 2PR1TpI9TS2brERnxubLQBbEzBcopZ1msY95qLAw2F0rLBB47EjEoHDTtLnTDn/sDI/oC
	 4yxt03qjCA9rqmmAYZHRkTZjgthX3zmmKKUUuCSWTiPjHa7Sz7jhD4ZG0VwXarUfnOyAb
	 FU2iiYagutKH2HMMYCrsfF1+BxV1Ne4+zSPgjg4GUncqm0WDWlvI16T5CfFj2MpbfXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kBMiDHA4;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE8F606A339
	for <linux-m68k@lists.linux-m68k.org>; Thu, 19 Nov 2026 13:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CE8F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kBMiDHA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795096415; x=1826632415;
  h=date:from:to:cc:subject:message-id;
  bh=h3dGqMeyPrKcbFvfOqKcCTAfgbF85JQVdnEpVNYqeUk=;
  b=kBMiDHA4CQ7xltUKUmZf8Nr47faJEuoBMehI2b+x2pFVsa5Zq8Ob1Xiv
   hvhg71zJOhMIJSbPy8HhIr97+WHrUsCNhaabDkrUy5zR7H2/Onk1hfB2F
   Ez01A+tXwjva9X63Ti3XRSszxlAiASQpFYr5bJ/Pl3GcRlzvn3o72ebCM
   PUsLgEDT/cFSa5I+JhlnNk0vkXbdEFkcHWZ4Bmq1Hz1TXGvLZuTMXFRbt
   6o6Uxo6Kdp48ecXBfReFvCNa0RL3KbSRgmCOkTtMb0yfEvNtZOvA0BlSe
   ywWIWZiCS6G1INGAhNk4P99MLvS54o0N1bgJoHRvNxTywz4oBcNCVdMnm
   g==;
X-CSE-ConnectionGUID: P4hBQuKrRoi5ab2EqGP6hQ==
X-CSE-MsgGUID: 5gKRygNQQPqjjav+k28Wng==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3865429"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3865429"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 05:53:34 -0800
X-CSE-ConnectionGUID: T1ZzZVADT+uMaFFWiAfeXg==
X-CSE-MsgGUID: pvWpWLPITsCWOaq3CF+/+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10330173"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 19 Nov 2026 05:53:31 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU2Zr-000000003mx-0m6b;
	Thu, 19 Nov 2026 13:53:27 +0000
Date: Thu, 19 Nov 2026 14:53:14 +0100
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@uclinux.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3]
 arch/arm/mm/alignment.c:799:25: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <20261119144827.LKUSrqya-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   956b02be1acd82a724269d0fc12ed4fe0f940172
commit: 956b02be1acd82a724269d0fc12ed4fe0f940172 [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-r2307-20261119 (https://download.01.org/0day-ci/archive/20261119/20261119144827.LKUSrqya-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119144827.LKUSrqya-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119144827.LKUSrqya-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm/mm/alignment.c:799:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned int [usertype] *ip @@
   arch/arm/mm/alignment.c:799:25: sparse:     expected void const volatile [noderef] __user *ptr
   arch/arm/mm/alignment.c:799:25: sparse:     got unsigned int [usertype] *ip
>> arch/arm/mm/alignment.c:814:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned short [usertype] *ip @@
   arch/arm/mm/alignment.c:814:25: sparse:     expected void const volatile [noderef] __user *ptr
   arch/arm/mm/alignment.c:814:25: sparse:     got unsigned short [usertype] *ip

vim +799 arch/arm/mm/alignment.c

c2860d43f5dfab George G. Davis   2009-06-04  792  
1bb9fb0a147f9d Russell King      2019-09-06  793  static int alignment_get_arm(struct pt_regs *regs, u32 *ip, u32 *inst)
67e15fa5b487ad Russell King      2019-08-31  794  {
67e15fa5b487ad Russell King      2019-08-31  795  	u32 instr = 0;
67e15fa5b487ad Russell King      2019-08-31  796  	int fault;
67e15fa5b487ad Russell King      2019-08-31  797  
67e15fa5b487ad Russell King      2019-08-31  798  	if (user_mode(regs))
67e15fa5b487ad Russell King      2019-08-31 @799  		fault = get_user(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  800  	else
25f12ae45fc193 Christoph Hellwig 2020-06-17  801  		fault = get_kernel_nofault(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  802  
67e15fa5b487ad Russell King      2019-08-31  803  	*inst = __mem_to_opcode_arm(instr);
67e15fa5b487ad Russell King      2019-08-31  804  
67e15fa5b487ad Russell King      2019-08-31  805  	return fault;
67e15fa5b487ad Russell King      2019-08-31  806  }
67e15fa5b487ad Russell King      2019-08-31  807  
67e15fa5b487ad Russell King      2019-08-31  808  static int alignment_get_thumb(struct pt_regs *regs, u16 *ip, u16 *inst)
67e15fa5b487ad Russell King      2019-08-31  809  {
67e15fa5b487ad Russell King      2019-08-31  810  	u16 instr = 0;
67e15fa5b487ad Russell King      2019-08-31  811  	int fault;
67e15fa5b487ad Russell King      2019-08-31  812  
67e15fa5b487ad Russell King      2019-08-31  813  	if (user_mode(regs))
67e15fa5b487ad Russell King      2019-08-31 @814  		fault = get_user(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  815  	else
25f12ae45fc193 Christoph Hellwig 2020-06-17  816  		fault = get_kernel_nofault(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  817  
67e15fa5b487ad Russell King      2019-08-31  818  	*inst = __mem_to_opcode_thumb16(instr);
67e15fa5b487ad Russell King      2019-08-31  819  
67e15fa5b487ad Russell King      2019-08-31  820  	return fault;
67e15fa5b487ad Russell King      2019-08-31  821  }
67e15fa5b487ad Russell King      2019-08-31  822  

:::::: The code at line 799 was first introduced by commit
:::::: 67e15fa5b487adb9b78a92789eeff2d6ec8f5cee ARM: mm: fix alignment handler faults under memory pressure

:::::: TO: Russell King <rmk+kernel@armlinux.org.uk>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
