Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CAFFC01
	for <linux-m68k@lists.linux-m68k.org>; Wed,  3 Apr 2024 01:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712106750; cv=none; b=gz5AvdQvLfqCSiHXGi5qsbKZnuX87VZHoI/FIYTXgGDiw3KniuWhBQHhIAtX/zqcE7+jh841rzN1/RB085LAid3Ah0iq5UTb0CAW5KpMp2h9otj5kiCXz6LkDFI/a5RE9q5o9W/LI4tfZvgRPDkCeaSWi0fmIPLOsS1kWvR31Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712106750; c=relaxed/simple;
	bh=Etgq1srubucCKsW6Eh/doG7epfLGVJqTSBX8og653BM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e8sq6NbSFjM8f+6QxnvwqkTZP59fjEaJdNz8cT0OOBhClgcXifx48pnKMXiRQ4W6td9AcbbBrpFQOR7BZrO2K6fR87Yqr+ffNHTVWj2m80td3NJbUK/lkAA6nwPbYN1PZZRJDIA//egeSoUEWNQh4uiTgzNWfuUY1l9uN0UhHxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cEzVIaAT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cEzVIaAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712106748; x=1743642748;
  h=date:from:to:cc:subject:message-id;
  bh=Etgq1srubucCKsW6Eh/doG7epfLGVJqTSBX8og653BM=;
  b=cEzVIaATV0lgedTS4zNlQHZIbpsAxEJhFWiYVydUMgBabMsdaPQu41W7
   CcnLLswbpSrKz1MVt1YdtUU70gnCQy4Znllv2GmSvtfRII1LNRMtomVu/
   kOP/2Kzp6XT57m+vJKRU7Km0fWbgWVfloUHk0bnzr37a0rS+vnhJ4q1vZ
   PM/IbAcXEG+KqQi5UeyAZlMhgGTJ48FQ9akNperaOZvi99Dsd0o2Bp/a1
   yvY/7Rc8ZvVe+7EITb1T+3mFzMn6PhagGl8JjEHwh6TXxc2/GqAGHK1Aq
   5J1T0Ksg/6KG1VdJ2ZQ3gmnBU/SvrhSCE8nxA9CGPNHoRByqSraiBXG8j
   A==;
X-CSE-ConnectionGUID: kmkfYfDtSUSiW+LcBfhWWQ==
X-CSE-MsgGUID: 0bktrk5aR6CcrdqydU+smA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="18679832"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="18679832"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 18:12:18 -0700
X-CSE-ConnectionGUID: cB/RKSXtQNK0atmqelIBBg==
X-CSE-MsgGUID: PJ3EmfDfRti3cmzfsd8lVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="23010381"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Apr 2024 18:12:17 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrpAk-0001hk-2a;
	Wed, 03 Apr 2024 01:12:14 +0000
Date: Wed, 03 Apr 2024 09:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 b4b58c9562a0148b8ab38e057ecef0c484f9d0cc
Message-ID: <202404030940.wD4xQJ4k-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: b4b58c9562a0148b8ab38e057ecef0c484f9d0cc  Merge tag 'v6.9-rc2'

elapsed time: 1025m

configs tested: 147
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240403   gcc  
arc                   randconfig-002-20240403   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240403   gcc  
arm                   randconfig-002-20240403   gcc  
arm                   randconfig-004-20240403   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-003-20240403   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240403   gcc  
csky                  randconfig-002-20240403   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240402   gcc  
i386         buildonly-randconfig-002-20240402   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240402   gcc  
i386                  randconfig-011-20240402   gcc  
i386                  randconfig-015-20240402   gcc  
i386                  randconfig-016-20240402   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240403   gcc  
loongarch             randconfig-002-20240403   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      loongson3_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240403   gcc  
nios2                 randconfig-002-20240403   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240403   gcc  
parisc                randconfig-002-20240403   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                    mvme5100_defconfig   gcc  
powerpc                      ppc64e_defconfig   gcc  
powerpc               randconfig-001-20240403   gcc  
powerpc               randconfig-002-20240403   gcc  
powerpc64             randconfig-001-20240403   gcc  
powerpc64             randconfig-003-20240403   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             alldefconfig   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240403   gcc  
sh                    randconfig-002-20240403   gcc  
sh                           se7721_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240403   gcc  
sparc64               randconfig-002-20240403   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240403   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240402   clang
x86_64       buildonly-randconfig-002-20240402   clang
x86_64       buildonly-randconfig-003-20240402   clang
x86_64       buildonly-randconfig-004-20240402   clang
x86_64       buildonly-randconfig-005-20240402   clang
x86_64       buildonly-randconfig-006-20240402   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240402   clang
x86_64                randconfig-002-20240402   clang
x86_64                randconfig-004-20240402   clang
x86_64                randconfig-013-20240402   clang
x86_64                randconfig-015-20240402   clang
x86_64                randconfig-071-20240402   clang
x86_64                randconfig-072-20240402   clang
x86_64                randconfig-073-20240402   clang
x86_64                randconfig-075-20240402   clang
x86_64                randconfig-076-20240402   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240403   gcc  
xtensa                randconfig-002-20240403   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
