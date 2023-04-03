Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2260EC76196
	for <linux-m68k@archiver.kernel.org>; Mon,  3 Apr 2023 21:53:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233569AbjDCVxr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 3 Apr 2023 17:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233317AbjDCVxq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 3 Apr 2023 17:53:46 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C97F490
        for <linux-m68k@lists.linux-m68k.org>; Mon,  3 Apr 2023 14:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680558825; x=1712094825;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a9nxfsbE467bQ9fRy1IqjWdx4H2PJkBZ775YYkophSY=;
  b=GL2r50yO8Y53b1cX9JegyIrysg6xCA29KPYlL6dMH87f0sMNF3DauuPZ
   RcvQzaH9DxdnYwzLoRekv8QMSuDfbmQJnbe8Lb2SmKexMSSQv6nIXpDJQ
   nd3insvkQPDxD3RV7OY40e51I8RCn3T7PCAz802ooKxNWAsHT2snUqaej
   jJzleNxggNe+1fQ4tFdijxnO20mp3h63IBVE9OvKAmVEM4E76ZyTdXE1k
   O0T5VnXx01WjbZGCH6BOIbKPZv6K9rgm37gWuAJd5aVcOf5a6ENLxBiqP
   shEElZ9ld11ttI9rC9Uo9VDRQEYyu459yesH5/eLqXxUmnL0nLt7OBmmT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="339514122"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="339514122"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 14:53:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829720985"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="829720985"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2023 14:53:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pjS7S-000OrM-26;
        Mon, 03 Apr 2023 21:53:42 +0000
Date:   Tue, 04 Apr 2023 05:53:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 98485defdf60678296754fce632b05c68f447029
Message-ID: <642b4acb.gXqroJzw1JI8IZO8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 98485defdf60678296754fce632b05c68f447029  Merge tag 'v6.3-rc5'

elapsed time: 727m

configs tested: 115
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r026-20230403   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r023-20230403   gcc  
arc                  randconfig-r034-20230403   gcc  
arc                  randconfig-r043-20230402   gcc  
arc                  randconfig-r043-20230403   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230402   gcc  
arm                  randconfig-r046-20230403   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230402   gcc  
arm64                randconfig-r005-20230402   gcc  
arm64                randconfig-r022-20230403   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230403   gcc  
csky                 randconfig-r033-20230403   gcc  
hexagon              randconfig-r016-20230403   clang
hexagon              randconfig-r035-20230403   clang
hexagon              randconfig-r041-20230402   clang
hexagon              randconfig-r041-20230403   clang
hexagon              randconfig-r045-20230402   clang
hexagon              randconfig-r045-20230403   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230403   clang
i386                 randconfig-a002-20230403   clang
i386                 randconfig-a003-20230403   clang
i386                 randconfig-a004-20230403   clang
i386                 randconfig-a005-20230403   clang
i386                 randconfig-a006-20230403   clang
i386                 randconfig-a011-20230403   gcc  
i386                 randconfig-a012-20230403   gcc  
i386                 randconfig-a013-20230403   gcc  
i386                 randconfig-a014-20230403   gcc  
i386                 randconfig-a015-20230403   gcc  
i386                 randconfig-a016-20230403   gcc  
i386                 randconfig-r036-20230403   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r003-20230402   gcc  
microblaze           randconfig-r001-20230403   gcc  
microblaze           randconfig-r002-20230403   gcc  
microblaze           randconfig-r025-20230402   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r025-20230403   clang
mips                 randconfig-r026-20230402   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r021-20230402   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230402   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r013-20230403   gcc  
powerpc              randconfig-r022-20230402   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r006-20230403   clang
riscv                randconfig-r042-20230402   clang
riscv                randconfig-r042-20230403   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r012-20230403   gcc  
s390                 randconfig-r014-20230402   clang
s390                 randconfig-r044-20230402   clang
s390                 randconfig-r044-20230403   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r011-20230403   gcc  
sh                   randconfig-r031-20230403   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230403   gcc  
sparc64              randconfig-r001-20230402   gcc  
sparc64              randconfig-r006-20230402   gcc  
sparc64              randconfig-r015-20230403   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230403   clang
x86_64               randconfig-a002-20230403   clang
x86_64               randconfig-a003-20230403   clang
x86_64               randconfig-a004-20230403   clang
x86_64               randconfig-a005-20230403   clang
x86_64               randconfig-a006-20230403   clang
x86_64               randconfig-a011-20230403   gcc  
x86_64               randconfig-a012-20230403   gcc  
x86_64               randconfig-a013-20230403   gcc  
x86_64               randconfig-a014-20230403   gcc  
x86_64               randconfig-a015-20230403   gcc  
x86_64               randconfig-a016-20230403   gcc  
x86_64               randconfig-r024-20230403   gcc  
x86_64               randconfig-r032-20230403   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r012-20230402   gcc  
xtensa               randconfig-r014-20230403   gcc  
xtensa               randconfig-r015-20230402   gcc  
xtensa               randconfig-r024-20230402   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
