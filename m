From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [uClinux-dev] Re: [PATCH] m68knommu: get rid of __do_IRQ and
 add support for using gpio irqs.
Date: Tue, 16 Mar 2010 11:26:41 +1000
Message-ID: <4B9EDE51.8070100@snapgear.com>
References: <200912161915.39692.sfking@fdwdc.com> <4B4A9FAB.5020109@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4B4A9FAB.5020109@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uClinux development list <uclinux-dev@uclinux.org>
Cc: Steven King <sfking@fdwdc.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>


Hi Steven,

Greg Ungerer wrote:
> Steven King wrote:
>> Since we now have generic irq support for m68knommu and as __do_IRQ is
>> supposed to go away real soon now, I added config 
>> GENERIC_HARDIRQS_NO__DO_IRQ
>> to m68knommu/Kconfig.  Unfortunately, that produced an unbootable 
>> kernel --
>> looking at the code for generic_handle_irq in linux/irq.h, the NO__DO_IRQ
>> version unconditionally calls desc->handle_irq, which suggests that an 
>> irq's
>> handle_irq isnt getting initialized in the early boot and indeed, 
>> adding an
>> initialization of handle_irq in init_IRQ produced a working system.
>>
>> I'm not entirely satisfied with that solution as it ignores why we are 
>> getting
>> an irq when no handler has been setup for it, but in any case, using
>> set_irq_chip_and_handler in init_IRQ to initialize all the handlers is 
>> the
>> right thing to do (or atleast, its what all the other arches do) (and 
>> I didnt
>> feel like digging out the BDM pod to figure out where the mystery irq is
>> coming from).
>>
>> Then the real reason I was digging into the irq code is to add support 
>> for
>> using gpio irqs on the gpios of the parts that support that.  The 
>> following
>> patch is against
>> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next
>>
>> only the intc-2 gpio irqs have been tested on real hardware.
>>
>> ------------------------------
>>
>> Get rid of __do_IRQ; use set_irq_chip_and_handler to initialize irqs.  
>> Add
>> support for using gpio irqs and setting the edge on external irqs 
>> generally.
>>
>> Signed-off-by: Steven King <sfking@fdwdc.com>
> 
> Applied to the for-linus and for-next branches of the m68knommu git
> tree.

I have dropped this from the for-linus branch of the m68knommu git
tree for now. It causes user space to hang on boot on at least one
of my ColdFire test platforms. I have not had a chance to debug it,
but it is hanging on entering user space. The console output ends
with:

   FEC Ethernet Driver
   TCP cubic registered
   NET: Registered protocol family 17
   VFS: Mounted root (romfs filesystem) readonly on device 31:0.
   Freeing unused kernel memory: 44k freed (0x4015a000 - 0x40164000)

Removing this patch and it boots all the way through to user
space as usual.

Regards
Greg



>> -- 
>>
>>  arch/m68k/include/asm/m520xsim.h             |    3 +
>>  arch/m68k/include/asm/m523xsim.h             |    3 +
>>  arch/m68k/include/asm/m5249sim.h             |    4 +-
>>  arch/m68k/include/asm/m527xsim.h             |    3 +
>>  arch/m68knommu/Kconfig                       |    4 ++
>>  arch/m68knommu/platform/5272/intc.c          |   39 +++++++++++---
>>  arch/m68knommu/platform/68328/ints.c         |    8 +--
>>  arch/m68knommu/platform/68360/ints.c         |    8 +--
>>  arch/m68knommu/platform/coldfire/intc-2.c    |   76 
>> ++++++++++++++++++++++++--
>>  arch/m68knommu/platform/coldfire/intc-simr.c |   68 
>> ++++++++++++++++++++++--
>>  arch/m68knommu/platform/coldfire/intc.c      |   59 
>> +++++++++++++++++++--
>>  11 files changed, 239 insertions(+), 36 deletions(-)
>>
> 


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
