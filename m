From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [RFC PATCH 1/2] arch/m68k/lib/mulsi3.S: Optimize]
Date: Fri, 13 May 2016 11:07:52 +1000
Message-ID: <573528E8.8070301@westnet.com.au>
References: <20160512205217.19233.qmail@ns.horizon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160512205217.19233.qmail@ns.horizon.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: George Spelvin <linux@horizon.com>, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org

On 13/05/16 06:52, George Spelvin wrote:
> Thank you very much!
> 
> Greg Ungerer wrote:
>> This syntax fails for me (using a binutils-2.25.1 based toolchain).
>> Registers must be prefixed with a "%", so here %sp and %a0.
>>
>>   arch/m68k/lib/mulsi3.S: Assembler messages:
>>   arch/m68k/lib/mulsi3.S:12: Error: syntax error -- statement `lea 4(sp),a0' ignored
>>
>> That was compiling with just this one patch for a ColdFire target.
> 
> Well, *that* is an embarrassing oversight.  If you fix that obvious typo
> (I used ":%s/[ad][01]/%&/g"), do you have a way of testing it?
> 
> Setting up a suitable Qemu environment is many times the effort needed
> to write the code, so I was hoping someone with the facilities already
> in place would be willing to test.
> 
> I've stared at the code and am convinced it's right, but I remember
> Knuth's words: "Beware of bugs in the above code; I have only proved it
> correct, not tried it."

I have many test setups for ColdFire (qemu and real hardware) but
none of them actually use the mulsi3 code. I don't have anything
for testing classic m68000 builds.

So other than compiling it I don't have an easy way to currently
test it.

Regards
Greg
