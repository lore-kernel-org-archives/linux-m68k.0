From: Zhaoxiu Zeng <zengzhaoxiu@163.com>
Subject: Re: [patch V4] lib: GCD: Use binary GCD algorithm instead of
 Euclidean
Date: Sun, 8 May 2016 20:52:52 +0800
Message-ID: <042bae7f-51d6-93e8-549d-a38bcb4c9cf5__2106.66335556216$1462713442$gmane$org@163.com>
References: <20160507084129.7284.qmail@ns.horizon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160507084129.7284.qmail@ns.horizon.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: George Spelvin <linux@horizon.com>, akpm@linux-foundation.org, dalias@libc.org, davem@davemloft.net, geert@linux-m68k.org, James.Bottomley@HansenPartnership.com, jjuran@gmail.com, peterz@infradead.org, sam@ravnborg.org
Cc: deller@gmx.de, heiko.carstens@de.ibm.com, ink@jurassic.park.msu.ru, james.hogan@imgtec.com, jejb@parisc-linux.org, jonas@southpole.se, lennox.wu@gmail.com, lftan@altera.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-metag@vger.kernel.org, linux-mips@linux-mips.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux@arm.linux.org.uk, linux@lists.openrisc.net, liqin.linux@gmail.com, mattst88@gmail.com, monstr@monstr.eu, nios2-dev@lists.rocketboards.org, ralf@linux-mips.org, rth@twiddle.net, schwidefsky@de.ibm.com, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, vgupta@synopsys.com, ysato@users.sourceforge.jp, zhaoxiu.zeng@gmail.com

=D4=DA 2016/5/7 16:41, George Spelvin =D0=B4=B5=C0:
> Nothing critical, but a bit of kibitzing.
> (That is slang in the Yiddish language for a person
> who offers annoying and unwanted advice.)
>
>> The binary GCD algorithm is based on the following facts:
>> 	1. If a and b are all evens, then gcd(a,b) =3D 2 * gcd(a/2, b/2)
>> 	2. If a is even and b is odd, then gcd(a,b) =3D gcd(a/2, b)
>> 	3. If a and b are all odds, then gcd(a,b) =3D gcd((a-b)/2, b) =3D g=
cd((a+b)/2, b)
> 1) "even" and "odd" are adjectives.  In English, adjectives to not ha=
ve
>    plural suffixes.  Thus, "they are even" or "they are odd".
> 2) Although "all" is not exactly wrong, it sounds odd.  Since there a=
re
>    exactly two of them it's clearer to say "both".
>
> If I also rephrase the last line to fit into 80 columns, you get:
>
>   The binary GCD algorithm is based on the following facts:
> - 	1. If a and b are all evens, then gcd(a,b) =3D 2 * gcd(a/2, b/2)
> + 	1. If a and b are both even, then gcd(a,b) =3D 2 * gcd(a/2, b/2)
>  	2. If a is even and b is odd, then gcd(a,b) =3D gcd(a/2, b)
> -	3. If a and b are all odds, then gcd(a,b) =3D gcd((a-b)/2, b) =3D g=
cd((a+b)/2, b)
> +	3. If both are odd, then gcd(a,b) =3D gcd((a-b)/2, b) =3D gcd((a+b)=
/2, b)
>
> 3) Negative config options are always confusing.
>
> Would it be better to call it CONFIG_INEFFICIEBNT_FFS, or even simple=
r
> CONFIG_SLOW_FFS?
>
> Also, you're allowed to add "help" to a non-interactive config option=
,
> and some documentation might be useful.
> E.g.
>
> +config CPU_SLOW_FFS
> +	def_bool n
> +	help
> +	  If n, the CPU supports a fast __ffs (__builtin_ctz) operation,
> +	  either directly or via a short code sequence using a count
> +	  leading zeros or population count instruction.  If y, the
> +	  operation is emulated by slower software, such as an unrolled
> +	  binary search.
> +
> +	  This is purely an optimization option; the kernel
> +	  will function correctly regardless of how it is set.
> +

Thanks a lot.

> Your benchmark code doesn't have to have a separate code path if
> __x86_64__; rdtsc works on 32-bit code just as well.  paths.  And the
> way you subtract the end and start times is unnecessarily complicated=
=2E
> The C language guarantees that unsigned arithmetic simply wraps modul=
o
> 2^bits as expected.

rdsc works on x86, the other path is prepared for other architectures.

> Here are some more timings, with the same flags as your tests:
>
> First, 32 bit code:
> 		gcd0	gcd1	gcd2	gcd3	gcd4
> Ivy Bridge	3156	1192	1740	1160	1640	PASS
> AMD Phenom	7150	2564	2348	2975	2843	PASS
> Core 2		4176	2592	4164	2604	3900	PASS
> Pentium 4	11492	4784	7632	4852	6452	PASS
>
> And 64-bit (longer times becuase the inputs are larger):
> Ivy Bridge	10636	2496	3500	2432	3360	PASS
> AMD Phenom	19482	4058	6030	5001	6845	PASS
>
> Looking at those, I'm not sure how much better the gcd3/4 versions ar=
e
> than gcd1/2.  The difference seems pretty minor and sometimes negativ=
e.
>

The worst case of binary GCD is that one number is power of 2,
for example a is 0xffffffff (0xcccccccc for the "even/odd" variant) and=
 b is 1.

The gcd3/4 versions can handle this properly.
