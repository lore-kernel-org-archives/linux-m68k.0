Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A8020E6EE
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Mar 2025 15:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742311382; cv=none; b=hnAZ7PGK+Y40SaRndsftXK+UiEU+Y9gdGN6eBUicCte0+qHM62SLyABxUDKbsia2PwA0G7LEjEJArY33EK5zcfDQ0WylhyTw3FQrPokUnqJREWVtzXkfl8TU7qba3fAPf8wWSpENzGFtUZv2cxH8sXkrn5cEUIH9SR6F9BwA8ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742311382; c=relaxed/simple;
	bh=HuuVKRG2ibagA0rdcDWJbOztYB/aEglJA4QiY7/7uH4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZIJDxCdKkdB4SzHWCNl7mT0YKFM/h1WC583wiesaatR2JwZRtljQ65HR0qfO4IasdBbOO1jkynkqdJM0fsNngcwtUIpH1mmYjsCP9xouLW1+DyNFdF95RJdNe1k9iKo39ykJaAP29Ns3/35NKQbOt9ZbY1AapOgjDulvRMpwKTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0FOG6Vk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0FOG6Vk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742311381; x=1773847381;
  h=date:from:to:cc:subject:message-id;
  bh=HuuVKRG2ibagA0rdcDWJbOztYB/aEglJA4QiY7/7uH4=;
  b=b0FOG6VkREEg9AusC0jn0mv91YhEgsriGqYKSy+/IzE5+egd5h9xnaJV
   XHnz1OYpv3RFz+TGpGhxmgvNPPpghluAjPPlkbdT0UYRD7ULK9qC++i6F
   l1bRCE5CrUDMSHkDntwB2OkHyTkRbWI2BGK01bDWoALudMGojgYnp4yX9
   NtLdASJ3lKBvhPa5+oQfkhtKsUL144ybCQCuHiU9wI/DWRY5/5kSuhISR
   P6dl0TsULGJNS17KeFCLi/cuzrjVL3o6TVQSiCDRTUomdijHCShrzdp4i
   tdD/To9PYqQXdw7HpMhjSiRIAmdHY5c/35B5ztGW0wb0DnsYRYjoBU/Gr
   w==;
X-CSE-ConnectionGUID: so5uPF9nR02dm30ZGOD5fg==
X-CSE-MsgGUID: LciGfiHsRL+8JctGYn7X2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="42634882"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="42634882"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 08:22:59 -0700
X-CSE-ConnectionGUID: tqBVklc4RuuQpm3v8yJF2g==
X-CSE-MsgGUID: gFolhKW7RYWYcizUGembzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="122785628"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 18 Mar 2025 08:22:58 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuYmN-000Dt5-2M;
	Tue, 18 Mar 2025 15:22:55 +0000
Date: Tue, 18 Mar 2025 23:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.15] BUILD SUCCESS
 c94cf023dce30d5f28323a9f28ee2912f248a68f
Message-ID: <202503182309.n7hyVnOS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.15
branch HEAD: c94cf023dce30d5f28323a9f28ee2912f248a68f  m68k: defconfig: Update defconfigs for v6.14-rc1

elapsed time: 1457m

configs tested: 12
configs skipped: 134

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
loongarch   allmodconfig    gcc-14.2.0
m68k        allmodconfig    gcc-14.2.0
m68k         allnoconfig    gcc-14.2.0
m68k        allyesconfig    gcc-14.2.0
microblaze  allmodconfig    gcc-14.2.0
microblaze   allnoconfig    gcc-14.2.0
microblaze  allyesconfig    gcc-14.2.0
mips         allnoconfig    gcc-14.2.0
nios2        allnoconfig    gcc-14.2.0
sh           allnoconfig    gcc-14.2.0
sparc        allnoconfig    gcc-14.2.0
xtensa       allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
