Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C031A9B34
	for <linux-m68k@lists.linux-m68k.org>; Fri,  7 Mar 2025 22:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741385396; cv=none; b=QkqbYNvs+wE512u0RBAakoHvHrs9VjzUNexFVdnI7HWklI1LOGRPABRvfLrq6kowuIgJSw+eLgWPXeF6ePap/gDpqnu4Zxj0B88sarS3wg+ohOdIa3N0nIiiza9Q69rJO9xlY3q58LY7kgTpt2XgNCn0s0sbp7MZzmoAYzrpqtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741385396; c=relaxed/simple;
	bh=SrDccJOqaJC+5/wA1pdnTwa1tJez7kYmHdz4b6r//PE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CnqY0j0hgcadM5dMZVxaKA7mZvHmm1+Sv0LWJUfUCNMQsd/zXmbZ51ANKCxdN5z5pI+S5mhhPfW7HbwVvJ2yd52d40hKxJ7MMRf5+kPlcl9E4k7nd9skLTbm6GISRtDIoPuzxLfDQW8jBmFzG8C1xI16Z9nXiIzHrOLzkfNJ098=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpFYpSGN; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpFYpSGN"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c3c9f7b1a6so229543185a.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Mar 2025 14:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741385394; x=1741990194; darn=lists.linux-m68k.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WQDcn8+Kkg+VJ3ToAm89lGpGIwYRFzkG+NUBWjAN8J8=;
        b=bpFYpSGNcqRoa4X0hXakMr1rgwDl79TGaXeFjN+BxqyEta2jOieSknTF1tx1ZjugFr
         9Np/x4RxgkqYs54zVXB6bSx52SbXqIicXV13MCRfvMUa3m1WxRo4Hb4B4PzQz6EYV4HU
         2JAZj2arJLY81/DKMJtipsfQME8I1O41q4sPODcHlOh+FbiH+16JYOXTma7kYU70P8G1
         kHVvPwo0n0PZsRBCdxY/xsIt6UEfuuG1AhuRGlg01VSTXz1+W34PKKQU7X79ForN2F/y
         5IzUbg9KX/t4G+zb34QJyBMpM/F5cwVjVp0hLF+96h9tcQAAChV/1D9m99dfTQRYZrYL
         zRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741385394; x=1741990194;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQDcn8+Kkg+VJ3ToAm89lGpGIwYRFzkG+NUBWjAN8J8=;
        b=gnIe2VnukutSIgrFEdSQqfuqf0t1LPqg+JqvlcKBYuQrI6hNOrDi/vz9+N7AQQgOdA
         OrfAibw9Y1gdEYKOKT2pJgOCZH5GsAaCF4bDXRDvqVNWKBwcwTt3iK28V20tyyqaEb2F
         w6TeFUXPKiezIshoITrlAS4+ufHI15lHWz5whz9BCdRNit0N7jcULe+t6bnbSFTX0iWO
         OhLgA4eaVgy2Rx48yy0/o4m+v8XwYfDkeSySCOqDjkPrZRjfiSNDVfPCuz+bPp80vl+i
         St1Ects3W5awaPWdZyM6kSjF2EEJXn7ftYuGgL0LsNS3LzQT4ehdsLwcrHKRwCEFoKlo
         vJ4w==
X-Forwarded-Encrypted: i=1; AJvYcCXgHS8Z9yL5KzZAFRMdKVDPLrJVPLi0vsqmqYGUvLuqzHoYjDOotf5XlWH4/ijR/sORhh80YxNbAPHb@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yyi8iwjoQbrjd8+0D7qKpqYjZ93ZN4x8Q7sWI9HDVZ8aqVwyVcM
	RRWH6Q9h1tYvi4xFVnie+5mdsL7c4ScVpi7ju+vtGIKRGLEQWDOu
X-Gm-Gg: ASbGnct/G5JJ1pWzIxEqWEZcUvnmBlk14Q+qjlFahvv5TLjoLOiyFcqQyL0FobQhHKz
	HkX3+0vT5A8gGq6Jqagkz5mpzaR5g1xsWGg5Pb1pqg4Iy7Z2pwTtbylcGGc8QCiiVJ48fh9SOza
	Lm33uwPrdThoeQXix9TKHSladPKn7SUmz+bDsus599EDu3XdEY8GztgpTk2przXFyQLz0Ldd7WS
	0mu48+2Q/ettFIboEaScJ9lrTZK8gHKv9YiSUtEwvoDA6XYTOiXfzFoKGiBPMRrdN5qd1eVbJ3n
	S9jIot6yd685guG177DaZlSGnMQffrgQwhnLDBulcYjPLXWmSxexe6En+0ILIxyWPzfEnaHms0L
	R
