Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9704C31E822
	for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Apr 2026 05:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775798059; cv=none; b=UF54lu81XnOzrAyciPCv9Cj3tmXWXyRbi051r8QNcGd6DDFAuDdzInN45OoiNgRwZt5QHlfaemCmRFMnIXAYBp7SEMIcXbbXtkD8YIE0edi/3OLxK91BA3JK8IEDIiebm8OZ2u8668beKoOAtEFbLBq86ZnV0vSg7kKJY9iCPJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775798059; c=relaxed/simple;
	bh=kAsoQHjC8jII2xkWmlHuhlAVjGsAMzlVN9XCknvM4bA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O4q33ugo0klOkp8cLVaMpgvGfO2G+UrqWiElfEE21GWua6fP/qEBvnctzDGagxBxs9Jqc2l4+mwQoXXRSjfmgOkBCvSPJ5LUbCWTuE8i280klfy61FeP22jVINWeFzerM/BnZ4LylRdJZ6p1XSDAr95MPL66ZOh4ThvyjAIFahI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hIbfbTyg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hIbfbTyg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775798057; x=1807334057;
  h=date:from:to:cc:subject:message-id;
  bh=kAsoQHjC8jII2xkWmlHuhlAVjGsAMzlVN9XCknvM4bA=;
  b=hIbfbTygsp1QpyoFYysR0POUHTWBh7udFgZ/O4dCMqg/uwLTSQgarY8M
   6Z8p8KYoBvo+LOt6YJfMwc0ElJFZA+eIWYn5pxHRC8la5rfqOLEsObkJ0
   37AmTq9y6LzEtQgvRrsL7DMBbeY4tscyFXyxVd/Vq7+kXZz+lPd227Cuk
   TQcIPFWt+crUcenkEawYJLDax21H81G3DffhI7DKz9y+eXVWpl2Bo8nSB
   Ch2Bf27uFA8vpFBvEKyV/u+RmHJP0M9z9BIDacyKRtIRYRQ2FhNznHj+I
   tCJhlEWPlZzYFl31IH6daAtoFm6zvFAboB/2pH5M0+1IfiBA7Cx5zAsHM
   g==;
X-CSE-ConnectionGUID: o9wlRT24RFOKeyTmI3eEww==
X-CSE-MsgGUID: eDCdu29DRGO1cg/Ak5fF2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="80405872"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="80405872"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 22:14:16 -0700
X-CSE-ConnectionGUID: 5HgDRa6oT6OYE0sobCzKGQ==
X-CSE-MsgGUID: gIYj8I8tR1GErEPrRv6ahg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="252128993"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Apr 2026 22:14:15 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB4C4-000000001nx-47lA;
	Fri, 10 Apr 2026 05:14:12 +0000
Date: Fri, 10 Apr 2026 13:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 a6b8c4537a43a9efd3ae0a39a3769af09d0695eb
Message-ID: <202604101318.iXloPTZA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: a6b8c4537a43a9efd3ae0a39a3769af09d0695eb  m68k: virt: Switch to qemu-virt-ctrl driver

elapsed time: 2629m

configs tested: 135
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260408    gcc-8.5.0
arc                   randconfig-002-20260408    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    clang-16
arm                         lpc18xx_defconfig    clang-23
arm                   randconfig-001-20260408    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260408    gcc-14.3.0
arm64                 randconfig-002-20260408    gcc-14.3.0
arm64                 randconfig-003-20260408    gcc-14.3.0
arm64                 randconfig-004-20260408    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260408    gcc-14.3.0
csky                  randconfig-002-20260408    gcc-14.3.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260408    clang-20
i386                  randconfig-002-20260408    clang-20
i386                  randconfig-003-20260408    clang-20
i386                  randconfig-004-20260408    clang-20
i386                  randconfig-005-20260408    clang-20
i386                  randconfig-006-20260408    clang-20
i386                  randconfig-007-20260408    clang-20
i386                  randconfig-011-20260408    gcc-14
i386                  randconfig-012-20260408    gcc-14
i386                  randconfig-013-20260408    gcc-14
i386                  randconfig-014-20260408    gcc-14
i386                  randconfig-015-20260408    gcc-14
i386                  randconfig-016-20260408    gcc-14
i386                  randconfig-017-20260408    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
openrisc                         allmodconfig    gcc-11.5.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260408    gcc-8.5.0
parisc                randconfig-002-20260408    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260408    gcc-8.5.0
powerpc               randconfig-002-20260408    gcc-8.5.0
powerpc64             randconfig-002-20260408    gcc-8.5.0
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20260408    gcc-15.2.0
riscv                 randconfig-002-20260408    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260408    gcc-15.2.0
sh                    randconfig-002-20260408    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc64                             defconfig    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260408    clang-20
x86_64      buildonly-randconfig-002-20260408    clang-20
x86_64      buildonly-randconfig-003-20260408    clang-20
x86_64      buildonly-randconfig-004-20260408    clang-20
x86_64      buildonly-randconfig-005-20260408    clang-20
x86_64      buildonly-randconfig-006-20260408    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260408    gcc-12
x86_64                randconfig-002-20260408    gcc-12
x86_64                randconfig-003-20260408    gcc-12
x86_64                randconfig-004-20260408    gcc-12
x86_64                randconfig-005-20260408    gcc-12
x86_64                randconfig-006-20260408    gcc-12
x86_64                randconfig-011-20260408    clang-20
x86_64                randconfig-012-20260408    clang-20
x86_64                randconfig-013-20260408    clang-20
x86_64                randconfig-014-20260408    clang-20
x86_64                randconfig-015-20260408    clang-20
x86_64                randconfig-016-20260408    clang-20
x86_64                randconfig-071-20260408    clang-20
x86_64                randconfig-072-20260408    clang-20
x86_64                randconfig-073-20260408    clang-20
x86_64                randconfig-074-20260408    clang-20
x86_64                randconfig-075-20260408    clang-20
x86_64                randconfig-076-20260408    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
