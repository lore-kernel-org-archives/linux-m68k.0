From: Matthew Lear <matt@bubblegen.co.uk>
Subject: tlb misses on m68k w/MMU & system performance impact
Date: Fri, 01 May 2009 15:42:03 +0100
Message-ID: <49FB0A3B.2060005@bubblegen.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from relay.pcl-ipout01.plus.net ([212.159.7.99]:39950 "EHLO
	relay.pcl-ipout01.plus.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1764983AbZEAOwZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 1 May 2009 10:52:25 -0400
Received: from [80.229.236.194] (helo=[192.136.1.12])
	 by pih-relay05.plus.net with esmtp (Exim) id 1LztwB-0004yZ-Q8
	for linux-m68k@vger.kernel.org; Fri, 01 May 2009 15:42:04 +0100
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hello,

I'm running a Freescale 2.6.23 linux kernel on an m68k mcf54455 based platform.
The kernel timer tick is 10msec and the MMU on the device is being utilised.
When the system should be idle (ie kernel booted, 'bare bones' user space
entered and sitting at login prompt), it seems to be constantly servicing
hardware interrupts. I am looking into some rx throughput problems regarding the
fec driver, but I thought it prudent to deal with this issue first since it may
well be impacting all sorts of things.

top indicates:

top - 00:08:13 up 8 min,  1 user,  load average: 0.00, 0.02, 0.00
Tasks: 24 total, 1 running, 23 sleeping, 0 stopped, 0 zombie
Cpu(s): 0.8%us, 0.0%sy, 0.0%ni, 0.0%id, 0.0%wa, 99.2%hi, 0.0%si, 0.0%st
Mem: 255320k total, 7736k used, 247584k free, 0k buffers
Swap: 0k total, 0k used, 0k free, 4280k cached

vmstat indicates:

procs -----------memory---------- ---swap-- -----io---- -system-- ----cpu----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa
 2  0      0 247304      0   4280    0    0     0     0  153  210  1 99  0  0

/proc/interrupts does not indicate that any irq lines are shared.

using readprofile, I obtained the following over a 30 sec period after issuing
readprofile -r:

~ # readprofile
  3353 default_idle                             128.9615
     1 __do_fault                                 0.0010
     1 handle_mm_fault                            0.0007
     2 check_poison_obj                           0.0034
     1 kmem_cache_free                            0.0034
    18 __ashrdi3                                  0.2250
     1 __lshrdi3                                  0.0139
     5 memmove                                    0.0194
  3382 total                                      0.0015
~ #

Adding debug prints into arch/m68k/coldfire/traps.c indicates that there is a
very high number of TLB misses happening. For example:

[   33.790000] *** Bus Error *** (e)TLB R miss
[   33.790000] pc 0x8012d850, mmusr 0x0, complainingAddress 0x801d439c
[   33.790000] *** Bus Error *** (e)TLB R miss
[   33.790000] pc 0xc0154bd8, mmusr 0x0, complainingAddress 0x801bbae3
[   33.790000] *** Bus Error *** (e)TLB R miss
[   33.790000] pc 0x800ee64c, mmusr 0x0, complainingAddress 0x801cd7c8
[   33.790000] *** Bus Error *** (e)TLB R miss
[   33.790000] pc 0x800ee650, mmusr 0x0, complainingAddress 0x801cf788
[   33.790000] *** Bus Error *** (e)TLB R miss
[   33.790000] pc 0x8012ec16, mmusr 0x0, complainingAddress 0x801d07a4
[   33.790000] *** Bus Error *** (e)TLB R miss
[   33.790000] pc 0x8012ec20, mmusr 0x0, complainingAddress 0x801cbcf4
[   33.790000] *** Bus Error *** (5)TLB X miss (opword)
[   33.790000] pc 0x80131302, mmusr 0x0, complainingAddress 0x801cbcf4
[   33.790000] *** Bus Error *** (5)TLB X miss (opword)
[   33.790000] pc 0x80133fc4, mmusr 0x0, complainingAddress 0x801cbcf4
[   33.790000] *** Bus Error *** (5)TLB X miss (opword)
[   33.790000] pc 0x801746a8, mmusr 0x0, complainingAddress 0x801cbcf4
[   33.790000] *** Bus Error *** (5)TLB X miss (opword)
[   33.790000] pc 0x8014377a, mmusr 0x0, complainingAddress 0x801cbcf4
[   33.790000] *** Bus Error *** (5)TLB X miss (opword)
[   33.790000] pc 0x8013530c, mmusr 0x0, complainingAddress 0x801cbcf4
[   33.790000] *** Bus Error *** (a)TLB W miss
[   33.790000] pc 0x801437f2, mmusr 0x0, complainingAddress 0x8008059c
[   33.790000] *** Bus Error *** (5)TLB X miss (opword)
[   33.790000] pc 0x80148014, mmusr 0x0, complainingAddress 0x8008059c
[   33.790000] *** Bus Error *** (e)TLB R miss
[   33.790000] pc 0x80148024, mmusr 0x0, complainingAddress 0x801bc6c2


I realise that this is a soft-translated arch and that a TLB miss generates an
exception. However, the amount of bus errors strikes me as odd and I suspect
they are indicative of a mis-configuration somewhere which is having a serious
impact on overall system performance.

Is anybody able to advise or provide some explanation as to what the reason(s)
could for such behaviour?

Much appreciated.
--  Matt
