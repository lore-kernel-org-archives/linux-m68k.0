From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: [PATCH] m68k: allow ColdFire m5441x parts to run with MMU enabled
Date: Mon, 21 Aug 2017 16:58:17 +0200
Message-ID: <ac5b376c-9ea9-7a62-7f01-d70d9b1e8121@sysam.it>
References: <bc3dc168-aaae-1271-b73b-4d649db5e301@sysam.it>
 <d1ce1669-0286-ebad-7c6c-e9dfe37c266c@sysam.it>
 <30318b18-e955-1615-975e-9b378d3201b8@westnet.com.au>
 <c095233b-15fc-53f7-c21d-a6c805711040@sysam.it>
 <0e1723eb-0724-7007-5b63-7d80112268a2@westnet.com.au>
 <d4e220c9-f607-cf9a-2e63-910e745dbea9@sysam.it>
 <c5dfd7b3-3266-1ecd-1dbf-e66bd9f5aa32@westnet.com.au>
 <f7d80fbd-3b99-66c5-38f5-592780703f96@sysam.it>
 <590226cf-890a-449b-6bd4-f461fff2938b@westnet.com.au>
 <c8916578-7f5a-707d-e59d-d4d274cbf7a1@sysam.it>
 <702374e9-7c94-1cbe-306a-d39a1fb70fdd@westnet.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------1E3BF147C5BF1BDA42CBB790"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:34089 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753524AbdHUO6U (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 21 Aug 2017 10:58:20 -0400
In-Reply-To: <702374e9-7c94-1cbe-306a-d39a1fb70fdd@westnet.com.au>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>

This is a multi-part message in MIME format.
--------------1E3BF147C5BF1BDA42CBB790
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Greg,

