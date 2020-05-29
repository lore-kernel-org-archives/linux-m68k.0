Return-Path: <SRS0=UnHi=7L=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEC3C433DF
	for <linux-m68k@archiver.kernel.org>; Fri, 29 May 2020 23:24:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C2402068D
	for <linux-m68k@archiver.kernel.org>; Fri, 29 May 2020 23:24:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3ULy+H7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbgE2XYL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 29 May 2020 19:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbgE2XYK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 29 May 2020 19:24:10 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B724C03E969
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 May 2020 16:24:10 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id f21so604616pgg.12
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 May 2020 16:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:references:cc:to:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=m29K+buS+kCUkbBsPs88vW0Uu8G5apcLkytExmRjvWE=;
        b=V3ULy+H7WvWMeGrDsmFQVA0w+A/09I8KVkqbYVEYKXaSgt0u3s6gVAxPrCrocf1AUT
         QUZzmtyhxg1jVeZF0qpP7EDhxGEiW76dzGSYJDPNicRnwsx4okvgj14VWprEMlTE8BRV
         Hd3iObVpolD6KOwTiciBXQmD+qd3P0ue5AML0jDG1fLT6U36hvdISZzVGJpTWrlxKEMM
         EENfXTKUzhseq7hnhLfeQf2QmbQ5VYzgDe2F4xOCrapBdVYelVP10IvYDGeQoYqzh8Lf
         WpReKoJe/JLH3IbA+PXzEMwAQZOBLzscNDI/58iS7zmqD75N2unVyaetICHp3jyGoN1E
         Vg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:references:cc:to:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=m29K+buS+kCUkbBsPs88vW0Uu8G5apcLkytExmRjvWE=;
        b=slyatzx8aBQm5JsT10ePlyqBQJHYGKyNJiZiQ8nXLTx0yWrNapu1gSplP4vACgbXdK
         42niVLBtvG93rE+VUv4Bval+bv29UckX06KF2NefNctHfIKT8ZevXQttgeC3eUzA4nwz
         pDnwg7XbcFf93FTbkLiJAzkaL6l4ReUDCsbS6e25WXOZwBcR5KGRsVkMKCdkvZ71Fv5N
         Le1NpAwE7U5tYHSp0G3js4bfoTWSaKphpw2D3w4Ckjy8zylEWmlR3MInXbQQvKUmWGSb
         prXhAv9JYGwVEXXzJPSe8wgqaHGyUserxiJA+6BPsbnTlquHnmlZLwJsConMik5sbux8
         XENw==
X-Gm-Message-State: AOAM531I06BLGtF8N09Pz6euvQwr684tMQz08rnm5wwEoWY7WwTVNDtm
        JUf/2PAAs/n8fhcDJT1dLwg=
X-Google-Smtp-Source: ABdhPJzG4prjb6H+mnlOvAVLP4P/8miY4XdT+kik6XDP8EtbDr7GT6jfqHAGCvDriM7CI7q1DKAIZw==
X-Received: by 2002:a63:cc4f:: with SMTP id q15mr10260462pgi.439.1590794649703;
        Fri, 29 May 2020 16:24:09 -0700 (PDT)
Received: from [192.168.1.101] (122-58-178-240-adsl.sparkbb.co.nz. [122.58.178.240])
        by smtp.gmail.com with ESMTPSA id n205sm8430089pfd.50.2020.05.29.16.24.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 May 2020 16:24:09 -0700 (PDT)
Subject: Re: [m68k:m68k-queue 8/13] drivers/usb/host/isp116x.h:370:87: note:
 in expansion of macro 'isa_rom_writew_raw'
References: <202005300247.nivoTcuo%lkp@intel.com>
Cc:     linux-m68k@lists.linux-m68k.org,
        Michael Schmitz <schmitz@debian.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <18b6b8b1-d91e-56c9-2eef-6d79fc0ad3e9@gmail.com>
Date:   Sat, 30 May 2020 11:23:58 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <202005300247.nivoTcuo%lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

