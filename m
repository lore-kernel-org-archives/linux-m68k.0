From: =?iso-8859-1?Q?Ingo_J=FCrgensmann?= <ij@2013.bluespice.org>
Subject: Re: Multiple Memory Chunks
Date: Sat, 10 Aug 2013 23:00:58 +0200
Message-ID: <6EF44417-6A7D-467E-8489-3E9928E22B12@2013.bluespice.org>
References: <2ff3a4b6bf1251e63cd24d4bda680c5b@localhost> <CAMuHMdVEdz9cmenqYNeemSK+O0aZj0RG7oKdxwygfBE6WWONsg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vserv.windfluechter.net ([31.172.31.194]:48682 "EHLO
	vserv.windfluechter.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758795Ab3HJVBK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 10 Aug 2013 17:01:10 -0400
In-Reply-To: <CAMuHMdVEdz9cmenqYNeemSK+O0aZj0RG7oKdxwygfBE6WWONsg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>

Am 10.08.2013 um 13:46 schrieb Geert Uytterhoeven <geert@linux-m68k.org>:

>> Memfile:
>> 2097152
>> 0x08000000 67108864
>> 0x07400000 12582912
> As 0x07400000 < 0x08000000, the kernel ignores the second chunk.

True, but as you state yourself below, everyone would usually want to get the kernel loaded at 0x08000000, because it's way faster. 

>> So, apparently the second FastMem chunk is ignored by the kernel itself. Is
>> there a way to make use of the additional 12 MB RAM? Although it's not as
>> fast as the 32bit memory on the accelerator card (64MB), it is still faster
>> than swapping to/from disk.
> If you reverse the order of the chunks, it will use both. Unfortunately the
> kernel will be in the slowest chunk.

Yes, and I would like to avoid this, of course. ;-) It really slows down the machine and you can even feel it... ;)

>> Especially this becomes important when we want to put BigRamPlus RAM
>> extensions into Amigas. Those are 256MB RAM extensions via ZorroIII bus and
>> the port would highly benefit from supporting multiple memory chunks. Is
>> this possible?
> I'd expect a Zorro III RAM expansion to end up at either 0xff000000 or
> 0x40000000, which is a higher address than your other RAM, so it
> should be OK.

Except that the ZorroIII RAM will be 4-6x slower than the RAM on the accelerator cards. 

> Now why do you have a memfile like this: a long time ago, the m68k kernel
> used its own mapping code for system RAM, where virtual and physical

Remember that there were problems with loading 3.2.0-4-amiga without the memfile. 

> addresses differed. This was needed as unlike on PC, (a) memory doesn't
> always start at address zero, and (b) memory isn't always contiguous.
> Hence we used the MMU to map all memory chunks next to each other,
> starting at virtual address zero.
> 
> With the unification of memory mapping across the different architectures,
> ouw own mapping code (and this feature) was lost.
> Due to lack of manpower, we (IIRC Roman Zippel) switched to the
> simplest memory model, where virtual == physical, but where memory
> doesn't have to start at zero.
> 
> However, it should be possible to revive the virtual mapping using
> generic code, as some of the big NUMA systems also needed it.

Yeah, that would be great... 

But we would still have the problem with the loading the kernel to the proper memory chunk, i.e. the fastest. 
AmigaOS has the concept of priorities for memory chunks. The memory on Cyberstorm MK2 accel cards have a priority of 40 whereas normal FastRAM on the mainboard has a priority of 10 (IIRC). The Amiga memory manager automatically selects the priority based on actually memory speeds on each boot, as stated at http://amigadev.elowar.com/read/ADCD_2.1/Hardware_Manual_guide/node00D2.html and http://amigadev.elowar.com/read/ADCD_2.1/Hardware_Manual_guide/node00D4.html outlines that the fastest memory will be located between the mainboard memory and the ZorroIII memory, as you said above. 
So the trick is get the kernel loaded in the fastest memory chunk and then reorder the other chunks accordingly. I think it's easier to have the kernel do the right thing[TM] than to rely on a fixed version of amiboot. That way we could use the memfile to determine where the kernel will get loaded (fastest chunk) by amiboot. 

> See mm/Kconfig, which offers DISCONTIGMEM (what we use),
> SPARSEMEM (what you need), and FLATMEM.
> 
> Note that SPARSEMEM may give better performance with
> BigRamPlus, as there's probably a huge gap between its physical
> address and the addresses of your other memory chunks.


So, to test this, I could edit that file, make the change and recompile the kernel and see whether amiboot loads the kernel to 0x08000000 and the kernel still uses the 12 MB memory on the mainboard?

-- 
Ciao...            //      Fon: 0381-2744150
      Ingo       \X/       http://blog.windfluechter.net


gpg pubkey:  http://www.juergensmann.de/ij_public_key.asc
