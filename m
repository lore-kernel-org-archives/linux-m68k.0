Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE656C00144
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Aug 2022 00:57:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbiHBA5B (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 Aug 2022 20:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiHBA5A (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 Aug 2022 20:57:00 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D01F43E7F
        for <linux-m68k@lists.linux-m68k.org>; Mon,  1 Aug 2022 17:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659401819; x=1690937819;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=n00eK2t6c9Z/HCsdhJiCCTyIaoFi0c9NBmk2PLR2yiA=;
  b=VCzHG+EihHlxla2eG7EFhWNZ2REVwrBg7KTY50OJNF11Prjcv7rIA1TA
   /4NqPGN9tacWs6Bj+WbqJeNbea/H9NuTsWEp0V0pZwK6FccQwfbXaHpdh
   cU29CBWIARUgiQ8oEHHDXWQKSJeXIdpLXmZ4UQfG7f0maTr/UrqFMIvEI
   SqQK2H1atQWg/6FUd54N9wTN4a4ELtmuvCVeSWLVQJQgS/YMok1csdBn9
   ic/E8aW3QqL3i/flYw02LfpQJZcDye/oHQHkFLh6rX5Iyatk4+9B7uFxY
   cjpNouU9U1p8iHtEqy6bV9nZCiYkgfLEHVdu5DHdDeE0G5AL6w0Rb3+SI
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="290062091"
X-IronPort-AV: E=Sophos;i="5.93,209,1654585200"; 
   d="scan'208";a="290062091"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 17:56:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,209,1654585200"; 
   d="scan'208";a="552721493"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Aug 2022 17:56:57 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oIgDR-000FXP-0E;
        Tue, 02 Aug 2022 00:56:57 +0000
Date:   Tue, 02 Aug 2022 08:55:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:m68k-v5.19] BUILD SUCCESS
 89d3010b9c8b97717ed20f363795c3635af5661a
Message-ID: <62e8761e.ASr4GKr6DS5WEnGx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v5.19
branch HEAD: 89d3010b9c8b97717ed20f363795c3635af5661a  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 711m

configs tested: 112
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                             allyesconfig
arc                  randconfig-r043-20220801
x86_64                              defconfig
s390                 randconfig-r044-20220801
arm                                 defconfig
x86_64                               rhel-8.3
riscv                randconfig-r042-20220801
m68k                             allyesconfig
x86_64                           allyesconfig
x86_64               randconfig-a014-20220801
x86_64               randconfig-a011-20220801
x86_64               randconfig-a012-20220801
mips                             allyesconfig
m68k                             allmodconfig
x86_64               randconfig-a013-20220801
x86_64               randconfig-a016-20220801
x86_64               randconfig-a015-20220801
powerpc                           allnoconfig
arm64                            allyesconfig
arm                              allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
ia64                             allmodconfig
sh                          r7785rp_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                      chrp32_defconfig
i386                 randconfig-a016-20220801
i386                 randconfig-a013-20220801
i386                 randconfig-a015-20220801
i386                 randconfig-a012-20220801
i386                 randconfig-a011-20220801
i386                 randconfig-a014-20220801
loongarch                        alldefconfig
loongarch                 loongson3_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
mips                     loongson1b_defconfig
xtensa                           alldefconfig
sh                          rsk7203_defconfig
nios2                         10m50_defconfig
sh                      rts7751r2d1_defconfig
m68k                          amiga_defconfig
powerpc                     tqm8555_defconfig
sh                          urquell_defconfig
i386                 randconfig-c001-20220801
x86_64               randconfig-k001-20220801
loongarch                           defconfig
loongarch                         allnoconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                     taishan_defconfig
sh                        dreamcast_defconfig
arm                         cm_x300_defconfig
mips                    maltaup_xpa_defconfig
powerpc                      ep88xc_defconfig
sh                           se7721_defconfig
powerpc                     tqm8541_defconfig
sh                           sh2007_defconfig
powerpc                   motionpro_defconfig
xtensa                  nommu_kc705_defconfig
sparc64                          alldefconfig
mips                           xway_defconfig
m68k                       m5249evb_defconfig
nios2                            allyesconfig
mips                            ar7_defconfig
arm                            mps2_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
sh                           se7780_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
arm                           viper_defconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
x86_64               randconfig-c001-20220801
arm                  randconfig-c002-20220801

clang tested configs:
i386                 randconfig-a001-20220801
i386                 randconfig-a002-20220801
i386                 randconfig-a003-20220801
hexagon              randconfig-r045-20220801
hexagon              randconfig-r041-20220801
i386                 randconfig-a005-20220801
i386                 randconfig-a004-20220801
i386                 randconfig-a006-20220801
x86_64               randconfig-a002-20220801
x86_64               randconfig-a001-20220801
x86_64               randconfig-a006-20220801
x86_64               randconfig-a003-20220801
x86_64               randconfig-a004-20220801
x86_64               randconfig-a005-20220801
mips                        qi_lb60_defconfig
mips                  cavium_octeon_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     akebono_defconfig
arm                   milbeaut_m10v_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
