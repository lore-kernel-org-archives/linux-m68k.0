Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B53239594
	for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Nov 2025 01:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764208780; cv=none; b=sGYdcH6tyqBYu/eUulD6DvHxnelA51+qpcvjGSLqfJIViofX2kqSMH5X2FuF74P0vYXrmqE1DlQNwEtx78P8Qfr6bLgIVXuoJqRk2NUsg0L36yV7p0vbVLIHPrkAUh2iusLtjfZNOsK/mBLOOpmaj/0/RdN7Kf6fg3pjzSuhHvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764208780; c=relaxed/simple;
	bh=/iTY5lK+GbVbpicqPvPbabWVnqm2qRHYTtm+0dMiuCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D33lKBPPOxMfn1n7OD0B2obW9DmenYTG5bQPUu0XJhs02pQX2Kqvr2+bYBMTWqYVJlOiqpmOiugWe7kC2r0jd/+atX6BBE39geyZWuZqzlmB4+rwaDVyfj5WmYk27gy947qwGG15jF7SXWaSs8z38lYfTmCjKUaSJKzozM2I7/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aqBLRcP1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aqBLRcP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764208778; x=1795744778;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/iTY5lK+GbVbpicqPvPbabWVnqm2qRHYTtm+0dMiuCA=;
  b=aqBLRcP191dbD787WEhc/6OIL2rh0A/iwW3yh/hnYO7vHz24tRSFJJyX
   1mqEEOMKqdET80YrOOBjJ0cxaIiRmUEytHc/pvbkE86lIoTy5U6Pm4PX7
   /w6dxc0fc3Tx1xc/+owfFzInGcKWS6qnGdjBfJ0G7+WS4tUoMEGojvmrc
   EhjADvOXuidbi5W4SAT38hSedJL8f/09kTbtube2kRrweCGe0K+Se0rVq
   xdePsZQgiVdhxTjqMANJQhZYvYOidOiu2hy3XcDEr1rtidcFsy8DILkh/
   kUOPTxfP+PWNlW4pzGhnKX/Q5iSa8AvoB/Ikmsr4jQGzlThWn40VN+0Zj
   w==;
X-CSE-ConnectionGUID: erwSfl6gSUyZ3dxspemMiQ==
X-CSE-MsgGUID: YxTEXuGOTJeVFvxIqkadBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65439495"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="65439495"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 17:59:37 -0800
X-CSE-ConnectionGUID: dOnZxvv5TN6aBUKek9C2pg==
X-CSE-MsgGUID: kq4D3beKReSkhCcAnWR2Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="193907601"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Nov 2025 17:59:35 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vORIC-000000003Yb-2ohe;
	Thu, 27 Nov 2025 01:59:32 +0000
Date: Thu, 27 Nov 2025 09:59:24 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@thingy.jp>, geert@linux-m68k.org
Cc: oe-kbuild-all@lists.linux.dev, kas@kernel.org, mingo@kernel.org,
	seanjc@google.com, bp@alien8.de, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>
Subject: Re: [PATCH] m68k: implement runtime consts
Message-ID: <202511270956.hzGiPzdZ-lkp@intel.com>
References: <20251127000505.2117956-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127000505.2117956-1-daniel@thingy.jp>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-m68k/for-next]
[also build test WARNING on geert-m68k/for-linus linus/master v6.18-rc7 next-20251126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Palmer/m68k-implement-runtime-consts/20251127-080652
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
patch link:    https://lore.kernel.org/r/20251127000505.2117956-1-daniel%40thingy.jp
patch subject: [PATCH] m68k: implement runtime consts
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251127/202511270956.hzGiPzdZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270956.hzGiPzdZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270956.hzGiPzdZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/dcache.c:38:
   arch/m68k/include/asm/runtime-const.h: In function '__runtime_fixup_ptr':
>> arch/m68k/include/asm/runtime-const.h:28:29: warning: unused variable 'end' [-Wunused-variable]
      28 |         const unsigned long end = start + sizeof(*value);
         |                             ^~~
   arch/m68k/include/asm/runtime-const.h: In function '__runtime_fixup_shift':
   arch/m68k/include/asm/runtime-const.h:51:29: warning: unused variable 'end' [-Wunused-variable]
      51 |         const unsigned long end = start + sizeof(*insn);
         |                             ^~~


vim +/end +28 arch/m68k/include/asm/runtime-const.h

    13	
    14	#define runtime_const_ptr(sym) ({				\
    15		typeof(sym) __ret;					\
    16		asm_inline("1:\t"					\
    17			"mov.l #0xcafef00d,%0\n\t"			\
    18			".pushsection runtime_ptr_" #sym ",\"a\"\n\t"	\
    19			".long 1b - .\n\t"				\
    20			".popsection"					\
    21			: "=a" (__ret));				\
    22		__ret; })
    23	
    24	static inline void __runtime_fixup_ptr(void *where, unsigned long val)
    25	{
    26		u32 *value = where + 2;
    27		const unsigned long start = ((unsigned long) where) + 2;
  > 28		const unsigned long end = start + sizeof(*value);
    29	
    30		*value = val;
    31	
    32		flush_icache_range(start, end);
    33	}
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
