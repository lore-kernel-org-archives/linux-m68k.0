Return-Path: <SRS0=3Sed=CX=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873CDC433E2
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Sep 2020 10:31:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2910B2076C
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Sep 2020 10:31:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgINKbn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Sep 2020 06:31:43 -0400
Received: from mga02.intel.com ([134.134.136.20]:26703 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726428AbgINKbm (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Sep 2020 06:31:42 -0400
IronPort-SDR: /zsipPsZLmiEL4LLnAXB5/w8UFJfYELdDhBGv8td95UWeSztWvo6pjoC9372JRGuthPLdE0kBN
 amCs6okEfHFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="146747573"
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; 
   d="gz'50?scan'50,208,50";a="146747573"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2020 03:29:15 -0700
IronPort-SDR: RvP9U8Jz/u0dPOgTG4HmF/W36G09Zi7hsTfdyABX6QDzR6+zn9gBkjh9ktwU73rfEL9sR5dJqo
 bo+REbZ91VYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; 
   d="gz'50?scan'50,208,50";a="286377383"
Received: from lkp-server01.sh.intel.com (HELO a75722977aa5) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 14 Sep 2020 03:29:13 -0700
Received: from kbuild by a75722977aa5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kHljU-00013U-Io; Mon, 14 Sep 2020 10:29:12 +0000
Date:   Mon, 14 Sep 2020 18:28:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     kbuild-all@lists.01.org, linux-m68k@lists.linux-m68k.org,
        uclinux-dev@uclinux.org, Christoph Hellwig <hch@lst.de>
Subject: [m68knommu:for-next 1/1] arch/m68k/kernel/signal.c:923:16: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202009141840.pFOE09JF%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next
head:   ef03e4545eac3137f37604daef09019dd638b17e
commit: ef03e4545eac3137f37604daef09019dd638b17e [1/1] m68knommu: switch to using asm-generic/uaccess.h
config: m68k-randconfig-s032-20200913 (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-191-g10164920-dirty
        git checkout ef03e4545eac3137f37604daef09019dd638b17e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=m68k 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> arch/m68k/kernel/signal.c:923:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char [noderef] __user *__x @@     got void * @@
>> arch/m68k/kernel/signal.c:923:16: sparse:     expected char [noderef] __user *__x
   arch/m68k/kernel/signal.c:923:16: sparse:     got void *
   arch/m68k/kernel/signal.c:1007:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char [noderef] __user *__x @@     got void * @@
   arch/m68k/kernel/signal.c:1007:16: sparse:     expected char [noderef] __user *__x
   arch/m68k/kernel/signal.c:1007:16: sparse:     got void *

# https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git/commit/?id=ef03e4545eac3137f37604daef09019dd638b17e
git remote add m68knommu https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git
git fetch --no-tags m68knommu for-next
git checkout ef03e4545eac3137f37604daef09019dd638b17e
vim +923 arch/m68k/kernel/signal.c

0c22fafd312cd86 Greg Ungerer       2012-03-14  783  
a95517992a37488 Greg Ungerer       2016-02-15 @784  asmlinkage int do_sigreturn(struct pt_regs *regs, struct switch_stack *sw)
0c22fafd312cd86 Greg Ungerer       2012-03-14  785  {
0c22fafd312cd86 Greg Ungerer       2012-03-14  786  	unsigned long usp = rdusp();
0c22fafd312cd86 Greg Ungerer       2012-03-14  787  	struct sigframe __user *frame = (struct sigframe __user *)(usp - 4);
0c22fafd312cd86 Greg Ungerer       2012-03-14  788  	sigset_t set;
0c22fafd312cd86 Greg Ungerer       2012-03-14  789  
96d4f267e40f950 Linus Torvalds     2019-01-03  790  	if (!access_ok(frame, sizeof(*frame)))
0c22fafd312cd86 Greg Ungerer       2012-03-14  791  		goto badframe;
0c22fafd312cd86 Greg Ungerer       2012-03-14  792  	if (__get_user(set.sig[0], &frame->sc.sc_mask) ||
0c22fafd312cd86 Greg Ungerer       2012-03-14  793  	    (_NSIG_WORDS > 1 &&
0c22fafd312cd86 Greg Ungerer       2012-03-14  794  	     __copy_from_user(&set.sig[1], &frame->extramask,
0c22fafd312cd86 Greg Ungerer       2012-03-14  795  			      sizeof(frame->extramask))))
0c22fafd312cd86 Greg Ungerer       2012-03-14  796  		goto badframe;
0c22fafd312cd86 Greg Ungerer       2012-03-14  797  
43a35995562495b Matt Fleming       2012-05-11  798  	set_current_blocked(&set);
0c22fafd312cd86 Greg Ungerer       2012-03-14  799  
0c22fafd312cd86 Greg Ungerer       2012-03-14  800  	if (restore_sigcontext(regs, &frame->sc, frame + 1))
0c22fafd312cd86 Greg Ungerer       2012-03-14  801  		goto badframe;
0c22fafd312cd86 Greg Ungerer       2012-03-14  802  	return regs->d0;
0c22fafd312cd86 Greg Ungerer       2012-03-14  803  
0c22fafd312cd86 Greg Ungerer       2012-03-14  804  badframe:
3cf5d076fb4d489 Eric W. Biederman  2019-05-23  805  	force_sig(SIGSEGV);
0c22fafd312cd86 Greg Ungerer       2012-03-14  806  	return 0;
0c22fafd312cd86 Greg Ungerer       2012-03-14  807  }
0c22fafd312cd86 Greg Ungerer       2012-03-14  808  
a95517992a37488 Greg Ungerer       2016-02-15  809  asmlinkage int do_rt_sigreturn(struct pt_regs *regs, struct switch_stack *sw)
0c22fafd312cd86 Greg Ungerer       2012-03-14  810  {
0c22fafd312cd86 Greg Ungerer       2012-03-14  811  	unsigned long usp = rdusp();
0c22fafd312cd86 Greg Ungerer       2012-03-14  812  	struct rt_sigframe __user *frame = (struct rt_sigframe __user *)(usp - 4);
0c22fafd312cd86 Greg Ungerer       2012-03-14  813  	sigset_t set;
0c22fafd312cd86 Greg Ungerer       2012-03-14  814  
96d4f267e40f950 Linus Torvalds     2019-01-03  815  	if (!access_ok(frame, sizeof(*frame)))
0c22fafd312cd86 Greg Ungerer       2012-03-14  816  		goto badframe;
0c22fafd312cd86 Greg Ungerer       2012-03-14  817  	if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
0c22fafd312cd86 Greg Ungerer       2012-03-14  818  		goto badframe;
0c22fafd312cd86 Greg Ungerer       2012-03-14  819  
43a35995562495b Matt Fleming       2012-05-11  820  	set_current_blocked(&set);
0c22fafd312cd86 Greg Ungerer       2012-03-14  821  
0c22fafd312cd86 Greg Ungerer       2012-03-14  822  	if (rt_restore_ucontext(regs, sw, &frame->uc))
0c22fafd312cd86 Greg Ungerer       2012-03-14  823  		goto badframe;
0c22fafd312cd86 Greg Ungerer       2012-03-14  824  	return regs->d0;
0c22fafd312cd86 Greg Ungerer       2012-03-14  825  
0c22fafd312cd86 Greg Ungerer       2012-03-14  826  badframe:
3cf5d076fb4d489 Eric W. Biederman  2019-05-23  827  	force_sig(SIGSEGV);
0c22fafd312cd86 Greg Ungerer       2012-03-14  828  	return 0;
0c22fafd312cd86 Greg Ungerer       2012-03-14  829  }
0c22fafd312cd86 Greg Ungerer       2012-03-14  830  
0c22fafd312cd86 Greg Ungerer       2012-03-14  831  static void setup_sigcontext(struct sigcontext *sc, struct pt_regs *regs,
0c22fafd312cd86 Greg Ungerer       2012-03-14  832  			     unsigned long mask)
0c22fafd312cd86 Greg Ungerer       2012-03-14  833  {
0c22fafd312cd86 Greg Ungerer       2012-03-14  834  	sc->sc_mask = mask;
0c22fafd312cd86 Greg Ungerer       2012-03-14  835  	sc->sc_usp = rdusp();
0c22fafd312cd86 Greg Ungerer       2012-03-14  836  	sc->sc_d0 = regs->d0;
0c22fafd312cd86 Greg Ungerer       2012-03-14  837  	sc->sc_d1 = regs->d1;
0c22fafd312cd86 Greg Ungerer       2012-03-14  838  	sc->sc_a0 = regs->a0;
0c22fafd312cd86 Greg Ungerer       2012-03-14  839  	sc->sc_a1 = regs->a1;
0c22fafd312cd86 Greg Ungerer       2012-03-14  840  	sc->sc_sr = regs->sr;
0c22fafd312cd86 Greg Ungerer       2012-03-14  841  	sc->sc_pc = regs->pc;
0c22fafd312cd86 Greg Ungerer       2012-03-14  842  	sc->sc_formatvec = regs->format << 12 | regs->vector;
0c22fafd312cd86 Greg Ungerer       2012-03-14  843  	save_a5_state(sc, regs);
0c22fafd312cd86 Greg Ungerer       2012-03-14  844  	save_fpu_state(sc, regs);
0c22fafd312cd86 Greg Ungerer       2012-03-14  845  }
0c22fafd312cd86 Greg Ungerer       2012-03-14  846  
0c22fafd312cd86 Greg Ungerer       2012-03-14  847  static inline int rt_setup_ucontext(struct ucontext __user *uc, struct pt_regs *regs)
0c22fafd312cd86 Greg Ungerer       2012-03-14  848  {
0c22fafd312cd86 Greg Ungerer       2012-03-14  849  	struct switch_stack *sw = (struct switch_stack *)regs - 1;
0c22fafd312cd86 Greg Ungerer       2012-03-14  850  	greg_t __user *gregs = uc->uc_mcontext.gregs;
0c22fafd312cd86 Greg Ungerer       2012-03-14  851  	int err = 0;
0c22fafd312cd86 Greg Ungerer       2012-03-14  852  
0c22fafd312cd86 Greg Ungerer       2012-03-14  853  	err |= __put_user(MCONTEXT_VERSION, &uc->uc_mcontext.version);
0c22fafd312cd86 Greg Ungerer       2012-03-14  854  	err |= __put_user(regs->d0, &gregs[0]);
0c22fafd312cd86 Greg Ungerer       2012-03-14  855  	err |= __put_user(regs->d1, &gregs[1]);
0c22fafd312cd86 Greg Ungerer       2012-03-14  856  	err |= __put_user(regs->d2, &gregs[2]);
0c22fafd312cd86 Greg Ungerer       2012-03-14  857  	err |= __put_user(regs->d3, &gregs[3]);
0c22fafd312cd86 Greg Ungerer       2012-03-14  858  	err |= __put_user(regs->d4, &gregs[4]);
0c22fafd312cd86 Greg Ungerer       2012-03-14  859  	err |= __put_user(regs->d5, &gregs[5]);
0c22fafd312cd86 Greg Ungerer       2012-03-14  860  	err |= __put_user(sw->d6, &gregs[6]);
0c22fafd312cd86 Greg Ungerer       2012-03-14  861  	err |= __put_user(sw->d7, &gregs[7]);
0c22fafd312cd86 Greg Ungerer       2012-03-14  862  	err |= __put_user(regs->a0, &gregs[8]);
0c22fafd312cd86 Greg Ungerer       2012-03-14  863  	err |= __put_user(regs->a1, &gregs[9]);
0c22fafd312cd86 Greg Ungerer       2012-03-14  864  	err |= __put_user(regs->a2, &gregs[10]);
0c22fafd312cd86 Greg Ungerer       2012-03-14  865  	err |= __put_user(sw->a3, &gregs[11]);
0c22fafd312cd86 Greg Ungerer       2012-03-14  866  	err |= __put_user(sw->a4, &gregs[12]);
0c22fafd312cd86 Greg Ungerer       2012-03-14  867  	err |= __put_user(sw->a5, &gregs[13]);
0c22fafd312cd86 Greg Ungerer       2012-03-14  868  	err |= __put_user(sw->a6, &gregs[14]);
0c22fafd312cd86 Greg Ungerer       2012-03-14  869  	err |= __put_user(rdusp(), &gregs[15]);
0c22fafd312cd86 Greg Ungerer       2012-03-14  870  	err |= __put_user(regs->pc, &gregs[16]);
0c22fafd312cd86 Greg Ungerer       2012-03-14  871  	err |= __put_user(regs->sr, &gregs[17]);
0c22fafd312cd86 Greg Ungerer       2012-03-14  872  	err |= __put_user((regs->format << 12) | regs->vector, &uc->uc_formatvec);
0c22fafd312cd86 Greg Ungerer       2012-03-14  873  	err |= rt_save_fpu_state(uc, regs);
0c22fafd312cd86 Greg Ungerer       2012-03-14  874  	return err;
0c22fafd312cd86 Greg Ungerer       2012-03-14  875  }
0c22fafd312cd86 Greg Ungerer       2012-03-14  876  
0c22fafd312cd86 Greg Ungerer       2012-03-14  877  static inline void __user *
36992f2893d224a Richard Weinberger 2014-03-05  878  get_sigframe(struct ksignal *ksig, size_t frame_size)
0c22fafd312cd86 Greg Ungerer       2012-03-14  879  {
36992f2893d224a Richard Weinberger 2014-03-05  880  	unsigned long usp = sigsp(rdusp(), ksig);
0c22fafd312cd86 Greg Ungerer       2012-03-14  881  
0c22fafd312cd86 Greg Ungerer       2012-03-14  882  	return (void __user *)((usp - frame_size) & -8UL);
0c22fafd312cd86 Greg Ungerer       2012-03-14  883  }
0c22fafd312cd86 Greg Ungerer       2012-03-14  884  
0d97500d3930126 Richard Weinberger 2013-10-07  885  static int setup_frame(struct ksignal *ksig, sigset_t *set,
0d97500d3930126 Richard Weinberger 2013-10-07  886  			struct pt_regs *regs)
0c22fafd312cd86 Greg Ungerer       2012-03-14  887  {
0c22fafd312cd86 Greg Ungerer       2012-03-14  888  	struct sigframe __user *frame;
0c22fafd312cd86 Greg Ungerer       2012-03-14  889  	int fsize = frame_extra_sizes(regs->format);
0c22fafd312cd86 Greg Ungerer       2012-03-14  890  	struct sigcontext context;
0d97500d3930126 Richard Weinberger 2013-10-07  891  	int err = 0, sig = ksig->sig;
0c22fafd312cd86 Greg Ungerer       2012-03-14  892  
0c22fafd312cd86 Greg Ungerer       2012-03-14  893  	if (fsize < 0) {
7c79e1eef8c9a72 Geert Uytterhoeven 2016-12-06  894  		pr_debug("setup_frame: Unknown frame format %#x\n",
0c22fafd312cd86 Greg Ungerer       2012-03-14  895  			 regs->format);
0d97500d3930126 Richard Weinberger 2013-10-07  896  		return -EFAULT;
0c22fafd312cd86 Greg Ungerer       2012-03-14  897  	}
0c22fafd312cd86 Greg Ungerer       2012-03-14  898  
36992f2893d224a Richard Weinberger 2014-03-05  899  	frame = get_sigframe(ksig, sizeof(*frame) + fsize);
0c22fafd312cd86 Greg Ungerer       2012-03-14  900  
0c22fafd312cd86 Greg Ungerer       2012-03-14  901  	if (fsize)
0c22fafd312cd86 Greg Ungerer       2012-03-14  902  		err |= copy_to_user (frame + 1, regs + 1, fsize);
0c22fafd312cd86 Greg Ungerer       2012-03-14  903  
a0075cd1cb79971 Richard Weinberger 2014-07-13  904  	err |= __put_user(sig, &frame->sig);
0c22fafd312cd86 Greg Ungerer       2012-03-14  905  
0c22fafd312cd86 Greg Ungerer       2012-03-14  906  	err |= __put_user(regs->vector, &frame->code);
0c22fafd312cd86 Greg Ungerer       2012-03-14  907  	err |= __put_user(&frame->sc, &frame->psc);
0c22fafd312cd86 Greg Ungerer       2012-03-14  908  
0c22fafd312cd86 Greg Ungerer       2012-03-14  909  	if (_NSIG_WORDS > 1)
0c22fafd312cd86 Greg Ungerer       2012-03-14  910  		err |= copy_to_user(frame->extramask, &set->sig[1],
0c22fafd312cd86 Greg Ungerer       2012-03-14  911  				    sizeof(frame->extramask));
0c22fafd312cd86 Greg Ungerer       2012-03-14  912  
0c22fafd312cd86 Greg Ungerer       2012-03-14  913  	setup_sigcontext(&context, regs, set->sig[0]);
0c22fafd312cd86 Greg Ungerer       2012-03-14  914  	err |= copy_to_user (&frame->sc, &context, sizeof(context));
0c22fafd312cd86 Greg Ungerer       2012-03-14  915  
0c22fafd312cd86 Greg Ungerer       2012-03-14  916  	/* Set up to return from userspace.  */
0c22fafd312cd86 Greg Ungerer       2012-03-14  917  #ifdef CONFIG_MMU
0c22fafd312cd86 Greg Ungerer       2012-03-14  918  	err |= __put_user(frame->retcode, &frame->pretcode);
0c22fafd312cd86 Greg Ungerer       2012-03-14  919  	/* moveq #,d0; trap #0 */
0c22fafd312cd86 Greg Ungerer       2012-03-14  920  	err |= __put_user(0x70004e40 + (__NR_sigreturn << 16),
0c22fafd312cd86 Greg Ungerer       2012-03-14  921  			  (long __user *)(frame->retcode));
0c22fafd312cd86 Greg Ungerer       2012-03-14  922  #else
0c22fafd312cd86 Greg Ungerer       2012-03-14 @923  	err |= __put_user((void *) ret_from_user_signal, &frame->pretcode);
0c22fafd312cd86 Greg Ungerer       2012-03-14  924  #endif
0c22fafd312cd86 Greg Ungerer       2012-03-14  925  
0c22fafd312cd86 Greg Ungerer       2012-03-14  926  	if (err)
0d97500d3930126 Richard Weinberger 2013-10-07  927  		return -EFAULT;
0c22fafd312cd86 Greg Ungerer       2012-03-14  928  
0c22fafd312cd86 Greg Ungerer       2012-03-14  929  	push_cache ((unsigned long) &frame->retcode);
0c22fafd312cd86 Greg Ungerer       2012-03-14  930  
0c22fafd312cd86 Greg Ungerer       2012-03-14  931  	/*
0c22fafd312cd86 Greg Ungerer       2012-03-14  932  	 * Set up registers for signal handler.  All the state we are about
0c22fafd312cd86 Greg Ungerer       2012-03-14  933  	 * to destroy is successfully copied to sigframe.
0c22fafd312cd86 Greg Ungerer       2012-03-14  934  	 */
0c22fafd312cd86 Greg Ungerer       2012-03-14  935  	wrusp ((unsigned long) frame);
0d97500d3930126 Richard Weinberger 2013-10-07  936  	regs->pc = (unsigned long) ksig->ka.sa.sa_handler;
0c22fafd312cd86 Greg Ungerer       2012-03-14  937  	adjustformat(regs);
0c22fafd312cd86 Greg Ungerer       2012-03-14  938  
0c22fafd312cd86 Greg Ungerer       2012-03-14  939  	/*
0c22fafd312cd86 Greg Ungerer       2012-03-14  940  	 * This is subtle; if we build more than one sigframe, all but the
0c22fafd312cd86 Greg Ungerer       2012-03-14  941  	 * first one will see frame format 0 and have fsize == 0, so we won't
0c22fafd312cd86 Greg Ungerer       2012-03-14  942  	 * screw stkadj.
0c22fafd312cd86 Greg Ungerer       2012-03-14  943  	 */
0c22fafd312cd86 Greg Ungerer       2012-03-14  944  	if (fsize)
0c22fafd312cd86 Greg Ungerer       2012-03-14  945  		regs->stkadj = fsize;
0c22fafd312cd86 Greg Ungerer       2012-03-14  946  
0c22fafd312cd86 Greg Ungerer       2012-03-14  947  	/* Prepare to skip over the extra stuff in the exception frame.  */
0c22fafd312cd86 Greg Ungerer       2012-03-14  948  	if (regs->stkadj) {
0c22fafd312cd86 Greg Ungerer       2012-03-14  949  		struct pt_regs *tregs =
0c22fafd312cd86 Greg Ungerer       2012-03-14  950  			(struct pt_regs *)((ulong)regs + regs->stkadj);
7c79e1eef8c9a72 Geert Uytterhoeven 2016-12-06  951  		pr_debug("Performing stackadjust=%04lx\n", regs->stkadj);
0c22fafd312cd86 Greg Ungerer       2012-03-14  952  		/* This must be copied with decreasing addresses to
0c22fafd312cd86 Greg Ungerer       2012-03-14  953                     handle overlaps.  */
0c22fafd312cd86 Greg Ungerer       2012-03-14  954  		tregs->vector = 0;
0c22fafd312cd86 Greg Ungerer       2012-03-14  955  		tregs->format = 0;
0c22fafd312cd86 Greg Ungerer       2012-03-14  956  		tregs->pc = regs->pc;
0c22fafd312cd86 Greg Ungerer       2012-03-14  957  		tregs->sr = regs->sr;
0c22fafd312cd86 Greg Ungerer       2012-03-14  958  	}
0c22fafd312cd86 Greg Ungerer       2012-03-14  959  	return 0;
0c22fafd312cd86 Greg Ungerer       2012-03-14  960  }
0c22fafd312cd86 Greg Ungerer       2012-03-14  961  

:::::: The code at line 923 was first introduced by commit
:::::: 0c22fafd312cd8658ca23f6067a20aec0781c02a m68k: merge the MMU and non-MMU signal.c code

:::::: TO: Greg Ungerer <gerg@uclinux.org>
:::::: CC: Greg Ungerer <gerg@uclinux.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--n8g4imXOkfNTN/H1
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
AA==

--n8g4imXOkfNTN/H1--
