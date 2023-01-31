Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466A9C38142
	for <linux-m68k@archiver.kernel.org>; Tue, 31 Jan 2023 04:54:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjAaEyj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 30 Jan 2023 23:54:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjAaEyi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 30 Jan 2023 23:54:38 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DA614484
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 20:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675140877; x=1706676877;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SXv+03GFLs99dKUcNgLSf2Ut8Gn0Syx8RisS1cpHZM4=;
  b=b7PzKaSRWsGOwwA7n7w/T+2ZWFVUBmgWix8rblx7I1zuxluxkaYSGueH
   1XUt70wDOGbLxFmSPc+vqk9BIzkzqERirTkOWyo3i7v/fLkP3hRnjIirq
   jikM3furnxaoRR7TJ3l3s0thutP4xWd2EBoVC9/fV4X2Cew2Tc6KDZ05m
   fYYrhqG8+OrRBfJdPrqfCklMWSWYkXBH2o028OnG/9UQ/ol3iqC3Q/cUz
   l7xxyx5EAwZHBWGR8fmR+yJq7OtpOaVIAJar6U62jFlsO30JAPEFshL9H
   2n5WMTrKY6FlXjn3uoR/I34a2Q6+sFPmlTYw+KtcS3B+a6cVAFQtl/xxf
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="325446003"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="325446003"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 20:54:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="806966723"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="806966723"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2023 20:54:35 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pMifD-0004Av-0R;
        Tue, 31 Jan 2023 04:54:35 +0000
Date:   Tue, 31 Jan 2023 12:53:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.3] BUILD SUCCESS
 be6c50d315f92071e481eacd1c0260cb4f7c325f
Message-ID: <63d89edf.2Nv9qBIuz+5UEQEB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.3
branch HEAD: be6c50d315f92071e481eacd1c0260cb4f7c325f  selftests/seccomp: Add m68k support

elapsed time: 726m

configs tested: 73
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
ia64                             allmodconfig
x86_64                            allnoconfig
s390                             allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20230130
i386                 randconfig-a001-20230130
i386                 randconfig-a004-20230130
i386                 randconfig-a003-20230130
i386                 randconfig-a005-20230130
i386                 randconfig-a006-20230130
m68k                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
arm                              allyesconfig
i386                                defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                             allyesconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
i386                          randconfig-c001
arm64                            allyesconfig
x86_64               randconfig-a006-20230130
x86_64               randconfig-a004-20230130
x86_64               randconfig-a005-20230130
x86_64               randconfig-a002-20230130
x86_64               randconfig-a001-20230130
x86_64               randconfig-a003-20230130
powerpc                       maple_defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf

clang tested configs:
i386                 randconfig-a013-20230130
i386                 randconfig-a012-20230130
i386                 randconfig-a014-20230130
i386                 randconfig-a015-20230130
i386                 randconfig-a011-20230130
i386                 randconfig-a016-20230130
x86_64                          rhel-8.3-rust
x86_64                        randconfig-k001
x86_64               randconfig-a014-20230130
x86_64               randconfig-a015-20230130
x86_64               randconfig-a016-20230130
x86_64               randconfig-a013-20230130
x86_64               randconfig-a011-20230130
x86_64               randconfig-a012-20230130
powerpc                    mvme5100_defconfig
powerpc                      pmac32_defconfig
arm                         s3c2410_defconfig
mips                       lemote2f_defconfig
powerpc                 xes_mpc85xx_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
