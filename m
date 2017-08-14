From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH] m68k: allow ColdFire m5441x parts to run with MMU enabled
Date: Mon, 14 Aug 2017 14:16:32 +1000
Message-ID: <c5dfd7b3-3266-1ecd-1dbf-e66bd9f5aa32@westnet.com.au>
References: <bc3dc168-aaae-1271-b73b-4d649db5e301@sysam.it>
 <d1ce1669-0286-ebad-7c6c-e9dfe37c266c@sysam.it>
 <30318b18-e955-1615-975e-9b378d3201b8@westnet.com.au>
 <c095233b-15fc-53f7-c21d-a6c805711040@sysam.it>
 <0e1723eb-0724-7007-5b63-7d80112268a2@westnet.com.au>
 <d4e220c9-f607-cf9a-2e63-910e745dbea9@sysam.it>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------E31209103008F1C7F4273581"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out8.external.iinet.net.au ([203.59.1.225]:54177
        "EHLO icp-osb-irony-out8.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750713AbdHNEQh (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 14 Aug 2017 00:16:37 -0400
In-Reply-To: <d4e220c9-f607-cf9a-2e63-910e745dbea9@sysam.it>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>, Linux/m68k <linux-m68k@vger.kernel.org>

This is a multi-part message in MIME format.
--------------E31209103008F1C7F4273581
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Angelo,

On 12/08/17 21:17, Angelo Dureghello wrote:
> On 10/08/2017 09:06, Greg Ungerer wrote:
>> On 10/08/17 01:32, Angelo Dureghello wrote:
>> [snip]
>>> sure, on this board  http://sysam.it/cff_stmark2.html
>>> there are 128MB of ddr2.
>>>
>>> External SDRAM is accessible, at least without any mmc support enabled,
>>> from 0x40000000.
>>>
>>> I have following test config:
>>>
>>>    GNU nano 2.8.6                                                                              File: arch/m68k/configs/stmark2_defconfig
>>>
>>> CONFIG_LOCALVERSION="stmark2-001"
>> [snip]
>>>
>>>
>>> I tried still yesterday a bit, but seems there is no much support for
>>> earlyprintk / low level debug for this architecture.
>>>
>>> In case i can try with a gpio toggling routine, at least to find
>>> where kernel stops.
>>
>> The attached patch, is a quick and dirty early console output method.
>> It works for me on the m5475, should work for you "as is" on the 5441x too.
>>
>> It is kind of an early printk. Of course it still needs the early
>> kernel boot to have succeeded before you will get anything much coming out.
>> But it is worth trying.
> 
> Ok many thanks. Btw i used a __square(); function written in asm, so i am
> sure i see the gpio toggling in very early stages.
> 
>>
>> I am wondering if the non-0 base RAM may be a problem. I have only run
>> the MMU enabled code on platforms with 0 based RAM so far. But lets see if
>> the early console trace attached gives us anything before digging into that.
>>
> 
> This MCU has sdram area physically mapped at 0x4000 0000 so U-Boot, to be
> able to execute the kernel must load it to that location/area anyway.
> 
> But i have seen that it is not a problem, after MMU is enabled in head.S
> the jump
>                 movel   #_vstart,%a0      /* jump to "virtual" space */
>         jmp     %a0@
> 
> works fine. Since that range is not hitting anything that is maintained
> physical, it can be translated into virtual without any issue.

Yeah, it is not so much the initial start up that I think will
be the problem. More the setup of the MMU mapping tables later
in boot.


