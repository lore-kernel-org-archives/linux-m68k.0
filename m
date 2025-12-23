Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033F433A710
	for <linux-m68k@lists.linux-m68k.org>; Tue, 23 Dec 2025 13:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766496208; cv=none; b=B6pqi5B57/AfiUYcnOH+h34DJtVuaQ+/oN+0ur/b+3sRp4Fwmk6rUS65l8Dyo9Bh1ZyUZFIJkFYk3ffRDCRH1yLqo/+2pyaNrRksdoW6vaGimWdKUx00G4cWK0B3zp8BWejSxmJjnBAK6XXGJsxi8gymfiMwM+MhKMfkPY7lW48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766496208; c=relaxed/simple;
	bh=sVjyIGQrrpkyBkTFumzOYIT7xsfvu4X4mrPIwnTXsuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGjWkZRvG1g19ktObOZanbts29bGTbg0dpKuF7EJu0ZEUnWh+vikbCNcGJJXG+C115IEuB2I3dqR/PJKGiE5k6KHwKLpU+hT61VlIFGVTTFfVTt9D3mnxTEjp1kboX8Nu25gRF62HBA88O6ApPnc5OAl+wH1ais1zfvTV5FBR+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7MVlIxC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7MVlIxC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766496207; x=1798032207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sVjyIGQrrpkyBkTFumzOYIT7xsfvu4X4mrPIwnTXsuo=;
  b=l7MVlIxCkk4dTVkJUxlwmY5+xVP7IjFkFi/OyQ4HIwtmJaLWJUNUj9nb
   OyufL1//sp0sCBXZIGs9zhhWY9p6uaC4ig+ZZkzxgJeFXGIpU64j6Ag57
   sJ85PwFeCQhCa4MYfawcouf8dSSn91xmuRQyV4Z8PzbmMmarivRw2nD3a
   LHTtlupBtAsuKMCieDDJqKK1TAGG6U46YP5s1Zn629rYKFdt7GY9BTHTP
   Cjk4PTHS8bPspJGwhu34eJiqgQjC88dv6ETtQ6LwMaXY5Fa400yGlOavl
   Ju2s87951eE91fQqlEIfOcIdL09/pzPlAFYjdtlCkSRWft9EA6bgXxKUZ
   g==;
X-CSE-ConnectionGUID: nnKxZVgwSL2LV07IMDhyYw==
X-CSE-MsgGUID: MVI3KbRqQTKLQzrZaOhRfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68226180"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="68226180"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 05:23:25 -0800
X-CSE-ConnectionGUID: trY28Fj2ScOhqzvD2TJVPw==
X-CSE-MsgGUID: pablz/scS8mrJb7R/PPP9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199691761"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Dec 2025 05:23:21 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY2MA-000000001xh-2Udu;
	Tue, 23 Dec 2025 13:23:18 +0000
Date: Tue, 23 Dec 2025 21:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@kernel.org>, David Gow <davidgow@google.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>,
	Christophe Leroy <chleroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	Tamir Duberstein <tamird@gmail.com>
Subject: Re: [PATCH v2 3/3] bitmap: break kunit into test cases
Message-ID: <202512232124.O36Ud5C2-lkp@intel.com>
References: <20251222-bitmap-kunit-convert-v2-3-6a61a5330eff@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-bitmap-kunit-convert-v2-3-6a61a5330eff@gmail.com>

Hi Tamir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Tamir-Duberstein/test_bitmap-extract-benchmark-module/20251222-214306
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251222-bitmap-kunit-convert-v2-3-6a61a5330eff%40gmail.com
patch subject: [PATCH v2 3/3] bitmap: break kunit into test cases
config: sparc-randconfig-001-20251223 (https://download.01.org/0day-ci/archive/20251223/202512232124.O36Ud5C2-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512232124.O36Ud5C2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512232124.O36Ud5C2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:65,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/kref.h:16,
                    from include/kunit/test.h:22,
                    from lib/bitmap_kunit.c:6:
   lib/bitmap_kunit.c: In function 'test_bitmap_printlist':
>> arch/sparc/include/asm/string.h:18:29: warning: 'memset' used with length equal to number of elements without multiplication by element size [-Wmemset-elt-size]
      18 | #define memset(s, c, count) __builtin_memset(s, c, count)
         |                             ^~~~~~~~~~~~~~~~
   lib/bitmap_kunit.c:468:9: note: in expansion of macro 'memset'
     468 |         memset(bmap, -1, PAGE_SIZE);
         |         ^~~~~~


vim +/memset +18 arch/sparc/include/asm/string.h

70a6fcf3283a0a Al Viro 2016-01-17  16  
70a6fcf3283a0a Al Viro 2016-01-17  17  #define __HAVE_ARCH_MEMSET
70a6fcf3283a0a Al Viro 2016-01-17 @18  #define memset(s, c, count) __builtin_memset(s, c, count)
70a6fcf3283a0a Al Viro 2016-01-17  19  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
