Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BD2182D9
	for <linux-m68k@lists.linux-m68k.org>; Wed,  1 Jan 2025 07:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735715238; cv=none; b=pwv3ItzUrWrjD8iq4G/U+UcBsQv73wPqEL9xgg8lvNEbQZZasB8H1xZ9eZpaIupKIoPsQOdVyFsTznQs2GiyVCw2cf/RbT4/dQinWgrXXGsUeWJPS1GDXxbda2XNSXqSbdlfrl49ek01zUW258TD+oI1a36HEQvTtwHoJMbFXzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735715238; c=relaxed/simple;
	bh=bJa6lqQ/pA0TIBl5kNBp8J4qOsUnhzrzz5GBr16GqAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F2Q+J7KWWBE/Ofh56g9FUCGieOMjO1um2MCKCrnkw7XYO+578GuvGSUNJ6/I7Sg9TMQTzkG1j3YtNQaRqpRhVIv8Q/TYtaGvSLPD8CHsZaxBNtygI66QcSWRzWlXJmKPWYboneHFRGQBOml4GagXf4pK84+VGYLxZbg9W/toYJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TsGM8t6C; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TsGM8t6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735715236; x=1767251236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bJa6lqQ/pA0TIBl5kNBp8J4qOsUnhzrzz5GBr16GqAI=;
  b=TsGM8t6CcWtnhPlKALuGYCvIxGvSnv04QZWqZHyoGtGqbXYk6UOQgFbw
   x4A9deG0QPRT3Bg63TWTt5II/64leOIyAozCgQQY3Ni+zxkwvmzav7MmU
   b3fr+2r/3XjuIPbIjqNwlowOfLx+G9U19WgIvGXxHdw/I49LiRfI+f4Sa
   tSlSleC/mPGYANWZVRbek+4qeH9WP4xym7/kVhXqYWAwGaYobVbbXqp4U
   JzgVkG3YyqktbRyBEsfyA0otJkXvDWpoaBUbEgQGd7wQqZoUmCwl/jBq2
   pVlWdZQpYb0eUuuuaBFphGXG4eauN+jVmfvkZC2XZmGe2K8S0MskDqLiA
   Q==;
X-CSE-ConnectionGUID: mHuSK7BVRGy/SaX0gYe2xQ==
X-CSE-MsgGUID: 31qLB6IWQfSVvCsx114ATQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="47333410"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="47333410"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 23:07:15 -0800
X-CSE-ConnectionGUID: 2x7h053SRWOwW3ByOqFxfA==
X-CSE-MsgGUID: YliKeYhhQ8O+4ES//B311g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106217703"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Dec 2024 23:07:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSsox-0007h1-1M;
	Wed, 01 Jan 2025 07:07:11 +0000
Date: Wed, 1 Jan 2025 15:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [geert-m68k:master 2/2] lib/muldi3.c:53:28: sparse: sparse: asm
 output is not an lvalue
Message-ID: <202501011517.5edVb87Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
head:   17810b1de0e9e5c1000cf8f5b4787ad930b0353e
commit: e96424b86d5098f44279399b85551e0f84a1c9e9 [2/2] m68k: Use kernel's generic muldi3 libgcc function
config: m68k-randconfig-r122-20250101 (https://download.01.org/0day-ci/archive/20250101/202501011517.5edVb87Z-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250101/202501011517.5edVb87Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501011517.5edVb87Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/muldi3.c:53:28: sparse: sparse: asm output is not an lvalue
>> lib/muldi3.c:53:28: sparse: sparse: asm output is not an lvalue
>> lib/muldi3.c:53:28: sparse: sparse: not addressable
>> lib/muldi3.c:53:28: sparse: sparse: generating address of non-lvalue (11)
>> lib/muldi3.c:53:28: sparse: sparse: generating address of non-lvalue (11)

vim +53 lib/muldi3.c

b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  48  
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  49  long long notrace __muldi3(long long u, long long v)
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  50  {
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  51  	const DWunion uu = {.ll = u};
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  52  	const DWunion vv = {.ll = v};
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23 @53  	DWunion w = {.ll = __umulsidi3(uu.s.low, vv.s.low)};

:::::: The code at line 53 was first introduced by commit
:::::: b35cd9884fa5d81c9d5e7f57c9d03264ae2bd835 lib: Add shared copies of some GCC library routines

:::::: TO: Palmer Dabbelt <palmer@dabbelt.com>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
