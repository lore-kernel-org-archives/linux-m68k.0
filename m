Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F31C4332F
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Nov 2022 04:04:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbiKOEEO (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Nov 2022 23:04:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237390AbiKOED7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Nov 2022 23:03:59 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FEEC13D11
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Nov 2022 20:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668485037; x=1700021037;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Kab4Z/YYBnX1IJFA173AOVHu5YQ+HTkWhUCLVUlnMtY=;
  b=BcE95ObQQeiUQHd+a3E92s1aaphFLHDeiFZiG27e3vFqxH7WWkTChrQR
   4Aq+k+Qk5KPvaiKnXVGRRoLsCJKe0mHgvf1MfiKZxmT0a7wROAOhbLG4p
   hVPKc2Sp1A7Hzj7kOS7PGU4rE1zIM+/Etft1Fb5vf7m72PTSeTbsbpUiy
   XGApFtEnu/Y59Vc7Ba2M683Ore33Y5RWseArUzga/C+SvJ2p7KMSiWwA0
   AHXQIrkuTMJ4D7ph2QFHI/s/lX3STrflP3RyoK68Kis28QWhouDizJc1D
   RlhlFgtoTZU0QAKMwXOX8BP2r4TKxv/LOnsyJvNqkd3PPAHQKdDkyrT9m
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="376420716"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="376420716"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 20:03:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="641044595"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="641044595"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 14 Nov 2022 20:03:54 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ounAv-00011Q-2A;
        Tue, 15 Nov 2022 04:03:53 +0000
Date:   Tue, 15 Nov 2022 12:03:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 0a1c6e6552b230768158ff7dbb5426fe75088887
Message-ID: <63730f95.5KgyPtNxNXoJ+mEG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 0a1c6e6552b230768158ff7dbb5426fe75088887  Merge tag 'v6.1-rc5'

elapsed time: 725m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64               randconfig-a002-20221114
arc                                 defconfig
x86_64               randconfig-a001-20221114
alpha                               defconfig
x86_64               randconfig-a003-20221114
s390                                defconfig
i386                                defconfig
x86_64               randconfig-a004-20221114
s390                             allmodconfig
i386                 randconfig-a001-20221114
x86_64               randconfig-a005-20221114
i386                 randconfig-a004-20221114
x86_64               randconfig-a006-20221114
s390                             allyesconfig
i386                 randconfig-a002-20221114
i386                 randconfig-a005-20221114
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a006-20221114
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
arc                  randconfig-r043-20221114
x86_64                         rhel-8.3-kunit
i386                 randconfig-a003-20221114
i386                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                              defconfig
ia64                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
sh                               allmodconfig
arm                                 defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221114
hexagon              randconfig-r041-20221114
riscv                randconfig-r042-20221114
s390                 randconfig-r044-20221114
x86_64               randconfig-a014-20221114
x86_64               randconfig-a012-20221114
x86_64               randconfig-a013-20221114
i386                 randconfig-a011-20221114
x86_64               randconfig-a011-20221114
x86_64               randconfig-a016-20221114
i386                 randconfig-a013-20221114
x86_64               randconfig-a015-20221114
i386                 randconfig-a012-20221114
i386                 randconfig-a015-20221114
i386                 randconfig-a014-20221114
i386                 randconfig-a016-20221114

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
