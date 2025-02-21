Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4719E20013C
	for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Feb 2025 20:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740170077; cv=none; b=JX5ryZD77xyS18hRcO2kj66gHj20FX5ayFUWOwEARhfI+A9NmUJAyImOZ2XmGcP+xCPStObNi1jYIEGjjgRNEe9+v/I8xFe+//Y2dJ0RAz3W8UyJZU9Q2vap/AM8o9oGp/vSATw8VrIheEgiyWCX2Sypae3bYOaneulmxolk/v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740170077; c=relaxed/simple;
	bh=IjQZWCcChkAfXgxXMTbda7fIUbIn/z7Xqt4ADbGLfzc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=erieC/RnCsoh1mB0E9R07S4SlHipInHvb5Lib4NpoVtWuDNYoSb75VweGjy8P1VRdiTZNeHuPfeFlLVFYQwGVHrPReYqFP56ssisNiCKPmv4lZO6PunKjIaZmKTZeKDVEapgZIgg/+fuqe6+fbqknRZVbG//3xpSVW6v41IqtTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIQfnppF; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIQfnppF"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e670d29644so19855166d6.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Feb 2025 12:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740170075; x=1740774875; darn=lists.linux-m68k.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m2QU0nOb5+Ymoq25Hm5zfDRVAmAik5t7toGKHPu7gD4=;
        b=LIQfnppFxbtBEwDRJkHJUqs+dHGGDg1geYzHVOMr2NSVk+H0BRd/dDpuzFT1Fw1Vm8
         GgMHYB/iZZSt9oZyEZwvrj/1dYYnYvGdexpN3ML2aaKorbStRz5kvylVoC2wIXw6qTK5
         0KN4/Y3+hllOLfFSQz5Z3ZZgxMvF2HIXavAIjITHQHhd5kCYbCDkRSiX95Y0lpBf9jmr
         9lD5JUQTX11tgqeIjmbTEK3mPg1Xhv3E8niFZXkmckDKUEkFRJ+elKw94btgZPn4KDdL
         cjlH+XxASbN/gcLZGRpVTUdlEzwxScRxYHySEcaIidmkMtKTmUz7XAr+1uNwdq5uCysg
         CLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740170075; x=1740774875;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2QU0nOb5+Ymoq25Hm5zfDRVAmAik5t7toGKHPu7gD4=;
        b=w/8/WtjbBihT3YzD+OK+rs6et4sPma9wBmLGllc4BC9OelhXJBnnPOsPh98l87Pcwx
         R+EE4YbtzGNZHQ6I1DQbP03yUl157X5hpY7otCS6+/vDQ7J3A6LFSLube49socy/hlER
         07MBnRL/ARCjO6M1JsuJT+Mk6OCYvRlL/rg7/skhH++dxzk4ko31hHXY8OgEBYiYPR0u
         P6dgeBm3H21rhJSPCCEJCV/m4BTsOupMT25rLONhLbd2MzRh7zZG7Q5X7TwV68G05SIg
         kFpiqExqmsT8XtvaFja1o+i11zt7os2FKgPOKjkJ6YXyWbF5ZboP++0uykBNvplnkftj
         iXqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5CyH3jJ2jemULuugXVwbmOuSfbm2XpkeEb1UapkCgVGrM47Wemw2FNwO6DERrNQgZEFvyw86/WncU@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwRnOG2nb7ibgiYLXr9kDC3yt/RO1FeTRLKEOmX7Da9ZnxCKt1f
	JpGGkYuEl7ijTonNX2dlPZZXIsm0+VEDbzegyLqDB+cm5nv48twp
X-Gm-Gg: ASbGnctDoYDqrf240PYQ46UnJ/V+Yx5pAu5HsD/c9ZoFpE6TiBw+0IpB3E8KPXFJsCt
	JLBwcZRDVLiiIk9TK07QiRH7PHpX3cZIvX7bewDQ+kAJGHbOAZ8lbUUTpP63mBhAtbEunFxC3Zb
	897gzPo35xdNWvc6AByXUDDuaYnVZ08Slq+PaTJRsTgbyCqpgK/74t8VrdpEQJxpfLfZX4u4PQD
	8A8go9qbpjyegZ18im/wnPUOJ7HkjPyKDHWu0aPP3zQfBx8blh9X+tYbLo7oEhGXF8T39TQVh58
	fzGn5mKckfBQvHeml4ZeHEYP2Cy8hMCXMGSqY5fmIzp+TeENvA==
X-Google-Smtp-Source: AGHT+IHGad2s1TxSW80R91JGuuyplh1yLb8ON8Nsn5tAfbzywmLJ9mTYusIE0wz9lRGU2BfVKo1N8Q==
X-Received: by 2002:ad4:5aa8:0:b0:6d8:848e:76c8 with SMTP id 6a1803df08f44-6e6b01d78ddmr55815896d6.42.1740170075129;
        Fri, 21 Feb 2025 12:34:35 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:880f:47d4:56c6:b852])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d9f36easm101677546d6.74.2025.02.21.12.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:34:33 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v5 0/3] printf: convert self-test to KUnit
Date: Fri, 21 Feb 2025 15:34:29 -0500
Message-Id: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFXjuGcC/3XPwU7DMAwG4FeZcibIceK04sR7IA5Z6mwWLJ3SE
 oGmvjvpuFRAj78lf/59UxMX4Uk9HW6qcJVJxtwCPRxUPId8Yi1DywoBCYw1+lokz0m/fWSZdRx
 z5TLrNDgwGAJy9KqtXgsn+byzL68tn2Wax/J1v1LNOv0BEdz/YDUaNMdkjr3zwQ38fLoEeX+M4
 0WtYMUt0u0g2BCg7oi299Cj/Y3YDWJgB7FrE/YhEgEk+tPEbZG9d1xDIpKjDpMhT1tkWZZvvMB
 DE4cBAAA=
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
 linuxppc-dev@lists.ozlabs.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

This is one of just 3 remaining "Test Module" kselftests (the others
being bitmap and scanf), the rest having been converted to KUnit.

I tested this using:

$ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 printf

I have also sent out a series converting scanf[0].

Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-386d7c3ee714@gmail.com/T/#u [0]

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
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
 MAINTAINERS                                 |   2 +-
 lib/Kconfig.debug                           |  12 +-
 lib/Makefile                                |   1 -
 lib/tests/Makefile                          |   1 +
 lib/{test_printf.c => tests/printf_kunit.c} | 437 ++++++++++++----------------
 tools/testing/selftests/lib/config          |   1 -
 tools/testing/selftests/lib/printf.sh       |   4 -
 8 files changed, 200 insertions(+), 262 deletions(-)
---
base-commit: d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
change-id: 20250131-printf-kunit-convert-fd4012aa2ec6

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

