From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [RFC PATCH 2/2] arch/m68k: Add CONFIG_CPU_HAS_NO_MULDIV32
Date: Fri, 13 May 2016 11:02:24 +1000
Message-ID: <573527A0.6030708@linux-m68k.org>
References: <20160512203116.8654.qmail@ns.horizon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160512203116.8654.qmail@ns.horizon.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: George Spelvin <linux@horizon.com>, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org

Hi George,

On 13/05/16 06:31, George Spelvin wrote:
>> Did you intend to no longer compile any of mulsi3.o, etc, for
>> ColdFire targets?
>>
>> CPU_HAS_NO_MULDIV64 is selected by both M68000 and ColdFire, so
>> those functions used to be compiled. But with this change on
>> only M68000 will compile them.
> 
> Yes, that's exactly the point.  ColdFire doesn't need or use them.
> 
> This was baiscally my answer to "why is there a ColdFire path
> in __mulsi3"?
> 
>> When compiling with m5200 gcc will generate calls to divsi3,
>> udivsi3, modsi3 and umodsi3. (As far as I can tell we never need
>> mulsi3 for ColdFire). So linking will fail with this patch as-is
>> in that m5200 case.
> 
> Ah!  I missed that on my testing.  Yes, indeed, there is *one* ColdFire
> that needs the divides.  And -mcpu=5206 is a supported option.
> 
> I had tested with
> 
> m68k-linux-gnu-gcc-6 -march=isaa -fomit-frame-pointer -S mul.c
> 
> unsigned mul(unsigned x, unsigned y) { return x * y; }
> unsigned div(unsigned x, unsigned y) { return x / y; }
> unsigned rem(unsigned x, unsigned y) { return x % y; }
> int sdiv(int x, int y) { return x / y; }
> int srem(int x, int y) { return x % y; }
> 
> But yes, -m5206 isn't the same as "-march=isaa -mtune=5200"; the very
> first is "ISA A minus" and doesn't have the *divides*.

It is rather annoying that the baseline isaa isn't really
the baseline :-)


> Now that you point it out, I also see the -m5200 fallback in the Makefile.
> 
> 
> Grumble, that just got more complicated.  It's easy enough to split
> the option into CPU_HAS_NO_MUL32 and CPU_HAS_NO_DIV32, but the answer
> depends on the GCC version, not just the config settings.
> 
> Options include:
> - Punt on the divide part entirely, and just always compile divides like now.
>   It's just a tiny bit of code space.

That part is no big deal. Those functions are library linked,
so if the final kernel doesn't need them then they will not
end up taking any code space at all.


> - (falsely) set CPU_HAS_NO_DIV32 for those CPUs always.
>   The problem is, some future code might make optimization decisions
>   based on that (e.g. using binary vs. Euclidean GCD algorithms),
>   and for the 99% of people using a modern compiler, it'll be wrong.

Yeah, that would not be so good. I would always want to assume
the presence of hardware div/rem for ColdFire (since all the hardware
we currently run on actually does have it). And the further in
the future you go the less likely your are to be using a really
old compiler.


> - Do some post-Kconfig Makefile magic to detect the situation.
> 
> How ugly is this:
> 
> +lib-$(CONFIG_CPU_HAS_NO_MUL32) += mulsi3.o
> +lib-$(CONFIG_CPU_HAS_NO_DIV32) += divsi3.o udivsi3.o modsi3.o umodsi3.o
> +
> +# Old GCC versions fall back to -m5200 compilation, generating these calls
> +# even though the CPU doesn't actually need it.  See arch/m68k/Makefile.
> +
> +ifeq ($(cpuflags-y),-m5200)
> +lib-y += divsi3.o udivsi3.o modsi3.o umodsi3.o
> +endif

I think I could live with that.

Regards
Greg
