Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18E71755C
	for <linux-m68k@lists.linux-m68k.org>; Sun,  4 Aug 2024 20:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722802750; cv=none; b=oB7hvSKP70YksMs5sfWDGpU9c2R9C6WVzpEsM0uNnrVFhIZ7Q3Te/LVZky1n4vO45VdLPwmF1dTgLtP+oh2LTgFvfAEtFI4VmUgQpEaDZgagJZvkDUypGyRdFEjn9kUB08Jpn2GP+ha4iGL4Z1F/a8qj1RAixrxlSeX1MIzmOF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722802750; c=relaxed/simple;
	bh=NWMwfLCQ0Wc3du6MqhN+a2x8w309gpLGxX3t4hNWdCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLnvawLWRSw39dUB9NXDSG6XjI/yuxg/tdijidWCAvpyZKXqu/SPhmUCdGnXS+zZTeG40DFeSlfsH+2i6hCgZ7XVYJXXC6ixB2s4dtnkxIXn8961WKLXFDTfNZBnh3KW72Z+9Rsy+qlnZTX01gqNaB/BpeDCds1OJAl5PhHI68s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+3X9uIi; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+3X9uIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722802749; x=1754338749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NWMwfLCQ0Wc3du6MqhN+a2x8w309gpLGxX3t4hNWdCk=;
  b=W+3X9uIiF+16kFHl2petlZtwEaKhT/I6qgljJthJhOHyHQe/vrhxeVqw
   OXUWWlKszOGltPMqsouQvpHNIlgBCno9r0fEptWbkT+WL+Csdpt7849hi
   xP58mCXz50VO/eu6yc3PSkO9VRbTyMgrkOWewPbRg2vxYCk6cvzyd1Qrh
   ACizsuENcprcZvoMtTcbhYFCYcX/jLknfVhRoYlDAwnzetDgP4DXuNkL7
   bBPlMpweOJ9UJxpL7wYQ2Jg29RvjTfZmQXQvuEDuNVi3gA9A1ikoWBKAc
   /nC/84EtG397lZZdz1/Z+Y3/eONWASATwdaDpFBDwqYpVekYKr1XPZKFt
   w==;
X-CSE-ConnectionGUID: u7SOAi40RNeGiopFlusWXA==
X-CSE-MsgGUID: 9RMpxb+LRwOn/AClpIXy4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="32159780"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="32159780"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 13:19:07 -0700
X-CSE-ConnectionGUID: CezMV2roS+atbOu9bEPdXQ==
X-CSE-MsgGUID: ri672EsKSV6Yw0+ERSuHyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="60328265"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 04 Aug 2024 13:19:05 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sahh1-0001au-1g;
	Sun, 04 Aug 2024 20:19:03 +0000
Date: Mon, 5 Aug 2024 04:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
	kernel test robot <lkp@intel.com>,
	Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: move sun3 into a top-level platform option
Message-ID: <202408050338.LSLH0NA3-lkp@intel.com>
References: <20240803140115.3305547-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240803140115.3305547-1-arnd@kernel.org>

Hi Arnd,

kernel test robot noticed the following build errors:

