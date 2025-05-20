Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2C9246770
	for <linux-m68k@lists.linux-m68k.org>; Tue, 20 May 2025 00:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747699288; cv=none; b=uSufXWbmqBvVFJF6GcMmTGIuA4mWJo47cYGoTmzclyZegjnZsLVZBnIM1WOvbVpo3dOPJzPyF4uK5GcXXBzHJiQDDqrlk3l3EveF44do3IdtSG88ZnD/0lyz1rNr2TmJqbPOeOa1X4iJGjz6sv4IDwvClAkak3HUrmy48UkRTR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747699288; c=relaxed/simple;
	bh=DaBecZ4rt1hxYlTcozXAFQNMCtbKHtM0IYyUf3Gwaws=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nr3I5s1BH4OfbsWVwMiFIxkfoxHZ4q7GJUs97o3+/6EBtiQA03a2awHZQc8JI3gdYn0ErhzToK09Bl+lmb24QdH1fZTDf9P8VaVilc8lSmzuPQSzL8UmHTPdpmvtOlJzkZX6G4fawMf8OGzsbV/ehT8xw625hxab05SI7j3n9fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mLXJJT1a; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mLXJJT1a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747699288; x=1779235288;
  h=date:from:to:cc:subject:message-id;
  bh=DaBecZ4rt1hxYlTcozXAFQNMCtbKHtM0IYyUf3Gwaws=;
  b=mLXJJT1aDNa8neV1Nt5SGtw2DoXkekHt8CGXnIYVT43NY9rXIFuXbJRW
   pOIfZsw4y5TT2/KLxZNJZ3GCWddCur8kV0SCF269/1wrHg4OlYZl01z9+
   RWepuUDORdHs/4BUEevqVG2H0sm9lox+adIxtPs1h1abMWJXatVLpey8W
   oLQwQ/fMBAjmBq3tjhFC2V4Ccc+N1X8CIcqccRcvVnHNj/2BHs6YzW8YI
   sIgOQwn6+pQP9sDdC6UpRkArt4HJWHPRxSKv9Ye0vPppcAO86MwI8LAeu
   3wprk+gazKae2zjxUO152BUPeYxte2lxAg/+3S9UL9VQ0FCaKuxNWQzSq
   A==;
X-CSE-ConnectionGUID: 97RspFGETUS+7Zbg3V761A==
X-CSE-MsgGUID: GeDl/O16SMmwbR9RQhrRdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="72125796"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="72125796"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 17:01:26 -0700
X-CSE-ConnectionGUID: Mqo7r6WKQmiOLOZpHZ7I7w==
X-CSE-MsgGUID: Li2/1Bc+Suy1F0N5YzSZNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139252152"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 May 2025 17:01:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHAQ6-000M0K-2Z;
	Tue, 20 May 2025 00:01:22 +0000
Date: Tue, 20 May 2025 08:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-next] BUILD SUCCESS
 f440518f379d22c95329e9e0e0fb6caaafa0f8b0
Message-ID: <202505200837.x6EWYVXq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
branch HEAD: f440518f379d22c95329e9e0e0fb6caaafa0f8b0  m68k: defconfig: Update defconfigs for v6.15-rc1

elapsed time: 730m

configs tested: 3
configs skipped: 129

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
m68k  allmodconfig    gcc-14.2.0
m68k   allnoconfig    gcc-14.2.0
m68k  allyesconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
