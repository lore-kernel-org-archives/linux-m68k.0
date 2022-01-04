Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03753C433F5
	for <linux-m68k@archiver.kernel.org>; Tue,  4 Jan 2022 16:03:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234073AbiADQDA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 4 Jan 2022 11:03:00 -0500
Received: from mga18.intel.com ([134.134.136.126]:37272 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234096AbiADQC7 (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 4 Jan 2022 11:02:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641312179; x=1672848179;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3hB6w28fDpwewzFRCrrDwR2oO6zcDJzH1GDZgFn8hOw=;
  b=HYAMJGPR/QyIKG56PFuxhUC5+c9PV+6eBdYeQQ2LHFlIwTcotCM3HBum
   bo9rs9zdhT1p0d/1hmWfwY8/XR5mDXSyUg2jX0jXxF3dXAFNHe++nG0Vr
   YMtSseANK8RF8D67APfEst1Y6bj7g1oZvmGjrMKIh9GL5wsWB8PgklWEY
   U9VmKyZQIkH7gT1CQ+PFfcetfDAlmXidzX+LpYQ9rY86E36V/CZCdWYHr
   YcMtFA2tdprvdv8j6lZNK9IM84+6n4GoIQDzRdF2XIqJYuyfZX1MkfqYR
   xu5VGl+lg2zsKEejQdtHsGXdv/99fGz50XOZSbTwz4p9Yj/cfhFXqUr40
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="229065524"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
   d="scan'208";a="229065524"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 08:02:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
   d="scan'208";a="526302101"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Jan 2022 08:02:57 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n4mH3-000FbV-A2; Tue, 04 Jan 2022 16:02:57 +0000
Date:   Wed, 05 Jan 2022 00:02:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 a7d8c163e3093ea440b90b5778174744fdc4d084
Message-ID: <61d46f9d.XmU2Fjwwzku0QYwf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: a7d8c163e3093ea440b90b5778174744fdc4d084  Merge tag 'v5.16-rc8'

elapsed time: 1542m

configs tested: 54
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                               defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
