Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384BEC4332F
	for <linux-m68k@archiver.kernel.org>; Thu,  2 Nov 2023 10:57:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346318AbjKBK5p (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 2 Nov 2023 06:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346098AbjKBK5o (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 2 Nov 2023 06:57:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B55E7
        for <linux-m68k@lists.linux-m68k.org>; Thu,  2 Nov 2023 03:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698922657; x=1730458657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h4enFCUSn8BV3Heci5Ocr14Bw9lcrZkIVIhepyhCnwQ=;
  b=jT0Nh13HDqKS3lTTzPMXwKxpJ8D3kr7I2BtLIpzYsIHbYB0HPNssgaOM
   +9DLxZY9cReAlKX5B9886tuZKA6y/nQye8AKquZlK4tZu4gF6rplYiNbT
   45TtZL3dsZEVVJ1EziN33+tgVlKpDQ6PZjP93APEFPwCJe2KOds3AbSCB
   G7uGj5p3M9XxLyQuDk7Yi11kuWCMvpxgYTexUb8yhivp/WfoSzFbxa9/H
   n81mZ+aGXDqyZtAQyHCd7dxEU+ZEDqc1iKyTL1ttaNQWFb1gi4aAJTudV
   xfgra+Ip1UTtkbVrF/sYcDB5hpTXn+vfJ48eGytn5mBf/CDoUxTfnEsiD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="379080214"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="379080214"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 03:57:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="831658437"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="831658437"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 02 Nov 2023 03:57:28 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qyVOA-0001QK-19;
        Thu, 02 Nov 2023 10:57:26 +0000
Date:   Thu, 2 Nov 2023 18:56:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Greg Ungerer <gerg@kernel.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:cf 3/3] lib/crypto/mpi/longlong.h:534: warning:
 "umul_ppmm" redefined
Message-ID: <202311021826.pC3SLHbU-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git cf
head:   046fd54f263ce0782ba2b56e0a514a1eeceff350
commit: 046fd54f263ce0782ba2b56e0a514a1eeceff350 [3/3] m68k: use kernel's generic muldi3 libgcc function
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231102/202311021826.pC3SLHbU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311021826.pC3SLHbU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311021826.pC3SLHbU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/crypto/mpi/generic_mpih-mul1.c:17:
>> lib/crypto/mpi/longlong.h:534: warning: "umul_ppmm" redefined
     534 | #define umul_ppmm(w1, w0, u, v) \
         | 
   In file included from include/linux/compiler_types.h:167,
                    from <command-line>:
   arch/m68k/include/asm/compiler.h:13: note: this is the location of the previous definition
      13 | #define umul_ppmm(w1, w0, u, v)                         \
         | 


vim +/umul_ppmm +534 lib/crypto/mpi/longlong.h

5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  510  
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  511  /***************************************
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  512  	**************  68000	****************
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  513  	***************************************/
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  514  #if (defined(__mc68000__) || defined(__mc68020__) || defined(__NeXT__) || defined(mc68020)) && W_TYPE_SIZE == 32
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  515  #define add_ssaaaa(sh, sl, ah, al, bh, bl) \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  516  	__asm__ ("add%.l %5,%1\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  517  	   "addx%.l %3,%0" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  518  	: "=d" ((USItype)(sh)), \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  519  	     "=&d" ((USItype)(sl)) \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  520  	: "%0" ((USItype)(ah)), \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  521  	     "d" ((USItype)(bh)), \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  522  	     "%1" ((USItype)(al)), \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  523  	     "g" ((USItype)(bl)))
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  524  #define sub_ddmmss(sh, sl, ah, al, bh, bl) \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  525  	__asm__ ("sub%.l %5,%1\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  526  	   "subx%.l %3,%0" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  527  	: "=d" ((USItype)(sh)), \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  528  	     "=&d" ((USItype)(sl)) \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  529  	: "0" ((USItype)(ah)), \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  530  	     "d" ((USItype)(bh)), \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  531  	     "1" ((USItype)(al)), \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  532  	     "g" ((USItype)(bl)))
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  533  #if (defined(__mc68020__) || defined(__NeXT__) || defined(mc68020))
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31 @534  #define umul_ppmm(w1, w0, u, v) \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  535  	__asm__ ("mulu%.l %3,%1:%0" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  536  	: "=d" ((USItype)(w0)), \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  537  	     "=d" ((USItype)(w1)) \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  538  	: "%0" ((USItype)(u)), \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  539  	     "dmi" ((USItype)(v)))
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  540  #define UMUL_TIME 45
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  541  #define udiv_qrnnd(q, r, n1, n0, d) \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  542  	__asm__ ("divu%.l %4,%1:%0" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  543  	: "=d" ((USItype)(q)), \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  544  	     "=d" ((USItype)(r)) \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  545  	: "0" ((USItype)(n0)), \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  546  	     "1" ((USItype)(n1)), \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  547  	     "dmi" ((USItype)(d)))
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  548  #define UDIV_TIME 90
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  549  #define sdiv_qrnnd(q, r, n1, n0, d) \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  550  	__asm__ ("divs%.l %4,%1:%0" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  551  	: "=d" ((USItype)(q)), \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  552  	     "=d" ((USItype)(r)) \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  553  	: "0" ((USItype)(n0)), \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  554  	     "1" ((USItype)(n1)), \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  555  	     "dmi" ((USItype)(d)))
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  556  #else /* not mc68020 */
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  557  #define umul_ppmm(xh, xl, a, b) \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  558  do { USItype __umul_tmp1, __umul_tmp2; \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  559  	__asm__ ("| Inlined umul_ppmm\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  560  	"move%.l %5,%3\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  561  	"move%.l %2,%0\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  562  	"move%.w %3,%1\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  563  	"swap	%3\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  564  	"swap	%0\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  565  	"mulu	%2,%1\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  566  	"mulu	%3,%0\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  567  	"mulu	%2,%3\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  568  	"swap	%2\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  569  	"mulu	%5,%2\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  570  	"add%.l	%3,%2\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  571  	"jcc	1f\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  572  	"add%.l	%#0x10000,%0\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  573  	"1:	move%.l %2,%3\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  574  	"clr%.w	%2\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  575  	"swap	%2\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  576  	"swap	%3\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  577  	"clr%.w	%3\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  578  	"add%.l	%3,%1\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  579  	"addx%.l %2,%0\n" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  580  	"| End inlined umul_ppmm" \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  581  	: "=&d" ((USItype)(xh)), "=&d" ((USItype)(xl)), \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  582  		"=d" (__umul_tmp1), "=&d" (__umul_tmp2) \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  583  	: "%2" ((USItype)(a)), "d" ((USItype)(b))); \
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  584  } while (0)
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  585  #define UMUL_TIME 100
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  586  #define UDIV_TIME 400
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  587  #endif /* not mc68020 */
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  588  #endif /* mc68000 */
5ce3e312ec5c11 lib/mpi/longlong.h Dmitry Kasatkin 2011-08-31  589  

:::::: The code at line 534 was first introduced by commit
:::::: 5ce3e312ec5c11abce13215be70700778bf601f0 crypto: GnuPG based MPI lib - header files (part 2)

:::::: TO: Dmitry Kasatkin <dmitry.kasatkin@intel.com>
:::::: CC: Dmitry Kasatkin <dmitry.kasatkin@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
