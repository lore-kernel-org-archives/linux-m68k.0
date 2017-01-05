From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 0/4] linux/const.h: cleanups of macros such as UL(), _BITUL(), BIT() etc.
Date: Thu,  5 Jan 2017 11:20:05 +0900
Message-ID: <1483582810-7046-1-git-send-email-yamada.masahiro__34175.2651766457$1483583115$gmane$org@socionext.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "H . Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Russell King <linux@armlinux.org.uk>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Pratyush Anand <panand@redhat.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, James Morse <james.morse@arm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, linux-m68k@lists.linux-m68k.org, Guan


ARM, ARM64, UniCore32 define UL() as a shorthand of _AC(..., UL).
In the future, more architectures may introduce it, so move
the definition to include/linux/const.h.

The _AC() is used for either (likely) UL or (unlikely) ULL.
Having UL(L) in a common place can avoid direct use of _AC().

The _AC() is defined under the uapi directory, so it compels
underscore-prefixed macros even for unexported headers.

I see similar situation for _BITUL().  This is available in
both C and assembly.  However, it is defined in an uapi header,
so direct use of the underscore macro is needed even for unexported
headers.  The 3/3 makes BIT() available in assembly too, which will
be more suitable for use in unexported headers.


Changes in v2:
  - Split out as a prerequisite patch

Masahiro Yamada (4):
  m68k: rename UL() to TO_UL()
  linux/const.h: move UL() macro to include/linux/const.h
  linux/const.h: refactor _BITUL and _BITULL a bit
  linux/const.h: move BIT(_ULL) to linux/const.h for use in assembly

 arch/arm/include/asm/memory.h       |  6 ------
 arch/arm64/include/asm/memory.h     |  6 ------
 arch/m68k/mm/init.c                 |  6 +++---
 arch/unicore32/include/asm/memory.h |  6 ------
 include/linux/bitops.h              |  3 +--
 include/linux/const.h               | 12 ++++++++++++
 include/uapi/linux/const.h          | 13 ++++++++-----
 7 files changed, 24 insertions(+), 28 deletions(-)
 create mode 100644 include/linux/const.h

-- 
2.7.4