the __w is used as a dummy read variable to execute a read cycle where 
the address encodes the value to be written to the peripheral on the ROM 
port. The value of this dummy variable is of no consequence (and may 
very well be undefined).

How do I annotate this so the compiler will shut up about it?

Cheers,

	Michael



Am 30.05.2020 um 06:19 schrieb kbuild test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-queue
> head:   5e423cc0afd9cc668eba93f37fd9975db9a9d96c
> commit: ef0029557f6a4845901edc3f08a2fe21a16c982c [8/13] m68k: atari: usb: Add ISP1160 USB host controller support
> config: m68k-allmodconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout ef0029557f6a4845901edc3f08a2fe21a16c982c
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> In file included from arch/m68k/include/asm/io_mm.h:25,
> from arch/m68k/include/asm/io.h:8,
> from include/linux/io.h:13,
> from include/linux/irq.h:20,
> from include/asm-generic/hardirq.h:13,
> from ./arch/m68k/include/generated/asm/hardirq.h:1,
> from include/linux/hardirq.h:9,
> from include/linux/interrupt.h:11,
> from include/linux/usb.h:16,
> from drivers/usb/host/isp116x-hcd.c:66:
> arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsb':
> arch/m68k/include/asm/raw_io.h:83:7: warning: variable '__w' set but not used [-Wunused-but-set-variable]
> 83 |  ({u8 __w, __v = (b);  u32 _addr = ((u32) (addr));          |       ^~~
> arch/m68k/include/asm/raw_io.h:430:3: note: in expansion of macro 'rom_out_8'
> 430 |   rom_out_8(port, *buf++);
> |   ^~~~~~~~~
> arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw':
> arch/m68k/include/asm/raw_io.h:86:8: warning: variable '__w' set but not used [-Wunused-but-set-variable]
> 86 |  ({u16 __w, __v = (w); u32 _addr = ((u32) (addr));          |        ^~~
> arch/m68k/include/asm/raw_io.h:448:3: note: in expansion of macro 'rom_out_be16'
> 448 |   rom_out_be16(port, *buf++);
> |   ^~~~~~~~~~~~
> arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw_swapw':
> arch/m68k/include/asm/raw_io.h:90:8: warning: variable '__w' set but not used [-Wunused-but-set-variable]
> 90 |  ({u16 __w, __v = (w); u32 _addr = ((u32) (addr));          |        ^~~
> arch/m68k/include/asm/raw_io.h:466:3: note: in expansion of macro 'rom_out_le16'
> 466 |   rom_out_le16(port, *buf++);
> |   ^~~~~~~~~~~~
> drivers/usb/host/isp116x.h: In function 'isp116x_write_addr':
> arch/m68k/include/asm/raw_io.h:86:8: warning: variable '__w' set but not used [-Wunused-but-set-variable]
> 86 |  ({u16 __w, __v = (w); u32 _addr = ((u32) (addr));          |        ^~~
> arch/m68k/include/asm/io_mm.h:246:37: note: in expansion of macro 'rom_out_be16'
> 246 | #define isa_rom_writew_raw(val, p)  rom_out_be16(isa_mtw((unsigned long)(p)), (val))
> |                                     ^~~~~~~~~~~~
>>> drivers/usb/host/isp116x.h:370:87: note: in expansion of macro 'isa_rom_writew_raw'
> 370 | #define isp_writew(v, p) ((((unsigned long)(__pa(p)) & 0x00000F00) == 0x00000300UL) ? isa_rom_writew_raw((v), __pa(p)) : __raw_writew((v), (p)))
> |                                                                                       ^~~~~~~~~~~~~~~~~~
> drivers/usb/host/isp116x.h:391:2: note: in expansion of macro 'isp_writew'
> 391 |  isp_writew(reg & 0xff, isp116x->addr_reg);
> |  ^~~~~~~~~~
> drivers/usb/host/isp116x.h: In function 'isp116x_write_data16':
> arch/m68k/include/asm/raw_io.h:86:8: warning: variable '__w' set but not used [-Wunused-but-set-variable]
> 86 |  ({u16 __w, __v = (w); u32 _addr = ((u32) (addr));          |        ^~~
> arch/m68k/include/asm/io_mm.h:246:37: note: in expansion of macro 'rom_out_be16'
> 246 | #define isa_rom_writew_raw(val, p)  rom_out_be16(isa_mtw((unsigned long)(p)), (val))
> |                                     ^~~~~~~~~~~~
>>> drivers/usb/host/isp116x.h:370:87: note: in expansion of macro 'isa_rom_writew_raw'
> 370 | #define isp_writew(v, p) ((((unsigned long)(__pa(p)) & 0x00000F00) == 0x00000300UL) ? isa_rom_writew_raw((v), __pa(p)) : __raw_writew((v), (p)))
> |                                                                                       ^~~~~~~~~~~~~~~~~~
> drivers/usb/host/isp116x.h:397:2: note: in expansion of macro 'isp_writew'
> 397 |  isp_writew(val, isp116x->data_reg);
> |  ^~~~~~~~~~
> drivers/usb/host/isp116x.h: In function 'isp116x_raw_write_data16':
> arch/m68k/include/asm/raw_io.h:86:8: warning: variable '__w' set but not used [-Wunused-but-set-variable]
> 86 |  ({u16 __w, __v = (w); u32 _addr = ((u32) (addr));          |        ^~~
> arch/m68k/include/asm/io_mm.h:241:13: note: in expansion of macro 'rom_out_be16'
> 241 |  (ISA_SEX ? rom_out_be16(isa_mtw((unsigned long)(p)), (val))          |             ^~~~~~~~~~~~
>>> drivers/usb/host/isp116x.h:372:91: note: in expansion of macro 'isa_rom_writew'
> 372 | #define isp_raw_writew(v, p) ((((unsigned long)(__pa(p)) & 0x00000F00) == 0x00000300UL) ? isa_rom_writew((v), __pa(p)) : writew((v), (p)))
> |                                                                                           ^~~~~~~~~~~~~~
> drivers/usb/host/isp116x.h:403:2: note: in expansion of macro 'isp_raw_writew'
> 403 |  isp_raw_writew(val, isp116x->data_reg);
> |  ^~~~~~~~~~~~~~
> arch/m68k/include/asm/raw_io.h:90:8: warning: variable '__w' set but not used [-Wunused-but-set-variable]
> 90 |  ({u16 __w, __v = (w); u32 _addr = ((u32) (addr));          |        ^~~
> arch/m68k/include/asm/io_mm.h:242:6: note: in expansion of macro 'rom_out_le16'
> 242 |    : rom_out_le16(isa_mtw((unsigned long)(p)), (val)))
> |      ^~~~~~~~~~~~
>>> drivers/usb/host/isp116x.h:372:91: note: in expansion of macro 'isa_rom_writew'
> 372 | #define isp_raw_writew(v, p) ((((unsigned long)(__pa(p)) & 0x00000F00) == 0x00000300UL) ? isa_rom_writew((v), __pa(p)) : writew((v), (p)))
> |                                                                                           ^~~~~~~~~~~~~~
> drivers/usb/host/isp116x.h:403:2: note: in expansion of macro 'isp_raw_writew'
> 403 |  isp_raw_writew(val, isp116x->data_reg);
> |  ^~~~~~~~~~~~~~
> drivers/usb/host/isp116x.h: In function 'isp116x_write_data32':
> arch/m68k/include/asm/raw_io.h:86:8: warning: variable '__w' set but not used [-Wunused-but-set-variable]
> 86 |  ({u16 __w, __v = (w); u32 _addr = ((u32) (addr));          |        ^~~
> arch/m68k/include/asm/io_mm.h:246:37: note: in expansion of macro 'rom_out_be16'
> 246 | #define isa_rom_writew_raw(val, p)  rom_out_be16(isa_mtw((unsigned long)(p)), (val))
> |                                     ^~~~~~~~~~~~
>>> drivers/usb/host/isp116x.h:370:87: note: in expansion of macro 'isa_rom_writew_raw'
> 370 | #define isp_writew(v, p) ((((unsigned long)(__pa(p)) & 0x00000F00) == 0x00000300UL) ? isa_rom_writew_raw((v), __pa(p)) : __raw_writew((v), (p)))
> |                                                                                       ^~~~~~~~~~~~~~~~~~
> drivers/usb/host/isp116x.h:427:2: note: in expansion of macro 'isp_writew'
> 427 |  isp_writew(val & 0xffff, isp116x->data_reg);
> |  ^~~~~~~~~~
> arch/m68k/include/asm/raw_io.h:86:8: warning: variable '__w' set but not used [-Wunused-but-set-variable]
> 86 |  ({u16 __w, __v = (w); u32 _addr = ((u32) (addr));          |        ^~~
> arch/m68k/include/asm/io_mm.h:246:37: note: in expansion of macro 'rom_out_be16'
> 246 | #define isa_rom_writew_raw(val, p)  rom_out_be16(isa_mtw((unsigned long)(p)), (val))
> |                                     ^~~~~~~~~~~~
>>> drivers/usb/host/isp116x.h:370:87: note: in expansion of macro 'isa_rom_writew_raw'
> 370 | #define isp_writew(v, p) ((((unsigned long)(__pa(p)) & 0x00000F00) == 0x00000300UL) ? isa_rom_writew_raw((v), __pa(p)) : __raw_writew((v), (p)))
> |                                                                                       ^~~~~~~~~~~~~~~~~~
> drivers/usb/host/isp116x.h:429:2: note: in expansion of macro 'isp_writew'
> 429 |  isp_writew(val >> 16, isp116x->data_reg);
> |  ^~~~~~~~~~
>
> vim +/isa_rom_writew_raw +370 drivers/usb/host/isp116x.h
>
>    357	
>    358	
>    359	#ifdef CONFIG_ATARI_ROM_ISA
>    360	  /*
>    361	   * 16 bit data bus byte swapped in hardware on both Atari variants.
>    362	   * EtherNAT variant of ISP1160 integration is memory mapped at 0x800000XX,
>    363	   * and uses regular readw/__raw_readw (but semantics swapped).
>    364	   * NetUSBee variant is hooked up through ROM port and uses ROM port
>    365	   * IO access, with fake IO address of 0x3XX.
>    366	   * Selection of the appropriate accessors relies on ioremapped addresses still
>    367	   * retaining the 0x3XX bit.
>    368	   */
>    369	#define isp_readw(p)		((((unsigned long)(__pa(p)) & 0x00000F00) == 0x00000300UL) ? isa_rom_readw_raw(__pa(p)) : __raw_readw((p)))
>  > 370	#define isp_writew(v, p)	((((unsigned long)(__pa(p)) & 0x00000F00) == 0x00000300UL) ? isa_rom_writew_raw((v), __pa(p)) : __raw_writew((v), (p)))
>    371	#define isp_raw_readw(p)	((((unsigned long)(__pa(p)) & 0x00000F00) == 0x00000300UL) ? isa_rom_readw(__pa(p)) : readw((p)))
>  > 372	#define isp_raw_writew(v, p)	((((unsigned long)(__pa(p)) & 0x00000F00) == 0x00000300UL) ? isa_rom_writew((v), __pa(p)) : writew((v), (p)))
>    373	#elif defined(CONFIG_ATARI)
>    374	  /*
>    375	   * 16 bit data bus byte swapped in hardware on EtherNAT only.
>    376	   */
>    377	#define isp_readw		__raw_readw
>    378	#define isp_writew		__raw_writew
>    379	#define isp_raw_readw		readw
>    380	#define isp_raw_writew		writew
>    381	#else
>    382	  /* sane hardware */
>    383	#define isp_readw		readw
>    384	#define isp_writew		writew
>    385	#define isp_raw_readw		__raw_readw
>    386	#define isp_raw_writew		__raw_writew
>    387	#endif
>    388	
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>
