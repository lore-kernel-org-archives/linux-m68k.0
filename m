Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251220;
	b=3tpLOUcJbCwiPGZNMxlQiv7LfjdHdvNXD5m1qmC4SqUlfqeprLvOoRl1V28XiDPHbu8R
	 3WtvFWgvwc4cs9NnV7tgp3PZxtchXAjenZZ4zllmdqzmezxzKmCkZZZDmeQdUKBywx58p
	 mW9/rk+eXkfG8eSom3AEi0R8hC2g4FcdS/JzrQcpfL2JOWrRlVF5CyWDl3YzTzUzonGDT
	 J373B9kA+fbbHFu9XLmdE8ZmUVJf1HTDtONU2DD6jpCkEWktoJuH9pY6ht5xlfX45fwrt
	 1IvBKj9nsGXgM5UjHi/HYCP44u2qklg7/b6ZkVYheyUN49/LYVnUueIPILY2uuUW7dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251220;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xY6OTPYc49ZkYpG+lHtAjzsBl/VdixyfeUWIMuRNcB8=;
	b=KQUMmxyo9Ux9XQb2WX3iseJxVCMyfaNGny//gRESOX2yM/dZQQp6N/t90DcNBRulfyMB
	 eDICvhnkz0OAyvkluzFW1Uq6KmHJnO+TTI7bzMFJUO0DCTDGZILJqPJPHqSVXnALlxUFo
	 TByCeoZp6Y9hkhOhNf5aoNO7Ee5SvT4HU0iAe7dw41GNN5jVYmXcE5w/mofsRH7a0j6CX
	 pzt4l2o4Yz2sAIpdybREThPeUmsQaLUq/j01i9G4ULx5uWVxemCcmGM8LlqtAAoWW69fY
	 kQ+uHI9h8Eh3rPxsGC3UURSwwt2Mwzt63gUW1WfP+LHWjRt904wLkzqP2Hf7MnfDGRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H8fo3Qx3;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0465606A325
	for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Nov 2026 19:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0465606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H8fo3Qx3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794251219; x=1825787219;
  h=date:from:to:cc:subject:message-id;
  bh=tFBkX3D80gVKiWe9dfHWT57ObqAghSHuR4IVVq/G0FA=;
  b=H8fo3Qx3zmXVBJwtF4GpCAJwLanwTsA9IhauP5CJ32NhpttesBJYFYHn
   96IGRY0ZV3bV1UADkcZk7O3x8McBLDoW/BHe0AjkxyqHJmyA8VJ53SJam
   Ruoafndzo68r2InPM1pM0TzIuYCkGH+p4Qnuqw70Twbn2uMuPg8yRhtUc
   xAgtc29QjHOEYoI7LrZhFn8hjJcaiTUWNR8mtmvtRP13Bu9v5SCje0hCe
   ODhGR0+pqTNeggACVr6cRxBPzNZwskf53GZ032bBxZTQUlNqeDI08hWb5
   QCqHQTc44huMTutMwWggOy89mkPlzFfvm6whGiTtiEL8aroEv6a29XOPl
   Q==;
X-CSE-ConnectionGUID: CPGvX8baTbih+x/PttGQ8g==
X-CSE-MsgGUID: LTGeGeLxSwO9/qYJLnEgYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2996755"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2996755"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 11:06:58 -0800
X-CSE-ConnectionGUID: cXpf6oyQQZKzwgM2E4C5sw==
X-CSE-MsgGUID: rRvhV3PHQuq0zUNWMUB3qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7962822"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 09 Nov 2026 11:06:54 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQUhf-000000000Rz-3sXf;
	Mon, 09 Nov 2026 19:06:51 +0000
Date: Mon, 09 Nov 2026 20:06:01 +0100
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:cpu-model 1/10] setup.c:undefined reference
 to `m68k_cpumodel'
Message-ID: <202611092059.OidEaf8N-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git cpu-model
head:   6217ad6f81c95c3046e6d406734dfdbf2aa85542
commit: d034e5f2c808aebe347eb33720e5a9937d6395c3 [1/10] m68k: support reporting CPU model name and revision
config: m68k-randconfig-2001-20261109 (https://download.01.org/0day-ci/archive/20261109/202611092059.OidEaf8N-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611092059.OidEaf8N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611092059.OidEaf8N-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: arch/m68k/kernel/setup.o: in function `show_cpuinfo':
>> setup.c:(.text+0x11e): undefined reference to `m68k_cpumodel'
>> m68k-linux-ld: setup.c:(.text+0x13a): undefined reference to `m68k_cpurevision'
   m68k-linux-ld: arch/m68k/kernel/setup.o: in function `setup_arch':
>> setup.c:(.init.text+0x86): undefined reference to `m68k_cpumodel'
>> m68k-linux-ld: setup.c:(.init.text+0x92): undefined reference to `m68k_cpumodel'
>> m68k-linux-ld: setup.c:(.init.text+0x98): undefined reference to `m68k_cpurevision'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
