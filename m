Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313C1241120
	for <linux-m68k@lists.linux-m68k.org>; Sat,  8 Feb 2025 17:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739037211; cv=none; b=mMUKtKPwwKOqdx1ZFDuq5piB9UXxQEL5IdH0m4zK5oAsZwK86R40KNSycProx0AJyWtjYBGnFCBehw9/qOKpeCqUC0a8iypuakDjcVZWODuQAZU8809eoUt15iEg3ArGZT1kbabpXtj7FXi+KZp9Q8X5FUwoFC1cdYxPb0xtl78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739037211; c=relaxed/simple;
	bh=u5KQrgj4hl5hhrtdAGh+wetosNfiX2i3D4EhPgaEPow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTfRVuQISrlX5nGdO7DZDqiVSsKwIz+vPjBI4TAYuIfJJUV4xbhYwo4X0Yq7uFGfCX799jI3SBQKwPZeJrKBLYWM7lrvh+nJ/g4cvG/iWH8pgYQwRJyLpIfyHIPhWrJKvEOVJlKFJcxOj74fy24UaMwzaGTWduXRgmDKmcgHhzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faV/gxSl; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faV/gxSl"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e46ac799015so2271669276.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 08 Feb 2025 09:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739037209; x=1739642009; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GWCLWUGpRzNN38qDSRAHapFkwtjzVMbT+fgTsmO02GE=;
        b=faV/gxSl1sDyiGY3jomxU89k7dLbysL9ZI1mNlrtUOQVoDHZvOTZvYqlY2Wuat7uZ4
         ipR3OsV1/FA5SBlqSl6NG0pFip2fGhOVB1SUxNqmMY6VPIkG2qLqYX96G9UTFt0ub2Pc
         x+uzET65zLlsZgqBaWGytpLPIMl8ptxAlULc9H/Qh26j+RRDvn1lJCWSbIFHfcu/wxB+
         KbD14Tmp/H9d9EA28PQptB8Emh/LmhU+TYzn+75ac9IGqs9hXZJE3GE8GMbRAjtT48h0
         DyIOxqVXU9NVeeXxGwiItK/sRx4X0kfrkrErYe/FJ4KRCVoyWcyJVld3+zNB4YCp/sx1
         VS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739037209; x=1739642009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWCLWUGpRzNN38qDSRAHapFkwtjzVMbT+fgTsmO02GE=;
        b=X19cjjmqWIXtBREAr+JSPPGYAaHe6Y4XWMIBaBfG/E1R4ytWfhBIOAz7vj2GcYxido
         zHaeX0M7BPpCFjSW5kPrvAjuVwXiVhUJaI6mnh+SbBIbhgLptxmZLfA2onT35CscVvuM
         d4qhRZ8rcNlyRjraEC4rpSSp6ugqt9bvioWn7CwZBfQe/mPmVSM5t6kt73jUlyGFJ6O0
         tV5NdA+Mod3x1cpZ7HwcUWK7V5EzipcX3IfvxQQw1gLatfDvx/EXS6g02vktVArMcRUX
         q6eYvWkCT/CSzBptqxVt3cKanA+A6oAJybSxmJrWR7cm60NcPyiHoMTDcKJltQO0a9QY
         T4Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUf2pLoB41y4fPsl35AJC4rSX80XrEdCq69ffshrjF+3ynxk90VaHH9rCWxxtH2tjTui+Ncn5c2X1rV@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyJjh1X6ek6J5MPMsOHK6UqsGBTFuYCyPeA075zcRf2QxuaiMIB
	J8CEArIJi9oZorPZn+bX0KFLRxDiVJ/N2sGK25p9FeBZATYO75R3
X-Gm-Gg: ASbGncvz6fWDSRUgSFBcVUnabap2ISQQeA6RmArt5IaQpEuCS80kwfd8HMVHkkexarY
	Mg53xsZI13/JuQ1NjNOPL2hVCpq2h3zWdiom78GWNPmocLGGW8RWH+2ekRlZ6tF5tz5U7REWZ4z
	qaCE0KC5Gk5VaZvKoEbaNgT1lesKyX/8bM0V9vfTGq9TvVG6y1RJEDPlWhdHqF0T4/2BXjC5oCU
	SzCM6Dx17pZSA/e0QYMk3Sr2m1C0T9sNu4WnoDdNwP7XNSXLfibioWED9DcJFSLJcXacNM1EfHj
	NzuordzTiuHC3mwZDGsFdo11eU3JpIYSrk0FiCTs+9vz1AxJjZE=