[auto build test ERROR on geert-m68k/for-next]
[also build test ERROR on geert-m68k/for-linus soc/for-next gerg-m68knommu/for-next linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/m68k-move-sun3-into-a-top-level-platform-option/20240804-001711
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
patch link:    https://lore.kernel.org/r/20240803140115.3305547-1-arnd%40kernel.org
patch subject: [PATCH] m68k: move sun3 into a top-level platform option
config: m68k-m5475evb_defconfig (https://download.01.org/0day-ci/archive/20240805/202408050338.LSLH0NA3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408050338.LSLH0NA3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408050338.LSLH0NA3-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:1135: Error: operands mismatch -- statement `movec %cacr,%d0' ignored
   {standard input}:1135: Error: invalid instruction for this architecture; needs 68000 or higher (68000 [68ec000, 68hc000, 68hc001, 68008, 68302, 68306, 68307, 68322, 68356], 68010, 68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334, 68336, 68340, 68341, 68349, 68360], fidoa [fido]) -- statement `orw #2056,%d0' ignored
   {standard input}:2182: Error: invalid instruction for this architecture; needs 68010 or higher (68010, 68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334, 68336, 68340, 68341, 68349, 68360], fidoa [fido]) -- statement `moves.l %d0,(%a1)' ignored
   {standard input}:2216: Error: invalid instruction for this architecture; needs 68010 or higher (68010, 68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334, 68336, 68340, 68341, 68349, 68360], fidoa [fido]) -- statement `moves.l %d0,(%a1)' ignored
   {standard input}:3614: Error: invalid instruction for this architecture; needs 68010 or higher (68010, 68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334, 68336, 68340, 68341, 68349, 68360], fidoa [fido]) -- statement `moves.l %d5,(%a0)' ignored
   {standard input}:3949: Error: invalid instruction for this architecture; needs 68010 or higher (68010, 68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334, 68336, 68340, 68341, 68349, 68360], fidoa [fido]) -- statement `moves.l %d3,(%a0)' ignored
--
   {standard input}: Assembler messages:
>> {standard input}:1014: Error: operands mismatch -- statement `movec %cacr,%d1' ignored
   {standard input}:1014: Error: invalid instruction for this architecture; needs 68000 or higher (68000 [68ec000, 68hc000, 68hc001, 68008, 68302, 68306, 68307, 68322, 68356], 68010, 68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334, 68336, 68340, 68341, 68349, 68360], fidoa [fido]) -- statement `orw #2056,%d1' ignored
>> {standard input}:1051: Error: operands mismatch -- statement `movec %cacr,%d3' ignored
   {standard input}:1051: Error: invalid instruction for this architecture; needs 68000 or higher (68000 [68ec000, 68hc000, 68hc001, 68008, 68302, 68306, 68307, 68322, 68356], 68010, 68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334, 68336, 68340, 68341, 68349, 68360], fidoa [fido]) -- statement `orw #2056,%d3' ignored
   {standard input}:1348: Error: operands mismatch -- statement `movec %cacr,%d1' ignored
   {standard input}:1348: Error: invalid instruction for this architecture; needs 68000 or higher (68000 [68ec000, 68hc000, 68hc001, 68008, 68302, 68306, 68307, 68322, 68356], 68010, 68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334, 68336, 68340, 68341, 68349, 68360], fidoa [fido]) -- statement `orw #2056,%d1' ignored
   {standard input}:4385: Error: operands mismatch -- statement `movec %cacr,%d0' ignored
   {standard input}:4385: Error: invalid instruction for this architecture; needs 68000 or higher (68000 [68ec000, 68hc000, 68hc001, 68008, 68302, 68306, 68307, 68322, 68356], 68010, 68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334, 68336, 68340, 68341, 68349, 68360], fidoa [fido]) -- statement `orw #2056,%d0' ignored
   {standard input}:5373: Error: operands mismatch -- statement `movec %cacr,%d3' ignored
   {standard input}:5373: Error: invalid instruction for this architecture; needs 68000 or higher (68000 [68ec000, 68hc000, 68hc001, 68008, 68302, 68306, 68307, 68322, 68356], 68010, 68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334, 68336, 68340, 68341, 68349, 68360], fidoa [fido]) -- statement `orw #2056,%d3' ignored
   {standard input}:6031: Error: operands mismatch -- statement `movec %cacr,%d0' ignored
   {standard input}:6031: Error: invalid instruction for this architecture; needs 68000 or higher (68000 [68ec000, 68hc000, 68hc001, 68008, 68302, 68306, 68307, 68322, 68356], 68010, 68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334, 68336, 68340, 68341, 68349, 68360], fidoa [fido]) -- statement `orw #2056,%d0' ignored
   {standard input}:6376: Error: operands mismatch -- statement `movec %cacr,%d0' ignored
   {standard input}:6376: Error: invalid instruction for this architecture; needs 68000 or higher (68000 [68ec000, 68hc000, 68hc001, 68008, 68302, 68306, 68307, 68322, 68356], 68010, 68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334, 68336, 68340, 68341, 68349, 68360], fidoa [fido]) -- statement `orw #2056,%d0' ignored
   {standard input}:6455: Error: operands mismatch -- statement `movec %cacr,%d0' ignored
   {standard input}:6455: Error: invalid instruction for this architecture; needs 68000 or higher (68000 [68ec000, 68hc000, 68hc001, 68008, 68302, 68306, 68307, 68322, 68356], 68010, 68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334, 68336, 68340, 68341, 68349, 68360], fidoa [fido]) -- statement `orw #2056,%d0' ignored
--
   {standard input}: Assembler messages:
   {standard input}:55: Error: operands mismatch -- statement `movec %cacr,%d0' ignored
   {standard input}:91: Error: operands mismatch -- statement `movec %cacr,%d1' ignored
>> {standard input}:108: Error: operands mismatch -- statement `movec %d3,%caar' ignored
   {standard input}:113: Error: operands mismatch -- statement `movec %d3,%caar' ignored
   {standard input}:213: Error: invalid instruction for this architecture; needs 68010 or higher (68010, 68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334, 68336, 68340, 68341, 68349, 68360], fidoa [fido]) -- statement `moves.l (%a0),%d4' ignored
   {standard input}:227: Error: invalid instruction for this architecture; needs 68010 or higher (68010, 68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334, 68336, 68340, 68341, 68349, 68360], fidoa [fido]) -- statement `moves.l %d0,(%a0)' ignored
--
   {standard input}: Assembler messages:
>> {standard input}:59: Error: operands mismatch -- statement `movec %d0,%sfc' ignored
>> {standard input}:59: Error: operands mismatch -- statement `movec %d0,%dfc' ignored
   {standard input}:74: Error: operands mismatch -- statement `movec %d0,%sfc' ignored
   {standard input}:74: Error: operands mismatch -- statement `movec %d0,%dfc' ignored
   {standard input}:89: Error: operands mismatch -- statement `movec %d0,%sfc' ignored
   {standard input}:89: Error: operands mismatch -- statement `movec %d0,%dfc' ignored
   {standard input}:104: Error: operands mismatch -- statement `movec %d0,%sfc' ignored
   {standard input}:104: Error: operands mismatch -- statement `movec %d0,%dfc' ignored

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
