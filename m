Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4F4C4167B
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Dec 2022 05:31:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbiLMFbI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 13 Dec 2022 00:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiLMFbH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 13 Dec 2022 00:31:07 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B7DEBE17
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Dec 2022 21:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670909462; x=1702445462;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gWdoEZsS08Bbw5Fi7jQT+kgHDOAmp9C3FR4W9qMg+CE=;
  b=NZtK+GDnRw1T4UooOSBtChp7IKjgsS7nIFKKIf8P5hX+TrZ/PHrEDjkq
   EcnMRzFdC29dG2CJ59MSevB8zc07VKDD5TqrRDTm3U3nQwTRMHqtc6rkG
   SLLFc5fWyaVLGIxObx9bBASHmiExZyBxv91Bx9Laq85GFilXYNSpFI+Ax
   9gqp7LsO2Rc86w2GGJ0r1zNsiGNSw5HNwOs00Xp8JxcT2PQtIP5fYpSlK
   PuMiKhc0TGoiG/Q7rPLc2W/SvEzcm90uxhOmv15LgsFHOsn071J1ZuigJ
   PYwvw3o7LFTQZiE29TUHOzUHw6byXHDkw0uP3UK3dzivjBlI8NhVCT6Mn
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="316748755"
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; 
   d="scan'208";a="316748755"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2022 21:31:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="680943140"
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; 
   d="scan'208";a="680943140"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Dec 2022 21:30:59 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p4xsZ-00047U-0J;
        Tue, 13 Dec 2022 05:30:59 +0000
Date:   Tue, 13 Dec 2022 13:30:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:m68k-v6.1] BUILD SUCCESS
 63ada160e9fc60b9e694db6587a25f42bfb8025b
Message-ID: <63980e09.Ai7LEIuKa3ES9bnN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v6.1
branch HEAD: 63ada160e9fc60b9e694db6587a25f42bfb8025b  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 723m

configs tested: 83
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
sh                               allmodconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
um                             i386_defconfig
arc                                 defconfig
um                           x86_64_defconfig
alpha                               defconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a013-20221212
i386                 randconfig-a014-20221212
i386                 randconfig-a012-20221212
i386                 randconfig-a011-20221212
x86_64                           rhel-8.3-bpf
x86_64                              defconfig
i386                 randconfig-a015-20221212
x86_64                           rhel-8.3-syz
i386                 randconfig-a016-20221212
x86_64                         rhel-8.3-kunit
arm                                 defconfig
x86_64                           rhel-8.3-kvm
x86_64                               rhel-8.3
i386                                defconfig
x86_64                           allyesconfig
x86_64                          rhel-8.3-rust
s390                                defconfig
x86_64                    rhel-8.3-kselftests
arm                              allyesconfig
x86_64                          rhel-8.3-func
arm64                            allyesconfig
ia64                             allmodconfig
s390                             allmodconfig
x86_64               randconfig-a013-20221212
x86_64               randconfig-a011-20221212
x86_64                            allnoconfig
x86_64               randconfig-a015-20221212
x86_64               randconfig-a012-20221212
x86_64               randconfig-a014-20221212
i386                             allyesconfig
s390                             allyesconfig
x86_64               randconfig-a016-20221212
i386                          randconfig-c001
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arm                        shmobile_defconfig
powerpc                     pq2fads_defconfig
sh                 kfr2r09-romimage_defconfig
openrisc                         alldefconfig
sh                   secureedge5410_defconfig
sh                          rsk7203_defconfig
arc                     haps_hs_smp_defconfig
nios2                            allyesconfig
powerpc                 mpc837x_rdb_defconfig
sh                               j2_defconfig
mips                           gcw0_defconfig
xtensa                          iss_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3

clang tested configs:
i386                 randconfig-a002-20221212
i386                 randconfig-a003-20221212
i386                 randconfig-a001-20221212
i386                 randconfig-a004-20221212
i386                 randconfig-a006-20221212
i386                 randconfig-a005-20221212
x86_64               randconfig-a001-20221212
x86_64               randconfig-a004-20221212
x86_64               randconfig-a003-20221212
x86_64               randconfig-a002-20221212
x86_64               randconfig-a005-20221212
x86_64               randconfig-a006-20221212
x86_64                        randconfig-k001
arm                          pxa168_defconfig
mips                        omega2p_defconfig
mips                          ath79_defconfig
mips                  cavium_octeon_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
