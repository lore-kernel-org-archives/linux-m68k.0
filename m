Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F12D5464D
	for <linux-m68k@lists.linux-m68k.org>; Sun, 28 Dec 2025 03:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766892903; cv=none; b=jnFkTYCvdRTiO2Mm0Xvu+C8FTR7UXboVErYmtv+zspvH7U6OZc8G2yUXraIGOttnS0rdxhwyYdnju34hEYjGTV9wDiQaXBempi9ikd71up67suqEwFPCLKbbUSA7d+lXWWU5JolVRlzSIX78EkMxQylCxULDErsJ+Ib1i4+OT5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766892903; c=relaxed/simple;
	bh=GuIC3bFkkJdvl1CpVIB6XPzQzDS3rWf2teTVlwCsumk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AqIHFBLFqZ7E7k9CEMMn8UHnttxFgrVId3y/TPmwFhZqa07stmN9wQgTC1+fN4/i4AIcQcrxMKb9QoywS+mXRXdVRTwsiaQho+IMIzmvLiqWx/ZEzASxRQ84eBZJyfD0fdREEYB6x2imo0YfCFG0z2eH1gzAUyXkECKaWuxFrRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMwIZITD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMwIZITD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766892902; x=1798428902;
  h=date:from:to:cc:subject:message-id;
  bh=GuIC3bFkkJdvl1CpVIB6XPzQzDS3rWf2teTVlwCsumk=;
  b=bMwIZITDVLmEAji3QIF2mIdspuCczfw9lSt9A0bBRTd4dg1VeoVVHSzZ
   gXJ8kovzGsdmK9KLP1N6GRiTBKF9YjphCbn2FoinOsSGHeorABgp3APJ0
   AeOwNDpF2+eSKSSqJ1Epw5Eklhmt63unw1fjRbIOxD/zT9p/2f2Zny0Gt
   T8BhMnSYFstKZvrtFwrKpPRjnXHNSSvGOOed+hFWKGZ3fdaljOuXhqo9h
   EWWnA5NGPDPtSz/PKadytpwkOF1A8tOs1e0xmHQavrgzHsBM6T8hts1qK
   7er96ZmiQa7gU4JRBm/FJvy+akD3I7sURBxy1Z+p4BrKsQGsPt0t3QLLZ
   A==;
X-CSE-ConnectionGUID: n6iYhlPsS5qV3+CD+TKsSA==
X-CSE-MsgGUID: OJgJUvehS7SObCq8LAJKlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="85982635"
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="85982635"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 19:34:59 -0800
X-CSE-ConnectionGUID: q8XkMzQJRyeii4tuPLryWg==
X-CSE-MsgGUID: CFwf+CXMQ0WSdaXFU0lYsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="201577753"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 27 Dec 2025 19:34:57 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZhYU-000000006En-3xiG;
	Sun, 28 Dec 2025 03:34:54 +0000
Date: Sun, 28 Dec 2025 11:34:44 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@uclinux.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3]
 include/linux/build_bug.h:78:41: error: static assertion failed: "XFS:
 sizeof(struct xfs_attr_sf_entry) is wrong, expected 3"
Message-ID: <202512281116.S91ii66Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   edf19f0aab57e81f4391d800d6845527413ca77b
commit: edf19f0aab57e81f4391d800d6845527413ca77b [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-r072-20251228 (https://download.01.org/0day-ci/archive/20251228/202512281116.S91ii66Y-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512281116.S91ii66Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512281116.S91ii66Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitfield.h:10,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:386,
                    from include/linux/uuid.h:11,
                    from fs/xfs/xfs_linux.h:10,
                    from fs/xfs/xfs.h:26,
                    from fs/xfs/xfs_super.c:7:
   fs/xfs/libxfs/xfs_ondisk.h: In function 'xfs_check_ondisk_structs':
>> include/linux/build_bug.h:78:41: error: static assertion failed: "XFS: sizeof(struct xfs_attr_sf_entry) is wrong, expected 3"
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                            ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                     ^~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:10:2: note: in expansion of macro 'static_assert'
     static_assert(sizeof(structname) == (size), \
     ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:137:2: note: in expansion of macro 'XFS_CHECK_STRUCT_SIZE'
     XFS_CHECK_STRUCT_SIZE(struct xfs_attr_sf_entry,  3);
     ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "XFS: sizeof(struct xfs_dir2_data_unused) is wrong, expected 6"
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                            ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                     ^~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:10:2: note: in expansion of macro 'static_assert'
     static_assert(sizeof(structname) == (size), \
     ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:140:2: note: in expansion of macro 'XFS_CHECK_STRUCT_SIZE'
     XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_data_unused, 6);
     ^~~~~~~~~~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
