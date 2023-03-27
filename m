Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FE0C6FD1D
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Mar 2023 23:06:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjC0XGl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Mar 2023 19:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjC0XGl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Mar 2023 19:06:41 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C3552133
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Mar 2023 16:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679958400; x=1711494400;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zX/MtX83LzByAvXcbNgYJ0iYMFKl65NE7UOELQK9Mro=;
  b=NMW9cw2QqOywYJ/I28rqASXkPQoyD5PN7OavxkvEWNamkxGyPzG+vPvr
   uDeKlVm9jxG94QM3a/0u/sBpJ49TRlVnNHAvBo2YkGwqUFwCQzujiyrkm
   Uhy6Vg0TjUWTd9LgcXAV+F+3a8ZluB//VWmHqNXrl7usgm+aTq1wI+Om8
   WbX/DcxfM4CH+3O1KdDQ0Omu3M6wBvnYkj4KUXVS6N6LPeIdHC4adNpzB
   QuAn9x2+aOzTC2rm5CVyqLDN+YV8vuOOye6uuDFAsGKtFw8w5U0YUz/bf
   tCSzaHY6gUZbjZaE1bu9ePpVnL1e+1zAjf7vI67rowh99ZsXqeExOrqUc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="368169565"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="368169565"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 16:06:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="716254138"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="716254138"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Mar 2023 16:06:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pgvvB-000I4a-0O;
        Mon, 27 Mar 2023 23:06:37 +0000
Date:   Tue, 28 Mar 2023 07:06:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 97e3e4fbb21e8f1f46dc0d13e72bd6b588626645
Message-ID: <6422215e./LJ6pU89t2kjp8hB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 97e3e4fbb21e8f1f46dc0d13e72bd6b588626645  Merge tag 'v6.3-rc4'

elapsed time: 727m

configs tested: 133
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r021-20230326   gcc  
alpha                randconfig-r024-20230327   gcc  
alpha                randconfig-r032-20230327   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230326   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r025-20230327   gcc  
arc                  randconfig-r043-20230326   gcc  
arc                  randconfig-r043-20230327   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r016-20230326   clang
arm                  randconfig-r033-20230326   gcc  
arm                  randconfig-r046-20230326   clang
arm                  randconfig-r046-20230327   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230327   gcc  
arm64                randconfig-r024-20230326   gcc  
arm64                randconfig-r031-20230327   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230326   gcc  
csky                 randconfig-r006-20230326   gcc  
csky                 randconfig-r012-20230326   gcc  
hexagon      buildonly-randconfig-r005-20230326   clang
hexagon      buildonly-randconfig-r006-20230327   clang
hexagon              randconfig-r021-20230327   clang
hexagon              randconfig-r023-20230327   clang
hexagon              randconfig-r041-20230326   clang
hexagon              randconfig-r041-20230327   clang
hexagon              randconfig-r045-20230326   clang
hexagon              randconfig-r045-20230327   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r003-20230327   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230327   gcc  
i386                 randconfig-a002-20230327   gcc  
i386                 randconfig-a003-20230327   gcc  
i386                 randconfig-a004-20230327   gcc  
i386                 randconfig-a005-20230327   gcc  
i386                 randconfig-a006-20230327   gcc  
i386                 randconfig-a011-20230327   clang
i386                 randconfig-a012-20230327   clang
i386                 randconfig-a013-20230327   clang
i386                 randconfig-a014-20230327   clang
i386                 randconfig-a015-20230327   clang
i386                 randconfig-a016-20230327   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r031-20230326   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230327   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r022-20230326   gcc  
m68k                 randconfig-r035-20230327   gcc  
microblaze   buildonly-randconfig-r002-20230326   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r005-20230327   clang
mips                 randconfig-r001-20230326   gcc  
mips                 randconfig-r014-20230327   gcc  
mips                 randconfig-r015-20230326   clang
mips                 randconfig-r034-20230326   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230326   gcc  
nios2                randconfig-r023-20230326   gcc  
openrisc             randconfig-r006-20230327   gcc  
parisc       buildonly-randconfig-r004-20230326   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r012-20230327   gcc  
parisc               randconfig-r013-20230326   gcc  
parisc               randconfig-r016-20230327   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230326   gcc  
powerpc              randconfig-r002-20230326   clang
powerpc              randconfig-r034-20230327   gcc  
powerpc              randconfig-r036-20230326   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r025-20230326   gcc  
riscv                randconfig-r042-20230326   gcc  
riscv                randconfig-r042-20230327   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r022-20230327   clang
s390                 randconfig-r044-20230326   gcc  
s390                 randconfig-r044-20230327   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r026-20230326   gcc  
sh                   randconfig-r032-20230326   gcc  
sparc        buildonly-randconfig-r004-20230327   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r035-20230326   gcc  
sparc                randconfig-r036-20230327   gcc  
sparc64      buildonly-randconfig-r001-20230326   gcc  
sparc64              randconfig-r001-20230327   gcc  
sparc64              randconfig-r003-20230327   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230327   gcc  
x86_64               randconfig-a002-20230327   gcc  
x86_64               randconfig-a003-20230327   gcc  
x86_64               randconfig-a004-20230327   gcc  
x86_64               randconfig-a005-20230327   gcc  
x86_64               randconfig-a006-20230327   gcc  
x86_64               randconfig-a011-20230327   clang
x86_64               randconfig-a012-20230327   clang
x86_64               randconfig-a013-20230327   clang
x86_64               randconfig-a014-20230327   clang
x86_64               randconfig-a015-20230327   clang
x86_64               randconfig-a016-20230327   clang
x86_64               randconfig-r013-20230327   clang
x86_64               randconfig-r033-20230327   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r004-20230327   gcc  
xtensa               randconfig-r011-20230326   gcc  
xtensa               randconfig-r015-20230327   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
