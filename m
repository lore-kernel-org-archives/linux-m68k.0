Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84585221FD4
	for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Jul 2025 22:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753310015; cv=none; b=e52NgGZtci9T9OLiQLFRrKkpxKiYZ9y4qYDJ+1hJ3kR6zpn8zbgZI24cZrwZYj79ouyq9UY7AfZe0E5ajgCbgOREx2viHiTlinOdgyPRbH3Z/9apXgerhl8/FlAo44gSPLP9C+wNn06NcjlODc+18+7nMagf0rZsCG0d0fnouks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753310015; c=relaxed/simple;
	bh=nncZDrpOvKqn5x5qZyNl+Xh4fLmSJcj9dkm+lxjIJMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ceFg3uTw7+DYOpUh82MVN7PmzmKupUQM7ABrD31NWV8ol+ObIFbvChqlJCTLBLNdAQyTu8curWf3IRw/TKLgEYI7MHYqwDOJ7Q2EDt85Ldp619MxPTvtuibsJxu7KLihwtBQdf0Hs4Hogmr2DW+flPqo6q8SSJNNys1N+5D9oQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V2RGWV01; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2RGWV01"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753310014; x=1784846014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nncZDrpOvKqn5x5qZyNl+Xh4fLmSJcj9dkm+lxjIJMI=;
  b=V2RGWV01yP/ZFJDiqGxWE6Z18w884B8i0dnYpH8IoUvIGvkB9Sy9YiYE
   H45PDine2Qd2xFMjgWCnpkZd5qVEwLNB0O7NIXpBLMTOtszPi7WKqJYyG
   AaD6kQavoGcNeQN3arRApzV1Fd1oUqy4OpSl/50z2e1IXWEeLr656+tOp
   0OLS6D/rhy/RH9qIOMenbH1hcTXVzIPzo9JYQgCHTXCbFrw8W81vNE1Cy
   JYXkp0c61PhTWckkDolVJuGYw46VoNCwzB9JEz6tSP1tVUOlpLbT+jHM0
   8RmxaRMLnWTv3D335MKm0quCm18tI9Y/roc5frWKnbeVQAqmBqn4aSPn2
   g==;
X-CSE-ConnectionGUID: 0CT1fAqUSM6D4whENE1MjA==
X-CSE-MsgGUID: 2I4zUz+7RAWFJH+I6MbqmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="43225121"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="43225121"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 15:33:29 -0700
X-CSE-ConnectionGUID: aFy6nzkMSb62VwUamiRcmA==
X-CSE-MsgGUID: erMXicQsQeqfLlbkAskXrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="160496792"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jul 2025 15:33:26 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uei1b-000JqN-2k;
	Wed, 23 Jul 2025 22:33:23 +0000
Date: Thu, 24 Jul 2025 06:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 11/14] kismet: WARNING: unmet direct dependencies
 detected for OF_EARLY_FLATTREE when selected by BUILTIN_DTB
Message-ID: <202507240640.HUof1qoU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   27df60f03ea91cb3f494cf3821d6b0859275bb0a
commit: ea4243b0b16a64a1f6c5c32276e692590fae11d4 [11/14] m68k: implement a builtin devicetree for nonmmu
config: m68k-kismet-CONFIG_OF_EARLY_FLATTREE-CONFIG_BUILTIN_DTB-0-0 (https://download.01.org/0day-ci/archive/20250724/202507240640.HUof1qoU-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250724/202507240640.HUof1qoU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507240640.HUof1qoU-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_EARLY_FLATTREE when selected by BUILTIN_DTB
   WARNING: unmet direct dependencies detected for OF_EARLY_FLATTREE
     Depends on [n]: OF [=n]
     Selected by [y]:
     - BUILTIN_DTB [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
