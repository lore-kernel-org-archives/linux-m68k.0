Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B74E207DEA
	for <linux-m68k@lists.linux-m68k.org>; Thu,  6 Mar 2025 12:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741263909; cv=none; b=uPlcG03swDxSsGtgbue9DstGjd59xTSy2NlVIRDKbntif+Yg5bOySt9vdzfhscscV6FrXy6oeSfrAe64JQYZLWNL5Q8a8rVp/yUYo7sVg3LH0N6LKH805wUYcQPpQeOThy6XTq1ycqh8N0AdU2glrr4hihX87sXfphV7xp9MLNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741263909; c=relaxed/simple;
	bh=dDtH0uvhV0kEplUpSLFEmJdkxsFYdF+2rLpMIvGfd7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nz66zBVTgQrlrHwQjz1RDZzqhJ6JQhX0i+YOqhYAj37417hnFTc8YEytJ8QZA7VPZQUMa/uaP6lTJV+m1fGWOgLPX/ilVLL6bgiKEIhxGtsJMQT30bPxENG52/YVKq3jZUnNdOYgcKKKd5dBN6TiH52lnFgXjRJbQeBMjxsCyog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KCMa/Lu1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KCMa/Lu1"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43bc4b16135so3435165e9.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 06 Mar 2025 04:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741263905; x=1741868705; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nIwcoBN/hkEYZ3G8KOPMnrmKGBBnfRqx2ozDCVdFctQ=;
        b=KCMa/Lu1rDUdAof4LtJwfulS7Ddj4MBRHhCyWmAgfUsGzN4e0z+Y3YRpoilDcH/2Vf
         mO7BkxbN9xuYnerw2f2SPU3ToI0oMQTKXTIVKZZXRLAzoM0eSDH6Te73z2ts5v+juqm8
         0o7IRWp7enBeoE8RUQnP8I0UKC6ZCiOUNa8pgC8CNU7sKhtxy9s7PRU4vOzkdglfEuib
         ITH+6ydTqbcB6GmrcD9erpYHHH2wVJ3T8S4Fxr5g/z76LVpwn/BLyp7hpwelaju2O/tW
         dnm95rd+NVvs8Og/9pZWwesbIGZWhcN2snjZdLUKYqrNcu5tj8Ryt/X8Ksg4eEMdq4OO
         eq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741263905; x=1741868705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIwcoBN/hkEYZ3G8KOPMnrmKGBBnfRqx2ozDCVdFctQ=;
        b=nn/wLMaSwFcItYt6UawMJ5OF6DniEwPmMUbaCEnWAO0pMuuHDU6C8cIpt+nFS6omSo
         s4z0LkYEDZdiYA22bLz2Ch4BM8keeFlzx6K3Md3NeHkmaqSzckpIljj0XKAAfi/0kOKi
         v4t8CYPhpP5Eqh1o7xtMIVXuf6p/cjA5EiE1Q60SfcvCbc+Ep+9RqYYEj3i0h7j0/0q3
         AwVv9pmVEHJuS5T5KP60sJ5n1TkCTZc2yY9V/qmECjY2/nW+nYog2cQM17baR+OMaADV
         5lzfseGxGTgWzWkX1L1Wy8nv9192BUXdjinqIH3VUVi+M2t1MXdDRCWqH43z3IL1Sp5E
         FdWw==
X-Forwarded-Encrypted: i=1; AJvYcCUWMNKk0bnsknn91mbHGDeXGW19/LMzJCMIbPYSzT/9sRqO1phiUOI7ya4/1t5tepdRaRNiQXjgTPG7@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Ywk/2+DvWe5l/Q5RnZdpyCK8dUoUcWe9yp+zAfdiiaogVxtMHpI
	ftNBhD0/6/l1X9sxV+pQa8kVljNArbPDMy2kvetwedeoyF5y5t0Su5k0yi2N2Qo=
X-Gm-Gg: ASbGnctEDJsLXHcK/5pcixkqdMtyaRa6f0SlArWlF7Bu0F0F+1F1kjdUtM9jNA7g0Eu
	SILA7QgBAlNkUwo1RCz9T+mh38hjPiIPYKBLGqaUWu0DxEQ3kPV6i/7xXxIYNoEF+aWYP/XfWXd
	b9xVFqHNRDGDxER1w11h5PPLYOCNbzrCfqi53mwsjSGXUotvhABuyCbmRJATOvbN0zk0Kjmr1yO
	VZlvU1ZMOXsNf3A33zVYAJWCWoPxqDpzj6E4J9dVb/NhyfI+vW/sojrs5dMz3RzIKseFsiO59hy
	9gdT1XHQr+eJOTqSyeIAJzaF/z0LA/kiIc8QDe9y1P6HKp4=
