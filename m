From: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>
Subject: Re: EtherNat USB working
Date: Fri, 18 Jan 2013 02:24:04 +0100
Message-ID: <20130118012404.GA3195@mail.biophys.uni-duesseldorf.de>
References: <CAL4YKD53-8vz+PzdqDkzc5Wp0iWZ4hsTwiZavW5-nDdZmty6UQ@mail.gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from opal-mail.biophys.uni-duesseldorf.de ([134.99.176.33]:35268
	"EHLO mail.biophys.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751825Ab3ARBdU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 17 Jan 2013 20:33:20 -0500
Content-Disposition: inline
In-Reply-To: <20130118000640.GA2752@mail.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: David =?iso-8859-1?Q?G=E1lvez?= <dgalvez75@gmail.com>
Cc: linux-m68k@vger.kernel.org

David, 

> > addr_reg: 0xd0400360 __pa(addr_reg): 0xd0400360
> > addr_reg: 0xd0400360 __pa(addr_reg): 0xd0400360
> > addr_reg: 0xd0400360 __pa(addr_reg): 0xd0400360
> 
> Bugger - the __pa() does not appear to work as expected. 

Just realized - might this be about the first page not being mapped on m68k?
That's where the 0x3X0 addresses would go (if it wasn't for the ROM port
special case). 
  
> > So if I'm not overlooking anything, __pa(p)<1024 is FALSE and the isa
> > routines aren't taken.
> > What do you think?
> 
> You're absolutely right - is the 0xd0400360 address the same as reported by
> the prinkt() statements frop isp116x_probe() ?? I think there are some that
> report what address the data register is at. 

Checked my boot log and it isn't - it properly reports 0x360/0x340 there. 
 
> You probably also still have that error messafe about a resource being freed
> that wasn't registered - does that match the same address? 

Different story - that's the CPLD, and I've found and corrected that one. 
 
> Geert et al. - what's the correct way to find out what physical address
> corresponds to a ioremapped virtual one? addr_reg is the ioremapped 'IO port
> address' 0x360 that I need to pass to the isa_rom macros in order to get the
> ROM port access right. Seems I've tangled myself up in too many indirections
> here. 

What's the expected behavior if I call __pa() on something that is not
actually mapped? 

Cheers,

  Michael


> 
> David - just mask off the address with 0xFFFUL if the test returns true to
> force the correct address on the accessors - that way we can get on with
> testing at least. 
> 
> Cheers,
> 
>   Michael 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
