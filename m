Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246217;
	b=krjYyMsYB7W8EEJDmCY3gpOL9iE7bbZvV64c6qOO0I3A8ebLEDj6aiuIiIZP13Q2dtEt
	 9egNP0G1IH+j0YvEj9aEECtrk23YGTLcRE82fr7wILUVOJKyM3zdCacuJAEeGlpqef/mu
	 rY5okcTfedHyFNQuOJ9CJPRAOlKg/AtHY0gbJCeZrOJlPh6ihrA6oiM97V9NqDZJg13Pu
	 dhhbBW/s5OrdH6G2S9DodQrlUiZ91euu/SII0ZHLY10Yr3AErk/4Oig3G91i4TFUyyfDV
	 /9GV6rMkAAdmUE314P4+W90HtFctAxzQn3LyJV8X/PJX0WTT6ygMDm9e/aPbSNSNELQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246217;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OQ6x8cey6Vk/rDL2GyI414Na3+QulPy4Gu4fmFDM6r0=;
	b=LA3LEXX55UGvhvQ6Rk2OWKr+/oOTt2NtGqpWImLKcRsfbfkPntMYRz1UZclKUpq28gsM
	 2nJrchPZBLE42DQVfwpirrQXCQoWfM8js+UdsxNdvS1gsL3AQ6PT7922bR5b5k5Aab60e
	 KU8J6FzWLzT7fiSOmas0EEsR4gfFzeGLmh9UO155RNWpHGKxSU6Zm4VUp0QSIu3cCLw1Q
	 iTV611tS22reMm9H/yr3LUpnN2U0Vi4GV/6yG8YgPa8XMU+YTHIW5ol3T4NilxDJP3cUg
	 izbKsdAu3G8t0WfjdDc8cWWq40w/HVr1qB4fiYv3wNfYkr31OlXKN9DHfTRk/YMR5Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d0dc7dSW;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7861A606A326
	for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Nov 2026 17:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7861A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d0dc7dSW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794246217; x=1825782217;
  h=date:from:to:cc:subject:message-id;
  bh=fMN1s7ZSLCuIxu5sGL+9Gl/U6SvnwushLX75W9Cdcrc=;
  b=d0dc7dSWp0LUapa/Gw8jtNaGNE2MCLqevLwc4mo+8bu2rbUUm6PcHWY4
   7UR3uHxJi2ibS2IG73HRZ/Vn+G0ZhDiflt+1mG+XMT1VeEMTXF2Owcouy
   WPiwJOBtgPQi44Dm6qtkz3HkRWGO/GolXPBdCivPCoJSNsW0xrFYV7DwN
   La5hkH/5cuDympORs0TGJbcr0Zi8K7NOwQfr+l5xGBY7yZMF/g40cQsrV
   nVaATGeYufCaffOExstSrDc/fq8KtdxGgGtVzb14OxkBx0k1IWL82xFjn
   ikKwjpGWoex79skWr+5qCaJvIIr9rjhanwluJhNcIgBSCu8T5Da4z70I+
   Q==;
X-CSE-ConnectionGUID: qg2udNwsQ4u5uCxlPyNw4g==
X-CSE-MsgGUID: u3t/5aZyTBGqI9oUzG999w==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2874976"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2874976"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 09:43:36 -0800
X-CSE-ConnectionGUID: yTE7szATTqSdFo5I0MezQQ==
X-CSE-MsgGUID: faH8ywv/TLe6UbN3mBHzOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8495625"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Nov 2026 09:43:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQTP2-00000000v1x-0KEO;
	Mon, 09 Nov 2026 17:43:32 +0000
Date: Tue, 10 Nov 2026 01:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:cpu-model 1/10] setup.c:undefined reference
 to `m68k_cpumodel'
Message-ID: <202611100112.k2Szzif8-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git cpu-model
head:   6217ad6f81c95c3046e6d406734dfdbf2aa85542
commit: d034e5f2c808aebe347eb33720e5a9937d6395c3 [1/10] m68k: support reporting CPU model name and revision
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20261110/202611100112.k2Szzif8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611100112.k2Szzif8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611100112.k2Szzif8-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: arch/m68k/kernel/setup.o: in function `show_cpuinfo':
>> setup.c:(.text+0xde): undefined reference to `m68k_cpumodel'
>> m68k-linux-ld: setup.c:(.text+0x13a): undefined reference to `m68k_cpurevision'
   m68k-linux-ld: arch/m68k/kernel/setup.o: in function `setup_arch':
>> setup.c:(.init.text+0x80): undefined reference to `m68k_cpumodel'
>> m68k-linux-ld: setup.c:(.init.text+0x72): undefined reference to `m68k_cpumodel'
>> m68k-linux-ld: setup.c:(.init.text+0x86): undefined reference to `m68k_cpurevision'
   m68k-linux-ld: setup.c:(.init.text+0xb2): undefined reference to `m68k_cpumodel'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
