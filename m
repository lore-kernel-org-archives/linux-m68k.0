From: =?ISO-8859-1?Q?David_G=E1lvez?= <dgalvez75@gmail.com>
Subject: Re: EtherNat USB working
Date: Fri, 18 Jan 2013 08:53:48 +0100
Message-ID: <CAL4YKD587X6UzQ7R__Yn5vZFLyEXe7e4BNDLsLG1LC7CMGMf_g@mail.gmail.com>
References: <50F2052E.3070808@biophys.uni-duesseldorf.de>
	<CAL4YKD53-8vz+PzdqDkzc5Wp0iWZ4hsTwiZavW5-nDdZmty6UQ@mail.gmail.com>
	<50F5E44A.1000709@biophys.uni-duesseldorf.de>
	<CAL4YKD60xG=G=ACKuTk1vb7kAjgjuAUpC_z6-aSrMn2tX8FwWg@mail.gmail.com>
	<20130116203536.GA16584@mail.biophys.uni-duesseldorf.de>
	<CAL4YKD6pJ8RE80j-uHxGP7YUhjuP09a24baF8OsG0iv6Ke8bVw@mail.gmail.com>
	<20130117002810.GA20320@mail.biophys.uni-duesseldorf.de>
	<CAL4YKD4i38yJK8ponxTcOHMrabxytRDdFLbQU57x-3z2L1cUBw@mail.gmail.com>
	<20130117193855.GA31693@mail.biophys.uni-duesseldorf.de>
	<CAL4YKD6TQf6o0fzhVL5kgs76KyW6gzLZHCCSmoxDmMb3xN7WPg@mail.gmail.com>
	<20130118000640.GA2752@mail.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20130118000640.GA2752@mail.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>
Cc: linux-m68k@lists.linux-m68k.org

2013/1/18 Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>:
> Hi David,
>
>> Hi Michael, may be I've found something
>
> It appears you have!
>
>> > Must be something rather obvious but I can't figure it out. Maybe it's time
>> > to stop fudging with the isa_rom_* macros and bang the ROM port directly
>> > until we know how to read the chip ID.
>> >
>>
>>
>> See the code below from isp116x.h, I've added some traces in function
>> isp116x_write_addr():
>>
>> static inline void isp116x_write_addr(struct isp116x *isp116x, unsigned reg)
>> {
>>       IRQ_TEST();
>>       isp_writew(reg & 0xff, isp116x->addr_reg);
>>       if (((int)isp116x->addr_reg & 0x00000FFFUL) == 0x360)
>>               printk("addr_reg: 0x%08lx __pa(addr_reg):
>> 0x%08lx\n",isp116x->addr_reg, __pa(isp116x->addr_reg));
>> //    isp116x_delay(isp116x, 300);
>> }
>>
>> This is what I'm getting for those two values:
>>
>> addr_reg: 0xd0400360 __pa(addr_reg): 0xd0400360
>> addr_reg: 0xd0400360 __pa(addr_reg): 0xd0400360
>> addr_reg: 0xd0400360 __pa(addr_reg): 0xd0400360
>
> Bugger - the __pa() does not appear to work as expected.
>
>> So if I'm not overlooking anything, __pa(p)<1024 is FALSE and the isa
>> routines aren't taken.
>> What do you think?
>
> You're absolutely right - is the 0xd0400360 address the same as reported by
> the prinkt() statements frop isp116x_probe() ?? I think there are some that
> report what address the data register is at.
>

ISP116X probe: data 340 virt. d0480340, addr 360 virt. d0400360

> You probably also still have that error messafe about a resource being freed
> that wasn't registered - does that match the same address?
>

this one?

Trying to free nonexistent resource <00000000002a8e52-00000000002a8e53>


> Geert et al. - what's the correct way to find out what physical address
> corresponds to a ioremapped virtual one? addr_reg is the ioremapped 'IO port
> address' 0x360 that I need to pass to the isa_rom macros in order to get the
> ROM port access right. Seems I've tangled myself up in too many indirections
> here.
>
> David - just mask off the address with 0xFFFUL if the test returns true to
> force the correct address on the accessors - that way we can get on with
> testing at least.
>

Sure, I'll do it later today.