On 21/08/2017 09:15, Greg Ungerer wrote:
> Hi Angelo,
> 
> On 20/08/17 23:26, Angelo Dureghello wrote:
>> On 20/08/2017 14:44, Greg Ungerer wrote:
>>> On 18/08/17 01:02, Angelo Dureghello wrote:
>>>> On 14/08/2017 06:16, Greg Ungerer wrote:
>>>>> On 12/08/17 21:17, Angelo Dureghello wrote:
>>>>>> On 10/08/2017 09:06, Greg Ungerer wrote:
>>>>>>> On 10/08/17 01:32, Angelo Dureghello wrote:
>>>>>>> [snip]
>>>>>>>> sure, on this board  http://sysam.it/cff_stmark2.html
>>>>>>>> there are 128MB of ddr2.
>>>>>>>>
>>>>>>>> External SDRAM is accessible, at least without any mmc support enabled,
>>>>>>>> from 0x40000000.
>>>>>>>>
>>>>>>>> I have following test config:
>>>>>>>>
>>>>>>>>      GNU nano 2.8.6 File: arch/m68k/configs/stmark2_defconfig
>>>>>>>>
>>>>>>>> CONFIG_LOCALVERSION="stmark2-001"
>>>>>>> [snip]
>>>>>>>>
>>>>>>>>
>>>>>>>> I tried still yesterday a bit, but seems there is no much support for
>>>>>>>> earlyprintk / low level debug for this architecture.
>>>>>>>>
>>>>>>>> In case i can try with a gpio toggling routine, at least to find
>>>>>>>> where kernel stops.
>>>>>>>
>>>>>>> The attached patch, is a quick and dirty early console output method.
>>>>>>> It works for me on the m5475, should work for you "as is" on the 5441x too.
>>>>>>>
>>>>>>> It is kind of an early printk. Of course it still needs the early
>>>>>>> kernel boot to have succeeded before you will get anything much coming out.
>>>>>>> But it is worth trying.
>>>>>>
>>>>>> Ok many thanks. Btw i used a __square(); function written in asm, so i am
>>>>>> sure i see the gpio toggling in very early stages.
>>>>>>
>>>>>>>
>>>>>>> I am wondering if the non-0 base RAM may be a problem. I have only run
>>>>>>> the MMU enabled code on platforms with 0 based RAM so far. But lets see if
>>>>>>> the early console trace attached gives us anything before digging into that.
>>>>>>>
>>>>>>
>>>>>> This MCU has sdram area physically mapped at 0x4000 0000 so U-Boot, to be
>>>>>> able to execute the kernel must load it to that location/area anyway.
>>>>>>
>>>>>> But i have seen that it is not a problem, after MMU is enabled in head.S
>>>>>> the jump
>>>>>>                   movel   #_vstart,%a0      /* jump to "virtual" space */
>>>>>>           jmp     %a0@
>>>>>>
>>>>>> works fine. Since that range is not hitting anything that is maintained
>>>>>> physical, it can be translated into virtual without any issue.
>>>>>
>>>>> Yeah, it is not so much the initial start up that I think will
>>>>> be the problem. More the setup of the MMU mapping tables later
>>>>> in boot.
>>>>>
>>>>>
>>>>>> After some hard debug, i see the execution stops at:
>>>>>>
>>>>>> asmlinkage __visible void __init start_kernel(void)
>>>>>>      ...
>>>>>>      setup_arch(&command_line);      setup_mm.c
>>>>>>         ...
>>>>>>         paging_init();               mm/mcfmmu.c
>>>>>>            ...
>>>>>>            empty_zero_page = (void *) alloc_bootmem_pages(PAGE_SIZE);
>>>>>>            ^line 47 mcfmmu.c
>>>>>>
>>>>>> Inside alloc_bootmem_pages(), execution seems to end up finally to
>>>>>> mm/bootmem.c and likely to alloc_bootmem_bdata().
>>>>>> In case i can still proceed to find the exact place where execution stops,
>>>>>> but i suspect in the while(1), line 545.
>>>>>>
>>>>>> As a curious thing, i find in a different cf CPU code "m54xx.c"
>>>>>> the following:
>>>>>>
>>>>>> void __init config_BSP(char *commandp, int size)
>>>>>> {
>>>>>> #ifdef CONFIG_MMU
>>>>>>       cf_bootmem_alloc();
>>>>>>       mmu_context_init();
>>>>>> #endif
>>>>>> Do also m5441x.c maybe need this calls ?
>>>>>
>>>>> Yes, you will need this. So that code above is only getting run when
>>>>> configured for a 547x CPU family. Attached is a rework of that code
>>>>> so that it will be run for all ColdFire MMU varients. Can you try
>>>>> that out?
>>>>>
>>>>>
>>>>>> Would be very nice to have MMU working. Strangely, i don't see any
>>>>>> board_config with it enabled. Was it ever tested on some Coldfire ?
>>>>>
>>>>> Oh, yeah, I run this on a real M5475 EVB board for every kernel
>>>>> mainline release, with and without MMU enabled. See the
>>>>> arch/m68k/configs/m5475evb_defconfig, it will default to having
>>>>> the MMU enabled.
>>>>>
>>>>> I have todays linux-4.13-rc5 running on it here now:
>>>>>
>>>>> # cat /proc/version
>>>>> Linux version 4.13.0-rc5-00001-gb014090-dirty (gerg@goober) (gcc version 5.4.0 (GCC)) #1 Mon Aug 14 10:14:12 AEST 2017
>>>>>
>>>>> # cat /proc/cpuinfo
>>>>> CPU:            ColdFire
>>>>> MMU:            ColdFire
>>>>> FPU:            ColdFire
>>>>> Clocking:       264.1MHz
>>>>> BogoMips:       264.19
>>>>> Calibration:    1320960 loops
>>>>> #
>>>>>
>>>>> Regards
>>>>> Greg
>>>>
>>>> Ok, i applied your patch, and still the kernel is hanging silently,
>>>> so i started up a new debug session again.
>>>>
>>>> What is actually happening (after your patch has been applied) is:
>>>>
>>>> setup_arch()                arch/m68k/kernel/setup_mm.c
>>>>    paging_init()
>>>> memmap_init()               mm/page_alloc.c
>>>> memmap_init_zone()
>>>>    __init_single_page()
>>>>        set_page_links()       include/linux/mm.h
>>>>           set_page_zone()
>>>>             kernel hangs silently on this line
>>>>             page->flags &= ~(ZONES_MASK << ZONES_PGSHIFT);
>>>>
>>>>>
>>>>
> 
> Can you run your current code with the console debug code I sent
> a little while back?
> 
> I ask because I suspect it should give something based on your debug
> above. I played around a little trying to fake out my configuration
> to make it look like the RAM was non-zero based. I couldn't get a fail,
> but I would like to add some more debug to see what is going on with
> the page pointers from your debug.
> 
> Can you apply the attached patch and get any extra debug?
> 

Sure. Done as you required, removed all my debug parts
and just added yours.

Not sure why, but seems there is now a kind of rollback, as the error
now comes again before reaching your printk line. Also some strange
ctrl char is printed at each line begin, in the debug printf.

This is the output:

U-Boot 2017.09-rc2-00136-gf069d2fd3e (Aug 20 2017 - 00:08:11 +0200)

CPU:   Freescale MCF54410 (Mask:9f Version:2)
        CPU CLK 240 MHz BUS CLK 120 MHz FLB CLK 60 MHz
        INP CLK 30 MHz VCO CLK 480 MHz
SPI:   ready
DRAM:  128 MiB
Using default environment

In:    serial
Out:   serial
Err:   serial
Hit any key to stop autoboot:  0
SF: Detected is25lp128 with page size 256 Bytes, erase size 64 KiB, total 16 MiB
device 0 offset 0x100000, size 0x700000
SF: 7340032 bytes @ 0x100000 Read: OK
## Booting kernel from Legacy Image at 40001000 ...
    Image Name:   mainline kernel
    Created:      2017-08-21  14:18:52 UTC
    Image Type:   M68K Linux Kernel Image (uncompressed)
    Data Size:    1939176 Bytes = 1.8 MiB
    Load Address: 40001000
    Entry Point:  40001000
    Verifying Checksum ... OK
    Loading Kernel Image ... OK
5Linux version 4.12.0stmark2-001-11691-g571d81b2b55f-dirty (angelo@jerusalem) (gcc version 4.9.0 (crosstools-sysam-2016.04.16)) #177 Mon Aug 21 16:18:51 CEST 2017
                                                   1bootmem alloc of 8192 bytes failed!
                                                                                        0Kernel panic - not syncing: Out of memory
                  0---[ end Kernel panic - not syncing: Out of memory


Or better, https://snag.gy/X8y4JM.jpg

I attach my whole current patch.

> 
>>>> I am wondering how mmu works, so at the moment mmu is enabled,
>>>> in head.S, i would expect that code compiled for 0x40001000 would
>>>> not run, since jumps would be translated to some different physical
>>>> addresses, but execution sill works.
>>>> At the same, after enabling mmu i would expect .data vars to be
>>>> invalid, since their address would be translated to a different
>>>> location, while not, the init values of .data variables are still
>>>> valid. In case, i am interested to understand this points.
>>>
>>> On the ColdFire the kernel relies on all RAM and IO peripheral
>>> addresses) to "hit" the ACR registers - and essentially be passed
>>> through as an identity physical = virtual mapping. If you look at
>>> the operation of the memory address translation when virtual mode
>>> is enabled (in the ColdFire MMU sections of the 5475 and 54411
>>> reference manual) you will see that addresses are checked in order
>>> to be for the MMUBAR, RAMBAR, ACR, then MMU.
>>>
>>> For example a kernel address when in supervisor mode will hit
>>> ACR1 or ACR3 the way we set them up in arch/m68k/coldfire/head.S.
>>> And that is why you see kernel code and data still being valid after
>>> the MMU is enabled in virtual mode. No TLB entries required for this.
>>>
>>> Looking at your call sequence above I can see that the physical
>>> RAM start address being non-zero is going to come into play. I'll
>>> dig into this a little more tomorrow see if I can figure out what
>>> is going on.
>>>
>>
>> Thanks for the kind clarifications.
>>
>> I'll look in this things too in next days, learning is always nice.
>> Btw, about load/entry address, i have noticed a possible basic
>> difference betweeen mcf5441x and mcf547x series:
>>
>> The second one (your cpu) is v4e and probably more recent i guess, and
>> one major difference from datasheet seems to be that it is Harvard.
>> So probably, for this reason, you can address ram from 0 there.
> 
> IIRC the 5475 was the first ColdFire with MMU, it is pretty old. Pretty
> sure the 54411 came later. Not sure what the thinking was on the different
> default memory layout though.
> 

Mmm, i was just curiously noticing that 5475 reaches and higher clock speed
as it could be a newer technology. But not important probably.

> Regards
> Greg
> 
> 

Will also look into this later.

Regards,
Angelo

--------------1E3BF147C5BF1BDA42CBB790
Content-Type: text/x-patch;
 name="current_mmu.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="current_mmu.patch"

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index d2219f30b78f..4dc51c090a45 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -283,7 +283,7 @@ config M548x
 
 config M5441x
 	bool "MCF5441x"
-	depends on !MMU
+	select MMU_COLDFIRE if MMU
 	select GENERIC_CLOCKEVENTS
 	select HAVE_CACHE_CB
 	help
diff --git a/arch/m68k/coldfire/m54xx.c b/arch/m68k/coldfire/m54xx.c
index c552851ec617..704efeaeab2d 100644
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
diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
index ea78b8f6a68e..b886f303cc3f 100644
--- a/arch/m68k/configs/stmark2_defconfig
+++ b/arch/m68k/configs/stmark2_defconfig
@@ -21,7 +21,7 @@ CONFIG_EMBEDDED=y
 # CONFIG_LBDAF is not set
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_BLK_CMDLINE_PARSER=y
-# CONFIG_MMU is not set
+CONFIG_COLDFIRE=y
 CONFIG_M5441x=y
 CONFIG_CLOCK_FREQ=240000000
 CONFIG_STMARK2=y
@@ -30,6 +30,8 @@ CONFIG_RAMSIZE=0x8000000
 CONFIG_VECTORBASE=0x40000000
 CONFIG_KERNELBASE=0x40001000
 CONFIG_BINFMT_FLAT=y
+CONFIG_BINFMT_ZFLAT=y
+CONFIG_BINFMT_SHARED_FLAT=y
 CONFIG_BINFMT_MISC=y
 # CONFIG_UEVENT_HELPER is not set
 CONFIG_DEVTMPFS=y
@@ -53,7 +55,6 @@ CONFIG_MTD_COMPLEX_MAPPINGS=y
 CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_PLATRAM=y
 CONFIG_MTD_SPI_NOR=y
-# CONFIG_INPUT_MOUSEDEV is not set
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_SERIO_LIBPS2=y
diff --git a/arch/m68k/include/asm/mmu_context.h b/arch/m68k/include/asm/mmu_context.h
index 4a6ae6dffa34..00c28b1dc47b 100644
--- a/arch/m68k/include/asm/mmu_context.h
+++ b/arch/m68k/include/asm/mmu_context.h
@@ -91,7 +91,6 @@ static inline void activate_mm(struct mm_struct *active_mm,
 
 #define deactivate_mm(tsk, mm) do { } while (0)
 
-extern void mmu_context_init(void);
 #define prepare_arch_switch(next) load_ksp_mmu(next)
 
 static inline void load_ksp_mmu(struct task_struct *task)
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index 87131cd3bc8f..c7efdf8e8eae 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -150,6 +150,23 @@ int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word)
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
 void __init cf_bootmem_alloc(void)
 {
 	unsigned long start_pfn;
@@ -177,23 +194,7 @@ void __init cf_bootmem_alloc(void)
 	memstart += init_bootmem_node(NODE_DATA(0), start_pfn,
 		min_low_pfn, max_low_pfn);
 	free_bootmem_node(NODE_DATA(0), memstart, _ramend - memstart);
-}
-
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
diff --git a/drivers/tty/serial/mcf.c b/drivers/tty/serial/mcf.c
index 02eb32217685..58b854e0713f 100644
--- a/drivers/tty/serial/mcf.c
+++ b/drivers/tty/serial/mcf.c
@@ -568,6 +568,30 @@ static int __init mcf_console_setup(struct console *co, char *options)
 
 /****************************************************************************/
 
+static void putrawch(char c)
+{
+	unsigned int membase = MCFUART_BASE0;
+	int i;
+
+	for (i = 0; (i < 0x10000); i++) {
+		if (readb(membase + MCFUART_USR) & MCFUART_USR_TXREADY)
+			break;
+	}
+	writeb(c, membase + MCFUART_UTB);
+	for (i = 0; (i < 0x10000); i++) {
+		if (readb(membase + MCFUART_USR) & MCFUART_USR_TXREADY)
+			break;
+	}
+}
+
+void printraw(const char *s)
+{
+	for (; *s != 0; s++)
+		putrawch(*s);
+}
+
+/****************************************************************************/
+
 static struct uart_driver mcf_driver;
 
 static struct console mcf_console = {
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index fc47863f629c..880a36d05abe 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1720,6 +1720,8 @@ asmlinkage int vprintk_emit(int facility, int level,
 	 */
 	text_len = vscnprintf(text, sizeof(textbuf), fmt, args);
 
+	{ extern void printraw(const char *); printraw(text); }
+
 	/* mark and strip a trailing newline */
 	if (text_len && text[text_len-1] == '\n') {
 		text_len--;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 6d30e914afb6..4a6bdaa118a4 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1168,6 +1168,7 @@ static void free_one_page(struct zone *zone,
 static void __meminit __init_single_page(struct page *page, unsigned long pfn,
 				unsigned long zone, int nid)
 {
+	printk("%s(%d): page=%p pfn=%ld\n", __FILE__, __LINE__, page, pfn);
 	set_page_links(page, zone, nid, pfn);
 	init_page_count(page);
 	page_mapcount_reset(page);

--------------1E3BF147C5BF1BDA42CBB790--
