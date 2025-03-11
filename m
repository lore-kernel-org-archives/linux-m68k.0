Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50061EF01
	for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Mar 2025 05:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741671680; cv=none; b=pSAAlfNnQC1sRYYyozuGzNmlUk+lhEFyItRt72VVcQ+R21dTuHmRmb4U1jcYE6GJiGzp/kkWqwGlyIITFWq8z/z03rliX0ngHqakZNPrAAcFXTlAl6o+wjXFi4BoEYE1Y1o4TU1NQIvxDMv2HXtVgck/bRtY58vcerlcsMKf1nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741671680; c=relaxed/simple;
	bh=9yUIigp60engUV8QTIlZtoBZtQYukhl8rjVVk2kybQw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q91f7keIwqeblkIqYScXXBd8TB54ER9BtXzBHUQT6VpcigkUmBnk9TCCrY+KjpBaiDnQnsnQddivgvNoMhUZAFW6uCW32jNpPbrrIM8zb0f9CCyqHlTgiaFn1fM6rnMUCOw0i5aWeg1D5yd+nq5sCkqs60H7cdhLkG+xiJrhpC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVOxwNiS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVOxwNiS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741671679; x=1773207679;
  h=date:from:to:cc:subject:message-id;
  bh=9yUIigp60engUV8QTIlZtoBZtQYukhl8rjVVk2kybQw=;
  b=LVOxwNiS3C2KK9/sDPA86PRwqgZ+hYNCoaWlXwNqPPaeXOVBPALS6uZe
   KouVvzYTGdE3MwSEdDJNkx5p0/vJ0ZtKEU8Ll0sZe77+4vN/md+pNWsLw
   pyt7OHy3yWX301+1+BcfHCpNX0X0hL30an3J6hzNkn4KyKWz6IqiNwTUi
   UngGW8070tbTCAMJH1yiu9Nfqip8qLUfdIhgxCRrT7OR9nJcwL1GFv8WI
   S9FKtl5UEKhAwNbW1ZAVVDYRblbGhfI8yV798P9a7+vb4MTYUaZyukUF1
   cUcKBadjrYDM7s0goeM21vjKl015lBa4OZV9gaaIOxVIlfzhFAtgvjI4O
   w==;
X-CSE-ConnectionGUID: NCx+q9ddR/ik+G1l0hKbEA==
X-CSE-MsgGUID: osuVdXhxREil3R6SVwBEOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="41858153"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="41858153"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 22:41:17 -0700
X-CSE-ConnectionGUID: /C8HZHkVQwOjzJ90jySJ8A==
X-CSE-MsgGUID: /Pxom725TOGc0wKpkPM2JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="125256843"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 10 Mar 2025 22:41:16 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trsMc-0006OO-1P;
	Tue, 11 Mar 2025 05:41:14 +0000
Date: Tue, 11 Mar 2025 13:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.15] BUILD SUCCESS
 3c4e4ec957b6243cce92fb7d450a71a93ce181c5
Message-ID: <202503111343.buOFHSrW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.15
branch HEAD: 3c4e4ec957b6243cce92fb7d450a71a93ce181c5  m68k: setup: Remove size argument when calling strscpy()

elapsed time: 936m

configs tested: 6
configs skipped: 135

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
loongarch   allmodconfig    gcc-14.2.0
m68k        allmodconfig    gcc-14.2.0
m68k         allnoconfig    gcc-14.2.0
m68k        allyesconfig    gcc-14.2.0
microblaze  allmodconfig    gcc-14.2.0
microblaze  allyesconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
