Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACE334B1A7
	for <linux-m68k@lists.linux-m68k.org>; Sat,  1 Aug 2026 05:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785562482; cv=none; b=Td0eWnamfwOE0dOp8T73kTTCad0hO3zXxiFOJv4ADaAi2DJdFQx7Ks5Pbs4pZKsTGzV9i52a6NgNonYkZrkrP0H6MfZky+YokxErc1i+8NYPQTvTsVib3PDVLTS0DUzMD1KlZeCmc4gaJgqmXavw5kcIZdfUiM4nrgW+eXokEVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785562482; c=relaxed/simple;
	bh=nqpPRylQfvbD2AeMNVhBGXuSZAXt0SdEluxe7CiFew8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=heNj5w3+BYVVZcz8V4jaXX8F6tSau+C8ncgpKcumK/Bm1y9bibdLAy/iuxUcYSGx54MGUXTEsySDXjs4KTIjnwS/BsbR8VLizjucjp2G0GaOr2kKKdb4UAN4ZEChA0sCxoBOEv9T1V0/GdjwdAbKQ45PBYZgijTPf54sJaNyRmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TX8fjSLN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TX8fjSLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785562480; x=1817098480;
  h=date:from:to:cc:subject:message-id;
  bh=nqpPRylQfvbD2AeMNVhBGXuSZAXt0SdEluxe7CiFew8=;
  b=TX8fjSLNBbMCFDtn6ND3y+47rdaqNIj8qzSGZSzZ+mO5GRuoM3hUIxQp
   0Cph3IYfC4BtR7Da07Nc9HvpozE05hjCM8xVsj52MI72CGUx0/pK/bb9h
   nH+x/FXF4q1N+QtzWA0/kUXBZsJJ+8UXcuPcuf8d1ATu3BscTXFWHcLAl
   wJSbrBzFY1vjnTnFWlDmnUt1nXkHdBUY2TDgeGd+BnIrIEXXIsUroide6
   F+antF/c0GBR7drJmyw1RVRtR+D1bgTBfES4R6xUn5ghWSSDLoX8WQsO9
   t1ODGZaI+w+jtWlIopWRacqRVhrsU8W8q/ekOR6TFMst2ll6Y+3UCA7qS
   A==;
X-CSE-ConnectionGUID: xKI43cKnRw25XC1VjGrStA==
X-CSE-MsgGUID: CmdZlSscT36pRQSXF1NXqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="89994350"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="89994350"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 22:34:39 -0700
X-CSE-ConnectionGUID: g0NXV5uDQUKiLxnk6UyF9g==
X-CSE-MsgGUID: yO+mjD+XR72EXDL/XqAKHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="256834578"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jul 2026 22:34:38 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq2Ml-000000002nt-1Bc1;
	Sat, 01 Aug 2026 05:34:35 +0000
Date: Sat, 01 Aug 2026 13:34:30 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 ab20614793ab50f900e655be38b7b9ab2241fbdb
Message-ID: <202608011316.8ud9CDrZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: ab20614793ab50f900e655be38b7b9ab2241fbdb  Merge tag 'v7.2-rc5'

elapsed time: 751m

configs tested: 48
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-12.5.0
arc                  randconfig-001-20260801    gcc-12.5.0
arc                  randconfig-002-20260801    gcc-12.5.0
arm                  randconfig-001-20260801    gcc-12.5.0
arm                  randconfig-002-20260801    gcc-12.5.0
arm                  randconfig-003-20260801    gcc-12.5.0
arm                  randconfig-004-20260801    gcc-12.5.0
arm                          u8500_defconfig    gcc-16.1.0
arm64                randconfig-002-20260801    clang-21
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260801    gcc-12.5.0
csky                 randconfig-002-20260801    gcc-10.5.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    gcc-14
i386       buildonly-randconfig-001-20260801    gcc-14
i386       buildonly-randconfig-002-20260801    gcc-14
i386       buildonly-randconfig-003-20260801    gcc-14
i386       buildonly-randconfig-004-20260801    gcc-14
i386       buildonly-randconfig-005-20260801    gcc-14
i386       buildonly-randconfig-006-20260801    gcc-14
i386                 randconfig-011-20260801    gcc-14
i386                 randconfig-012-20260801    gcc-14
i386                 randconfig-013-20260801    gcc-14
i386                 randconfig-014-20260801    gcc-14
i386                 randconfig-015-20260801    gcc-14
i386                 randconfig-016-20260801    gcc-14
i386                 randconfig-017-20260801    gcc-14
loongarch                          defconfig    clang-24
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
powerpc                    mpc83xx_defconfig    clang-21
sh                                 defconfig    gcc-16.1.0
x86_64     buildonly-randconfig-001-20260801    clang-22
x86_64     buildonly-randconfig-002-20260801    clang-22
x86_64     buildonly-randconfig-003-20260801    gcc-13
x86_64     buildonly-randconfig-004-20260801    clang-22
x86_64     buildonly-randconfig-005-20260801    clang-22
x86_64     buildonly-randconfig-006-20260801    clang-22
x86_64                                 kexec    clang-22
x86_64                          rhel-9.4-bpf    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
