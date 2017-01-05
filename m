From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 1/3] linux/const.h: move UL() macro to include/linux/const.h
Date: Thu, 5 Jan 2017 11:22:55 +0900
Message-ID: <CAK7LNATgkJJ4rnK7N8NQ2WR22eoCR3Hz5pCoE4VvOiRXrC0yPQ@mail.gmail.com>
References: <1483520127-29316-1-git-send-email-yamada.masahiro@socionext.com>
 <1483520127-29316-2-git-send-email-yamada.masahiro@socionext.com> <CAMuHMdVyzF4xFPotburrP+cihjfyCDfHeAt4bienLG9kdG_zSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVyzF4xFPotburrP+cihjfyCDfHeAt4bienLG9kdG_zSg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Will Deacon <will.deacon@arm.com>, David Howells <dhowells@redhat.com>, Chris Brandt <chris.brandt@renesas.com>, "H . Peter Anvin" <hpa@zytor.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, the arch/x86 maintainers <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Laura Abbott <labbott@redhat.com>, Neeraj Upadhyay <neeraju@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Santosh Shilimkar <ssantosh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>

Hi Geert,

2017-01-04 18:27 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
> Hi Yamada-san,
>
> On Wed, Jan 4, 2017 at 9:55 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> Some architectures are duplicating the definition of UL():
>>
>>   #define UL(x) _AC(x, UL)
>>
>> This is not actually arch-specific, so it will be useful to move it
>> to a common header.  Currently, we only have the uapi variant for
>> linux/const.h, so I am creating include/linux/const.h.
>>
>> I am also adding _UL(x), _ULL(x), ULL(x) because _AC() is used for
>> UL in most places (and ULL in some places).  I expect _AC(..., UL)
>> will be replaced with _UL(...) or UL(...).  The underscore-prefixed
>> one should be used for exported headers.
>>
>> Note:
>> I renamed UL(x) in arch/m68k/mm/init.c, where it is used for a
>> different meaning.
>
> Shouldn't that be a separate (prerequisite) patch?


Yes, I did so in v2.

Thanks!



-- 
Best Regards
Masahiro Yamada
