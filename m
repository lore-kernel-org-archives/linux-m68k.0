Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C8BC636D4
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Feb 2023 01:39:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjBNBjz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Feb 2023 20:39:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbjBNBjw (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Feb 2023 20:39:52 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1D0193E9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Feb 2023 17:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676338791; x=1707874791;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=auU1GuxPE/goqhp1Fere3vD3o1eH9VU/C41k4m/WwYY=;
  b=Sns+rNDNQMROr5Q/zzP0JAZPY+MZxGThdQdg4n60U7xpixIVStXr37QV
   1DlLu+9dmc+uQC74YDo5iIX+PLNy3ksAqfLFf4Uzu7biWJL60SqLwoNU+
   NBqygsOlrLEqU+f5lAAMdmXYMjUVY+xZF6dG4dc64Is7Kz/k5XYYPL8bL
   tf4840k9+sQ651+s2EIPOvlsNsDOUf9d6lyjTIw3ZYGaH8Tp5u0OMdYTd
   3DxIaZnsowVmhMG5hZqU4aqEDW0oN8XwtYgJqgijiqARmnf3T5AicqQqJ
   jke3CgyXachAlQWPmp+m4+6GtBzbcKll9p5Ms5NHh4YPBv3hP8r5rNQkQ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="328759631"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="328759631"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 17:39:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="842978986"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="842978986"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 Feb 2023 17:39:49 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pRkIO-000875-0R;
        Tue, 14 Feb 2023 01:39:48 +0000
Date:   Tue, 14 Feb 2023 09:39:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.3] BUILD SUCCESS
 1e5b5df65af99013b4d31607ddb3ca5731dbe44d
Message-ID: <63eae65a.zXDPECo58peFuF9O%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.3
branch HEAD: 1e5b5df65af99013b4d31607ddb3ca5731dbe44d  m68k: /proc/hardware should depend on PROC_FS

elapsed time: 849m

configs tested: 48
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
alpha                               defconfig
arc                              allyesconfig
arc                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
csky                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
i386                 randconfig-a011-20230213
i386                 randconfig-a012-20230213
i386                 randconfig-a013-20230213
i386                 randconfig-a014-20230213
i386                 randconfig-a015-20230213
i386                 randconfig-a016-20230213
ia64                             allmodconfig
ia64                                defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
m68k                             allmodconfig
m68k                                defconfig
mips                             allmodconfig
mips                             allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
sh                               allmodconfig
sparc                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
