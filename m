Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FCE1940A1
	for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Feb 2025 21:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739569976; cv=none; b=cquowxHxIXxw6aOnhhT1HfAVwCy1vUQxj65udV495oz6IJGo0vRmhEvyKpEKlyn7BQt6WvGbXVf+HXTfqeovykdbVKbEC2NZ5Dxt4WOJ7nY2jEHuai0P9peoDoejNwrVeEWxVMKxqegC8ceMwBSsgGl3x/X1QIjBLW9wTw6JNR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739569976; c=relaxed/simple;
	bh=cYHXN4WirskhlsZE2ge7GTpevcXDyiKQeYIflIaEL8I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fuSQ+8DpLHCsNg8bhFyHaxk5UA85J3gR7M3yh7VtFI7k2VrGlWOY2W55JnZXM13fBbBOBb/V5G+ewMICzeV51CSPAbs04ztMwjxKIrUHZC5Q2LHcd8wE/JzCP1utrPkM/Uz6pcXn0JGoOkUILflNktvNGC/QPtrJeVavpRrcRG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sya8oPU+; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sya8oPU+"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6dcdf23b4edso22430086d6.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Feb 2025 13:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739569974; x=1740174774; darn=lists.linux-m68k.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oelTRyiq2uUQLScUvm+yzvdL+C/sBoOcsl6Ykq5dg44=;
        b=Sya8oPU+H3eU1ckvcSh+bD5Dx2zFozCTtFwOpMsWgXkDaIY1OahM3J5JIhKZwgWUMh
         g2yryap/9XbMmqyQfv8E3uXzmoq8lLIGss6WY0NcBEz5nyG1tTI+c3zRFAKUbXJp0ZdZ
         rofPz7h+12N/kbncOEJ0XhszMEhPDUBqhtAIBvpAQ6gonC7h7AnPCv/i2yW9qDmlvoRw
         j5aBn8lInls27v6YC2aRtwCTfZsfgaW1ITqnL9ksme0Tsp5ZtTFK7OoYFuAD6xElYbXh
         zOJOVlst7EQK+Ik0bdcww2PBCuY9oBEasTFpLrSs132mbP3CgrLZxgdRWirBJcSoZRZz
         fW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739569974; x=1740174774;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oelTRyiq2uUQLScUvm+yzvdL+C/sBoOcsl6Ykq5dg44=;
        b=UqyZPTkC4y1d8agDXOjV6Y0nqlpCYozo5SOzAZYtAQ1x0u9BoioMP8EqtQIdZYFpBw
         MPaOr1PZgBuNoRh0XACOiliIpKwQ1YnmrJMFVWYXafaMmsE6/gBIoCgoniZA8ohpCRZC
         GX81JOtSVjhHRdxadPffiYVv8pEFAV1fWahoDuFx57E8OVV+pzO04CxgCV50kU4Z91La
         wet14+B3EzaKO7qrTMl0IwFwVSDtje2RlBAfxzfCfK9d71Ian78/vBzlym8i6f+U3bN9
         wQnPD3c+xhbN/yBg3ACctNi+1wzHmrkQCY2uqvbU+xD0l9d6RUwzT7uqSdtqe4HIPKFX
         d0vw==
X-Forwarded-Encrypted: i=1; AJvYcCVw/9ufUQ2/qMf9T7oHrathkenmtqG0XTvK+fdscMLWQAJIg/4K7ApIbvc15Chr5JzfntFNgpK/YEFl@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwFwgih0mDntolG3MknaT7rOm7tX/zuAcDCNhYvW6K3mDc0YpA5
	aLa+XcD9xWXyq/ItR1DaWNWwvRpD7LrZ+QevrxbaJ7nmIhbTZj8n
X-Gm-Gg: ASbGncu9ODT0AeII6P7QA8MTNLLbxcRirkGf7t8SD2KVqbpQ/2GhhsKX/v2kcK9aC/R
	pFd3tRS0qSWsgejqAVEJQ4Z7Qaz92iDAGz2iW4l8/dOz0I68iAnqdR32rMtiG78QCZMLoxg6uwk
	NS8BkH4B0SRQCgs9X3FPAYPq819iL2jYIEdVmNhh6c4kK9yjwaKQGQvkICtaUaLUpQ31SJNh8er
	ra36GfvlcFo+0T1Z1pWtBFkMZTOMRC32NGEOA0Mi0bg0bZRpg6+ZN1iJitYoCFzFzRCmvPNMXhG
	RcnR1t7Xa33RC94r8QXI4RXvO+tqUhlmIJOouw==
X-Google-Smtp-Source: AGHT+IF4uKo/kzj1TcgrhYbwG/5VYUbRGcDZFwUtTMQKwOkAQIIBdKv6vbbSZxzo9Ggb97riNE72Rw==
X-Received: by 2002:a05:6214:5190:b0:6e6:617c:abb6 with SMTP id 6a1803df08f44-6e66cc7febdmr16020726d6.6.1739569973947;
        Fri, 14 Feb 2025 13:52:53 -0800 (PST)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:d4df:402c:65f0:87da])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471c2af3367sm21844451cf.59.2025.02.14.13.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 13:52:52 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v4 0/3] printf: convert self-test to KUnit
Date: Fri, 14 Feb 2025 16:52:38 -0500
Message-Id: <20250214-printf-kunit-convert-v4-0-c254572f1565@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACa7r2cC/3XOQQ7CIBAF0KsY1mKGAWrjynsYF0gHnai0oZVoT
 O8u1Y0aXf5J5v1/Fz0lpl6sZneRKHPPbSzBzGfCH1zck+SmZIGAFpRWskschyCPl8iD9G3MlAY
 ZGgMKnUPylSivXaLA1ye72ZZ84H5o0+3ZktV0fYEI5jeYlQRJPqhdbSpnGlrvz45PC9+exQRmf
 EeWfxAsCNjlDnVdQY36G9FviII/iJ6WUOW8tQDBfiwZx/EBRqyiUEIBAAA=
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
base-commit: 7b7a883c7f4de1ee5040bd1c32aabaafde54d209
change-id: 20250131-printf-kunit-convert-fd4012aa2ec6

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