> After some hard debug, i see the execution stops at:
> 
> asmlinkage __visible void __init start_kernel(void)
>    ...
>    setup_arch(&command_line);      setup_mm.c
>       ...
>       paging_init();               mm/mcfmmu.c
>          ...
>          empty_zero_page = (void *) alloc_bootmem_pages(PAGE_SIZE);
>          ^line 47 mcfmmu.c
> 
> Inside alloc_bootmem_pages(), execution seems to end up finally to
> mm/bootmem.c and likely to alloc_bootmem_bdata().
> In case i can still proceed to find the exact place where execution stops,
> but i suspect in the while(1), line 545.
> 
> As a curious thing, i find in a different cf CPU code "m54xx.c"
> the following:
> 
> void __init config_BSP(char *commandp, int size)
> {
> #ifdef CONFIG_MMU
>     cf_bootmem_alloc();
>     mmu_context_init();
> #endif
>     
> Do also m5441x.c maybe need this calls ?

Yes, you will need this. So that code above is only getting run when
configured for a 547x CPU family. Attached is a rework of that code
so that it will be run for all ColdFire MMU varients. Can you try
that out?


> Would be very nice to have MMU working. Strangely, i don't see any
> board_config with it enabled. Was it ever tested on some Coldfire ?

Oh, yeah, I run this on a real M5475 EVB board for every kernel
mainline release, with and without MMU enabled. See the
arch/m68k/configs/m5475evb_defconfig, it will default to having
the MMU enabled.

I have todays linux-4.13-rc5 running on it here now:

# cat /proc/version
Linux version 4.13.0-rc5-00001-gb014090-dirty (gerg@goober) (gcc version 5.4.0 (GCC)) #1 Mon Aug 14 10:14:12 AEST 2017

# cat /proc/cpuinfo
CPU:            ColdFire
MMU:            ColdFire
FPU:            ColdFire
Clocking:       264.1MHz
BogoMips:       264.19
Calibration:    1320960 loops
# 

Regards
Greg

--------------E31209103008F1C7F4273581
Content-Type: text/x-patch;
 name="cf-mmu-init.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="cf-mmu-init.patch"

diff --git a/arch/m68k/coldfire/m54xx.c b/arch/m68k/coldfire/m54xx.c
index c552851..704efea 100644
--- a/arch/m68k/coldfire/m54xx.c
+++ b/arch/m68k/coldfire/m54xx.c
@@ -95,10 +95,6 @@ static void mcf54xx_reset(void)
 
 void __init config_BSP(char *commandp, int size)
 {
-#ifdef CONFIG_MMU
-	cf_bootmem_alloc();
-	mmu_context_init();
-#endif
 	mach_reset = mcf54xx_reset;
 	mach_sched_init = hw_timer_init;
 	m54xx_uarts_init();
diff --git a/arch/m68k/include/asm/mmu_context.h b/arch/m68k/include/asm/mmu_context.h
index 4a6ae6d..00c28b1 100644
--- a/arch/m68k/include/asm/mmu_context.h
+++ b/arch/m68k/include/asm/mmu_context.h
@@ -91,7 +91,6 @@ static inline void activate_mm(struct mm_struct *active_mm,
 
 #define deactivate_mm(tsk, mm) do { } while (0)
 
-extern void mmu_context_init(void);
 #define prepare_arch_switch(next) load_ksp_mmu(next)
 
 static inline void load_ksp_mmu(struct task_struct *task)
diff --git a/arch/m68k/kernel/setup_mm.c b/linux/arch/m68k/kernel/setup_mm.c
index 7a2c212..5632c48 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -343,6 +343,7 @@ void __init setup_arch(char **cmdline_p)
 #ifdef CONFIG_COLDFIRE
 	case MACH_M54XX:
 	case MACH_M5441X:
+		cf_bootmem_alloc();
 		config_BSP(NULL, 0);
 		break;
 #endif
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index 87131cd..d09a317 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -150,6 +150,24 @@ int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word)
 	return 0;
 }
 
+/*
+ * Initialize the context management stuff.
+ * The following was taken from arch/ppc/mmu_context.c
+ */
+static void __init mmu_context_init(void)
+{
+	/*
+	 * Some processors have too few contexts to reserve one for
+	 * init_mm, and require using context 0 for a normal task.
+	 * Other processors reserve the use of context zero for the kernel.
+	 * This code assumes FIRST_CONTEXT < 32.
+	 */
+	context_map[0] = (1 << FIRST_CONTEXT) - 1;
+	next_mmu_context = FIRST_CONTEXT;
+	atomic_set(&nr_free_contexts, LAST_CONTEXT - FIRST_CONTEXT + 1);
+}
+
+
 void __init cf_bootmem_alloc(void)
 {
 	unsigned long start_pfn;
@@ -177,23 +195,8 @@ void __init cf_bootmem_alloc(void)
 	memstart += init_bootmem_node(NODE_DATA(0), start_pfn,
 		min_low_pfn, max_low_pfn);
 	free_bootmem_node(NODE_DATA(0), memstart, _ramend - memstart);
-}
 
-/*
- * Initialize the context management stuff.
- * The following was taken from arch/ppc/mmu_context.c
- */
-void __init mmu_context_init(void)
-{
-	/*
-	 * Some processors have too few contexts to reserve one for
-	 * init_mm, and require using context 0 for a normal task.
-	 * Other processors reserve the use of context zero for the kernel.
-	 * This code assumes FIRST_CONTEXT < 32.
-	 */
-	context_map[0] = (1 << FIRST_CONTEXT) - 1;
-	next_mmu_context = FIRST_CONTEXT;
-	atomic_set(&nr_free_contexts, LAST_CONTEXT - FIRST_CONTEXT + 1);
+	mmu_context_init();
 }
 
 /*

--------------E31209103008F1C7F4273581--
