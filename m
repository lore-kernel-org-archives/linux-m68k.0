Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8492014F9FF
	for <linux-m68k@lists.linux-m68k.org>; Thu,  6 Mar 2025 14:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741271184; cv=none; b=ALFZ3UfJiiZ8z1ydy3l1GiV4lNx/h8+KiLT81h1LxqL9+GtlK6im/m99zWduvC7UjIc/4gRH3qp++iYb7aXorcf0xYFHC+JLXw64cgUZSDt7grN8z7wX49CAhYeyZQg1As7/uNT3edFgmFNhbw+NeVVXMUAU8Nb69hWrBG93KnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741271184; c=relaxed/simple;
	bh=te7b7Wje3ARNsRFRLvh/ICjzFJkmakKAokM7Jd1NJlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KOqwOrcSSPu5QOoETOQh7Fx3i3/Gocgz2zyeUeWzHXGGrYeFa+M1nzgDacIA2qCWWQWeZWEupkI2zyjIiorjvoWYts2u0F3ZJMV1s75ogW096jzHYOW31w0tvYkkVksMuZU9EdmF0xGUYXD3vPnatTIR/jMdCM42p9rnqeye+pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yk+oVeoi; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yk+oVeoi"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bd21f887aso5720811fa.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 06 Mar 2025 06:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741271181; x=1741875981; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EU1SNay1u5/ZQ9+AL396YtUFXY6YN/hw7R0JiytRFJU=;
        b=Yk+oVeoiQjA8zc1v3TJKpJDhLxNeGg5nQ9BBAOwQp3SZ/cAIhKOpsJMZck6kgDZ0Ad
         7idATg5zD+Tc3JLgpQEqeveuXwGXm31DsIXwpPQiUTb1DHLh8in18AvxuvXvv3s733SW
         uOGkYzWxSScq95VprTxsdX+0o0LJjtH8Ig75LmXPsoKtT7y+Ta2KysXxz1bFuBNfESNS
         OMxyXuJyt665cNbcNxTKX2DH2L1vY5EBi4jJPblVORQcBCpsTkjBJQbN39w+gtWVAZHZ
         YeI/rFxXsUV4bvqq3FuE8yXzkWCLe2DBt0bT1oHiSfpGH4c4DuY8yvG4Bl9TpSmWco7g
         tDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741271181; x=1741875981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EU1SNay1u5/ZQ9+AL396YtUFXY6YN/hw7R0JiytRFJU=;
        b=JUweK5m3Tdt6LD+qd+UZsNtKHFxVdYOtZdOeYuXcNKugcXT19D2xdYWJE+EoCVB/15
         rh+4xFP4DaV/OXg+jML+ESuKXK6vSJxGBuO9fvB5dLS2zloayWe68LN6mh93bLWlVuOL
         oW7H3dyGDWalz2n3oI8ZKwCOqa46DxqEFW6euhW1ilQ3hXRGVbJuZjJH39nR4v8KT8nR
         dEm+aKU7vKKKrmtnfC4x03rIV6BtQyhdigA9dLvQWTyZWHUWy4xf43Kg8rCmpVj/QblI
         22ig6983LwDiNlmRVTVRuRFIBzxOYE9jOs4hdr2wkQMDcJZ5UbUNtlWj9hHNxjhWoEmJ
         g6Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUnSBoYyxLzAOjTusp2bgrecurF9GCy3zBzk44hgMqyjWgMdpW6DRxttkWYNIt9p2uQWcOuW03M8j0x@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwLLIQd2Jvh7bISUKjSuQ6ZzWnMtkLrb+zd+rxT7vjBtzWJ34lz
	l8cGTBjSM0PqfuBtrKWOmpenUI6gDhTAfyx111FauVYNg2D1R6C8kiP10XrEBa/T7755wpvrtxn
	0ChkzFpEgcgbW+ElQXUFZaKkmjao=
