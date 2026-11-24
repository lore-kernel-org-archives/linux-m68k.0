Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502793;
	b=l5tF+W8QPYY2ORxqonZyHqRhSGSULRjSNGzd/78vQGegw3CL8E/dw9joqW1Erfx2+fSh
	 /8LJvKIXJWHfb4Xm36Q7B0ksPLKEwRGH9JgpY12+9Lhpc3OJY8mFXWxEKPEHG1wvZ0cS1
	 hM9dKZsL6VBAL7fJJgQbdpE42eBY/APn2Y2ZQXowlftRcVdFJ7tKNoKQ6YA32qm3NeypP
	 Tfr1pr/7PqSfyc8ud14SP0Nlz1vFMnJ+vWcQaawvqFIjEMs0Ulr0FXleObIiGK/SXuyTS
	 N+8CmQxqBoDW1HgxKnzFIE5gXklvWfCRp25uNhbLMD2bvC5jiuKfRksKRyi/HnCpM/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502793;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XbuhtLDGWtkTKSxH3CBrk0Cq5zfTSoik3PKv4+igocU=;
	b=AsFzYrrj7DqcJZDm+BmzG5ds8aPp03st+wvF8anxDvYNS56p150E0cv9ma+M3V/frw+V
	 fZHQpVfMxFAffJ6oV7iFpleSwWO2pBqsrVrVMonsqGFboYVRYnGeAeZq4tCVL2BFygtSN
	 kwoNum6i1hACBl8guhIa8awq7jUCDuNS4xYOD/PXOPoBE6XtNlk7aytljfNbSOuvJ20Nr
	 LgqBHlNBlKn8c22WulW0bfPK0/1kCFGxGVJYUSsbTiAhA7huKF5bWLlCAoLzV95es23Gz
	 cjNPrdTQIzdjTpRzgOpqdHTxkHhFcHehin+2UH8xg5NCyNDA0eE+SgrxI+H9Dkdvs5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VHlNGT7T;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC73606A321
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Nov 2026 06:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC73606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VHlNGT7T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795502793; x=1827038793;
  h=date:from:to:cc:subject:message-id;
  bh=YG//nTXA3njp07OuK1vXcGDe/ZI5jOQ3emvKzRO6HCM=;
  b=VHlNGT7TcClUAEKT9jom0l+5qqfRm8PE3wJ9WIkn+4cV4gw5YdVTxJrI
   fgInCUsM8H+ovwE9ZorqFKfmVln1F009QlxSUsGlVsbY/zoISy0v1/bMm
   Yc4UZo/pMhtXfw/gJrxlcFzoUOIrUEjb4Nn8Xy1aGdHiL1Q9WM8TrBCO2
   I24L2j6zNqz45IezJBJqFRjyqrfdEU1+zExK/Pz+4IRsquJBvW8ZyQWUZ
   qgtxi9nEfMV+8KxilqcYiC2FWMwYqdFR1Jt3/GmDXxdvnLeJS49I/qyaP
   9ghvWcb6xhPeudM/MCa7+lRRjkyZhxqft/AuhZd6An3jPy2JNtcpwTYCR
   Q==;
X-CSE-ConnectionGUID: DdIpLKFBTtWJmoo8C3Iwtg==
X-CSE-MsgGUID: ACboOnizTy2sc5+JNC417Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4374444"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4374444"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 22:46:32 -0800
X-CSE-ConnectionGUID: CeWQDonLQhar5LkAOV8rsQ==
X-CSE-MsgGUID: 3rJWW/hATNaKTLG5QKvMlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11517317"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Nov 2026 22:46:30 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVkIO-00000001OfQ-0iFR;
	Tue, 24 Nov 2026 06:46:28 +0000
Date: Tue, 24 Nov 2026 14:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 f1fb947de237fb817617e6f3210c7288956d906d
Message-ID: <20261124144627.tb52SpXF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: f1fb947de237fb817617e6f3210c7288956d906d  Merge tag 'v7.4-rc4'

elapsed time: 853m

