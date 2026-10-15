Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB11183CC3
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Oct 2026 06:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046135; cv=none; b=nA2JhxiPsnb7EIbVg4qt1C0+hsarMGqn66J3PBLX7+ZIdjqD1ZKO3CMWUNTX8pXqBJP0zIvcbOeRbqRSxGwWdk99lEfQiBJiqsohPHFcPQp2LOFlzWc64xRZZURZxPonkdtByN+/nwqNDo/qSnWuu7auNy67aRsFCkza3hp9UIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046135; c=relaxed/simple;
	bh=7FfhJoDdhp/LaknWzn0+ebiWdGuS70youlIHQskg0tI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kNV/TC+hiyD10g+NROHDb8oYhhy4vSTbghTRKuV55k3UwFSKtT0OBjFayUO7vEjuwNsxNLT/TYau0wuOPdXVH2wT2reCptFrqYMXpw9QiOKiY91XcPgvfk4ro7szpTGTDNV04JIJSqf4yEl4HDA9KfQnYO2UcS4T0IVA3EX3w8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHbERIqE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHbERIqE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792046133; x=1823582133;
  h=date:from:to:cc:subject:message-id;
  bh=7FfhJoDdhp/LaknWzn0+ebiWdGuS70youlIHQskg0tI=;
  b=gHbERIqE8ZcTXkpvHhVBn3Y54O/Bh/15WzCxdVQmbByOa5QgVpTbU3OM
   UhBzrfZMsKDQ7HI7mgovROeRbKiAUcxpzUegNI2yM5wqZt/yFaHY6Fs1w
   1GSTXaOldiRAEyehK96NdLsGUNZKcy9SuX5ypIZRKw3+ghf4IPAD/k9C2
   DSKE1qoyW+Gq2vPeY/W2Zsqdb42EVWZ2GviS8DIOYCZaEMKnCt6vlU7tt
   MtgPGPM6Rlnfwt4fhj3tpNumkUqhs/CojGj7TPITBQgnPnKT5CP79wehk
   k4mCk7U1vlIxRq7udq2pNNmiQZjpu/dPnfQt+YPCIVk9JS5wFtLrD8lFc
   A==;
X-CSE-ConnectionGUID: otlEHnafRH2LGhzF0bGykw==
X-CSE-MsgGUID: dWgT01iqTciPeAGyFFlQfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="703607"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="703607"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 23:35:32 -0700
X-CSE-ConnectionGUID: /r0A4SzgQj28dC8GuMrg5Q==
X-CSE-MsgGUID: cePp/rMAQsesGq7sTKTNbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1531078"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Oct 2026 23:35:31 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHF3o-00000000Fwc-03iG;
	Thu, 15 Oct 2026 06:35:28 +0000
Date: Thu, 15 Oct 2026 14:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 c97e04597297e7483fde771c23d3cdb9c9e22f44
Message-ID: <202610151404.MTD9JlF1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: c97e04597297e7483fde771c23d3cdb9c9e22f44  Merge tag 'v7.3-rc7'

elapsed time: 2255m

