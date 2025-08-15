Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D873009EF
	for <linux-m68k@lists.linux-m68k.org>; Fri, 15 Aug 2025 12:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755260659; cv=none; b=WMbchPSWYsPvOrgxZbyyunL3CqtjnWZI9/FOPqSZ145XkkfFmdjqu+COYhQQkQF3T5iu0ZK8Ow9a+V8as5BUjk03pfmhlG7Mi5V+xcyWSo30NAC1zxdPW1GI+t/9s3obX9v7V5gauC0Z/9iwEqIWNW522HnuKPtjH9doew3At7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755260659; c=relaxed/simple;
	bh=j3VWF1UseoZEG8mpMD4BASAnx08WjqII5tx6UBWw3Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SphVUQff+amE69zQb7sG0MtA7Xa6JzIYLmoKIvSC4g/fsj20/Gs8rsQZLb4fW1NF9jRuoT+yx1d/yS2AtYVIbaxw797E9Be3GzGAyVdYqsTlGgtTzFZF10IalKvvomYF0ko4oACJ4Cb+oh2n1Wa2HCPf2kqSQ5/DTgr39hn/E3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JTMpgshG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTMpgshG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755260658; x=1786796658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j3VWF1UseoZEG8mpMD4BASAnx08WjqII5tx6UBWw3Cw=;
  b=JTMpgshGAIc3JTcBPiCMAHHHNuZfXfW0uP8WaIfVGMQxFfATsMBaWNg5
   ml1nBweVeYe/PbQaeGFKiZLAb6EYkECgEslEFHZqSaIz6GDKXdvXysS0X
   Iro8exLq7Nc6DTQflg4bAXHgHkOBudE29aUdy+orVwXTbqCbb+RQBFRra
   IkiKUT/YX5U3NEbPvsVVzS2P24hZBInbqW3Xx7qKCRdkWPuKC0uYzRMy2
   /lVnEFwdbeohrhpQsmaYpvrA3l0gmET/6sgpSWBq6uLhNrDqxpGH5v/GN
   3f1w0vfsqrTf+VYszXv2DbX70fNpyuHG803NbwxevGMCM1uvQd5tUNYGu
   Q==;
X-CSE-ConnectionGUID: TntPoD9VQ7KTM9kvfibKCw==
X-CSE-MsgGUID: ryCs/hyMSuqpCZiqb91bZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57690139"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57690139"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 05:24:16 -0700
X-CSE-ConnectionGUID: 85x5RQDpQwWJAFQzxkXvSQ==
X-CSE-MsgGUID: yuZglviPSXCfappjvVsJNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="172340429"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 15 Aug 2025 05:24:15 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umtTg-000BxG-2J;
	Fri, 15 Aug 2025 12:24:12 +0000
Date: Fri, 15 Aug 2025 20:23:34 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@uclinux.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3] include/linux/compiler_types.h:572:38:
 error: call to '__compiletime_assert_547' declared with attribute error:
 BUILD_BUG_ON failed: sizeof(priv_tbl->probs) % 16
Message-ID: <202508152015.U8E8Ryjx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   037916143d9bf6331f9834e99f8da416960ac8da
commit: 037916143d9bf6331f9834e99f8da416960ac8da [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-r073-20250815 (https://download.01.org/0day-ci/archive/20250815/202508152015.U8E8Ryjx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508152015.U8E8Ryjx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508152015.U8E8Ryjx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c: In function 'rkvdec_vp9_start':
>> include/linux/compiler_types.h:572:38: error: call to '__compiletime_assert_547' declared with attribute error: BUILD_BUG_ON failed: sizeof(priv_tbl->probs) % 16
     572 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:553:4: note: in definition of macro '__compiletime_assert'
     553 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:572:2: note: in expansion of macro '_compiletime_assert'
     572 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c:1010:2: note: in expansion of macro 'BUILD_BUG_ON'
    1010 |  BUILD_BUG_ON(sizeof(priv_tbl->probs) % 16); /* ensure probs size is 128-bit aligned */
         |  ^~~~~~~~~~~~
--
   In file included from <command-line>:
   rkvdec-vp9.c: In function 'rkvdec_vp9_start':
>> include/linux/compiler_types.h:572:38: error: call to '__compiletime_assert_547' declared with attribute error: BUILD_BUG_ON failed: sizeof(priv_tbl->probs) % 16
     572 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:553:4: note: in definition of macro '__compiletime_assert'
     553 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:572:2: note: in expansion of macro '_compiletime_assert'
     572 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   rkvdec-vp9.c:1010:2: note: in expansion of macro 'BUILD_BUG_ON'
    1010 |  BUILD_BUG_ON(sizeof(priv_tbl->probs) % 16); /* ensure probs size is 128-bit aligned */
         |  ^~~~~~~~~~~~


vim +/__compiletime_assert_547 +572 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  565   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  567   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  568   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  569   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  570   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  571  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @572  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  573  

:::::: The code at line 572 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