X-Google-Smtp-Source: AGHT+IGharplEze0gu0SCa8jNPf4PFwFx7r6QQdncnkwjNrUp7r48urY21da4KyUfmTiooRho9XVbw==
X-Received: by 2002:a05:690c:74c3:b0:6f6:cd43:5468 with SMTP id 00721157ae682-6f9b2a2165amr71225727b3.33.1739037208799;
        Sat, 08 Feb 2025 09:53:28 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fceff39sm9570747b3.19.2025.02.08.09.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 09:53:28 -0800 (PST)
Date: Sat, 8 Feb 2025 12:53:27 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: David Gow <davidgow@google.com>, John Hubbard <jhubbard@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/3] bitmap: convert self-test to KUnit
Message-ID: <Z6eaDuXnT_rjVSNS@thinkpad>
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>

On Fri, Feb 07, 2025 at 03:14:01PM -0500, Tamir Duberstein wrote:
> This is one of just 3 remaining "Test Module" kselftests (the others
> being printf and scanf), the rest having been converted to KUnit.
> 
> I tested this using:
> 
> $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 bitmap.
> 
> I've already sent out a conversion series for each of printf[0] and scanf[1].
> 
> There was a previous attempt[2] to do this in July 2024. Please bear
> with me as I try to understand and address the objections from that
> time. I've spoken with Muhammad Usama Anjum, the author of that series,
> and received their approval to "take over" this work. Here we go...

Take over means that you'd at least add the Co-developed-by tag.

> 
> On 7/26/24 11:45 PM, John Hubbard wrote:
> > 
> > This changes the situation from "works for Linus' tab completion
> > case", to "causes a tab completion problem"! :)
> > 
> > I think a tests/ subdir is how we eventually decided to do this [1],
> > right?
> > 
> > So:
> > 
> >     lib/tests/bitmap_kunit.c
> > 
> > [1] https://lore.kernel.org/20240724201354.make.730-kees@kernel.org
> 
> This is true and unfortunate, but not trivial to fix because new
> kallsyms tests were placed in lib/tests in commit 84b4a51fce4c
> ("selftests: add new kallsyms selftests")  *after* the KUnit filename
> best practices were adopted.
> 
> I propose that the KUnit maintainers blaze this trail using
> `string_kunit.c` which currently still lives in lib/ despite the KUnit
> docs giving it as an example at lib/tests/.
> 
> On 7/27/24 12:24 AM, Shuah Khan wrote:
> > 
> > This change will take away the ability to run bitmap tests during
> > boot on a non-kunit kernel.
> > 
> > Nack on this change. I wan to see all tests that are being removed
> > from lib because they have been converted - also it doesn't make
> > sense to convert some tests like this one that add the ability test
> > during boot.
> 
> This point was also discussed in another thread[3] in which:
> 
> On 7/27/24 12:35 AM, Shuah Khan wrote:
> > 
> > Please make sure you aren't taking away the ability to run these tests during
> > boot. 
> >
> > It doesn't make sense to convert every single test especially when it
> > is intended to be run during boot without dependencies - not as a kunit test
> > but a regression test during boot.
> > 
> > bitmap is one example - pay attention to the config help test - bitmap
> > one clearly states it runs regression testing during boot. Any test that
> > says that isn't a candidate for conversion.
> > 
> > I am going to nack any such conversions.
> 
> The crux of the argument seems to be that the config help text is taken
> to describe the author's intent with the fragment "at boot". I think
 
KUNIT is disabled in defconfig, at least on x86_64. It is also disabled
on my Ubuntu 24.04 machine. If I take your patches, I'll be unable to
boot-test bitmaps. Even worse, I'll be unable to build the standalone
test from sources as a module and load it later.

Or I misunderstand it, and there's a way to build some particular KUNIT
test without enabling KUNIT in config and/or re-compiling the whole kernel?
Please teach me, if so

Unless you give me a way to build and run the test in true
production environment, I'm not going with KUNITs. Sorry.

