From: Chen Gang <gang.chen.5i5j@gmail.com>
Subject: Re: [PATCH v3] arch: Kconfig: Let all architectures set endian explicitly
Date: Fri, 15 Aug 2014 06:14:38 +0800
Message-ID: <53ED34CE.3040001@gmail.com>
References: <53ECE9DD.80004@gmail.com> <20140814180418.GA20777@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20140814180418.GA20777@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Arnd Bergmann <arnd@arndb.de>, akpm@linux-foundation.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@synopsys.com, Geert Uytterhoeven <geert@linux-m68k.org>, Jean Delvare <jdelvare@suse.de>, linux@arm.linux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, hskinnemoen@gmail.com, egtvedt@samfundet.no, realmz6@gmail.com, msalter@redhat.com, a-jacquiot@ti.com, starvik@axis.com, jesper.nilsson@axis.com, dhowells@redhat.com, rkuo@codeaurora.org, tony.luck@intel.com, fenghua.yu@intel.com, takata@linux-m32r.org, james.hogan@imgtec.com, Michal Simek <monstr@monstr.eu>, yasutake.koichi@jp.panasonic.com, jonas@southpole.se, jejb@parisc-linux.org, deller@gmx.de, Benjamin Herrenschmidt <benh@kernel.crashing.org>, paulus@samba.org, mpe@ellerman.id.au, Mart
List-Id: linux-m68k@vger.kernel.org

On 08/15/2014 02:04 AM, Ralf Baechle wrote:
> On Fri, Aug 15, 2014 at 12:54:53AM +0800, Chen Gang wrote:
> 
>> Normal architectures:
>>
>>  - Big endian: avr32, frv, m68k, openrisc, parisc, s390, sparc
>>
>>  - Little endian: alpha, blackfin, cris, hexagon, ia64, metag, mn10300,
>>                   score, unicore32, x86
>>
>>  - Choose in config time: arc, arm, arm64, c6x, m32r, mips, powerpc, sh
> 
> Nak for MIPS.  On MIPS Kconfig already always sets one of CPU_BIG_ENDIAN
> and CPU_LITTLE_ENDIAN depending on platforms and where both endianess are
> supported by a platform, user choice:
> 
> config FOO
> 	bool "foo"
> 	select SYS_SUPPORTS_LITTLE_ENDIAN
> 
> config FOO
> 	bool "foo"
> 	select SYS_SUPPORTS_BIG_ENDIAN
> 	select SYS_SUPPORTS_LITTLE_ENDIAN
> [...]
> choice
>         prompt "Endianess selection"
>         help
>           Some MIPS machines can be configured for either little or big endian
>           byte order. These modes require different kernels and a different
>           Linux distribution.  In general there is one preferred byteorder for a
>           particular system but some systems are just as commonly used in the
>           one or the other endianness.
> 
> config CPU_BIG_ENDIAN
>         bool "Big endian"
>         depends on SYS_SUPPORTS_BIG_ENDIAN
> 
> config CPU_LITTLE_ENDIAN
>         bool "Little endian"
>         depends on SYS_SUPPORTS_LITTLE_ENDIAN
>         help
> 
> endchoice
> 

OK, thanks, I assumes when support both endian, the default choice is
CPU_BIG_ENDIAN, although no default value for choice (originally, I did
worry about it).

> So I think you can just drop the MIPS segment from your patch.
> 

If what I assumes is correct, what you said sounds reasonable to me.


Thanks.
-- 
Chen Gang

Open share and attitude like air water and life which God blessed
