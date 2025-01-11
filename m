Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC9A1B87DA
	for <linux-m68k@lists.linux-m68k.org>; Sat, 11 Jan 2025 21:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736629570; cv=none; b=qz3euiav4/OdQ51dtglpOm7GgC3u16WfN+Z32QZXAwtuZA/rxl5arEns5gGy38NuAG5hUYoOq2CWyjnZY2antscpFAuawRVyJoga1hL4g7jyQ0PaBzXLbhM21bXtnpJqVBruf3ZcpxXDkYCtdd/SmFy5QUEncFnvr6pFJfhjPN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736629570; c=relaxed/simple;
	bh=KIyVo7rhDv5U9a2m9uUPF1sHWPaMkt6MToDHXgzY2SQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0h+7awDQo/3lux8U6rzMPohKw0TP4/NS9g+GVMVvY7MsFSJm5akReRAcW/5sV49e8aePaXAlqZytx9G2Hx9KBXaJIDsLnyIw6jVno2Yyl4o6tXM+J+2+4EvO6tVxDLln25efGyuMLiIR+lsOJkloMjReCYLhdIqPl8an0npJAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwDZDeyk; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwDZDeyk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736629568; x=1768165568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KIyVo7rhDv5U9a2m9uUPF1sHWPaMkt6MToDHXgzY2SQ=;
  b=cwDZDeykRShbc7NSLbJ6kzNatEaobQ+5nCCJ6ihnhwrjZsL+QejWULUp
   STUFRAOf9SmV2ZnVeePD4ZGgOr5UV9tScryEi9QKm+qbG4fmSEZg77Zff
   8/X7R7aSdnL0v8IEp2bF3CtQXcgjpSRNni/gDsu8QHPx6/NZDzpSLfsmA
   4JEgcKPNhyISSG049EjDJ5U0PaWo3P6NexeL17VZ8QYvQ/3hW/1v5hLbz
   5MAlke4eYaekVijk1VKJFr/T07mRs2JoQzKBqNC25JOdhbSwm1W7+Xyjr
   NlwNZbI1jdGR5ArAhYw/pOPMv/7OAbFPhbh/flUmPPZF0pIgRNKrQWBd0
   w==;
X-CSE-ConnectionGUID: XAP9hWMaSXuFxsjodXS0xg==
X-CSE-MsgGUID: imT+vJxiSHK2F6lZAwOQdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="47391061"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="47391061"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 13:06:05 -0800
X-CSE-ConnectionGUID: USUZh5MxQrKqMrvcO7TRsQ==
X-CSE-MsgGUID: v47+EjcAR0GF9DNRbLx7iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="109054185"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jan 2025 13:05:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWig7-000LCn-2U;
	Sat, 11 Jan 2025 21:05:55 +0000
Date: Sun, 12 Jan 2025 05:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Albershteyn <aalbersh@redhat.com>, linux-fsdevel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Andrey Albershteyn <aalbersh@redhat.com>,
	linux-api@vger.kernel.org, monstr@monstr.eu, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
	maddy@linux.ibm.com, luto@kernel.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com,
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz,
	arnd@arndb.de, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH] fs: introduce getfsxattrat and setfsxattrat syscalls
Message-ID: <202501120410.3ZwwYXqY-lkp@intel.com>
References: <20250109174540.893098-1-aalbersh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109174540.893098-1-aalbersh@kernel.org>

Hi Andrey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on geert-m68k/for-next powerpc/next powerpc/fixes s390/features linus/master v6.13-rc6 next-20250110]
[cannot apply to geert-m68k/for-linus deller-parisc/for-next jcmvbkbc-xtensa/xtensa-for-next tip/x86/asm]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrey-Albershteyn/fs-introduce-getfsxattrat-and-setfsxattrat-syscalls/20250110-014739
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250109174540.893098-1-aalbersh%40kernel.org
patch subject: [PATCH] fs: introduce getfsxattrat and setfsxattrat syscalls
config: riscv-randconfig-002-20250111 (https://download.01.org/0day-ci/archive/20250112/202501120410.3ZwwYXqY-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501120410.3ZwwYXqY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120410.3ZwwYXqY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1615:2: warning: #warning syscall getfsxattrat not implemented [-Wcpp]
>> <stdin>:1618:2: warning: #warning syscall setfsxattrat not implemented [-Wcpp]
--
>> <stdin>:1615:2: warning: #warning syscall getfsxattrat not implemented [-Wcpp]
>> <stdin>:1618:2: warning: #warning syscall setfsxattrat not implemented [-Wcpp]
--
>> <stdin>:1615:2: warning: #warning syscall getfsxattrat not implemented [-Wcpp]
>> <stdin>:1618:2: warning: #warning syscall setfsxattrat not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
