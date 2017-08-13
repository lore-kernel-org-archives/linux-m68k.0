From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: [PATCH] m68k: allow ColdFire m5441x parts to run with MMU enabled
Date: Sun, 13 Aug 2017 03:15:07 +0200
Message-ID: <c1ab772a-cd03-2901-7753-8b93df03a783@sysam.it>
References: <bc3dc168-aaae-1271-b73b-4d649db5e301@sysam.it>
 <d1ce1669-0286-ebad-7c6c-e9dfe37c266c@sysam.it>
 <30318b18-e955-1615-975e-9b378d3201b8@westnet.com.au>
 <c095233b-15fc-53f7-c21d-a6c805711040@sysam.it>
 <0e1723eb-0724-7007-5b63-7d80112268a2@westnet.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:59475 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752156AbdHMBPJ (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Sat, 12 Aug 2017 21:15:09 -0400
In-Reply-To: <0e1723eb-0724-7007-5b63-7d80112268a2@westnet.com.au>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi greg,

On 10/08/2017 09:06, Greg Ungerer wrote:
> Hi Angelo,
> 
> On 10/08/17 01:32, Angelo Dureghello wrote:
> [snip]
>> sure, on this board  http://sysam.it/cff_stmark2.html
>> there are 128MB of ddr2.
>>
>> External SDRAM is accessible, at least without any mmc support enabled,
>> from 0x40000000.
>>
>> I have following test config:
>>
>>    GNU nano 2.8.6                                                                              File: arch/m68k/configs/stmark2_defconfig
>>
>> CONFIG_LOCALVERSION="stmark2-001"
> [snip]
>>
>>
>> I tried still yesterday a bit, but seems there is no much support for
>> earlyprintk / low level debug for this architecture.
>>
>> In case i can try with a gpio toggling routine, at least to find
>> where kernel stops.
> 
> The attached patch, is a quick and dirty early console output method.
> It works for me on the m5475, should work for you "as is" on the 5441x too.
> 
> It is kind of an early printk. Of course it still needs the early
> kernel boot to have succeeded before you will get anything much coming out.
> But it is worth trying.
> 
> I am wondering if the non-0 base RAM may be a problem. I have only run
> the MMU enabled code on platforms with 0 based RAM so far. But lets see if
> the early console trace attached gives us anything before digging into that.
>

I have some news, found the exact point where the kernel stops,
it is a " panic("Out of memory");" but you can check
the comments in the diff below to see what exactly happen:

iff --git a/mm/bootmem.c b/mm/bootmem.c
index 9fedb27c6451..2bf51bf1bf28 100644
--- a/mm/bootmem.c
+++ b/mm/bootmem.c
@@ -20,6 +20,8 @@
  
  #include "internal.h"
  
+extern void __square(void);
+
  #ifndef CONFIG_NEED_MULTIPLE_NODES
  struct pglist_data __refdata contig_page_data = {
         .bdata = &bootmem_node_data[0]
@@ -501,6 +503,8 @@ static void * __init alloc_bootmem_bdata(struct bootmem_data *bdata,
         unsigned long fallback = 0;
         unsigned long min, max, start, sidx, midx, step;
  
+       /* we don't even enter here */
+
         bdebug("nid=%td size=%lx [%lu pages] align=%lx goal=%lx limit=%lx\n",
                 bdata - bootmem_node_data, size, PAGE_ALIGN(size) >> PAGE_SHIFT,
                 align, goal, limit);
@@ -539,6 +543,7 @@ static void * __init alloc_bootmem_bdata(struct bootmem_data *bdata,
                  * catch the fallback below.
                  */
                 fallback = sidx + 1;
+
                 sidx = align_idx(bdata, bdata->hint_idx, step);
         }
  
@@ -609,12 +614,18 @@ static void * __init alloc_bootmem_core(unsigned long size,
         bootmem_data_t *bdata;
         void *region;
  
+       /* we pass from here */
         if (WARN_ON_ONCE(slab_is_available()))
                 return kzalloc(size, GFP_NOWAIT);
  
+       /* we pass from here */
         list_for_each_entry(bdata, &bdata_list, list) {
+
+               /* we never enter here */
+
                 if (goal && bdata->node_low_pfn <= PFN_DOWN(goal))
                         continue;
+
                 if (limit && bdata->node_min_pfn >= PFN_DOWN(limit))
                         break;
  
@@ -623,6 +634,8 @@ static void * __init alloc_bootmem_core(unsigned long size,
                         return region;
         }
  
+       /* we pass from here */
+
         return NULL;
  }
  
@@ -637,11 +650,18 @@ static void * __init ___alloc_bootmem_nopanic(unsigned long size,
         ptr = alloc_bootmem_core(size, align, goal, limit);
         if (ptr)
                 return ptr;
+
+       /* alloc_bootmem_core returns null, ptr = 0 */
+
         if (goal) {
                 goal = 0;
                 goto restart;
+
+               /* we pass from here yes */
         }
  
+       /* we pass from here yes */
+
         return NULL;
  }
  
@@ -677,7 +697,10 @@ static void * __init ___alloc_bootmem(unsigned long size, unsigned long align,
          * Whoops, we cannot satisfy the allocation request.
          */
         pr_alert("bootmem alloc of %lu bytes failed!\n", size);
+
+       /* we finally stop here */
         panic("Out of memory");
+
         return NULL;
  }


So trying now to understand why that

list_for_each_entry(bdata, &bdata_list, list)

looks as an emtty list.

Regards,
Angelo



> Regards
> Greg
> 