X-Google-Smtp-Source: AGHT+IG009jfgS7Y1rNm77MEBAZpvk+csfOSyOFqNcxON1KmaThlFkX95r4263wttZgsIJhefyFJoA==
X-Received: by 2002:a05:600c:548f:b0:43b:c0fa:f9bc with SMTP id 5b1f17b1804b1-43bd29c75famr57031165e9.12.1741263905515;
        Thu, 06 Mar 2025 04:25:05 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd947544sm18165635e9.35.2025.03.06.04.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 04:25:05 -0800 (PST)
Date: Thu, 6 Mar 2025 13:25:03 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
	David Gow <davidgow@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 1/3] printf: convert self-test to KUnit
Message-ID: <Z8mUH0comOCpycpK@pathway.suse.cz>
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-1-5db840301730@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-printf-kunit-convert-v5-1-5db840301730@gmail.com>

On Fri 2025-02-21 15:34:30, Tamir Duberstein wrote:
> Convert the printf() self-test to a KUnit test.
> 
> In the interest of keeping the patch reasonably-sized this doesn't
> refactor the tests into proper parameterized tests - it's all one big
> test case.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  Documentation/core-api/printk-formats.rst   |   4 +-
>  MAINTAINERS                                 |   2 +-
>  lib/Kconfig.debug                           |  12 +-
>  lib/Makefile                                |   1 -
>  lib/tests/Makefile                          |   1 +
>  lib/{test_printf.c => tests/printf_kunit.c} | 188 +++++++++++++++-------------
>  tools/testing/selftests/lib/config          |   1 -
>  tools/testing/selftests/lib/printf.sh       |   4 -
>  8 files changed, 117 insertions(+), 96 deletions(-)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index ecccc0473da9..4bdc394e86af 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -661,7 +661,7 @@ Do *not* use it from C.
>  Thanks
>  ======
>  
> -If you add other %p extensions, please extend <lib/test_printf.c> with
> -one or more test cases, if at all feasible.
> +If you add other %p extensions, please extend <lib/tests/printf_kunit.c>
> +with one or more test cases, if at all feasible.
>  
>  Thank you for your cooperation and attention.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f076360ce3c6..b051ccf6b276 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25510,8 +25510,8 @@ R:	Sergey Senozhatsky <senozhatsky@chromium.org>
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git
>  F:	Documentation/core-api/printk-formats.rst
> -F:	lib/test_printf.c
>  F:	lib/test_scanf.c
> +F:	lib/tests/printf_kunit.c
>  F:	lib/vsprintf.c
>  
>  VT1211 HARDWARE MONITOR DRIVER
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 7ddbfdacf895..d2b15f633227 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2436,6 +2436,15 @@ config ASYNC_RAID6_TEST
>  config TEST_HEXDUMP
>  	tristate "Test functions located in the hexdump module at runtime"
>  
> +config PRINTF_KUNIT_TEST
> +	tristate "KUnit test printf() family of functions at runtime" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  Enable this option to test the printf functions at runtime.
> +
> +	  If unsure, say N.
> +
>  config STRING_KUNIT_TEST
>  	tristate "KUnit test string functions at runtime" if !KUNIT_ALL_TESTS
>  	depends on KUNIT
> @@ -2449,9 +2458,6 @@ config STRING_HELPERS_KUNIT_TEST
>  config TEST_KSTRTOX
>  	tristate "Test kstrto*() family of functions at runtime"
>  
> -config TEST_PRINTF
> -	tristate "Test printf() family of functions at runtime"
> -
>  config TEST_SCANF
>  	tristate "Test scanf() family of functions at runtime"
>  
> diff --git a/lib/Makefile b/lib/Makefile
> index 961aef91d493..f31e6a3100ba 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -77,7 +77,6 @@ obj-$(CONFIG_TEST_RHASHTABLE) += test_rhashtable.o
>  obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_keys.o
>  obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_key_base.o
>  obj-$(CONFIG_TEST_DYNAMIC_DEBUG) += test_dynamic_debug.o
> -obj-$(CONFIG_TEST_PRINTF) += test_printf.o
>  obj-$(CONFIG_TEST_SCANF) += test_scanf.o
>  
>  obj-$(CONFIG_TEST_BITMAP) += test_bitmap.o
> diff --git a/lib/tests/Makefile b/lib/tests/Makefile
> index 8961fbcff7a4..183c6a838a5d 100644
> --- a/lib/tests/Makefile
> +++ b/lib/tests/Makefile
> @@ -30,6 +30,7 @@ obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
>  obj-$(CONFIG_MEMCPY_KUNIT_TEST) += memcpy_kunit.o
>  CFLAGS_overflow_kunit.o = $(call cc-disable-warning, tautological-constant-out-of-range-compare)
>  obj-$(CONFIG_OVERFLOW_KUNIT_TEST) += overflow_kunit.o
> +obj-$(CONFIG_PRINTF_KUNIT_TEST) += printf_kunit.o
>  obj-$(CONFIG_SIPHASH_KUNIT_TEST) += siphash_kunit.o
>  obj-$(CONFIG_SLUB_KUNIT_TEST) += slub_kunit.o
>  obj-$(CONFIG_TEST_SORT) += test_sort.o
> diff --git a/lib/test_printf.c b/lib/tests/printf_kunit.c
> similarity index 87%
> rename from lib/test_printf.c
> rename to lib/tests/printf_kunit.c
> index 59dbe4f9a4cb..287bbfb61148 100644
> --- a/lib/test_printf.c
> +++ b/lib/tests/printf_kunit.c
> @@ -3,9 +3,7 @@
>   * Test cases for printf facility.
>   */
>  
> -#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> -
> -#include <linux/init.h>
> +#include <kunit/test.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/printk.h>
> @@ -25,8 +23,6 @@
>  
>  #include <linux/property.h>
>  
> -#include "../tools/testing/selftests/kselftest_module.h"
> -
>  #define BUF_SIZE 256
>  #define PAD_SIZE 16
>  #define FILL_CHAR '$'
> @@ -37,12 +33,17 @@
>  	block \
>  	__diag_pop();
>  
> -KSTM_MODULE_GLOBALS();
> +static unsigned int total_tests;
> +
> +static char *test_buffer;
> +static char *alloced_buffer;
> +
> +static struct kunit *kunittest;
>  
> -static char *test_buffer __initdata;
> -static char *alloced_buffer __initdata;
> +#define tc_fail(fmt, ...) \
> +	KUNIT_FAIL(kunittest, fmt, ##__VA_ARGS__)
>  
> -static int __printf(4, 0) __init
> +static void __printf(4, 0)
>  do_test(int bufsize, const char *expect, int elen,
>  	const char *fmt, va_list ap)
>  {
> @@ -57,52 +58,50 @@ do_test(int bufsize, const char *expect, int elen,
>  	va_end(aq);
>  
>  	if (ret != elen) {
> -		pr_warn("vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d\n",
> +		tc_fail("vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d",

1. It looks a bit strange that the 1st patch replaces pr_warn() with
   tc_fail() which hides KUNIT_FAIL().

   And the 2nd patch replaces tc_fail() with KUNIT_FAIL().

   It looks like a non-necessary churn.

   It would be better to avoid the temporary "tc_fail" and swith to
   KUNIT_FAIL() already in this patch.

   I did not find any comment about this in the earier versions of the
   patchset.

   Is it just a result of the evolution of the patchset or
   is there any motivation for this?


2. What was the motivation to remove the trailing '\n', please?

   It actually makes a difference from the printk() POV. Messages without
   the trailing '\n' are _not_ flushed to the console until another
   message is added. The reason is that they might still be appended
   by pr_cont(). And printk() emits only complete lines to the
   console.

   In general, messages should include the trailing '\n' unless the
   code wants to append something later or the trailing '\n' is
   added by another layer of the code. It does not seem to be this case.


>  			bufsize, fmt, ret, elen);
> -		return 1;
> +		return;
>  	}

[...]

> @@ -842,13 +836,15 @@ test_pointer(void)
>  	fourcc_pointer();
>  }
>  
> -static void __init selftest(void)
> +static void printf_test(struct kunit *test)
>  {
>  	alloced_buffer = kmalloc(BUF_SIZE + 2*PAD_SIZE, GFP_KERNEL);
>  	if (!alloced_buffer)
>  		return;

I would use here:

	KUNIT_ASSERT_NOT_NULL(test, alloced_buffer);

And move the same change for the other kmalloc() location from
the 2nd patch.


>  	test_buffer = alloced_buffer + PAD_SIZE;
>  
> +	kunittest = test;
> +
>  	test_basic();
>  	test_number();
>  	test_string();


Otherwise, it looks good to me.

Best Regards,
Petr
