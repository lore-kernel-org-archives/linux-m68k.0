From: kbuild test robot <fengguang.wu@intel.com>
Subject: [m68k:printk 6/23] arch/m68k/include/asm/dma.h:373:23: error:
 'dmabp' undeclared
Date: Fri, 9 Dec 2016 06:02:21 +0800
Message-ID: <201612090619.fcgMCy8S%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="ibTvN161/egqYuK8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kbuild-all@01.org, linux-m68k@lists.linux-m68k.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git printk
head:   9d1d9d1ffdacef304e12669e3695b996fe357303
commit: a364f78f057a9066823e2e433ac138c93eea65ad [6/23] m68k/coldfire: Modernize printing of kernel messages
config: m68k-m5272c3_defconfig (attached as .config)
compiler: m68k-linux-gcc (GCC) 4.9.0
reproduce:
        wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout a364f78f057a9066823e2e433ac138c93eea65ad
        # save the attached .config to linux build tree
        make.cross ARCH=m68k 

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:13:0,
                    from include/linux/list.h:8,
                    from include/linux/module.h:9,
                    from init/main.c:15:
   arch/m68k/include/asm/dma.h: In function 'set_dma_mode':
>> arch/m68k/include/asm/dma.h:373:23: error: 'dmabp' undeclared (first use in this function)
      &dmalp[MCFDMA_DMR], dmabp[MCFDMA_DMR], &dmawp[MCFDMA_DIR],
                          ^
   include/linux/printk.h:121:18: note: in definition of macro 'no_printk'
       printk(fmt, ##__VA_ARGS__); \
                     ^
>> arch/m68k/include/asm/dma.h:372:3: note: in expansion of macro 'pr_dma'
      pr_dma("%s(%u): dmanr=%d DMR[%p]=%x DIR[%p]=%x\n", __FILE__, __LINE__, dmanr,
      ^
   arch/m68k/include/asm/dma.h:373:23: note: each undeclared identifier is reported only once for each function it appears in
      &dmalp[MCFDMA_DMR], dmabp[MCFDMA_DMR], &dmawp[MCFDMA_DIR],
                          ^
   include/linux/printk.h:121:18: note: in definition of macro 'no_printk'
       printk(fmt, ##__VA_ARGS__); \
                     ^
>> arch/m68k/include/asm/dma.h:372:3: note: in expansion of macro 'pr_dma'
      pr_dma("%s(%u): dmanr=%d DMR[%p]=%x DIR[%p]=%x\n", __FILE__, __LINE__, dmanr,
      ^
   arch/m68k/include/asm/dma.h: In function 'set_dma_addr':
>> arch/m68k/include/asm/dma.h:400:21: error: 'dmawp' undeclared (first use in this function)
      __LINE__, dmanr, &dmawp[MCFDMA_DMR], dmawp[MCFDMA_DMR],
                        ^
   include/linux/printk.h:121:18: note: in definition of macro 'no_printk'
       printk(fmt, ##__VA_ARGS__); \
                     ^
   arch/m68k/include/asm/dma.h:399:3: note: in expansion of macro 'pr_dma'
      pr_dma("%s(%u): dmanr=%d DMR[%p]=%x SAR[%p]=%08x DAR[%p]=%08x\n", __FILE__,
      ^

vim +/dmabp +373 arch/m68k/include/asm/dma.h

   366	    /* burst, 32 bit, 16 bit or 8 bit transfers are separately configurable on the MCF5272 */
   367	    (((mode & DMA_MODE_SSIZE_MASK) >> DMA_MODE_SSIZE_OFF) << MCFDMA_DMR_DSTS_OFF) |
   368	    (((mode & DMA_MODE_SSIZE_MASK) >> DMA_MODE_SSIZE_OFF) << MCFDMA_DMR_SRCS_OFF);
   369	
   370	  dmawp[MCFDMA_DIR] |= MCFDMA_DIR_ASCEN;   /* Enable completion interrupts */
   371	
 > 372	  pr_dma("%s(%u): dmanr=%d DMR[%p]=%x DIR[%p]=%x\n", __FILE__, __LINE__, dmanr,
 > 373		 &dmalp[MCFDMA_DMR], dmabp[MCFDMA_DMR], &dmawp[MCFDMA_DIR],
   374		 dmawp[MCFDMA_DIR]);
   375	}
   376	
   377	/* Set transfer address for specific DMA channel */
   378	static __inline__ void set_dma_addr(unsigned int dmanr, unsigned int a)
   379	{
   380	  volatile unsigned int   *dmalp;
   381	
   382	  pr_dma("set_dma_addr(dmanr=%d,a=%x)\n", dmanr, a);
   383	
   384	  dmalp = (unsigned int *) dma_base_addr[dmanr];
   385	
   386	  /* Determine which address registers are used for memory/device accesses */
   387	  if (dmalp[MCFDMA_DMR] & MCFDMA_DMR_SRCM) {
   388	    /* Source incrementing, must be memory */
   389	    dmalp[MCFDMA_DSAR] = a;
   390	    /* Set dest address, must be device */
   391	    dmalp[MCFDMA_DDAR] = dma_device_address[dmanr];
   392	  } else {
   393	    /* Destination incrementing, must be memory */
   394	    dmalp[MCFDMA_DDAR] = a;
   395	    /* Set source address, must be device */
   396	    dmalp[MCFDMA_DSAR] = dma_device_address[dmanr];
   397	  }
   398	
   399	  pr_dma("%s(%u): dmanr=%d DMR[%p]=%x SAR[%p]=%08x DAR[%p]=%08x\n", __FILE__,
 > 400		 __LINE__, dmanr, &dmawp[MCFDMA_DMR], dmawp[MCFDMA_DMR],
   401		 &dmalp[MCFDMA_DSAR], dmalp[MCFDMA_DSAR], &dmalp[MCFDMA_DDAR],
   402		 dmalp[MCFDMA_DDAR]);
   403	}

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--ibTvN161/egqYuK8
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
tXsL+v8/e/ogDGZzAAA=

--ibTvN161/egqYuK8--
