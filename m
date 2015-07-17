From: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>
Subject: Re: [RFC 0/8] m5441x: mmu support patchset
Date: Fri, 17 Jul 2015 12:30:09 +0200
Message-ID: <55A8D931.6010101@open.eurogiciel.org>
References: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com> <559D2EA7.7060909@westnet.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:36470 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757761AbbGQKaN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 17 Jul 2015 06:30:13 -0400
Received: by wgxm20 with SMTP id m20so78783909wgx.3
        for <linux-m68k@vger.kernel.org>; Fri, 17 Jul 2015 03:30:12 -0700 (PDT)
In-Reply-To: <559D2EA7.7060909@westnet.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>, linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: yannick.gicquel@open.eurogiciel.org

Hi Greg, Geert,

Sorry for late response and thanks for your reviews and comments,

These patchs can gives an overview of the work that *seem* required for=
 MMU
support on 5441x, but clearly there still some unknown behaviour under=20
study.
It looks like the address translation is not always took into account b=
y=20
HW, but this
needs a deeper investigation which is on going.

This is good to know the 5475 MMU support is Ok on latest kernel versio=
n.
I have checked deeper in datasheets to study differences. MMU are quite=
=20
similar,
but few differences are present.

At register level, there are additional bits on M5441x serie :

MMUCR[UVE] : User virtual mode enable.
     0: Virtual mode activation based on MMUCR[EN], (default)
     1: based on MMUCR[EN] && CPU *not* in Supervisor mode.

MMUCR[SAL] : Select ASID location
     0: defined by ASID register, (default)
     1: defined by MMUAR[9:2]

 From my understanding of current CFV4e MMU support, I think the MMUCR[=
SAL]
needs to be set. ASID register is set in head.S but *not* used in=20
cf_tlb_miss() missed.

Regarding MMUCR[UVE], I think the default configuration is coherent wit=
h=20
address
translation requirement while running in kernel mode.


Another difference between M5441x & 5475 is Peripheral memory mapping=20
which is
relative to MBAR ( =3D=3D 0xff000000 in defconfig ) register on 5475, a=
nd=20
fixed on M5441x.
Also, physical RAM is accessible from 0x40000000 on m5441x, and starts=20
at 0x0 on 5475.

Don't think it should have an impact on the virtual address translation=
=20
mechanism, but
if for some reason this is faulty or disable at some point, there may b=
e=20
an "overlap"
between virtual and physical address space on 5441x which is not presen=
t=20
on 5475.
Just an assumption...


Other comments in threads as well.

Best Regards,
Yannick


Le 08/07/2015 16:07, Greg Ungerer a =E9crit :
> Hi Yannick,
>
> On 08/07/15 19:51, Yannick GICQUEL wrote:
>> Here is a patchset proposal for MMU support on Coldfire 5441x serie.
>
> Nice.
>
>
>> This patchset allows building the mcfmmu on chip without FPU, enable=
 the
>> elf binary support and report some code from m54xx to m5441x sources
>> files.
>>
>> Also, it contains a proposal for uImage generation.
>>
>>
>> Functional status is OK on kernel v3.14.
>> But on v4.2-rc1, we observe a map_err exit fail in do_page_fault().
>> After bisecting, we point out the regression appears after the
>> vm_ops->map_pages() feature integration (introduced in 8c6e50b and=20
>> later)
>
> I haven't looked in detail into this yet. But I can confirm
> that it still works fine on a 5475 with MMU enabled.

>
> Some other comments as replies to specific patches.
>
> Regards
> Greg
>
>
>> Your feedbacks are welcome on this.
>>
>> Best Regards,
>> Yannick
>>
>>
>> Yannick GICQUEL (8):
>>    m68k: coldfire: unlink FPU presence from MMU activation
>>    m68k: fix build issue in setup_arch() when no FPU
>>    m68k: add dummy dump_fpu() when FPU is not present
>>    m68k: m5441x: add ColdFire 5441x CPU MMU memory init code
>>    m68k: m5441x: fix ACR0 base address when MBAR is not present
>>    m68k: m5441x: set rambar to end of SRAM physical addr space
>>    m68k: mmu: add u-boot command line support in setup_arch()
>>    m68k: uImage generation support
>>
>>   arch/m68k/Kconfig                |  2 +-
>>   arch/m68k/Kconfig.cpu            |  4 +-
>>   arch/m68k/Makefile               |  8 +++-
>>   arch/m68k/boot/Makefile          | 45 ++++++++++++++++++++++
>>   arch/m68k/coldfire/head.S        |  9 +++++
>>   arch/m68k/coldfire/m5441x.c      | 47 +++++++++++++++++++++++
>>   arch/m68k/include/asm/m54xxacr.h | 13 ++++++-
>>   arch/m68k/kernel/process.c       |  6 ++-
>>   arch/m68k/kernel/setup_mm.c      | 82=20
>> +++++++++++++++++++++++++++++++++++++++-
>>   9 files changed, 209 insertions(+), 7 deletions(-)
>>   create mode 100644 arch/m68k/boot/Makefile
>>
>
