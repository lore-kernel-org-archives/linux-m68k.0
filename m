Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186991DB34B
	for <linux-m68k@lists.linux-m68k.org>; Sun,  6 Jul 2025 23:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751843100; cv=none; b=aIK+3xIGzX6i6Ps4DmEwYEvhuv34aLkjwJTANPXCuasBer/OxCDf9FDRkFEqDxANyrbTa85OYiJHXKO9u2mZmmuAyaNmkO3Z0mqyvxXX0ltAmKcsGOAQYGFamalo4FoHcL2KdYwNUMrrtiGhtnJXebX8TZr/TLEVbaVWjxrgAow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751843100; c=relaxed/simple;
	bh=+gYEormBWSbwT/vwr5KibrbnyiVpvdXGvAF1VXWyheA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CyCn/kjUjxCFLMxZfCvsv2bqtpi5IPFdfIHPElDTE0qZTrK9e4E12YhQBpussT0kT5kxWyLSUPNeD8ihzCLccYiMmWtgip309zp9B7JPLBED12JTAA4/OqNZwcpr7ZA83qdDRPftxpQDr6Qks6JMugDyuhHXzumwlK0MBqh50Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACdyUm59; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACdyUm59"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751843098; x=1783379098;
  h=date:from:to:cc:subject:message-id;
  bh=+gYEormBWSbwT/vwr5KibrbnyiVpvdXGvAF1VXWyheA=;
  b=ACdyUm59AdDwae2Hf940tKnZzZEeWN9fhVSdbXRVTbtV35ehQNwlWZJi
   HsEafMejeJZVlQfprI+ZT9vZzgEIJ/cVVb1qLdXqliqXFt+F94CORPWy6
   DfIORAokHlbFJNTju0Uy3BCw0I1zDdDdxwigFHhfYqB/xrjUzVIpvNops
   SSxDVWk8+EQD4T9W4rqa1wP5uvXMPj+cbWvVhtFQoH1qaPnSY6McVHeck
   2J6THud5JXnLXo3yiO088foIaotlWOBed3gQac+WNP1V6avq0VhYFaPdp
   08z4TYc5SJXVrkC5mo5gDCsPhJXCbtDxbu3oOIrgnDhxuXUicFeQEbDM9
   g==;
X-CSE-ConnectionGUID: qeuO1IiZTI+x2nmHb7YZZQ==
X-CSE-MsgGUID: 7yKmr+68TjOv4+U1wKzpzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="53986684"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="53986684"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 16:04:56 -0700
X-CSE-ConnectionGUID: RMnWzeDGRmKFKmnamdt26Q==
X-CSE-MsgGUID: 1IyCWWSyRZiRpipVP3FuBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="154806818"
Received: from lkp-server01.sh.intel.com (HELO def1aeed4587) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Jul 2025 16:04:56 -0700
Received: from kbuild by def1aeed4587 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYYPl-00004h-1P;
	Sun, 06 Jul 2025 23:04:53 +0000
Date: Mon, 07 Jul 2025 07:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.17] BUILD SUCCESS
 c8995932db2bad6fa093ac64dbaf7a3e8870eafa
Message-ID: <202507070757.U9X4Pn4I-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.17
branch HEAD: c8995932db2bad6fa093ac64dbaf7a3e8870eafa  m68k: mac: Improve clocksource driver commentary

elapsed time: 722m

configs tested: 48
configs skipped: 128

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    clang-21
arc                     allnoconfig    clang-21
arm                     allnoconfig    clang-21
arm                gemini_defconfig    clang-21
arm                 omap1_defconfig    clang-21
arm64                   allnoconfig    clang-21
csky                    allnoconfig    clang-21
hexagon                 allnoconfig    clang-21
i386        randconfig-001-20250707    gcc-12
i386        randconfig-002-20250707    gcc-12
i386        randconfig-003-20250707    gcc-12
i386        randconfig-004-20250707    gcc-12
i386        randconfig-005-20250707    gcc-12
i386        randconfig-006-20250707    gcc-12
i386        randconfig-007-20250707    gcc-12
i386        randconfig-011-20250707    gcc-12
i386        randconfig-012-20250707    gcc-12
i386        randconfig-013-20250707    gcc-12
i386        randconfig-014-20250707    gcc-12
i386        randconfig-015-20250707    gcc-12
i386        randconfig-016-20250707    gcc-12
i386        randconfig-017-20250707    gcc-12
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-21
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
m68k             m5475evb_defconfig    clang-21
m68k                 virt_defconfig    clang-21
microblaze             allmodconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
microblaze                defconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips            maltaaprp_defconfig    clang-21
nios2                   allnoconfig    gcc-14.2.0
nios2                     defconfig    gcc-15.1.0
parisc                    defconfig    gcc-15.1.0
parisc64                  defconfig    gcc-15.1.0
powerpc            ppc64e_defconfig    clang-21
powerpc           tqm8560_defconfig    clang-21
sh                      allnoconfig    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
sparc                     defconfig    gcc-15.1.0
x86_64                        kexec    clang-20
x86_64                     rhel-9.4    clang-20
xtensa                  allnoconfig    gcc-15.1.0
xtensa        cadence_csp_defconfig    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