> this may be a case of confirmation bias: I see at least the following
> KUnit tests with "at boot" in their help text:
> - CPUMASK_KUNIT_TEST

This one doesn't count because the test was not converted, it's
originally written as a KUNIT test. I am happy when people bring new
tests in the most comfortable way for them, and I don't want to push
them to use this framework or another. So I didn't object, and I'm
thankful for this contribution to Sander.

> - BITFIELD_KUNIT

Same here. Plus, it was written long before I took over bitfields.

> - CHECKSUM_KUNIT
> - UTIL_MACROS_KUNIT

> It seems to me that the inference being made is that any test that runs
> "at boot" is intended to be run by both developers and users, but I find
> no evidence that bitmap in particular would ever provide additional
> value when run by users.

This is my evidence: sometimes people report performance or whatever
issues on their systems, suspecting bitmaps guilty. I ask them to run
the bitmap or find_bit test to narrow the problem. Sometimes I need to
test a hardware I have no access to, and I have to (kindly!) ask people
to build a small test and run it. I don't want to ask them to rebuild
the whole kernel, or even to build something else.

https://lore.kernel.org/all/YuWk3titnOiQACzC@yury-laptop/

> There's further discussion about KUnit not being "ideal for cases where
> people would want to check a subsystem on a running kernel", but I find
> no evidence that bitmap in particular is actually testing the running
> kernel; it is a unit test of the bitmap functions, which is also stated
> in the config help text.
> 
> David Gow made many of the same points in his final reply[4], which was
> never replied to.

Nice summary for the discussion. Unfortunately you missed my concerns.
Which are:

Pros:
 - Now we switch to KUNITs because KUNITs are so good

Cons:
 - Wipes git history;
 - Bloats the test's source code;
 - Adds dependencies;
 - Doesn't run on most popular distros and defconfig;

So, no.

Thanks,
Yury

> Link: https://lore.kernel.org/all/20250207-printf-kunit-convert-v2-0-057b23860823@gmail.com/T/#u [0]
> Link: https://lore.kernel.org/all/20250207-scanf-kunit-convert-v4-0-a23e2afaede8@gmail.com/T/#u [1]
> Link: https://lore.kernel.org/all/20240726110658.2281070-1-usama.anjum@collabora.com/T/#u [2]
> Link: https://lore.kernel.org/all/327831fb-47ab-4555-8f0b-19a8dbcaacd7@collabora.com/T/#u [3]
> Link: https://lore.kernel.org/all/CABVgOSmMoPD3JfzVd4VTkzGL2fZCo8LfwzaVSzeFimPrhgLa5w@mail.gmail.com/ [4]
> 
> Thanks for your attention.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> Tamir Duberstein (3):
>       bitmap: remove _check_eq_u32_array
>       bitmap: convert self-test to KUnit
>       bitmap: break kunit into test cases
> 
>  MAINTAINERS                           |   2 +-
>  arch/m68k/configs/amiga_defconfig     |   1 -
>  arch/m68k/configs/apollo_defconfig    |   1 -
>  arch/m68k/configs/atari_defconfig     |   1 -
>  arch/m68k/configs/bvme6000_defconfig  |   1 -
>  arch/m68k/configs/hp300_defconfig     |   1 -
>  arch/m68k/configs/mac_defconfig       |   1 -
>  arch/m68k/configs/multi_defconfig     |   1 -
>  arch/m68k/configs/mvme147_defconfig   |   1 -
>  arch/m68k/configs/mvme16x_defconfig   |   1 -
>  arch/m68k/configs/q40_defconfig       |   1 -
>  arch/m68k/configs/sun3_defconfig      |   1 -
>  arch/m68k/configs/sun3x_defconfig     |   1 -
>  arch/powerpc/configs/ppc64_defconfig  |   1 -
>  lib/Kconfig.debug                     |  24 +-
>  lib/Makefile                          |   2 +-
>  lib/{test_bitmap.c => bitmap_kunit.c} | 454 +++++++++++++---------------------
>  tools/testing/selftests/lib/bitmap.sh |   3 -
>  tools/testing/selftests/lib/config    |   1 -
>  19 files changed, 195 insertions(+), 304 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250207-bitmap-kunit-convert-92d3147b2eee
> 
> Best regards,
> -- 
> Tamir Duberstein <tamird@gmail.com>