X-Google-Smtp-Source: AGHT+IGQES6u145PCL7njlniOUgI19DACMWBXh7cghgv/R6KrBR+utSuxWgPw2eW3fPWcgc8Tk2fOA==
X-Received: by 2002:a05:620a:4c8a:b0:7c5:3da4:5bed with SMTP id af79cd13be357-7c53da45ccamr69321485a.17.1741385393990;
        Fri, 07 Mar 2025 14:09:53 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([2600:4041:5be7:7c00:f0dd:49a0:8ab6:b3b6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e533a095sm295001385a.3.2025.03.07.14.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 14:09:53 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v6 0/3] printf: convert self-test to KUnit
Date: Fri, 07 Mar 2025 17:08:55 -0500
Message-Id: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHduy2cC/3XQzW7DIAwH8FepOI/JGEyinfoeUw+UmBZtJRXJU
 Kcq7z7SXVC3HP+W/PPHXUycI0/ibXcXmUuc4phqsC874c8unVjGoWaBgARKK3nNMc1BfnylOEs
 /psJ5lmEwoNA5ZG9Fbb1mDvH2YN8PNZ/jNI/5+zGlqLX6CyKY/8GiJEj2QR17Y50ZeH+6uPj56
 seLWMGCLdJtIFgRoO6IurfQo35GdIMo2ED0uglb54kAAv3ZxLTI1jmmIh7JUIdBkaVnhBoEN55
 cqCI01I+ABtVpaJFlWX4A+w6Oo8wBAAA=
X-Change-ID: 20250131-printf-kunit-convert-fd4012aa2ec6
To: Arpitha Raghunandan <98.arpi@gmail.com>, 
 David Gow <davidgow@google.com>, Petr Mladek <pmladek@suse.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linuxppc-dev@lists.ozlabs.org, workflows@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

This is one of just 3 remaining "Test Module" kselftests (the others
being bitmap and scanf), the rest having been converted to KUnit.

I tested this using:

$ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 printf

I have also sent out a series converting scanf[0].

Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-386d7c3ee714@gmail.com/T/#u [0]

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v6:
- Use __printf correctly on `__test`. (Petr Mladek)
- Rebase on linux-next.
- Remove leftover references to `printf.sh`.
- Update comment in `hash_pointer`. (Petr Mladek)
- Avoid overrun in `KUNIT_EXPECT_MEMNEQ`. (Petr Mladek)
- Restore trailing newlines on printk strings and add some missing ones.
  (Petr Mladek)
- Use `kunit_skip` on not-yet-initialized crng. (Petr Mladek)
- Link to v5: https://lore.kernel.org/r/20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com

Changes in v5:
- Update `do_test` `__printf` annotation (Rasmus Villemoes).
- Link to v4: https://lore.kernel.org/r/20250214-printf-kunit-convert-v4-0-c254572f1565@gmail.com

Changes in v4:
- Add patch "implicate test line in failure messages".
- Rebase on linux-next, move scanf_kunit.c into lib/tests/.
- Link to v3: https://lore.kernel.org/r/20250210-printf-kunit-convert-v3-0-ee6ac5500f5e@gmail.com

Changes in v3:
- Remove extraneous trailing newlines from failure messages.
- Replace `pr_warn` with `kunit_warn`.
- Drop arch changes.
- Remove KUnit boilerplate from CONFIG_PRINTF_KUNIT_TEST help text.
- Restore `total_tests` counting.
- Remove tc_fail macro in last patch.
- Link to v2: https://lore.kernel.org/r/20250207-printf-kunit-convert-v2-0-057b23860823@gmail.com

Changes in v2:
- Incorporate code review from prior work[0] by Arpitha Raghunandan.
- Link to v1: https://lore.kernel.org/r/20250204-printf-kunit-convert-v1-0-ecf1b846a4de@gmail.com

Link: https://lore.kernel.org/lkml/20200817043028.76502-1-98.arpi@gmail.com/t/#u [0]

---
Tamir Duberstein (3):
      printf: convert self-test to KUnit
      printf: break kunit into test cases
      printf: implicate test line in failure messages

 Documentation/core-api/printk-formats.rst   |   4 +-
 Documentation/dev-tools/kselftest.rst       |   2 +-
 MAINTAINERS                                 |   2 +-
 lib/Kconfig.debug                           |  12 +-
 lib/Makefile                                |   1 -
 lib/tests/Makefile                          |   1 +
 lib/{test_printf.c => tests/printf_kunit.c} | 442 ++++++++++++----------------
 tools/testing/selftests/kselftest/module.sh |   2 +-
 tools/testing/selftests/lib/Makefile        |   2 +-
 tools/testing/selftests/lib/config          |   1 -
 tools/testing/selftests/lib/printf.sh       |   4 -
 11 files changed, 207 insertions(+), 266 deletions(-)
---
base-commit: 7ec162622e66a4ff886f8f28712ea1b13069e1aa
change-id: 20250131-printf-kunit-convert-fd4012aa2ec6

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

