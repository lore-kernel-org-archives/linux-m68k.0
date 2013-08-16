From: =?iso-8859-1?Q?Ingo_J=FCrgensmann?= <ij@2013.bluespice.org>
Subject: Re: Multiple Memory Chunks
Date: Fri, 16 Aug 2013 07:59:04 +0200
Message-ID: <4E605291-9891-4120-AA3E-728A63C052D8@2013.bluespice.org>
References: <2ff3a4b6bf1251e63cd24d4bda680c5b@localhost> <CAMuHMdVEdz9cmenqYNeemSK+O0aZj0RG7oKdxwygfBE6WWONsg@mail.gmail.com> <6EF44417-6A7D-467E-8489-3E9928E22B12@2013.bluespice.org> <CAMuHMdUNS5UXbzV5g_YFESJmu43EqiZsE6c1_F3YSLpxN39+Wg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vserv.windfluechter.net ([31.172.31.194]:38636 "EHLO
	vserv.windfluechter.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753084Ab3HPF7R convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Aug 2013 01:59:17 -0400
In-Reply-To: <CAMuHMdUNS5UXbzV5g_YFESJmu43EqiZsE6c1_F3YSLpxN39+Wg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Am 13.08.2013 um 11:14 schrieb Geert Uytterhoeven <geert@linux-m68k.org>:

>> Yes, and I would like to avoid this, of course. ;-) It really slows down the machine and you can even feel it... ;)
> We may also use the slow mainboard RAM (I get ca. 12 MiB/s) as a fast swap
> device.

I would like to avoid using those kind of RAM as swap. Reasons: 
- it would add an additional layer of paging in/out. Even if it is comparable fast, pages of data and code would need to swapped in and out.
- to make sense it would need an higher swap priority to get used first, but then again it will most likey result in being filled with something that accidently gets swapped out first, whereas stuff that gets frequently used and swapped in/out will still be swapped to disk. 
- to avoid this we would need some kind of write through cache like it's often used for SSD hybrid disks where stuff that is often needed will reside within SSD side of that hybrid disks while other stuff will be stored on the slower spinning disk. 

>> Except that the ZorroIII RAM will be 4-6x slower than the RAM on the accelerator cards.
> So this is also a candidate for swap? Does anyone have benchmark results?
> I found that ZoRAM does 12 MiB/s.

12 MB/s is about the maximum of the ZIII bus, so that's ok. As already said above, I'm no big fan of the swap idea, but would favor the usage as "real" memory. ;)

> BTW, http://www.bigbookofamigahardware.com/bboah/product.aspx?id=1936 claims
> it's only guaranteed to work with the original daughter board, and thus may fail
> with '060 accelerators.

The accelerator cards reside in the CPU slot. The daughter board is the riser card where the Zorro slots are. So, this claim only counts for third party tower cases were the Desktop mainboards riser card (vertical to mainboard) gets replaced by a custom made new riser card (parallel to mainboard): 

Original riser card

   --| <- riser card w/ attached cards
   --|  
   --|
   --|
     |
--------------------
mainboard


Tower mod: 

riser card w/ attached cards
 |   mainboard
 \/  \/

      | 
      |
      | 
--|   | 
--|   | 
--|---|
--|   | 
--|   | 
--|   | 
      | 
      | 
      | 

 

>>> Now why do you have a memfile like this: a long time ago, the m68k kernel
>>> used its own mapping code for system RAM, where virtual and physical
>> 
>> Remember that there were problems with loading 3.2.0-4-amiga without the memfile.
> Yes, going out of memory when allocating the page table arrays? That won't
> improve when adding 256 MiB of Z3 RAM in the far end of the physical
> address space...

No, but we would have more memory to waste for this. Excluding 8 MB for this from 128 MB does hurt more than 8 MB out of 384 MB. ;)

But this problem was solved by using initrds now. 

> The NUMA code should also take into account priorities, at least for CPU
> affinity (although we have only one CPU).

Actually any Amiga with a accel card has two CPUs. Unfortunately the second CPU on the mainboard will get electrically deactivated when there is an accel card. Otherwise we could use the 68030/25 for I/O or other things. I don't know if the Copper can be used for anything as it only knows 3 commands. But I guess the effort to make it usuable would be too big for the benefit. ;)

But when the NUMA code could use the priorities for the memory and we could then use any memory that is in the machine as real main memory we would greatly benefit from that. Remember that we could maybe even plug two BigRamPlus cards into one host, resulting in 2x 256 MB Z3RAM + 128 MB AccelRAM + 16 MB mainboard + 2 MB chip instead of 128 MB AccelRAM maximum now. (the other 2 Zorro slots would be occupied by NIC and graphic card in a standard A3000). 

>> So, to test this, I could edit that file, make the change and recompile the kernel and see whether amiboot loads the kernel to 0x08000000 and the kernel still uses the 12 MB memory on the mainboard?
> Unfortunately it's not that simple. I haven't checked the details, but
> I think we'll
> have to change other parts in arch/m68k/mm, too. Definitely the check to
> ignore blocks with lower addresses has to go ;-)


If you think we could made this work as desired, I would order a BigRamPlus and put it into Spice so we could test it. :)

-- 
Ciao...            //      Fon: 0381-2744150
      Ingo       \X/       http://blog.windfluechter.net


gpg pubkey:  http://www.juergensmann.de/ij_public_key.asc
