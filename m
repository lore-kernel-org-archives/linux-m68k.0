Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794250499;
	b=WtpWGSdjcetwzIln3ewBYoxPDUgJErkolBVDJPTZT40nQsXs3CYuLN+4daJ6c60Gkdx0
	 tfn5NyoxHkr4TK7dYBufMSh3vaAf7yKYLXLZqp+G5Jd2EWPJGs8FyiHLdQMACqZScGoIe
	 kKRL1FF4vCQdK4IHHmf5T7FOhrHgI3PJ5abnTaO2UXa2FZNjHReFUV9r4Rd3++hWQvM7S
	 ek0YrhfYWvVLLcxODfVHCakbysZ/4pxlQLPHoUhLnmNe+nEtgGHVMgsDCUPLJl+NDAM7r
	 IccAKjFIiXLagOlQiXW0URK3L4SwGk0fLHFw57HhxfzNvyZ8x+Y1o/mGbQHXhkWkZuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250499;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qNWPO3ESfUz8h7cGcjF6BYoa7/aaGNqHks5OyiSdf+k=;
	b=dPm/2TBIXUKdSNXRoEIf3CbzRbI8BNm3wcnfuYnQwaAVUDhcNF8mJx9MCYtziRTe7HoH
	 fhBpsvedb2qEiE5qZuMoKYZJRCut5hzB7qsh6aip6B3/MLEWphwynCK/d6SgESaCt+fpI
	 GW3R547E5rZTDMdLDxw2CLcPZDilBZ6r6X/1o5YmvbO2Av+BgOC5yKcGvwX6c5v1i/YN/
	 wW45d2KW+/nyt+dGWGcxGEGZZ7J11M5XelDtK6/0jpgOmpUgLHCSzmMqRht8jCMjYBl9n
	 IBim8Z+gvCIkPOkjV7FFwTPJcyF2GzAxyiqmBPgQSwmlt80ZxarTzYHR0rBFMYpwFFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KMcGvjR+;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD41F606A31C
	for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Nov 2026 18:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD41F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KMcGvjR+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794250498; x=1825786498;
  h=date:from:to:cc:subject:message-id;
  bh=3kTd9Wzn67gmP1A88O6AXHennLcNWMoBZLsf5wJSMk4=;
  b=KMcGvjR+9M57QvKgi7WUuGOSkyTN5U8xSKUoIKI3N5VjQzpdR3QExyRI
   zKKFSw9aQRneJwl0ru+5cR9XIsZ+1jvbD+/Pdss7yHhfRAHlmMmiCld4d
   nwYO1Mf9O8RZyC9xXNcfsiE7LUf1MBshLhfPewDhHu6UJSMZ+OdurL8ZG
   S19ZWNrQ6+Ls+I9oAqvFkiKyjEF2o10XfYuElF5Grs3gI6F9WTrGrx8sC
   QRcp5wgWLEVIXz/TUXk4GXrOVzkvanGHwrFNE6VE1aj0Q4kXUB6BZ76cE
   y7HgAoyY9JI3f5BnyLuos/RdTxBxRs/LnU6tdCZZ0DY+Bf85e81ng+BE4
   Q==;
X-CSE-ConnectionGUID: cOExQYTgQbC10QMcRHXosw==
X-CSE-MsgGUID: sSKdh5YtRGe7c56VRtkEaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2883404"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2883404"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 10:54:58 -0800
X-CSE-ConnectionGUID: 1SURzrq+TZegSLZhJgEPRA==
X-CSE-MsgGUID: aRZ+yDFvSZqz6yf/R//6/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8086088"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 09 Nov 2026 10:54:53 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQUW2-000000000Rd-110X;
	Mon, 09 Nov 2026 18:54:50 +0000
Date: Mon, 09 Nov 2026 19:54:38 +0100
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:cpu-model 1/10]
 arch/m68k/kernel/setup_no.c:104:undefined reference to `m68k_cpumodel'
Message-ID: <202611091939.sdvxRq4x-lkp@intel.com>
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
config: m68k-randconfig-2200-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091939.sdvxRq4x-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091939.sdvxRq4x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091939.sdvxRq4x-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: arch/m68k/kernel/setup.o: in function `setup_arch':
>> arch/m68k/kernel/setup_no.c:104:(.init.text+0x6e): undefined reference to `m68k_cpumodel'
>> m68k-linux-ld: arch/m68k/kernel/setup_no.c:105:(.init.text+0x7a): undefined reference to `m68k_cpumodel'
>> m68k-linux-ld: arch/m68k/kernel/setup_no.c:106:(.init.text+0x80): undefined reference to `m68k_cpurevision'


vim +104 arch/m68k/kernel/setup_no.c

   101	
   102		process_uboot_commandline(&command_line[0], sizeof(command_line));
   103	
 > 104		if (m68k_cpumodel == NULL)
 > 105			m68k_cpumodel = CPU_NAME;
 > 106		if (m68k_cpurevision)
   107			sprintf(revstr, "revision=%ld", m68k_cpurevision);
   108		pr_info("CPU: %s (%s,noMMU) %s\n", m68k_cpumodel, CPU_FAMILY, revstr);
   109	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
