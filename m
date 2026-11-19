Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068586;
	b=dRLbkWSqz8nFJhkJBwH6PufP1pw4PolFBF2585JgBVVc92tl/QfT/ZH0UzZZXehFGzgU
	 JvJHs0eh1nkRxf8Q14VEJsTmW3cVBZzbwUPxICDxZPmmtUOh2mzacV2WCVa3fmOVQmtAq
	 +AhxXEbAdKJ8RN7MZ3EFmxuQIiXBz0c0PTBKhsNPbAML2hBpMZtZxYZsdOJTM3s+2Df6m
	 OcODs5cqZIk0BLJ597nfSkVWxLPS8eJIz7se3og2CmxgX5bwjEnsnN6SueGojhPHNL9vC
	 /YckifF6tRuz2xoppniYy4QkG8bQsl174qpWJY/pL/9dyCiLh1rGK9VdPwThgPHuWGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068586;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=s5D1lJQdk2Q750ENp58ZP1J44NtcwTLwzt/iRP7BF88=;
	b=NhirKiBc6vfmvlLR2ybeY9vYIfxFPw0bbk+Sb4T6aG/+b+8RZiwH1vUMTMY/3ypDDN9A
	 TY4o8cZsoh3g6bp3uKCI//ZBPaUDiTBXPWKm3oK1PKvOWaSzfI2wkr+x0Py2hrZd7M8yk
	 QYj6h9PHorj9H90hP9yPT26Sl8EY+RMm1hJvV7whJh+naHuNZSXpet+72fH4ftNdz2ox3
	 ZSojlXxJK5R2sg3GBPn5pi21rNnKDU0ij2PoEej+b+Lv2tddxWFwupUgzxyWWtRBIm0ua
	 niIzqjvrMQeKbWOEKpMZzwLY9zR4EpfSt1TNRVv4HVR4ky+daeSX6gU0jWLSPD894Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gGbuQoB4;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428DF606A326
	for <linux-m68k@lists.linux-m68k.org>; Thu, 19 Nov 2026 06:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 428DF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gGbuQoB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795068586; x=1826604586;
  h=date:from:to:cc:subject:message-id;
  bh=As7C/2WHu7Yv83kx3RjGPKKEWSdWZiyWDpI7VrO88Ak=;
  b=gGbuQoB4MBT4W0qsxzALKk165N22B+weWdBqyvzepdhJ0FeZynGAqaFY
   haEL/lKqJLIIyGyOINtRhNgQcGL0Q6uyd8OmRYFCJWE7O9xNTynVq7gBJ
   +Nfy8f/HuK/iPoiQ/o2+e55m7AVEL6+wRsuwe58Sdbbe6OLYl5im04Ixn
   QQ12mQPpPHW1wpM97ik4B9ZaoquDWg/TqucpsiX82T0l+gNjC4Cbbop+y
   +nElYF6RxfeLNaeMfo3q9A7H8v8LLgYKYnIo4+DfVHOAatyh7s5MaqrL4
   lY7c7fwS8B7lp4v50W39cv8uOmm+brQpt/gR5yZ+ajA7rUX2P8a6DwxwB
   A==;
X-CSE-ConnectionGUID: qEm6+CkzS1Gciert9pjszQ==
X-CSE-MsgGUID: MSeYEpYlS7+EyGyTbj2QRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3898080"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3898080"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 22:09:45 -0800
X-CSE-ConnectionGUID: WzqGxOkoTHSCj6Vpzhr7QQ==
X-CSE-MsgGUID: 39JhtGA+QjG99SXV54kc5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10246192"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 18 Nov 2026 22:09:43 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTvL2-000000003gT-2xuD;
	Thu, 19 Nov 2026 06:09:40 +0000
Date: Thu, 19 Nov 2026 07:08:52 +0100
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:cpu-model 3/10]
 arch/m68k/coldfire/m523x.c:93:13: error: implicit declaration of function
 'MCFCIR'; did you mean 'MCF_CIR'?
Message-ID: <20261119070741.Az2SiBZu-lkp@intel.com>
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
head:   bdf44b7b88a06b5bfcef4a4a64b9baa63b9a6646
commit: 08bb06f5e742469237cc22d7571e443ff5272187 [3/10] m68knommu: probe CPU identity for ColdFire 523x types
config: m68k-randconfig-2000-20261119 (https://download.01.org/0day-ci/archive/20261119/20261119070741.Az2SiBZu-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119070741.Az2SiBZu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119070741.Az2SiBZu-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/m68k/coldfire/m523x.c: In function 'm523x_probe_cpu':
>> arch/m68k/coldfire/m523x.c:93:13: error: implicit declaration of function 'MCFCIR'; did you mean 'MCF_CIR'? [-Wimplicit-function-declaration]
      93 |         if (MCFCIR(v) == MCFCIR_5235)
         |             ^~~~~~
         |             MCF_CIR


vim +93 arch/m68k/coldfire/m523x.c

    87	
    88	static void __init m523x_probe_cpu(void)
    89	{
    90		u16 v;
    91	
    92		v = mcf_read16(MCF_CIR);
  > 93		if (MCFCIR(v) == MCFCIR_5235)
    94			m68k_cpumodel = "5235";
    95		else
    96			m68k_cpumodel = "523x";
    97		m68k_cpurevision = MCFCIR_PRN(v);
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
