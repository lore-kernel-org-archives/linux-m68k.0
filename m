Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6FF1C4321E
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Nov 2022 23:24:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234689AbiK1XYU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Nov 2022 18:24:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234701AbiK1XYI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 28 Nov 2022 18:24:08 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7405031DD7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Nov 2022 15:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669677845; x=1701213845;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0m5H6arLKKDtHXvU1AH5vphIiX6dwH7x/RHnRIY2ASk=;
  b=ShoCqgae0NYDPDQjACAHqLHf/l5jmM/Zyy6eBcGbCaXN7cMpMrtG1A1g
   ZbKdk1Tvh1tz6RBCMPIR2BwMYy7U5e1D2mHsbJ8Bcqopydc5Kaat3ONl1
   SDnddYIVfoBHP7QGMvFK4bWlaqaX5uRecX+EaM9BWDS1zLx8n5/VIuV/b
   hc8VVNjxz7CwCbXCe5gkKexE/fexc/Ae4CUkM1Qauqhz9g+3UsHJJkvQj
   BHtj/QeOH1fBdHy4pn4H4C55NbHHiSDO3E7cSmd7fPl3m8ps2VxH/WWUV
   nubpR/XwvpygYQzOpR/eHjbXTZcl1kls83GiWqpeALAOfHskjk8sn9lOD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="341890167"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; 
   d="scan'208";a="341890167"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 15:24:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="643574855"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; 
   d="scan'208";a="643574855"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Nov 2022 15:24:03 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oznTm-0008O7-1V;
        Mon, 28 Nov 2022 23:24:02 +0000
Date:   Tue, 29 Nov 2022 07:23:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 6100fd707322c24cffcaefb357615e088fdc5463
Message-ID: <63854304.D9fGy+KsKgmNAObm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 6100fd707322c24cffcaefb357615e088fdc5463  Merge tag 'v6.1-rc7'

elapsed time: 728m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a002-20221128
i386                 randconfig-a002-20221128
i386                 randconfig-a003-20221128
x86_64               randconfig-a001-20221128
i386                 randconfig-a001-20221128
x86_64               randconfig-a003-20221128
i386                 randconfig-a005-20221128
ia64                             allmodconfig
x86_64               randconfig-a004-20221128
i386                 randconfig-a004-20221128
x86_64               randconfig-a005-20221128
i386                 randconfig-a006-20221128
arc                  randconfig-r043-20221128
x86_64                              defconfig
x86_64               randconfig-a006-20221128
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
i386                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
x86_64                           allyesconfig
powerpc                          allmodconfig
m68k                             allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
sh                               allmodconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221128
riscv                randconfig-r042-20221128
hexagon              randconfig-r041-20221128
s390                 randconfig-r044-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a013-20221128
x86_64               randconfig-a015-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a016-20221128
i386                 randconfig-a012-20221128
i386                 randconfig-a015-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a014-20221128
i386                 randconfig-a016-20221128

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
