Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFA3C433F5
	for <linux-m68k@archiver.kernel.org>; Tue,  5 Apr 2022 02:57:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbiDEC7R (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 4 Apr 2022 22:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbiDEC7K (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 4 Apr 2022 22:59:10 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 751D8A56DA
        for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Apr 2022 19:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649124632; x=1680660632;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=d/L3xrfkN7lpSfDrqUrtE4FbHwmT/greWRiRjuP+hPc=;
  b=mUaQV6haOLKn0L8qrP0S4AVFD3A4GjEPDEOKUCvG8AUkN7bnN2KJ4nCz
   IOGZ5Lj0PmrLd0/RKyWg/8PiHRIhoGMQ3ocjqWcEcP9jqOHht3QoXXHlW
   zP+9lF6BHifWc7dZCJoOGVkgnUdwSYnei50mroOww8S31rOI7qQITQ4G9
   g+dtvyKQdj3pmdzqfQftwtsfnYQmqDTDo16UEqx5WqL8cSt1l0HTR3ABR
   sKKIpOozgp4rJ9dV4pPpiGaWYTteDM+c8vG+lsYIXTDfsegJeJ8ezo3nB
   FoHKI6fcdgV8m+wdqozgzjmZxkEoK9M4qxbE4vYXttmEU2KOw3c2GeJ+n
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="259463725"
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="259463725"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 16:57:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,235,1643702400"; 
   d="scan'208";a="721840780"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 04 Apr 2022 16:57:38 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nbWZm-0002SD-8u;
        Mon, 04 Apr 2022 23:57:38 +0000
Date:   Tue, 05 Apr 2022 07:57:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 412ed8f7fe7544bd92457711b4f992793655f88c
Message-ID: <624b85ee.6yp6/dEFAFI9H8+n%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 412ed8f7fe7544bd92457711b4f992793655f88c  Merge tag 'v5.18-rc1'

elapsed time: 738m

configs tested: 121
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220404
arm                      integrator_defconfig
arm                        realview_defconfig
arm                     eseries_pxa_defconfig
ia64                            zx1_defconfig
arc                        nsimosci_defconfig
m68k                          sun3x_defconfig
sh                                  defconfig
xtensa                              defconfig
alpha                            alldefconfig
powerpc                        cell_defconfig
sh                          rsk7203_defconfig
sh                            shmin_defconfig
sh                          rsk7264_defconfig
arm                        mini2440_defconfig
sh                           se7780_defconfig
m68k                          hp300_defconfig
powerpc                      ep88xc_defconfig
sh                               j2_defconfig
arc                      axs103_smp_defconfig
arm                       multi_v4t_defconfig
m68k                            q40_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                  randconfig-c002-20220404
x86_64               randconfig-c001-20220404
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
arc                                 defconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a015-20220404
x86_64               randconfig-a011-20220404
x86_64               randconfig-a014-20220404
x86_64               randconfig-a016-20220404
x86_64               randconfig-a012-20220404
x86_64               randconfig-a013-20220404
i386                 randconfig-a014-20220404
i386                 randconfig-a013-20220404
i386                 randconfig-a016-20220404
i386                 randconfig-a015-20220404
i386                 randconfig-a011-20220404
i386                 randconfig-a012-20220404
arc                  randconfig-r043-20220404
s390                 randconfig-r044-20220404
riscv                randconfig-r042-20220404
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                               defconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
i386                 randconfig-c001-20220404
x86_64               randconfig-c007-20220404
powerpc              randconfig-c003-20220404
riscv                randconfig-c006-20220404
mips                 randconfig-c004-20220404
arm                  randconfig-c002-20220404
arm                          moxart_defconfig
mips                   sb1250_swarm_defconfig
powerpc                     pseries_defconfig
s390                             alldefconfig
powerpc                     mpc512x_defconfig
arm                        multi_v5_defconfig
powerpc                        icon_defconfig
arm                        magician_defconfig
powerpc                   microwatt_defconfig
x86_64               randconfig-a006-20220404
x86_64               randconfig-a002-20220404
x86_64               randconfig-a001-20220404
x86_64               randconfig-a005-20220404
x86_64               randconfig-a003-20220404
x86_64               randconfig-a004-20220404
i386                 randconfig-a001-20220404
i386                 randconfig-a006-20220404
i386                 randconfig-a002-20220404
i386                 randconfig-a004-20220404
i386                 randconfig-a003-20220404
i386                 randconfig-a005-20220404
hexagon              randconfig-r045-20220404
hexagon              randconfig-r041-20220404

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
