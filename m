Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D365A567D
	for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Dec 2024 02:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734834316; cv=none; b=SRynfZdh6+4I5Atq4503QI6kBn43CRniKsGUwVBGTwEXIFWjhbcEcQTMZ2TA31YKFtaNyhFNQSuy+PJNQ8oK86UEZfRdUKm7KL5ySd0dONt4dNyqyvjbr3yVyMbKCk66+EGdwApP8/zw+IOc0YogNQ+LXhYW4rWbxQubi9uMitA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734834316; c=relaxed/simple;
	bh=5zmmfZiVBNmWOqRBb1MW9m6tygoveJNhgbwIMzhut5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZEII6GlGc2JeUBkpdp/qeJMgsB8inl7keWT+hTrwVJ7DZxlPu3hkAkSQGvxsPlbA16/8Ech2Jh60R1Esdhh0vKRXU6zOyQrENIpBz6ktBnqcizcYwaHctupFzrNf1JmT/xoTzJelxEHnPbVYzbR6w/eSoOzn8OoQB82zKsEAouM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9DREXur; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9DREXur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734834315; x=1766370315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5zmmfZiVBNmWOqRBb1MW9m6tygoveJNhgbwIMzhut5w=;
  b=B9DREXurisqO0aXATran/Q8ahe2YxjWZiGaI0Tc5IdQ1WSaaJ98/eND6
   XKcMa01MYhK6CpLKA5Rqgh81kmZi/pL/XPIcqI/P7BEbSYXiwoi53lP8R
   DjdRXbJWE/DdyB2SKANBEqspjHZm5gdn9Ynaw+uyju02lkZWnhRoDERHH
   DfMV5n1q8oH9i6a+MMS/Vxpob5P7+bIKdTWTQFYW0sKH5+b2ittWQOOgw
   BhF5wfPrIyNe8+hqmIdIYHSegKEViUqpMqntPJnNCZqPrqgnZEiuY1q4V
   AAQrSV1+yd7dy0r0t26jlw2Fv+P6EAKpX5/zYaKe+zHXnl3TicJQHdflA
   w==;
X-CSE-ConnectionGUID: y+ZgB8nzQWeqK0OwNNhVUA==
X-CSE-MsgGUID: LLKdcJrxR7K+7ST8TNTjPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35235276"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35235276"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 18:25:13 -0800
X-CSE-ConnectionGUID: fTQFRDlSTHGEV8ntRY05QA==
X-CSE-MsgGUID: bZ7t4Co6Rha1DEhIleKqjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="99097171"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Dec 2024 18:25:12 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPBeX-0002fr-2n;
	Sun, 22 Dec 2024 02:25:09 +0000
Date: Sun, 22 Dec 2024 10:24:16 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@uclinux.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3] include/linux/compiler_types.h:542:45:
 error: call to '__compiletime_assert_503' declared with attribute error:
 BUILD_BUG_ON failed: sizeof(priv_tbl->probs) % 16
Message-ID: <202412221002.BSM55noD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   83fed5567367d0b8d99c0d455fe265ed2a505947
commit: 83fed5567367d0b8d99c0d455fe265ed2a505947 [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-r051-20241222 (https://download.01.org/0day-ci/archive/20241222/202412221002.BSM55noD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221002.BSM55noD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221002.BSM55noD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/staging/media/rkvdec/rkvdec-vp9.c: In function 'rkvdec_vp9_start':
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_503' declared with attribute error: BUILD_BUG_ON failed: sizeof(priv_tbl->probs) % 16
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:523:25: note: in definition of macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/staging/media/rkvdec/rkvdec-vp9.c:1010:9: note: in expansion of macro 'BUILD_BUG_ON'
    1010 |         BUILD_BUG_ON(sizeof(priv_tbl->probs) % 16); /* ensure probs size is 128-bit aligned */
         |         ^~~~~~~~~~~~
--
   In file included from <command-line>:
   rkvdec-vp9.c: In function 'rkvdec_vp9_start':
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_503' declared with attribute error: BUILD_BUG_ON failed: sizeof(priv_tbl->probs) % 16
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:523:25: note: in definition of macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   rkvdec-vp9.c:1010:9: note: in expansion of macro 'BUILD_BUG_ON'
    1010 |         BUILD_BUG_ON(sizeof(priv_tbl->probs) % 16); /* ensure probs size is 128-bit aligned */
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_503 +542 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  528  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  529  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  530  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  531  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  532  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  533   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  534   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  535   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  536   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  537   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  538   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  539   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  540   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  541  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @542  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  543  

:::::: The code at line 542 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