configs tested: 342
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2110-20261012    gcc-10.5.0 cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-2000-20261012    gcc-14.3.0
arc                   randconfig-2000-20261012    gcc-16.1.0
arc                   randconfig-2001-20261012    gcc-16.1.0
arc                  randconfig-r2200-20261012    gcc-16.1.0 smatch
arc                  randconfig-r2311-20261012    gcc-14.3.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                      am200epdkit_defconfig    gcc-16.1.0
arm                      davinci_all_defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                       jornada720_defconfig    clang-24
arm                          mv78xx0_defconfig    gcc-16.1.0
arm                              mxs_defconfig    gcc-16.1.0
arm                   randconfig-2000-20261012    gcc-16.1.0
arm                   randconfig-2001-20261012    clang-17
arm                   randconfig-2001-20261012    gcc-16.1.0
arm                  randconfig-r2107-20261012    gcc-9.5.0  cocci
arm                  randconfig-r2110-20261012    clang-24   cocci
arm                  randconfig-r2201-20261012    gcc-10.5.0 smatch
arm                  randconfig-r2306-20261012    gcc-12.5.0 sparse
arm                          s3c6400_defconfig    clang-24
arm                          socfpga_defconfig    gcc-16.1.0
arm                            u8500_defconfig    clang-24
arm                         vexpress_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261015    gcc-8.5.0
arm64                 randconfig-1001-20261015    gcc-8.5.0
arm64                 randconfig-1002-20261015    gcc-8.5.0
arm64                 randconfig-1003-20261015    gcc-8.5.0
arm64                 randconfig-2000-20261012    clang-22
arm64                 randconfig-2000-20261012    gcc-16.1.0
arm64                 randconfig-2001-20261012    gcc-11.5.0
arm64                 randconfig-2001-20261012    gcc-16.1.0
arm64                randconfig-r2101-20261012    gcc-15.2.0 cocci
arm64                randconfig-r2108-20261012    gcc-15.2.0 cocci
arm64                randconfig-r2201-20261012    gcc-10.5.0 smatch
arm64                randconfig-r2303-20261012    clang-24   sparse
arm64                randconfig-r2305-20261012    clang-24   sparse
arm64                randconfig-r2311-20261012    gcc-12.5.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261015    gcc-8.5.0
csky                  randconfig-1001-20261015    gcc-8.5.0
csky                  randconfig-2000-20261012    gcc-14.3.0
csky                  randconfig-2000-20261012    gcc-16.1.0
csky                  randconfig-2001-20261012    gcc-16.1.0
csky                 randconfig-r2100-20261012    gcc-12.5.0 cocci
csky                 randconfig-r2106-20261012    gcc-14     cocci
csky                 randconfig-r2111-20261012    gcc-10.5.0 cocci
csky                 randconfig-r2200-20261012    gcc-10.5.0 smatch
csky                 randconfig-r2302-20261012    clang-24   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261015    clang-24
hexagon               randconfig-1001-20261015    clang-24
hexagon               randconfig-2000-20261012    clang-17
hexagon               randconfig-2000-20261012    gcc-16.1.0
hexagon               randconfig-2001-20261012    clang-24
hexagon               randconfig-2001-20261012    gcc-16.1.0
hexagon              randconfig-r2102-20261012    clang-24   cocci
hexagon              randconfig-r2104-20261012    clang-24   cocci
hexagon              randconfig-r2109-20261012    clang-24   cocci
hexagon              randconfig-r2110-20261012    gcc-14     cocci
hexagon              randconfig-r2310-20261012    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261015    gcc-14
i386        buildonly-randconfig-1001-20261015    gcc-14
i386        buildonly-randconfig-1002-20261015    gcc-14
i386        buildonly-randconfig-1003-20261015    gcc-14
i386        buildonly-randconfig-1004-20261015    gcc-14
i386        buildonly-randconfig-1005-20261015    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261015    gcc-14
i386                  randconfig-1001-20261015    gcc-14
i386                  randconfig-1002-20261015    gcc-14
i386                  randconfig-1003-20261015    gcc-14
i386                  randconfig-1004-20261015    gcc-14
i386                  randconfig-1005-20261015    gcc-14
i386                  randconfig-1006-20261015    gcc-14
i386                  randconfig-1007-20261015    clang-22
i386                  randconfig-1008-20261015    clang-22
i386                  randconfig-1009-20261015    clang-22
i386                  randconfig-1010-20261015    clang-22
i386                  randconfig-1011-20261015    clang-22
i386                  randconfig-1012-20261015    clang-22
i386                  randconfig-1013-20261015    clang-22
i386                  randconfig-2000-20261012    gcc-14
i386                  randconfig-2000-20261012    gcc-16.1.0
i386                  randconfig-2001-20261012    clang-22
i386                  randconfig-2001-20261012    gcc-16.1.0
i386                  randconfig-2100-20261012    clang-22   cocci
i386                  randconfig-2101-20261012    clang-22   cocci
i386                  randconfig-2102-20261012    clang-22   cocci
i386                  randconfig-2103-20261012    clang-22   cocci
i386                  randconfig-2104-20261012    clang-22   cocci
i386                  randconfig-2105-20261012    clang-22   cocci
i386                  randconfig-2200-20261012    clang-22   smatch
i386                  randconfig-2300-20261012    gcc-14     sparse
i386                  randconfig-2301-20261012    gcc-14     sparse
i386                  randconfig-2302-20261012    gcc-14     sparse
i386                 randconfig-r2202-20261012    clang-22   smatch
i386                 randconfig-r2301-20261012    clang-22   sparse
i386                 randconfig-r2307-20261012    gcc-12.5.0 sparse
i386                 randconfig-r2310-20261012    gcc-12.5.0 sparse
i386                 randconfig-r2311-20261012    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    clang-24
loongarch             randconfig-1000-20261015    clang-24
loongarch             randconfig-1001-20261015    clang-24
loongarch             randconfig-2000-20261012    gcc-11.5.0
loongarch             randconfig-2001-20261012    gcc-11.5.0
loongarch            randconfig-r2101-20261012    clang-24   cocci
loongarch            randconfig-r2102-20261012    gcc-12.5.0 cocci
loongarch            randconfig-r2106-20261012    gcc-10.5.0 cocci
loongarch            randconfig-r2201-20261012    clang-20   smatch
loongarch            randconfig-r2302-20261012    clang-24   sparse
loongarch            randconfig-r2305-20261012    clang-22   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2103-20261012    gcc-12.5.0 cocci
m68k                 randconfig-r2109-20261012    gcc-12.5.0 cocci
m68k                 randconfig-r2201-20261012    gcc-13.4.0 smatch
m68k                 randconfig-r2305-20261012    clang-24   sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2109-20261012    gcc-15.2.0 cocci
microblaze           randconfig-r2300-20261012    clang-24   sparse
microblaze           randconfig-r2308-20261012    gcc-12.5.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                        bmips_be_defconfig    gcc-16.1.0
mips                 randconfig-r2100-20261012    clang-24   cocci
mips                 randconfig-r2304-20261012    clang-24   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261015    clang-24
nios2                 randconfig-1001-20261015    clang-24
nios2                 randconfig-2000-20261012    gcc-11.5.0
nios2                 randconfig-2001-20261012    gcc-11.5.0
nios2                randconfig-r2107-20261012    gcc-10.5.0 cocci
nios2                randconfig-r2108-20261012    clang-24   cocci
nios2                randconfig-r2108-20261012    gcc-12.5.0 cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2104-20261012    gcc-14     cocci
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261015    gcc-8.5.0
parisc                randconfig-1001-20261015    gcc-8.5.0
parisc                randconfig-2000-20261012    gcc-11.5.0
parisc                randconfig-2001-20261012    gcc-11.5.0
parisc               randconfig-r2105-20261012    gcc-9.5.0  cocci
parisc               randconfig-r2110-20261012    gcc-9.5.0  cocci
parisc               randconfig-r2111-20261012    gcc-9.5.0  cocci
parisc               randconfig-r2303-20261012    clang-22   sparse
parisc               randconfig-r2304-20261012    clang-22   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                         cell_defconfig    clang-24
powerpc               randconfig-1000-20261015    gcc-8.5.0
powerpc               randconfig-1001-20261015    gcc-8.5.0
powerpc               randconfig-2000-20261012    gcc-14
powerpc               randconfig-2001-20261012    gcc-14
powerpc              randconfig-r2103-20261012    clang-24   cocci
powerpc              randconfig-r2106-20261012    clang-24   cocci
powerpc              randconfig-r2106-20261012    gcc-9.5.0  cocci
powerpc              randconfig-r2309-20261012    clang-22   sparse
powerpc                      tqm8540_defconfig    clang-24
powerpc64             randconfig-1000-20261015    gcc-8.5.0
powerpc64             randconfig-1001-20261015    gcc-8.5.0
powerpc64             randconfig-2000-20261012    gcc-14
powerpc64             randconfig-2001-20261012    gcc-14
powerpc64            randconfig-r2105-20261012    clang-24   cocci
powerpc64            randconfig-r2302-20261012    clang-22   sparse
powerpc64            randconfig-r2306-20261012    gcc-8.5.0  sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261015    gcc-11.5.0
riscv                 randconfig-1001-20261015    gcc-11.5.0
riscv                 randconfig-2000-20261012    gcc-14.3.0
riscv                 randconfig-2001-20261012    gcc-14.3.0
riscv                randconfig-r2102-20261012    gcc-15.2.0 cocci
riscv                randconfig-r2103-20261012    gcc-15.2.0 cocci
riscv                randconfig-r2111-20261012    clang-24   cocci
riscv                randconfig-r2202-20261012    clang-24   smatch
riscv                randconfig-r2300-20261012    clang-22   sparse
riscv                randconfig-r2308-20261012    gcc-16.1.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261015    gcc-11.5.0
s390                  randconfig-1001-20261015    gcc-11.5.0
s390                  randconfig-2000-20261012    gcc-14.3.0
s390                  randconfig-2001-20261012    gcc-14.3.0
s390                 randconfig-r2105-20261012    gcc-14     cocci
s390                 randconfig-r2111-20261012    gcc-14     cocci
s390                 randconfig-r2202-20261012    gcc-14.3.0 smatch
s390                 randconfig-r2306-20261012    clang-22   sparse
s390                 randconfig-r2307-20261012    gcc-11.5.0 sparse
s390                 randconfig-r2309-20261012    gcc-12.5.0 sparse
s390                 randconfig-r2310-20261012    clang-22   sparse
s390                 randconfig-r2310-20261012    gcc-16.1.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                          ap325rxa_defconfig    clang-24
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261015    gcc-11.5.0
sh                    randconfig-1001-20261015    gcc-11.5.0
sh                    randconfig-2000-20261012    gcc-14.3.0
sh                    randconfig-2001-20261012    gcc-14.3.0
sh                   randconfig-r2107-20261012    clang-24   cocci
sh                   randconfig-r2300-20261012    clang-24   sparse
sh                   randconfig-r2301-20261012    clang-24   sparse
sh                   randconfig-r2307-20261012    gcc-16.1.0 sparse
sh                   randconfig-r2309-20261012    gcc-16.1.0 sparse
sh                         sh7763rdp_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261015    gcc-8.5.0
sparc                 randconfig-1001-20261015    gcc-8.5.0
sparc                 randconfig-2000-20261012    gcc-8.5.0
sparc                 randconfig-2001-20261012    gcc-8.5.0
sparc                randconfig-r2100-20261012    gcc-15.2.0 cocci
sparc                randconfig-r2101-20261012    gcc-12.5.0 cocci
sparc                randconfig-r2308-20261012    gcc-16.1.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261015    gcc-8.5.0
sparc64               randconfig-1001-20261015    gcc-8.5.0
sparc64               randconfig-2000-20261012    gcc-8.5.0
sparc64               randconfig-2001-20261012    gcc-8.5.0
sparc64              randconfig-r2200-20261012    clang-20   smatch
sparc64              randconfig-r2311-20261012    gcc-16.1.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261015    gcc-8.5.0
um                    randconfig-1001-20261015    gcc-8.5.0
um                    randconfig-2000-20261012    gcc-8.5.0
um                    randconfig-2001-20261012    gcc-8.5.0
um                   randconfig-r2202-20261012    clang-17   smatch
um                   randconfig-r2307-20261012    clang-22   sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261015    gcc-14
x86_64      buildonly-randconfig-1001-20261015    gcc-14
x86_64      buildonly-randconfig-1002-20261015    gcc-14
x86_64      buildonly-randconfig-1003-20261015    gcc-14
x86_64      buildonly-randconfig-1004-20261015    gcc-14
x86_64      buildonly-randconfig-1005-20261015    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261015    gcc-14
x86_64                randconfig-1001-20261015    gcc-14
x86_64                randconfig-1002-20261015    gcc-14
x86_64                randconfig-1003-20261015    gcc-14
x86_64                randconfig-1004-20261015    gcc-14
x86_64                randconfig-1005-20261015    gcc-14
x86_64                randconfig-1006-20261015    gcc-14
x86_64                randconfig-1007-20261015    gcc-14
x86_64                randconfig-1008-20261015    gcc-14
x86_64                randconfig-1009-20261015    gcc-14
x86_64                randconfig-1010-20261015    gcc-14
x86_64                randconfig-1011-20261015    gcc-14
x86_64                randconfig-1012-20261015    gcc-13
x86_64                randconfig-1013-20261015    gcc-13
x86_64                randconfig-1014-20261015    gcc-13
x86_64                randconfig-1015-20261015    gcc-13
x86_64                randconfig-1016-20261015    gcc-13
x86_64                randconfig-1017-20261015    gcc-13
x86_64                randconfig-2000-20261012    gcc-14
x86_64                randconfig-2001-20261012    gcc-14
x86_64                randconfig-2100-20261012    clang-22   cocci
x86_64                randconfig-2101-20261012    clang-22   cocci
x86_64                randconfig-2101-20261012    gcc-14     cocci
x86_64                randconfig-2102-20261012    clang-22   cocci
x86_64                randconfig-2103-20261012    clang-22   cocci
x86_64                randconfig-2104-20261012    clang-22   cocci
x86_64                randconfig-2105-20261012    clang-22   cocci
x86_64                randconfig-2200-20261012    gcc-14     smatch
x86_64                randconfig-2300-20261012    gcc-14     sparse
x86_64                randconfig-2301-20261012    gcc-14     sparse
x86_64                randconfig-2302-20261012    gcc-14     sparse
x86_64               randconfig-r2104-20261012    gcc-10.5.0 cocci
x86_64               randconfig-r2105-20261012    gcc-10.5.0 cocci
x86_64               randconfig-r2107-20261012    gcc-14     cocci
x86_64               randconfig-r2304-20261012    clang-24   sparse
x86_64               randconfig-r2308-20261012    clang-22   sparse
x86_64               randconfig-r2309-20261012    gcc-14     sparse
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
xtensa                randconfig-1000-20261015    gcc-8.5.0
xtensa                randconfig-1001-20261015    gcc-8.5.0
xtensa                randconfig-2000-20261012    gcc-8.5.0
xtensa                randconfig-2001-20261012    gcc-8.5.0
xtensa               randconfig-r2104-20261012    gcc-9.5.0  cocci
xtensa               randconfig-r2301-20261012    clang-24   sparse
xtensa               randconfig-r2303-20261012    clang-24   sparse
xtensa               randconfig-r2306-20261012    gcc-16.1.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
