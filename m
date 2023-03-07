Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD07C64EC4
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Mar 2023 02:15:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjCGCPA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Mar 2023 21:15:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjCGCO7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Mar 2023 21:14:59 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8CB419F13
        for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Mar 2023 18:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678155298; x=1709691298;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=O7Qq+kOX/21wFCRLgDaT3NLRlZcrCXG7LyNTpE8Os+s=;
  b=IhlYX9eNmbRm+hY7YCaq2CNM7657eBF4V5X7NHBcVWTYrxNCUUiQ/SnH
   CBtQBD/xqCt1JHoke+m1hXnQFwKrB0TxLeSaw/Sgvqdtd6Ii2axJy1NrI
   963GH8521QXOOoFDwTW69X3p3dc/KHncjoz4nrkW+upY7qyeWUYOxuAMo
   hmpcmQaSR9DnMBpVfk17obmE6ZTRF9NklM8Nub1Jf2sZtQVzSOfai1fMp
   HXOwlOP8jJYR/mkRC76oqme9KEKZ5Ucznt/sjHCQPm/R+xmCNwMQZiFda
   rhRDHxLnn6ocaA8XT9FbiflmQ372lWLX3MEr15jO4Tse1sUp8KvueweXy
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315394443"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="315394443"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 18:11:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="706648282"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="706648282"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Mar 2023 18:11:46 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZMnq-0000rh-07;
        Tue, 07 Mar 2023 02:11:46 +0000
Date:   Tue, 07 Mar 2023 10:11:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.3] BUILD SUCCESS
 e36a82bebbf7da814530d5a179bef9df5934b717
Message-ID: <64069d37.52oFaWkgtsYZ/2QD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.3
branch HEAD: e36a82bebbf7da814530d5a179bef9df5934b717  m68k: Only force 030 bus error if PC not in exception table

elapsed time: 721m

configs tested: 2
configs skipped: 178

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
