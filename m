Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C919EC38142
	for <linux-m68k@archiver.kernel.org>; Tue, 31 Jan 2023 08:21:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjAaIVu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 31 Jan 2023 03:21:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbjAaIVt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 31 Jan 2023 03:21:49 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD5BEB64
        for <linux-m68k@lists.linux-m68k.org>; Tue, 31 Jan 2023 00:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675153308; x=1706689308;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8kHl7h8yN4wPtxTvMtyufN6PhKh8OlZ+1lnOBT6KvxA=;
  b=A5/Of9AYG1w7AQPaB+9forC0AgLO7ufCZ3+2VGtQo2LThoIFu+33nnTL
   8ZhVd7uuOx1uQBk9qwRHGRmF1klOAhiLmel/UG11ylD70CzMjiqcZ1Cr9
   EauCDT9lBkznBMbrykv/+a4uKOw7kcsHNjW5ITKDYsZ76EIMM+ojrRTih
   0OmCHQ8EpDdrToZmRRpjUNY/UxmR4o+XSsQx3/JTX9xifaC7jtgxlc5QW
   0uDJywfHUxvwKsqeIf+Y9EV4caOW2rbEFDgLVjj8YBKzaBlz/Z9+JJA9H
   +01g5ngb2YyIuNYP1npz7a21nrN5DJBDZQTFIDmIn6nfon8L6mHj7ZdFI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="315744290"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="315744290"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 00:21:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="807013563"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="807013563"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 31 Jan 2023 00:21:44 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pMltf-0004Ij-2d;
        Tue, 31 Jan 2023 08:21:43 +0000
Date:   Tue, 31 Jan 2023 16:21:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 6aee36105369223c6859cc6cf042d262caa1068f
Message-ID: <63d8cf80.IYxeYlt+qZGK69di%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 6aee36105369223c6859cc6cf042d262caa1068f  selftests/seccomp: Add m68k support

elapsed time: 933m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
x86_64                              defconfig
x86_64                            allnoconfig
s390                                defconfig
i386                                defconfig
x86_64                               rhel-8.3
s390                             allmodconfig
x86_64                           rhel-8.3-kvm
powerpc                           allnoconfig
i386                 randconfig-a002-20230130
x86_64               randconfig-a001-20230130
x86_64                           rhel-8.3-bpf
x86_64               randconfig-a003-20230130
x86_64                           rhel-8.3-syz
x86_64               randconfig-a004-20230130
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a002-20230130
x86_64               randconfig-a006-20230130
i386                 randconfig-a001-20230130
x86_64               randconfig-a005-20230130
arm                                 defconfig
s390                             allyesconfig
i386                 randconfig-a005-20230130
x86_64                           allyesconfig
i386                 randconfig-a004-20230130
i386                 randconfig-a003-20230130
i386                 randconfig-a006-20230130
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
arm                              allyesconfig
arm64                            allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
ia64                             allmodconfig
mips                             allyesconfig
i386                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
arc                  randconfig-r043-20230129
arm                  randconfig-r046-20230129
arm                  randconfig-r046-20230130
arc                  randconfig-r043-20230130
powerpc                          allmodconfig

clang tested configs:
x86_64                          rhel-8.3-rust
i386                 randconfig-a013-20230130
i386                 randconfig-a011-20230130
i386                 randconfig-a012-20230130
i386                 randconfig-a014-20230130
i386                 randconfig-a015-20230130
i386                 randconfig-a016-20230130
x86_64               randconfig-a012-20230130
x86_64               randconfig-a015-20230130
x86_64               randconfig-a013-20230130
x86_64               randconfig-a016-20230130
x86_64               randconfig-a011-20230130
x86_64               randconfig-a014-20230130
hexagon              randconfig-r041-20230129
hexagon              randconfig-r041-20230130
hexagon              randconfig-r045-20230129
hexagon              randconfig-r045-20230130
riscv                randconfig-r042-20230129
s390                 randconfig-r044-20230129
riscv                randconfig-r042-20230130
s390                 randconfig-r044-20230130

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
