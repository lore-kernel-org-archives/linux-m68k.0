From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: Hashing via multiply on 68000, H8 and Microblaze
Date: Mon, 16 May 2016 08:52:59 +0200
Message-ID: <57396E4B.4010307@xilinx.com>
References: <20160514041429.6631.qmail@ns.horizon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160514041429.6631.qmail@ns.horizon.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: George Spelvin <linux@horizon.com>, geert@linux-m68k.org, gerg@linux-m68k.org, monstr@monstr.eu, ysato@users.sourceforge.jp
Cc: linux-m68k@lists.linux-m68k.org, michal.simek@xilinx.com, uclinux-h8-devel@lists.sourceforge.jp

On 14.5.2016 06:14, George Spelvin wrote:
> My current project is reworking <linux/hash.h>.  The most urgent fix
> went in to 4.6-rc7 as commit 689de1d6ca ("Minimal fix-up of bad hashing
> behavior of hash_64()"), but there's more.
> 
> This is done by multiplication on most platforms, but there are some
> where that's very inefficient.  This message is:
> 
> 1. A brain dump on the subject,
> 2. Establishing contact with the relevant architecture maintainers
>    in preparation for future patches, and
> 3. A solicitation for ideas.
> 
> 
> The Linux kernel makes heavy use of the inline functions hash_32(x, bits)
> and hash_64(x, bits) to compute hash table indexes from an integer, pointer,
> or word-sized string hash.
> 
> hash_32() is just { return x * CONSTANT >> (32 - bits); } for some
> suitably chosen 32-bit CONSTANT, and equivalently (with a larger constant)
> for hash_64.  The multiply basically causes each bit of the input to
> affect all more-significant bits of the output, and then those bits
> are extracted for the final index.
> 
> But the current constant was chosen to be easy to compute with a
> shift-and-add sequence on platforms without a good hardware multiplier,
> which causes bad bit mixing, and I've been looking into the implications
> of changing that.
> 
> On Sun, 1 May 2016 at 09:5, Linus Torvalds wrote:
>> On Sun, May 1, 2016 at 2:43 AM, George Spelvin <linux@horizon.com> wrote:
>>> * If you feel ambitious, add a 32-bit CONFIG_ARCH_HAS_SLOW_MULTIPLIER
>>>   exception path.
>>
>> Let's make that a separate worry, and just fix hash_64() first.
>>
>> In particular, that means "let's not touch COLDEN_RATIO_32 yet". I
>> suspect that when we *do* change that value, we do want the
>> non-multiplying version you had.
> 
> Upon research, I've found that all 64-bit processors have decent
> 64x64-bit multiplier, so there's no benefit to choosing a "simpler"
> constant.
> 
> As do most 32-bit processors that Linux supports.  But not all.
> 
> The current exceptions are:
> 
> * MC68000/010/328 (arch/m68k, no-mmu)
> * H8 (arch/h8300)
> * Microblaze (Xilinx soft-core) may be configured without multiplier

yes. Microblaze can be configured without multiplier.

> 
> The thing about these is, they *also* don't have barrel shifters.

Barrel shifter is optional for Microblaze too.
But for most of systems which runs Linux has multiplier and BS ON
(size of logic is not a problem today).


> I have an efficient shift-and-add pattern for computing x * 0x61C88647:
> 	a = x + (x << 19);
> 	b = a + (x << 9);
> 	c = b + (x << 23);
> 	reutrn (b << 11) + (c << 6) + (a << 3) - c;
> ... but it involves large shifts, and without efficient support for them,
> this isn't a great alternative!
> 
> The 68000 has multi-bit shifts, but they're also multi-cycle.
> 
> The H8/300 has only 1-bit shift instructions, and more recent models have
> been extended with 2-bit shifts, but either way, large shifts are a PITA.
> 
> Both of these have moderately efficient 16x16->32-bit multiplies.  (On some
> H8 models, the multiply is actually a practical way to do left shifts!)
> 
> Both also provide efficient access to the 16-bit halves of 32-bit values,
> which can be used by large shits and rotates.
> 
> Microblaze is complicated.  Both barrel shifter and multiplier are
> configurable options.  If missing, so are the corresponding instructions.
> (And arch/microblaze/Kconfig.platform supports omitting both.)

As I said above you can design your code to be optional when MUL and BS
are on and say when one of then it is not then hashes calculation wont'
be optimal.

> Given that it's not necessary to compute the same hash function on all
> platforms (as long as it's still a good hash), my current thoughts are
> that "generic" fallback code is impractical and I should instead:
> - Add a CONFIG_ARCH_HASH option, which works like CONFIG_ARCH_RANDOM,
>   indicating that the gneric code should #include <asm/archhash.h>
> - Within that, platforms may define replacement functions and #define
>   HAVE_ARCH_FOO variable to suppress the standard definitions.
>   (This is all conditional, as other m68k platforms with MULU.L can
>   use the generic functions.)
> - On 68000 and H8, I'll define
>   hash32(x) = swap((x & 0xffff) * CONST1 + (x >> 16) * CONST2)
>   This isn't quite as good mixing as a 32-bit multiply, but only needs
>   2 (not 3) 16x16->32-bit multiplies and the swap put the most-mixed bits
>   in the msbits.
> - If a Microblaze has a barrel shifter (but no multiplier), I'll use the
>   shift-and-add code.
> - If a Microblaze does not have a barrel shifter, I don't know what
>   the heck I'll do.  Any ideas?

Just keep it inefficient.

Thanks,
Michal
