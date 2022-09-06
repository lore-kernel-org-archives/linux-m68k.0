Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F2FECAAA1
	for <linux-m68k@archiver.kernel.org>; Tue,  6 Sep 2022 01:43:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbiIFBnK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 5 Sep 2022 21:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiIFBnI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 5 Sep 2022 21:43:08 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C93D6745D
        for <linux-m68k@lists.linux-m68k.org>; Mon,  5 Sep 2022 18:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662428587; x=1693964587;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EffWLfVgLKmhRW1EPj8maAWrmv/twGefeqMNERFjC9E=;
  b=JNYzu1PDGeEGBANhey9bNetle6W2nOis+1ByeZF/slvLbmmrdszjqyFP
   M1Ma5SU7MplbMiDvwcNnHLlGIaG09ffV7VLYEOd8fgW4TclUXgGR/4awt
   kXgzbneZPDsS8Q7Z3f1waiLQVM5tr9kz7NjP7+3Eoe+H5YxUfdxj8k0/4
   5nyppWOCG1JOkKGIAnIeD3qe26jVAlAhVq/7zdATMa2+X4KyYWuxVaoiV
   bwT+50QfguxtaX3peRaw4U7r2ZEcWzPyMVOLwMVyR/c8Gt9dEIGEwBVcz
   zTdw9MnX3whLCAe0ZMFaXWSjp1qnGt14qJdZkaq1poahJzk9WsvnfYu79
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="296478804"
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; 
   d="scan'208";a="296478804"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 18:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; 
   d="scan'208";a="739731714"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Sep 2022 18:43:05 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oVNcH-0004ib-0i;
        Tue, 06 Sep 2022 01:43:05 +0000
Date:   Tue, 06 Sep 2022 09:42:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 d8ae14187f514133f5acea8e1a0aa19bf1e258c3
Message-ID: <6316a577.vsybxcrBV1aMtL5e%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: d8ae14187f514133f5acea8e1a0aa19bf1e258c3  m68k: Allow kexec on M68KCLASSIC with MMU enabled only

elapsed time: 728m

configs tested: 57
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                  randconfig-r043-20220905
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a003-20220905
i386                                defconfig
i386                 randconfig-a001-20220905
sh                               allmodconfig
i386                 randconfig-a002-20220905
x86_64                              defconfig
i386                 randconfig-a004-20220905
i386                 randconfig-a005-20220905
i386                 randconfig-a006-20220905
x86_64                               rhel-8.3
x86_64               randconfig-a003-20220905
arm                                 defconfig
x86_64               randconfig-a002-20220905
x86_64                           allyesconfig
x86_64               randconfig-a004-20220905
i386                             allyesconfig
x86_64               randconfig-a005-20220905
x86_64               randconfig-a001-20220905
x86_64               randconfig-a006-20220905
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
arc                               allnoconfig
alpha                             allnoconfig
csky                              allnoconfig
riscv                             allnoconfig

clang tested configs:
hexagon              randconfig-r041-20220905
hexagon              randconfig-r045-20220905
s390                 randconfig-r044-20220905
riscv                randconfig-r042-20220905
x86_64               randconfig-a012-20220905
x86_64               randconfig-a013-20220905
x86_64               randconfig-a011-20220905
x86_64               randconfig-a014-20220905
i386                 randconfig-a013-20220905
x86_64               randconfig-a016-20220905
x86_64               randconfig-a015-20220905
i386                 randconfig-a012-20220905
i386                 randconfig-a011-20220905
i386                 randconfig-a014-20220905
i386                 randconfig-a015-20220905
i386                 randconfig-a016-20220905

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
