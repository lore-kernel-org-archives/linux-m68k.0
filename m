Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACA3C4332F
	for <linux-m68k@archiver.kernel.org>; Tue,  1 Nov 2022 23:37:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiKAXh6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 1 Nov 2022 19:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiKAXh5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 1 Nov 2022 19:37:57 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC301BE9F
        for <linux-m68k@lists.linux-m68k.org>; Tue,  1 Nov 2022 16:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667345876; x=1698881876;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vZyRj/JQdB/6eY2Md/9PIyMF8y3E7rpemqyiGtZyKVs=;
  b=PQJCgZYPhZ1wJE7pdLBAaqWfvIynUpPgCs9KfntS8mGme4Pp6eMtjKlZ
   ASgCkiSUDQPNTCvvArpW/d0AhLe41NxbViMtBAbL5k8W2xRpeq2k0LYH3
   Fdt+rAtO3BR1XrnS7Vgm9n+6+0JMd7wgNJYE9xGbYrOmnSInymdafGbY9
   1O9VP+cKjJwrnfcMfUVCpUhcolvCy4u6DnyIzIYjgCEplbGbgOz4pgbw9
   +ETXDpMx4aVEf3HYEtlxJNIlybG2wEf+4K3nM+baafWexSn1ICfzAKIBN
   M8ydTLHgnY+INkgp2yQeKwil8tcQHAxbyYQH2fdXpAHCYhsDULJp7MO6k
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="310370382"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="310370382"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 16:37:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="759344840"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="759344840"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 01 Nov 2022 16:37:30 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oq0oz-000EAo-1t;
        Tue, 01 Nov 2022 23:37:29 +0000
Date:   Wed, 02 Nov 2022 07:36:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-next] BUILD SUCCESS
 550a998f37b4f9c243501f735aa283c79189ba9b
Message-ID: <6361ad8b.MAdmkw0bI7wu1YAO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
branch HEAD: 550a998f37b4f9c243501f735aa283c79189ba9b  m68k: mac: Reword comment using double "in"

elapsed time: 722m

configs tested: 123
configs skipped: 118

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
m68k                             allyesconfig
x86_64               randconfig-a016-20221031
x86_64               randconfig-a011-20221031
x86_64               randconfig-a013-20221031
x86_64               randconfig-a012-20221031
x86_64               randconfig-a014-20221031
x86_64               randconfig-a015-20221031
x86_64               randconfig-k001-20221031
m68k                             allmodconfig
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arc                              allyesconfig
alpha                            allyesconfig
i386                             allyesconfig
i386                                defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm                         lubbock_defconfig
powerpc                      chrp32_defconfig
m68k                                defconfig
arm                            mps2_defconfig
i386                 randconfig-a016-20221031
i386                 randconfig-a012-20221031
i386                 randconfig-a015-20221031
i386                 randconfig-a013-20221031
i386                 randconfig-a014-20221031
i386                 randconfig-a011-20221031
sh                              ul2_defconfig
powerpc                 mpc8540_ads_defconfig
openrisc                       virt_defconfig
powerpc                 canyonlands_defconfig
i386                          randconfig-c001
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                 randconfig-c001-20221031
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm64                            alldefconfig
powerpc                 linkstation_defconfig
m68k                        stmark2_defconfig
um                                  defconfig
arm                         s3c6400_defconfig
m68k                       m5249evb_defconfig
arm                            qcom_defconfig
arm                      footbridge_defconfig
powerpc                     taishan_defconfig
sh                  sh7785lcr_32bit_defconfig
alpha                             allnoconfig
s390                 randconfig-r044-20221031
riscv                randconfig-r042-20221031
arc                  randconfig-r043-20221031
sparc                             allnoconfig
powerpc                      arches_defconfig
powerpc                    klondike_defconfig
openrisc                            defconfig
mips                    maltaup_xpa_defconfig
arc                      axs103_smp_defconfig
arm                       omap2plus_defconfig
arm                          iop32x_defconfig
riscv                    nommu_k210_defconfig
sh                        sh7757lcr_defconfig
openrisc                    or1ksim_defconfig
powerpc                     stx_gp3_defconfig
ia64                        generic_defconfig
sh                          rsk7203_defconfig
sh                      rts7751r2d1_defconfig
arm                             ezx_defconfig
arm                           sama5_defconfig
ia64                            zx1_defconfig
mips                         db1xxx_defconfig
mips                            ar7_defconfig
sh                     sh7710voipgw_defconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
riscv                randconfig-r042-20221101
hexagon              randconfig-r041-20221101
hexagon              randconfig-r045-20221101
s390                 randconfig-r044-20221101
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
powerpc                   bluestone_defconfig
arm                        magician_defconfig
arm                        vexpress_defconfig
powerpc                       ebony_defconfig
powerpc                      obs600_defconfig
x86_64               randconfig-a005-20221031
x86_64               randconfig-a006-20221031
x86_64               randconfig-a004-20221031
x86_64               randconfig-a001-20221031
x86_64               randconfig-a003-20221031
x86_64               randconfig-a002-20221031
mips                        qi_lb60_defconfig
arm                      pxa255-idp_defconfig
mips                      bmips_stb_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
