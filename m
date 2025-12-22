Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61422D248C
	for <linux-m68k@lists.linux-m68k.org>; Mon, 22 Dec 2025 20:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766434229; cv=none; b=Tc+eRKQ6EV4ywVaOmH8P5MDS6z5kjua3O+c8PUw4vAdLusp9mr6z4lS4k1hsr2WGcWrKd6ZpKjKjkrHuNinEWVxqU7rP7/V8+onxR4qLKjO3XExM55mQOAqefCXlgKXAnR6PQfVHEowfSUMPgGU+SUHwcpTzpALv+DaeL5fFEgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766434229; c=relaxed/simple;
	bh=+AxsR+nGpyvansS4HZjuFjIzXqCVMCuURncsb+yjanw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xctkdao1wa8YBvDgtmBTscl0M2FHhZhDUJk5RyoCfPuK68I/Hzfq0YijHg5iWcqtCvP4PLeAF3Avayh3FEanTfDIvSOYWrsVoKzW8+4wOWxUToY1jpCCsqvrILjKvn0S+RAACF1mdbMw2QISToTG3hMaEQqNjYJ6tY1gQqQPAys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVLntDSU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVLntDSU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766434228; x=1797970228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+AxsR+nGpyvansS4HZjuFjIzXqCVMCuURncsb+yjanw=;
  b=lVLntDSUR5uriktcTD2WezTe0owraS4DHDZWfFEs/2pxMkTb++Dd9LAs
   ouCTPmjZLeQuUUX2gqOMqhgWBi4uwMerXVk9QhuFQTePrjtmNI8LsXuL9
   Iz+H2Yy8xfNY2WPyIgy0ZceMfpZw3hjS0ULp4UL9E8f4RGG+G2RFUuFlT
   U8fs1qU3o8fiU4l1yenJTWuL47TH1EArGDmc9HJHsjPcLvuHRmPfL5vV9
   WUt6kNiWJAq5MyoB3oboxGiqxgI1x58iJ0oNU9N1p0AfjcEBYHH+RsXVm
   78OuyklCwQ+2qOawrPJu9OT6QyS11KFXMBu4O6xCqSOF5e5ve1sVVokxr
   A==;
X-CSE-ConnectionGUID: AcRVoWjtRgyKucDtUsMW1g==
X-CSE-MsgGUID: MMmHEw+QR9WaeJsDYOIJMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68334223"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68334223"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 12:10:27 -0800
X-CSE-ConnectionGUID: EJPjbv42RPqydkSuar4Wxg==
X-CSE-MsgGUID: b/mwD4C+Qf6avkBvGCeLoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="204658395"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 22 Dec 2025 12:10:25 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXmEY-000000005bU-1Hyv;
	Mon, 22 Dec 2025 20:10:22 +0000
Date: Mon, 22 Dec 2025 21:09:54 +0100
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 11/14] kismet: WARNING: unmet direct dependencies
 detected for OF_EARLY_FLATTREE when selected by BUILTIN_DTB
Message-ID: <202512222123.KE7ZAOJS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   75398811dd9a9ad1cbc69c3de30cc2232f6bb182
commit: fec8a81995c029feadaee0b30cd8d03b146c081e [11/14] m68k: implement a builtin devicetree for nonmmu
config: m68k-kismet-CONFIG_OF_EARLY_FLATTREE-CONFIG_BUILTIN_DTB-0-0 (https://download.01.org/0day-ci/archive/20251222/202512222123.KE7ZAOJS-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512222123.KE7ZAOJS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222123.KE7ZAOJS-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_EARLY_FLATTREE when selected by BUILTIN_DTB
   WARNING: unmet direct dependencies detected for OF_EARLY_FLATTREE
     Depends on [n]: OF [=n]
     Selected by [y]:
     - BUILTIN_DTB [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
