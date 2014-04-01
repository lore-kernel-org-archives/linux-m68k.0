From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Tue, 1 Apr 2014 23:23:00 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1404012153360.16187@nippy.intranet>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org> <8761mvl3jb.fsf@igel.home> <CAOmrzkLWKq_qxmL5wKsGQGvAwNEQCP1QHhkd70vxViAyBoP98g@mail.gmail.com> <87a9c63x1c.fsf@igel.home> <CAOmrzkLbnUYjaEYa3MAccs03J46OWWKtndA3zyE8Kc+Ckr2eEg@mail.gmail.com>
 <87txae2dt4.fsf@igel.home> <20140331235216.GA2109@mail.biophys.uni-duesseldorf.de> <CAMuHMdUeMv1R69vSLv0HZpKEgVpRUG_iMs=61JWVubBsSN7VVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:42265 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751721AbaDAMX2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 1 Apr 2014 08:23:28 -0400
In-Reply-To: <CAMuHMdUeMv1R69vSLv0HZpKEgVpRUG_iMs=61JWVubBsSN7VVA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>, Andreas Schwab <schwab@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, debian m68k <debian-68k@lists.debian.org>


On Tue, 1 Apr 2014, Geert Uytterhoeven wrote:

> On Tue, Apr 1, 2014 at 1:52 AM, Michael Schmitz wrote:
> > > > do we know the size of the first memory chunk early enough in 
> > > > head.S? Maybe it's time to increase INIT_MAPPED_SIZE at least in 
> > > > cases where we know that there's more than 4 MB in the first 
> > > > memchunk ...
> > >
> > > How do you know?  You would have to reimplement the check 
> > > paging_init does.
> >
> > I see - as a heuristic, we can probably assume that the first memchunk 
> > is the relevant one, and especially in the case of FastRAM, also the 
> > larger one. Does this hold for Amiga/Mac/VME as well?
> 
> People want to run the kernel in the fastest memory chunk, which is 
> typically also the largest (slow Amiga mainboard memory may be 2 - 16 
> MiB for Linux-capable machines, accelerator memory may be larger).
> 
> Don't know about Mac,

It may be possible to boot Linux with MacOS running in 24-bit mode, and 
ISTR that this leads to a large number of memory chunks. The Penguin 
documentation says use 32-bit mode (which means installing Mode32 if you 
have old MacOS and old ROMs). The only Mac I have here is running MacOS 
7.6 so I can't test 24-bit mode. You can see the debug output from Penguin 
below.

> but I have some memories of interleaved banks and such...

There are some Mac models with memory controllers that do interleaving. I 
don't know whether interleaving is relevant here. I'd have to consult the 
Penguin source code to know whether it behaves differently on different 
models.

Perhaps you're thinking of this --

    "68020: Don't force kernel into bank A: [optional] This is a special 
    option for the 68020 and MacII owners only. It has to do with the 
    physical arrangement of the memory banks in the MacII ... NOTE: This 
    option has been removed from Penguin 18."

from http://www.mac.linux-m68k.org/docs/penguin.php

-- 


Logging started Friday, 1 January 1904 12:19:07 AM
Penguin App version 19

Logical To Physical Mapping table (V2)
Logical -> physical : length
0x00000000 -> 0x00000000 : 0x00C00000

System: 7.6.1
Gestalt ID: 33 (PowerBook 180)
CPU: 68030
FPU: 68882
Physical RAM: 12 MB
Command line is 'consoleblank=0 console=tty console=ttyS0 earlyprintk'
GUnzipping Macintosh HD:Desktop Folder:vmlinux.gz
.Kernel format: ELF

The kernel will be located at physical 0x00001000
Kernel at logical address 0x5d4008
GUnzipping Macintosh HD:Desktop Folder:vmlinux.gz
..............................................Read 2794880 bytes for segment 0, requested 2794880
.Read 101752 bytes for segment 1, requested 101752

Bootstrap's bootinfo version: 2.0
Kernel's bootinfo version	: 2.0
Kernel entry physical is 0x2000
RAM disk at 0x008b7008, ends at 0x00929008, size is 456 K
Kernel segment 0 at 0x5d4008, size 2917724
Kernel segment 1 at 0x89d008, size 102400
Kernel size is 0x2e2000

boot_info is at 0x8b6008
boot_info size is dynamic

ramdisk logical target 0xb8e000
ramdisk physical at 0xb8e000
ramdisk physical top at 0xc00000

Bootstrap logical 1: 0x00000000
Bootstrap physical : 0x00000000

Dump of bootinfo, version 2.0:
BI_MACHTYPE           = 0x3
BI_CPUTYPE            = 0x2
BI_FPUTYPE            = 0x2
BI_MMUTYPE            = 0x2
BI_MEMCHUNK[0].addr   = 0x00000000
BI_MEMCHUNK[0].size   = 0x00c00000
BI_RAMDISK.addr       = 0x00b8e000
BI_RAMDISK.size       = 0x00072000
BI_COMMAND_LINE       = consoleblank=0 console=tty console=ttyS0 earlyprintk
BI_MAC_MODEL          = 0x21
BI_MAC_VADDR          = 0x60040000
BI_MAC_VDEPTH         = 0x4
BI_MAC_VROW           = 0x140
BI_MAC_VDIM           = 0x01900280
BI_MAC_VLOGICAL       = 0x60040000
BI_MAC_SCCBASE        = 0x50f04000
BI_MAC_BTIME          = 0x83da53fb
BI_MAC_GMTBIAS        = 0x0
BI_MAC_MEMSIZE        = 0xc
BI_MAC_CPUID          = 0x1
BI_MAC_ROMBASE        = 0x40800000

Booting Linux (fasten seat belts, please)...
Waking up serial ports, no rest for the wicked...
Modem port awake and configured!
slot_int_set: slot 0x00, drvr_refnum -49, spID 0xBC, spExtDev 0x00, ON 0

Logging ended Friday, 1 January 1904 12:19:50 AM
