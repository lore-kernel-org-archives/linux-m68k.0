From: kbuild test robot <fengguang.wu@intel.com>
Subject: [m68knommu:for-next 9/11] arch/m68k/kernel/process.c:208:7: warning:
 unused variable 'fpustate'
Date: Fri, 2 Sep 2016 13:49:48 +0800
Message-ID: <201609021345.8nVjX6vR%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="UugvWAfsgieZRqgk"
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: kbuild-all@01.org, linux-m68k@lists.linux-m68k.org, uclinux-dev@uclinux.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next
head:   bab9058f2048514bb8db75712a9aca3833f92bb8
commit: 126219c5a0cdb283f9ff2933ae0ac9f43b760918 [9/11] m68k: always make available dump_fpu()
config: m68k-allnoconfig (attached as .config)
compiler: m68k-linux-gcc (GCC) 4.9.0
reproduce:
        wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 126219c5a0cdb283f9ff2933ae0ac9f43b760918
        # save the attached .config to linux build tree
        make.cross ARCH=m68k 

All warnings (new ones prefixed by >>):

   arch/m68k/kernel/process.c: In function 'dump_fpu':
>> arch/m68k/kernel/process.c:208:7: warning: unused variable 'fpustate' [-Wunused-variable]
     char fpustate[216];
          ^

vim +/fpustate +208 arch/m68k/kernel/process.c

fde39441 Greg Ungerer 2012-02-09  192  						"m" (p->thread.fpcntl[0])
fde39441 Greg Ungerer 2012-02-09  193  					      : "memory");
fde39441 Greg Ungerer 2012-02-09  194  			}
fde39441 Greg Ungerer 2012-02-09  195  		}
fde39441 Greg Ungerer 2012-02-09  196  
fde39441 Greg Ungerer 2012-02-09  197  		/* Restore the state in case the fpu was busy */
fde39441 Greg Ungerer 2012-02-09  198  		asm volatile ("frestore %0" : : "m" (p->thread.fpstate[0]));
fde39441 Greg Ungerer 2012-02-09  199  	}
fde39441 Greg Ungerer 2012-02-09  200  #endif /* CONFIG_FPU */
fde39441 Greg Ungerer 2012-02-09  201  
fde39441 Greg Ungerer 2012-02-09  202  	return 0;
fde39441 Greg Ungerer 2012-02-09  203  }
fde39441 Greg Ungerer 2012-02-09  204  
fde39441 Greg Ungerer 2012-02-09  205  /* Fill in the fpu structure for a core dump.  */
fde39441 Greg Ungerer 2012-02-09  206  int dump_fpu (struct pt_regs *regs, struct user_m68kfp_struct *fpu)
fde39441 Greg Ungerer 2012-02-09  207  {
fde39441 Greg Ungerer 2012-02-09 @208  	char fpustate[216];
fde39441 Greg Ungerer 2012-02-09  209  
fde39441 Greg Ungerer 2012-02-09  210  	if (FPU_IS_EMU) {
fde39441 Greg Ungerer 2012-02-09  211  		int i;
fde39441 Greg Ungerer 2012-02-09  212  
fde39441 Greg Ungerer 2012-02-09  213  		memcpy(fpu->fpcntl, current->thread.fpcntl, 12);
fde39441 Greg Ungerer 2012-02-09  214  		memcpy(fpu->fpregs, current->thread.fp, 96);
fde39441 Greg Ungerer 2012-02-09  215  		/* Convert internal fpu reg representation
fde39441 Greg Ungerer 2012-02-09  216  		 * into long double format

:::::: The code at line 208 was first introduced by commit
:::::: fde3944141c70b264aace92334b297a05233e179 m68k: merge the MMU and non-MMU versions of process.c

:::::: TO: Greg Ungerer <gerg@uclinux.org>
:::::: CC: Greg Ungerer <gerg@uclinux.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--UugvWAfsgieZRqgk
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
yzj9H6M/OlxNOQAA

--UugvWAfsgieZRqgk--
