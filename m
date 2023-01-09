Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA6DC5479D
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Jan 2023 22:35:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237654AbjAIWe7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Jan 2023 17:34:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237863AbjAIWed (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 9 Jan 2023 17:34:33 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A898183AB
        for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Jan 2023 14:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673303672; x=1704839672;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8kY1sTKaHAbqFuZ9LlKQej17EmJ/7eiiI2DFMG2eh+4=;
  b=i6ePAcXCoRJbZ7HNo8FBs52EkpO2cFhNZKTa8k0A7eD9jaHF0duvtLWb
   bRr0uwpmt6e0ze70hh/1UvyBggCuy0pj3zy57Mrr/57wP7usod+7MzcjT
   pXAZq5IHpFYe3YbY9bxWcf//NFe2iyD0aujHwSqcJPNLnKvf6OtZzmRHD
   jtL8Jx1AM4/+zSddn/1sJyT8ccWk5llMpRoIywaPE/PQV7EygAnG5wkhS
   CedIhQ+GzaXjzwHEE7tsdCxFRg8bKkGCZiYbRZc0EQ5L+pwDc/Pl+i7Nh
   Dz94L8UFtLiMlaKulaMjgfJbk137JaFYzmmiiyq9lFOF8l0PsH+Snz2XZ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="350215254"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; 
   d="scan'208";a="350215254"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 14:34:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="830770234"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; 
   d="scan'208";a="830770234"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 09 Jan 2023 14:34:29 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pF0iq-0007Ii-3C;
        Mon, 09 Jan 2023 22:34:28 +0000
Date:   Tue, 10 Jan 2023 06:33:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 1bc55ff8b47d90556ab406c82135f5eb0da931ce
Message-ID: <63bc963f.6f2in58oTUJpESPY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 1bc55ff8b47d90556ab406c82135f5eb0da931ce  Merge tag 'v6.2-rc3'

elapsed time: 728m

configs tested: 74
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
powerpc                           allnoconfig
x86_64                              defconfig
sh                               allmodconfig
mips                             allyesconfig
x86_64                               rhel-8.3
x86_64               randconfig-a012-20230109
um                             i386_defconfig
x86_64               randconfig-a014-20230109
i386                 randconfig-a011-20230109
um                           x86_64_defconfig
arc                                 defconfig
x86_64                           rhel-8.3-bpf
i386                 randconfig-a013-20230109
x86_64               randconfig-a011-20230109
s390                             allmodconfig
x86_64               randconfig-a013-20230109
x86_64                           rhel-8.3-syz
x86_64                           allyesconfig
i386                 randconfig-a012-20230109
alpha                               defconfig
i386                 randconfig-a014-20230109
powerpc                          allmodconfig
x86_64                         rhel-8.3-kunit
i386                 randconfig-a016-20230109
s390                                defconfig
x86_64               randconfig-a016-20230109
i386                                defconfig
x86_64               randconfig-a015-20230109
i386                 randconfig-a015-20230109
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
arm                                 defconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
x86_64                          rhel-8.3-func
arc                              allyesconfig
riscv                randconfig-r042-20230109
s390                 randconfig-r044-20230109
arm                  randconfig-r046-20230108
arc                  randconfig-r043-20230108
arc                  randconfig-r043-20230109
arm64                            allyesconfig
i386                             allyesconfig
arm                              allyesconfig
arc                     haps_hs_smp_defconfig
sh                         apsh4a3a_defconfig
powerpc                   motionpro_defconfig

clang tested configs:
i386                 randconfig-a001-20230109
arm                  randconfig-r046-20230109
riscv                randconfig-r042-20230108
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230108
i386                 randconfig-a004-20230109
hexagon              randconfig-r041-20230109
i386                 randconfig-a002-20230109
hexagon              randconfig-r045-20230108
i386                 randconfig-a003-20230109
i386                 randconfig-a006-20230109
x86_64               randconfig-a003-20230109
s390                 randconfig-r044-20230108
x86_64               randconfig-a002-20230109
x86_64               randconfig-a004-20230109
x86_64               randconfig-a001-20230109
i386                 randconfig-a005-20230109
x86_64               randconfig-a005-20230109
x86_64               randconfig-a006-20230109
hexagon              randconfig-r045-20230109
arm                      tct_hammer_defconfig
arm                       mainstone_defconfig
powerpc                 mpc832x_mds_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