configs tested: 599
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261123    gcc-8.5.0
alpha                 randconfig-2000-20261124    gcc-11.5.0
alpha                 randconfig-2001-20261123    gcc-8.5.0
alpha                 randconfig-2001-20261124    gcc-11.5.0
alpha                 randconfig-2200-20261123    gcc-12.5.0 smatch
alpha                randconfig-r2106-20261123    gcc-14.4.0 cocci
alpha                randconfig-r2107-20261123    gcc-13.5.0 cocci
alpha                randconfig-r2111-20261123    gcc-8.5.0  cocci
alpha                randconfig-r2300-20261124    clang-24   sparse
alpha                randconfig-r2301-20261123    gcc-11.5.0 sparse
alpha                randconfig-r2302-20261123    gcc-8.5.0  sparse
alpha                randconfig-r2303-20261123    gcc-14.4.0 sparse
alpha                randconfig-r2304-20261123    gcc-8.5.0  sparse
alpha                randconfig-r2305-20261123    gcc-11.5.0 sparse
alpha                randconfig-r2310-20261123    gcc-10.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                       axs103_smp_defconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261124    clang-24
arc                   randconfig-1001-20261124    clang-24
arc                   randconfig-2000-20261123    gcc-12.5.0
arc                   randconfig-2001-20261123    gcc-12.5.0
arc                   randconfig-2002-20261123    gcc-12.5.0
arc                   randconfig-2003-20261123    gcc-12.5.0
arc                   randconfig-2004-20261123    gcc-12.5.0
arc                   randconfig-2005-20261123    gcc-12.5.0
arc                   randconfig-2200-20261123    gcc-12.5.0 smatch
arc                   randconfig-2200-20261124    gcc-8.5.0  smatch
arc                  randconfig-r2102-20261123    gcc-8.5.0  cocci
arc                  randconfig-r2104-20261123    gcc-8.5.0  cocci
arc                  randconfig-r2108-20261123    clang-20   cocci
arc                  randconfig-r2108-20261124    clang-24   cocci
arc                  randconfig-r2109-20261123    clang-20   cocci
arc                  randconfig-r2109-20261123    gcc-15.3.0 cocci
arc                  randconfig-r2109-20261123    gcc-8.5.0  cocci
arc                  randconfig-r2300-20261123    gcc-11.5.0 sparse
arc                  randconfig-r2306-20261123    clang-24   sparse
arc                  randconfig-r2308-20261123    gcc-13.5.0 sparse
arc                  randconfig-r2309-20261123    clang-22   sparse
arc                  randconfig-r2310-20261123    gcc-13.5.0 sparse
arc                  randconfig-r2310-20261123    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          at91_dt_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                           ep93xx_defconfig    clang-24
arm                       footbridge_defconfig    clang-24
arm                         mvebu_v5_defconfig    clang-24
arm                   randconfig-1000-20261124    clang-24
arm                   randconfig-1001-20261124    clang-24
arm                   randconfig-1002-20261124    clang-24
arm                   randconfig-1003-20261124    clang-24
arm                   randconfig-2000-20261123    gcc-8.5.0
arm                   randconfig-2001-20261123    gcc-8.5.0
arm                   randconfig-2002-20261123    gcc-8.5.0
arm                   randconfig-2200-20261123    gcc-8.5.0  smatch
arm                   randconfig-2200-20261124    clang-17   smatch
arm                  randconfig-r2100-20261123    gcc-8.5.0  cocci
arm                  randconfig-r2101-20261123    gcc-14.4.0 cocci
arm                  randconfig-r2101-20261123    gcc-8.5.0  cocci
arm                  randconfig-r2103-20261123    gcc-8.5.0  cocci
arm                  randconfig-r2105-20261123    gcc-14.4.0 cocci
arm                  randconfig-r2106-20261123    clang-20   cocci
arm                  randconfig-r2106-20261123    gcc-8.5.0  cocci
arm                  randconfig-r2305-20261123    gcc-9.5.0  sparse
arm                  randconfig-r2306-20261123    clang-24   sparse
arm                  randconfig-r2308-20261123    clang-24   sparse
arm                  randconfig-r2309-20261123    clang-24   sparse
arm                          s5pv210_defconfig    clang-24
arm                         spear3xx_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261124    gcc-8.5.0
arm64                 randconfig-1001-20261124    gcc-8.5.0
arm64                 randconfig-1002-20261124    gcc-8.5.0
arm64                 randconfig-1003-20261124    gcc-8.5.0
arm64                 randconfig-2000-20261123    gcc-8.5.0
arm64                 randconfig-2001-20261123    gcc-8.5.0
arm64                 randconfig-2002-20261123    gcc-8.5.0
arm64                 randconfig-2200-20261123    clang-17   smatch
arm64                randconfig-r2100-20261123    gcc-8.5.0  cocci
arm64                randconfig-r2101-20261123    gcc-8.5.0  cocci
arm64                randconfig-r2103-20261123    gcc-8.5.0  cocci
arm64                randconfig-r2107-20261123    clang-17   cocci
arm64                randconfig-r2109-20261123    clang-17   cocci
arm64                randconfig-r2300-20261123    clang-24   sparse
arm64                randconfig-r2300-20261123    gcc-13.5.0 sparse
arm64                randconfig-r2301-20261123    gcc-14     sparse
arm64                randconfig-r2303-20261123    gcc-8.5.0  sparse
arm64                randconfig-r2306-20261123    gcc-10.5.0 sparse
arm64                randconfig-r2309-20261123    gcc-13.5.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261124    gcc-8.5.0
csky                  randconfig-1001-20261124    gcc-8.5.0
csky                  randconfig-2000-20261123    gcc-12.5.0
csky                  randconfig-2001-20261123    gcc-12.5.0
csky                  randconfig-2200-20261123    gcc-16.2.0 smatch
csky                  randconfig-2200-20261124    gcc-15.3.0 smatch
csky                 randconfig-r2102-20261124    clang-24   cocci
csky                 randconfig-r2105-20261123    gcc-8.5.0  cocci
csky                 randconfig-r2107-20261123    gcc-8.5.0  cocci
csky                 randconfig-r2108-20261123    gcc-16.2.0 cocci
csky                 randconfig-r2111-20261123    clang-17   cocci
csky                 randconfig-r2306-20261123    clang-22   sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261124    gcc-10.5.0
hexagon               randconfig-1001-20261124    gcc-10.5.0
hexagon               randconfig-2000-20261123    gcc-12.5.0
hexagon               randconfig-2001-20261123    gcc-12.5.0
hexagon               randconfig-2200-20261123    clang-24   smatch
hexagon               randconfig-2200-20261124    clang-24   smatch
hexagon              randconfig-r2100-20261123    gcc-8.5.0  cocci
hexagon              randconfig-r2105-20261123    gcc-8.5.0  cocci
hexagon              randconfig-r2105-20261124    clang-24   cocci
hexagon              randconfig-r2107-20261123    clang-20   cocci
hexagon              randconfig-r2300-20261123    gcc-14.4.0 sparse
hexagon              randconfig-r2301-20261123    clang-24   sparse
hexagon              randconfig-r2302-20261124    clang-24   sparse
hexagon              randconfig-r2307-20261123    clang-24   sparse
hexagon              randconfig-r2309-20261123    gcc-12.5.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261124    gcc-12
i386        buildonly-randconfig-1001-20261124    gcc-12
i386        buildonly-randconfig-1002-20261124    gcc-12
i386        buildonly-randconfig-1003-20261124    gcc-12
i386        buildonly-randconfig-1004-20261124    gcc-12
i386        buildonly-randconfig-1005-20261124    gcc-12
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261124    gcc-14
i386                  randconfig-1001-20261124    gcc-14
i386                  randconfig-1002-20261124    gcc-14
i386                  randconfig-1003-20261124    gcc-14
i386                  randconfig-1004-20261124    gcc-14
i386                  randconfig-1005-20261124    gcc-14
i386                  randconfig-1006-20261124    gcc-14
i386                  randconfig-2000-20261123    gcc-14
i386                  randconfig-2000-20261124    gcc-14
i386                  randconfig-2001-20261123    gcc-14
i386                  randconfig-2001-20261124    gcc-14
i386                  randconfig-2002-20261123    gcc-14
i386                  randconfig-2002-20261124    gcc-14
i386                  randconfig-2003-20261123    gcc-14
i386                  randconfig-2003-20261124    gcc-14
i386                  randconfig-2004-20261123    gcc-14
i386                  randconfig-2004-20261124    gcc-14
i386                  randconfig-2005-20261123    gcc-14
i386                  randconfig-2005-20261124    gcc-14
i386                  randconfig-2100-20261123    clang-22   cocci
i386                  randconfig-2101-20261123    clang-22   cocci
i386                  randconfig-2102-20261123    clang-22   cocci
i386                  randconfig-2103-20261123    clang-22   cocci
i386                  randconfig-2104-20261123    clang-22   cocci
i386                  randconfig-2105-20261123    clang-22   cocci
i386                  randconfig-2200-20261123    gcc-14     smatch
i386                  randconfig-2200-20261124    clang-22   smatch
i386                  randconfig-2300-20261123    gcc-14     sparse
i386                  randconfig-2300-20261124    gcc-14     sparse
i386                  randconfig-2301-20261123    gcc-14     sparse
i386                  randconfig-2301-20261124    gcc-14     sparse
i386                  randconfig-2302-20261123    gcc-14     sparse
i386                  randconfig-2302-20261124    gcc-14     sparse
i386                 randconfig-r2100-20261123    gcc-14     cocci
i386                 randconfig-r2104-20261123    gcc-14     cocci
i386                 randconfig-r2104-20261123    gcc-8.5.0  cocci
i386                 randconfig-r2106-20261123    clang-20   cocci
i386                 randconfig-r2108-20261123    gcc-8.5.0  cocci
i386                 randconfig-r2110-20261123    gcc-13.5.0 cocci
i386                 randconfig-r2300-20261123    gcc-8.5.0  sparse
i386                 randconfig-r2305-20261123    clang-24   sparse
i386                 randconfig-r2309-20261123    clang-24   sparse
i386                 randconfig-r2310-20261123    clang-22   sparse
i386                 randconfig-r2310-20261123    clang-24   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261124    gcc-10.5.0
loongarch             randconfig-1001-20261124    gcc-10.5.0
loongarch             randconfig-2000-20261123    gcc-16.2.0
loongarch             randconfig-2000-20261124    clang-18
loongarch             randconfig-2001-20261123    gcc-16.2.0
loongarch             randconfig-2001-20261124    clang-18
loongarch             randconfig-2200-20261123    clang-24   smatch
loongarch            randconfig-r2100-20261123    gcc-14     cocci
loongarch            randconfig-r2100-20261123    gcc-8.5.0  cocci
loongarch            randconfig-r2101-20261124    clang-24   cocci
loongarch            randconfig-r2104-20261123    gcc-12.5.0 cocci
loongarch            randconfig-r2106-20261123    clang-17   cocci
loongarch            randconfig-r2108-20261123    clang-17   cocci
loongarch            randconfig-r2108-20261123    clang-20   cocci
loongarch            randconfig-r2109-20261123    gcc-13.5.0 cocci
loongarch            randconfig-r2302-20261123    gcc-11.5.0 sparse
loongarch            randconfig-r2302-20261123    gcc-14     sparse
loongarch            randconfig-r2302-20261123    gcc-14.4.0 sparse
loongarch            randconfig-r2305-20261123    gcc-8.5.0  sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                           atari_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    clang-24
m68k                        m5235evb_defconfig    clang-24
m68k                       m54418evb_defconfig    gcc-16.2.0
m68k                        m5475evb_defconfig    clang-17
m68k                  randconfig-2000-20261123    gcc-8.5.0
m68k                  randconfig-2000-20261124    gcc-11.5.0
m68k                  randconfig-2001-20261123    gcc-8.5.0
m68k                  randconfig-2001-20261124    gcc-11.5.0
m68k                  randconfig-2200-20261123    gcc-8.5.0  smatch
m68k                  randconfig-2200-20261124    gcc-10.5.0 smatch
m68k                 randconfig-r2100-20261123    gcc-8.5.0  cocci
m68k                 randconfig-r2101-20261123    gcc-12.5.0 cocci
m68k                 randconfig-r2101-20261123    gcc-8.5.0  cocci
m68k                 randconfig-r2102-20261123    gcc-12.5.0 cocci
m68k                 randconfig-r2102-20261123    gcc-8.5.0  cocci
m68k                 randconfig-r2103-20261123    gcc-12.5.0 cocci
m68k                 randconfig-r2303-20261123    clang-24   sparse
m68k                 randconfig-r2303-20261123    gcc-14     sparse
m68k                 randconfig-r2303-20261123    gcc-14.4.0 sparse
m68k                 randconfig-r2304-20261123    gcc-14.4.0 sparse
m68k                 randconfig-r2305-20261123    gcc-13.5.0 sparse
m68k                 randconfig-r2305-20261123    gcc-8.5.0  sparse
m68k                 randconfig-r2307-20261123    gcc-8.5.0  sparse
m68k                 randconfig-r2308-20261123    clang-22   sparse
m68k                 randconfig-r2308-20261123    gcc-10.5.0 sparse
m68k                 randconfig-r2308-20261123    gcc-14     sparse
m68k                 randconfig-r2309-20261123    gcc-8.5.0  sparse
m68k                 randconfig-r2310-20261123    gcc-12.5.0 sparse
m68k                            sun3_defconfig    clang-17
m68k                            sun3_defconfig    gcc-16.2.0
microblaze                        alldefconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261123    gcc-8.5.0
microblaze            randconfig-2000-20261124    gcc-11.5.0
microblaze            randconfig-2001-20261124    gcc-11.5.0
microblaze            randconfig-2200-20261123    gcc-16.2.0 smatch
microblaze           randconfig-r2103-20261123    gcc-8.5.0  cocci
microblaze           randconfig-r2105-20261123    gcc-8.5.0  cocci
microblaze           randconfig-r2110-20261123    clang-17   cocci
microblaze           randconfig-r2301-20261123    gcc-8.5.0  sparse
microblaze           randconfig-r2302-20261123    clang-24   sparse
microblaze           randconfig-r2304-20261123    clang-24   sparse
microblaze           randconfig-r2306-20261123    gcc-12.5.0 sparse
microblaze           randconfig-r2309-20261123    gcc-10.5.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                          cobalt_defconfig    clang-24
mips                          db1xxx_defconfig    gcc-16.2.0
mips                     maltaup_xpa_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261123    gcc-10.5.0
mips                  randconfig-2000-20261124    gcc-16.2.0
mips                  randconfig-2001-20261123    gcc-10.5.0
mips                  randconfig-2001-20261124    gcc-16.2.0
mips                  randconfig-2002-20261123    gcc-10.5.0
mips                  randconfig-2002-20261124    gcc-16.2.0
mips                  randconfig-2200-20261123    gcc-14.4.0 smatch
mips                 randconfig-r2102-20261123    gcc-14     cocci
mips                 randconfig-r2103-20261123    gcc-8.5.0  cocci
mips                 randconfig-r2107-20261124    clang-24   cocci
mips                 randconfig-r2301-20261123    gcc-8.5.0  sparse
mips                 randconfig-r2304-20261123    gcc-11.5.0 sparse
mips                 randconfig-r2304-20261123    gcc-13.5.0 sparse
mips                 randconfig-r2311-20261123    clang-22   sparse
mips                 randconfig-r2311-20261123    gcc-12.5.0 sparse
mips                 randconfig-r2311-20261123    gcc-8.5.0  sparse
mips                            rs90_defconfig    gcc-16.2.0
mips                            xway_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261124    gcc-10.5.0
nios2                 randconfig-1001-20261124    gcc-10.5.0
nios2                 randconfig-2000-20261123    gcc-16.2.0
nios2                 randconfig-2000-20261124    clang-18
nios2                 randconfig-2001-20261123    gcc-16.2.0
nios2                 randconfig-2001-20261124    clang-18
nios2                 randconfig-2200-20261123    gcc-8.5.0  smatch
nios2                randconfig-r2102-20261123    gcc-8.5.0  cocci
nios2                randconfig-r2103-20261124    clang-24   cocci
nios2                randconfig-r2106-20261123    gcc-13.5.0 cocci
nios2                randconfig-r2106-20261123    gcc-15.3.0 cocci
nios2                randconfig-r2109-20261123    clang-20   cocci
nios2                randconfig-r2110-20261123    gcc-16.2.0 cocci
nios2                randconfig-r2300-20261123    gcc-9.5.0  sparse
nios2                randconfig-r2303-20261123    gcc-11.5.0 sparse
nios2                randconfig-r2304-20261123    gcc-8.5.0  sparse
nios2                randconfig-r2307-20261123    gcc-13.5.0 sparse
nios2                randconfig-r2311-20261123    gcc-14     sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261123    gcc-10.5.0
openrisc              randconfig-2000-20261124    gcc-16.2.0
openrisc              randconfig-2001-20261123    gcc-10.5.0
openrisc              randconfig-2001-20261124    gcc-16.2.0
openrisc              randconfig-2002-20261123    gcc-10.5.0
openrisc              randconfig-2002-20261124    gcc-16.2.0
openrisc              randconfig-2200-20261123    gcc-12.5.0 smatch
openrisc              randconfig-2200-20261124    gcc-11.5.0 smatch
openrisc             randconfig-r2101-20261123    gcc-8.5.0  cocci
openrisc             randconfig-r2108-20261123    gcc-13.5.0 cocci
openrisc             randconfig-r2303-20261123    gcc-9.5.0  sparse
openrisc             randconfig-r2304-20261123    gcc-14     sparse
openrisc             randconfig-r2311-20261123    clang-24   sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                 generic-32bit_defconfig    clang-17
parisc                randconfig-1000-20261124    clang-24
parisc                randconfig-1001-20261124    clang-24
parisc                randconfig-2000-20261123    gcc-16.2.0
parisc                randconfig-2000-20261124    clang-18
parisc                randconfig-2001-20261123    gcc-16.2.0
parisc                randconfig-2001-20261124    clang-18
parisc                randconfig-2200-20261123    gcc-14.4.0 smatch
parisc               randconfig-r2100-20261123    gcc-14.4.0 cocci
parisc               randconfig-r2104-20261123    gcc-8.5.0  cocci
parisc               randconfig-r2109-20261123    gcc-14.4.0 cocci
parisc               randconfig-r2110-20261123    gcc-8.5.0  cocci
parisc               randconfig-r2303-20261123    gcc-13.5.0 sparse
parisc               randconfig-r2304-20261124    clang-24   sparse
parisc               randconfig-r2305-20261123    gcc-14     sparse
parisc               randconfig-r2305-20261123    gcc-14.4.0 sparse
parisc               randconfig-r2306-20261123    gcc-13.5.0 sparse
parisc               randconfig-r2307-20261123    gcc-12.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       chrp32_defconfig    gcc-16.2.0
powerpc                       cm5200_defconfig    clang-24
powerpc                        ebony_defconfig    clang-24
powerpc                         icon_defconfig    clang-17
powerpc                   mpc866_ads_defconfig    clang-17
powerpc                     mvme5100_defconfig    gcc-16.2.0
powerpc                        ppc64_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261124    clang-24
powerpc               randconfig-1001-20261124    clang-24
powerpc               randconfig-2000-20261123    clang-21
powerpc               randconfig-2001-20261123    clang-21
powerpc               randconfig-2002-20261123    clang-21
powerpc               randconfig-2200-20261123    gcc-9.5.0  smatch
powerpc               randconfig-2200-20261124    clang-21   smatch
powerpc              randconfig-r2102-20261123    gcc-14.4.0 cocci
powerpc              randconfig-r2104-20261123    gcc-8.5.0  cocci
powerpc              randconfig-r2111-20261123    gcc-13.5.0 cocci
powerpc              randconfig-r2300-20261123    gcc-8.5.0  sparse
powerpc              randconfig-r2301-20261123    gcc-14.4.0 sparse
powerpc              randconfig-r2301-20261123    gcc-9.5.0  sparse
powerpc              randconfig-r2307-20261123    clang-22   sparse
powerpc              randconfig-r2310-20261123    gcc-14     sparse
powerpc              randconfig-r2311-20261123    gcc-10.5.0 sparse
powerpc                      skiroot_defconfig    clang-17
powerpc                      skiroot_defconfig    clang-24
powerpc                     socrates_defconfig    gcc-16.2.0
powerpc                      stx_gp3_defconfig    gcc-16.2.0
powerpc                      tqm8541_defconfig    gcc-16.2.0
powerpc                      tqm8560_defconfig    gcc-16.2.0
powerpc                       tqm8xx_defconfig    clang-24
powerpc64                         alldefconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261124    clang-24
powerpc64             randconfig-1001-20261124    clang-24
powerpc64             randconfig-2000-20261123    clang-21
powerpc64             randconfig-2001-20261123    clang-21
powerpc64             randconfig-2002-20261123    clang-21
powerpc64             randconfig-2200-20261123    gcc-15.3.0 smatch
powerpc64             randconfig-2200-20261124    gcc-12.5.0 smatch
powerpc64            randconfig-r2100-20261123    gcc-8.5.0  cocci
powerpc64            randconfig-r2102-20261123    gcc-8.5.0  cocci
powerpc64            randconfig-r2103-20261123    gcc-14     cocci
powerpc64            randconfig-r2103-20261123    gcc-14.4.0 cocci
powerpc64            randconfig-r2302-20261123    gcc-13.5.0 sparse
powerpc64            randconfig-r2303-20261124    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    clang-17
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261124    gcc-11.5.0
riscv                 randconfig-1001-20261124    gcc-11.5.0
riscv                 randconfig-2000-20261123    gcc-11.5.0
riscv                 randconfig-2001-20261123    gcc-11.5.0
riscv                 randconfig-2002-20261123    gcc-11.5.0
riscv                 randconfig-2003-20261123    gcc-11.5.0
riscv                 randconfig-2004-20261123    gcc-11.5.0
riscv                 randconfig-2005-20261123    gcc-11.5.0
riscv                 randconfig-2200-20261123    clang-17   smatch
riscv                 randconfig-2200-20261124    gcc-14.4.0 smatch
riscv                randconfig-r2105-20261123    gcc-14     cocci
riscv                randconfig-r2106-20261124    clang-24   cocci
riscv                randconfig-r2108-20261123    gcc-14.4.0 cocci
riscv                randconfig-r2110-20261123    clang-20   cocci
riscv                randconfig-r2110-20261123    gcc-14.4.0 cocci
riscv                randconfig-r2111-20261123    gcc-14.4.0 cocci
riscv                randconfig-r2302-20261123    gcc-14.4.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261124    gcc-11.5.0
s390                  randconfig-1001-20261124    gcc-11.5.0
s390                  randconfig-2000-20261123    clang-20
s390                  randconfig-2001-20261123    clang-20
s390                  randconfig-2002-20261123    clang-20
s390                  randconfig-2003-20261123    clang-20
s390                  randconfig-2004-20261123    clang-20
s390                  randconfig-2005-20261123    clang-20
s390                  randconfig-2200-20261123    clang-24   smatch
s390                  randconfig-2200-20261124    clang-24   smatch
s390                 randconfig-r2104-20261123    gcc-8.5.0  cocci
s390                 randconfig-r2108-20261123    gcc-15.3.0 cocci
s390                 randconfig-r2110-20261123    clang-20   cocci
s390                 randconfig-r2301-20261123    gcc-14.4.0 sparse
s390                 randconfig-r2308-20261123    clang-24   sparse
s390                 randconfig-r2311-20261123    gcc-13.5.0 sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                             migor_defconfig    clang-24
sh                    randconfig-1000-20261124    gcc-11.5.0
sh                    randconfig-1001-20261124    gcc-11.5.0
sh                    randconfig-2000-20261123    gcc-16.2.0
sh                    randconfig-2001-20261123    gcc-16.2.0
sh                    randconfig-2002-20261123    gcc-16.2.0
sh                    randconfig-2003-20261123    gcc-16.2.0
sh                    randconfig-2004-20261123    gcc-16.2.0
sh                    randconfig-2005-20261123    gcc-16.2.0
sh                    randconfig-2200-20261123    gcc-16.2.0 smatch
sh                    randconfig-2200-20261124    gcc-16.2.0 smatch
sh                   randconfig-r2106-20261123    clang-17   cocci
sh                   randconfig-r2107-20261123    gcc-14.4.0 cocci
sh                   randconfig-r2108-20261123    clang-17   cocci
sh                   randconfig-r2110-20261124    clang-24   cocci
sh                   randconfig-r2111-20261123    clang-20   cocci
sh                   randconfig-r2111-20261123    gcc-15.3.0 cocci
sh                   randconfig-r2302-20261123    gcc-9.5.0  sparse
sh                   randconfig-r2304-20261123    gcc-14.4.0 sparse
sh                   randconfig-r2306-20261123    gcc-14     sparse
sh                   randconfig-r2306-20261123    gcc-8.5.0  sparse
sh                           sdk7780_defconfig    gcc-16.2.0
sh                           sdk7786_defconfig    clang-24
sh                            se7619_defconfig    gcc-16.2.0
sh                            se7721_defconfig    gcc-16.2.0
sh                            se7780_defconfig    clang-24
sh                         sh7757lcr_defconfig    gcc-16.2.0
sh                    sh7770_generic_defconfig    clang-24
sh                           urquell_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261124    clang-24
sparc                 randconfig-1001-20261124    clang-24
sparc                 randconfig-2000-20261123    gcc-9.5.0
sparc                 randconfig-2000-20261124    gcc-8.5.0
sparc                 randconfig-2001-20261123    gcc-9.5.0
sparc                 randconfig-2001-20261124    gcc-8.5.0
sparc                 randconfig-2200-20261123    gcc-12.5.0 smatch
sparc                 randconfig-2200-20261124    gcc-11.5.0 smatch
sparc                randconfig-r2100-20261124    clang-24   cocci
sparc                randconfig-r2101-20261123    gcc-8.5.0  cocci
sparc                randconfig-r2102-20261123    gcc-14     cocci
sparc                randconfig-r2104-20261123    gcc-14.4.0 cocci
sparc                randconfig-r2105-20261123    gcc-12.5.0 cocci
sparc                randconfig-r2107-20261123    gcc-16.2.0 cocci
sparc                randconfig-r2304-20261123    gcc-9.5.0  sparse
sparc                randconfig-r2305-20261123    gcc-14.4.0 sparse
sparc                randconfig-r2307-20261123    gcc-10.5.0 sparse
sparc                randconfig-r2308-20261123    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261124    clang-24
sparc64               randconfig-1001-20261124    clang-24
sparc64               randconfig-2000-20261123    gcc-9.5.0
sparc64               randconfig-2000-20261124    gcc-8.5.0
sparc64               randconfig-2001-20261123    gcc-9.5.0
sparc64               randconfig-2001-20261124    gcc-8.5.0
sparc64               randconfig-2200-20261123    clang-22   smatch
sparc64               randconfig-2200-20261124    clang-24   smatch
sparc64              randconfig-r2103-20261123    gcc-14     cocci
sparc64              randconfig-r2104-20261123    gcc-14     cocci
sparc64              randconfig-r2104-20261124    clang-24   cocci
sparc64              randconfig-r2106-20261123    gcc-16.2.0 cocci
sparc64              randconfig-r2107-20261123    clang-17   cocci
sparc64              randconfig-r2111-20261123    clang-20   cocci
sparc64              randconfig-r2302-20261123    gcc-8.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261124    clang-24
um                    randconfig-1001-20261124    clang-24
um                    randconfig-2000-20261123    gcc-9.5.0
um                    randconfig-2000-20261124    gcc-8.5.0
um                    randconfig-2001-20261123    gcc-9.5.0
um                    randconfig-2001-20261124    gcc-8.5.0
um                    randconfig-2200-20261123    clang-21   smatch
um                    randconfig-2200-20261124    gcc-14     smatch
um                   randconfig-r2103-20261123    gcc-8.5.0  cocci
um                   randconfig-r2105-20261123    gcc-14     cocci
um                   randconfig-r2105-20261123    gcc-8.5.0  cocci
um                   randconfig-r2109-20261124    clang-24   cocci
um                   randconfig-r2111-20261123    clang-17   cocci
um                   randconfig-r2300-20261123    gcc-14     sparse
um                   randconfig-r2301-20261124    clang-24   sparse
um                   randconfig-r2305-20261124    clang-24   sparse
um                   randconfig-r2307-20261123    gcc-14     sparse
um                   randconfig-r2310-20261123    clang-24   sparse
um                   randconfig-r2311-20261123    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261124    gcc-14
x86_64      buildonly-randconfig-1001-20261124    gcc-14
x86_64      buildonly-randconfig-1002-20261124    gcc-14
x86_64      buildonly-randconfig-1003-20261124    gcc-14
x86_64      buildonly-randconfig-1004-20261124    gcc-14
x86_64      buildonly-randconfig-1005-20261124    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261124    gcc-12
x86_64                randconfig-1001-20261124    gcc-12
x86_64                randconfig-1002-20261124    gcc-12
x86_64                randconfig-1003-20261124    gcc-12
x86_64                randconfig-1004-20261124    gcc-12
x86_64                randconfig-1005-20261124    gcc-12
x86_64                randconfig-2000-20261123    gcc-14
x86_64                randconfig-2000-20261124    gcc-14
x86_64                randconfig-2001-20261123    gcc-14
x86_64                randconfig-2001-20261124    gcc-14
x86_64                randconfig-2002-20261123    gcc-14
x86_64                randconfig-2002-20261124    gcc-14
x86_64                randconfig-2003-20261123    gcc-14
x86_64                randconfig-2003-20261124    gcc-14
x86_64                randconfig-2004-20261123    gcc-14
x86_64                randconfig-2004-20261124    gcc-14
x86_64                randconfig-2005-20261123    gcc-14
x86_64                randconfig-2005-20261124    gcc-14
x86_64                randconfig-2100-20261123    clang-22   cocci
x86_64                randconfig-2101-20261123    clang-22   cocci
x86_64                randconfig-2102-20261123    clang-22   cocci
x86_64                randconfig-2103-20261123    clang-22   cocci
x86_64                randconfig-2104-20261123    clang-22   cocci
x86_64                randconfig-2105-20261123    clang-22   cocci
x86_64                randconfig-2200-20261123    gcc-14     smatch
x86_64                randconfig-2200-20261124    gcc-14     smatch
x86_64                randconfig-2300-20261123    gcc-14     sparse
x86_64                randconfig-2300-20261124    gcc-14     sparse
x86_64                randconfig-2301-20261123    gcc-14     sparse
x86_64                randconfig-2301-20261124    gcc-14     sparse
x86_64                randconfig-2302-20261123    gcc-14     sparse
x86_64                randconfig-2302-20261124    gcc-14     sparse
x86_64               randconfig-r2101-20261123    gcc-14     cocci
x86_64               randconfig-r2104-20261123    gcc-8.5.0  cocci
x86_64               randconfig-r2105-20261123    gcc-8.5.0  cocci
x86_64               randconfig-r2107-20261123    gcc-15.3.0 cocci
x86_64               randconfig-r2109-20261123    clang-17   cocci
x86_64               randconfig-r2301-20261123    gcc-13.5.0 sparse
x86_64               randconfig-r2309-20261123    gcc-14     sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261124    clang-24
xtensa                randconfig-1001-20261124    clang-24
xtensa                randconfig-2000-20261123    gcc-12.5.0
xtensa                randconfig-2001-20261123    gcc-12.5.0
xtensa                randconfig-2200-20261123    gcc-8.5.0  smatch
xtensa               randconfig-r2101-20261123    gcc-14     cocci
xtensa               randconfig-r2101-20261123    gcc-8.5.0  cocci
xtensa               randconfig-r2109-20261123    gcc-16.2.0 cocci
xtensa               randconfig-r2110-20261123    gcc-15.3.0 cocci
xtensa               randconfig-r2111-20261123    gcc-16.2.0 cocci
xtensa               randconfig-r2111-20261124    clang-24   cocci
xtensa               randconfig-r2308-20261123    gcc-12.5.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