X-Gm-Gg: ASbGnctdZeVmN40I6BrtEN5pjg/dgLUwYK+yBRinzUVVaJ/iOk5X2ILRxquAG0KTTsa
	ODlqteDqVFzTUreiiSGpcYgcv6iowtcz865ZFblNvmtTT57buisCmRYt6KVRKdRhbxAkkv1uNmb
	Kk4t5UgEY4vUmDvGdhG7dQGxLcwpZj9T3pxHtPZ4aD7w==
X-Google-Smtp-Source: AGHT+IHZhENG4gRb0F9Rmf1OW/m+syh7kdQynM5mTvYms238dYHdARpTdMPN/4mbWA/GlV/jiD0tvfW6UVqOxS69Kro=
X-Received: by 2002:a2e:be04:0:b0:30b:c608:22d4 with SMTP id
 38308e7fff4ca-30bd7a4f765mr30020021fa.12.1741271180244; Thu, 06 Mar 2025
 06:26:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-1-5db840301730@gmail.com> <Z8mUH0comOCpycpK@pathway.suse.cz>
In-Reply-To: <Z8mUH0comOCpycpK@pathway.suse.cz>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 6 Mar 2025 09:25:43 -0500
X-Gm-Features: AQ5f1JqPBebRjAFDoM5duNxSXp3o4HRO5vi13RwnCXj2Yfg6UzKlfwprHEOJ4RU
Message-ID: <CAJ-ks9nFSzRXFauavzSWhvhr2Rou7qqkWi_LZ=4e1Tyr4_bn3g@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] printf: convert self-test to KUnit
To: Petr Mladek <pmladek@suse.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, David Gow <davidgow@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 7:25=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrote=
:
>
> On Fri 2025-02-21 15:34:30, Tamir Duberstein wrote:
> > Convert the printf() self-test to a KUnit test.
> >
> > In the interest of keeping the patch reasonably-sized this doesn't
> > refactor the tests into proper parameterized tests - it's all one big
> > test case.
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  Documentation/core-api/printk-formats.rst   |   4 +-
> >  MAINTAINERS                                 |   2 +-
> >  lib/Kconfig.debug                           |  12 +-
> >  lib/Makefile                                |   1 -
> >  lib/tests/Makefile                          |   1 +
> >  lib/{test_printf.c =3D> tests/printf_kunit.c} | 188 +++++++++++++++---=
----------
> >  tools/testing/selftests/lib/config          |   1 -
> >  tools/testing/selftests/lib/printf.sh       |   4 -
> >  8 files changed, 117 insertions(+), 96 deletions(-)
> >
> > diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/=
core-api/printk-formats.rst
> > index ecccc0473da9..4bdc394e86af 100644
> > --- a/Documentation/core-api/printk-formats.rst
> > +++ b/Documentation/core-api/printk-formats.rst
> > @@ -661,7 +661,7 @@ Do *not* use it from C.
> >  Thanks
> >  =3D=3D=3D=3D=3D=3D
> >
> > -If you add other %p extensions, please extend <lib/test_printf.c> with
> > -one or more test cases, if at all feasible.
> > +If you add other %p extensions, please extend <lib/tests/printf_kunit.=
c>
> > +with one or more test cases, if at all feasible.
> >
> >  Thank you for your cooperation and attention.
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f076360ce3c6..b051ccf6b276 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25510,8 +25510,8 @@ R:    Sergey Senozhatsky <senozhatsky@chromium.=
org>
> >  S:   Maintained
> >  T:   git git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.gi=
t
> >  F:   Documentation/core-api/printk-formats.rst
> > -F:   lib/test_printf.c
> >  F:   lib/test_scanf.c
> > +F:   lib/tests/printf_kunit.c
> >  F:   lib/vsprintf.c
> >
> >  VT1211 HARDWARE MONITOR DRIVER
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 7ddbfdacf895..d2b15f633227 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -2436,6 +2436,15 @@ config ASYNC_RAID6_TEST
> >  config TEST_HEXDUMP
> >       tristate "Test functions located in the hexdump module at runtime=
"
> >
> > +config PRINTF_KUNIT_TEST
> > +     tristate "KUnit test printf() family of functions at runtime" if =
!KUNIT_ALL_TESTS
> > +     depends on KUNIT
> > +     default KUNIT_ALL_TESTS
> > +     help
> > +       Enable this option to test the printf functions at runtime.
> > +
> > +       If unsure, say N.
> > +
> >  config STRING_KUNIT_TEST
> >       tristate "KUnit test string functions at runtime" if !KUNIT_ALL_T=
ESTS
> >       depends on KUNIT
> > @@ -2449,9 +2458,6 @@ config STRING_HELPERS_KUNIT_TEST
> >  config TEST_KSTRTOX
> >       tristate "Test kstrto*() family of functions at runtime"
> >
> > -config TEST_PRINTF
> > -     tristate "Test printf() family of functions at runtime"
> > -
> >  config TEST_SCANF
> >       tristate "Test scanf() family of functions at runtime"
> >
> > diff --git a/lib/Makefile b/lib/Makefile
> > index 961aef91d493..f31e6a3100ba 100644
> > --- a/lib/Makefile
> > +++ b/lib/Makefile
> > @@ -77,7 +77,6 @@ obj-$(CONFIG_TEST_RHASHTABLE) +=3D test_rhashtable.o
> >  obj-$(CONFIG_TEST_STATIC_KEYS) +=3D test_static_keys.o
> >  obj-$(CONFIG_TEST_STATIC_KEYS) +=3D test_static_key_base.o
> >  obj-$(CONFIG_TEST_DYNAMIC_DEBUG) +=3D test_dynamic_debug.o
> > -obj-$(CONFIG_TEST_PRINTF) +=3D test_printf.o
> >  obj-$(CONFIG_TEST_SCANF) +=3D test_scanf.o
> >
> >  obj-$(CONFIG_TEST_BITMAP) +=3D test_bitmap.o
> > diff --git a/lib/tests/Makefile b/lib/tests/Makefile
> > index 8961fbcff7a4..183c6a838a5d 100644
> > --- a/lib/tests/Makefile
> > +++ b/lib/tests/Makefile
> > @@ -30,6 +30,7 @@ obj-$(CONFIG_LINEAR_RANGES_TEST) +=3D test_linear_ran=
ges.o
> >  obj-$(CONFIG_MEMCPY_KUNIT_TEST) +=3D memcpy_kunit.o
> >  CFLAGS_overflow_kunit.o =3D $(call cc-disable-warning, tautological-co=
nstant-out-of-range-compare)
> >  obj-$(CONFIG_OVERFLOW_KUNIT_TEST) +=3D overflow_kunit.o
> > +obj-$(CONFIG_PRINTF_KUNIT_TEST) +=3D printf_kunit.o
> >  obj-$(CONFIG_SIPHASH_KUNIT_TEST) +=3D siphash_kunit.o
> >  obj-$(CONFIG_SLUB_KUNIT_TEST) +=3D slub_kunit.o
> >  obj-$(CONFIG_TEST_SORT) +=3D test_sort.o
> > diff --git a/lib/test_printf.c b/lib/tests/printf_kunit.c
> > similarity index 87%
> > rename from lib/test_printf.c
> > rename to lib/tests/printf_kunit.c
> > index 59dbe4f9a4cb..287bbfb61148 100644
> > --- a/lib/test_printf.c
> > +++ b/lib/tests/printf_kunit.c
> > @@ -3,9 +3,7 @@
> >   * Test cases for printf facility.
> >   */
> >
> > -#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > -
> > -#include <linux/init.h>
> > +#include <kunit/test.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/printk.h>
> > @@ -25,8 +23,6 @@
> >
> >  #include <linux/property.h>
> >
> > -#include "../tools/testing/selftests/kselftest_module.h"
> > -
> >  #define BUF_SIZE 256
> >  #define PAD_SIZE 16
> >  #define FILL_CHAR '$'
> > @@ -37,12 +33,17 @@
> >       block \
> >       __diag_pop();
> >
> > -KSTM_MODULE_GLOBALS();
> > +static unsigned int total_tests;
> > +
> > +static char *test_buffer;
> > +static char *alloced_buffer;
> > +
> > +static struct kunit *kunittest;
> >
> > -static char *test_buffer __initdata;
> > -static char *alloced_buffer __initdata;
> > +#define tc_fail(fmt, ...) \
> > +     KUNIT_FAIL(kunittest, fmt, ##__VA_ARGS__)
> >
> > -static int __printf(4, 0) __init
> > +static void __printf(4, 0)
> >  do_test(int bufsize, const char *expect, int elen,
> >       const char *fmt, va_list ap)
> >  {
> > @@ -57,52 +58,50 @@ do_test(int bufsize, const char *expect, int elen,
> >       va_end(aq);
> >
> >       if (ret !=3D elen) {
> > -             pr_warn("vsnprintf(buf, %d, \"%s\", ...) returned %d, exp=
ected %d\n",
> > +             tc_fail("vsnprintf(buf, %d, \"%s\", ...) returned %d, exp=
ected %d",
>
> 1. It looks a bit strange that the 1st patch replaces pr_warn() with
>    tc_fail() which hides KUNIT_FAIL().
>
>    And the 2nd patch replaces tc_fail() with KUNIT_FAIL().
>
>    It looks like a non-necessary churn.
>
>    It would be better to avoid the temporary "tc_fail" and swith to
>    KUNIT_FAIL() already in this patch.
>
>    I did not find any comment about this in the earier versions of the
>    patchset.
>
>    Is it just a result of the evolution of the patchset or
>    is there any motivation for this?

The motivation was to keep the width of the macro the same in this
first patch for ease of review, particularly in the 7 instances where
the invocation wraps to a second line. If you prefer I go straight to
KUNIT_FAIL, I can make that change.

> 2. What was the motivation to remove the trailing '\n', please?
>
>    It actually makes a difference from the printk() POV. Messages without
>    the trailing '\n' are _not_ flushed to the console until another
>    message is added. The reason is that they might still be appended
>    by pr_cont(). And printk() emits only complete lines to the
>    console.
>
>    In general, messages should include the trailing '\n' unless the
>    code wants to append something later or the trailing '\n' is
>    added by another layer of the code. It does not seem to be this case.
>
>
> >                       bufsize, fmt, ret, elen);
> > -             return 1;
> > +             return;
> >       }
>
> [...]

I noticed in my testing that the trailing \n didn't change the test
output, but I didn't know the details you shared about the trailing
\n. I'll restore them, unless we jump straight to the KUNIT macros per
the discussion above.

>
> > @@ -842,13 +836,15 @@ test_pointer(void)
> >       fourcc_pointer();
> >  }
> >
> > -static void __init selftest(void)
> > +static void printf_test(struct kunit *test)
> >  {
> >       alloced_buffer =3D kmalloc(BUF_SIZE + 2*PAD_SIZE, GFP_KERNEL);
> >       if (!alloced_buffer)
> >               return;
>
> I would use here:
>
>         KUNIT_ASSERT_NOT_NULL(test, alloced_buffer);
>
> And move the same change for the other kmalloc() location from
> the 2nd patch.

I didn't do that here because I was trying to keep this patch as small
as possible, and I wrote that in the commit message.

As for using KUNIT_ASSERT_NOT_NULL here, that would have to change
back to an error return in the 2nd patch because this code moves into
`suite_init`, which is called with `struct kunit_suite` rather than
`struct kunit_test`, and KUnit assertion macros do not work with the
former (and for good reason, because failures in suite setup cannot be
attributed to a particular test case).

So I'd prefer to leave this as is.

>
>
> >       test_buffer =3D alloced_buffer + PAD_SIZE;
> >
> > +     kunittest =3D test;
> > +
> >       test_basic();
> >       test_number();
> >       test_string();
>
>
> Otherwise, it looks good to me.
>
> Best Regards,
> Petr

Thank you for the review!
