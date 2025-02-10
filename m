Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E59922257D
	for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Feb 2025 18:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211806; cv=none; b=fRUlaMowjrqleHKse6xaxIr5NCAWuBgiana+dMAjsyjIXOi9uyiO6xW+yUZVn252SNWIN0K3Nh2Tmwv1m/NseNCKM+6nzcuZ5MvA2fzKYJ9KChTgD+PSA1rxsoMQSEIIhmlCICmrE8Mjjc0KUFoZOCQicDP22rsSwOs1EKueITA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211806; c=relaxed/simple;
	bh=eqq5ajvjea3MeOhWfO3+dxXQWvINLCgWfRuHmU74dSs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FYyisZuZ6JxK6Z3eL41K+Y+ro+bzgxJnmNyy5l1HAiiVrkqZk5hyZ0W/uS4E6xog/LKX+VcnHqpASW3zEWHIm+gg0qwVs7Fjh2PmJSeQCO7gQ1rpQERbztVVmLwe7oEy8f0tShZzOnp9hE6d4qs1td7yygBK/Yl9hdVQvjypMuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyK36e3R; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyK36e3R"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e440e64249so51473816d6.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Feb 2025 10:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739211804; x=1739816604; darn=lists.linux-m68k.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zywqNIFDXEwlE7hLyD+JRB5FcKOg2ioCGIncmY+HT84=;
        b=WyK36e3R+DcPkM5IsAXaCXBG+L5w0K5Q9IPBR2ozxl5xnoLg6SbPoT4ELJrr/FsauX
         AGPqAYF49ZdnKhxhhRQenuox4ff53xt/Mys8+AAWxfLbuQtVHb7FaCRuyEmTYoEHx5Yb
         cJW7fXUylN/6W8PcGu/Giz3mtNWqfT/C4k/eHeO7CbAWQAePFNJbJwuVX6aJy+c8gbpZ
         P4Mkvj4f3Sf1fslQl7ZfC5Vo5i4KOxa9duGlzP+tXQKNeiUVNpMduu7xxfb64FWnn5jV
         XEqL816gUy1dK1beCjFQDP+JNOar5Xq1SHIW48FA1qKqSxJ1NWnzT0LTwzwZqAn+hpRO
         XDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211804; x=1739816604;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zywqNIFDXEwlE7hLyD+JRB5FcKOg2ioCGIncmY+HT84=;
        b=uIsXHOK6LHeXROKsuV4iA2u+JJt+bX2tHjZen0RgVqjMvMfOGqCDwE6toTu9h3f5dt
         OLHfrjFm3js+ApiNItRdZQz3RST98tv2QuL99P4TBDdhETEoQ2/WlIeHa7Hr05GgTcZs
         jlKo2mBBp2LpNCokOoq8ks3W+zloYl46mcu7RUwAFjzCHBebN7Jc3GABvGH0XudckB9f
         IX2g2xybOkVOcTzuLYKGDXa+r8eLNRW99CHNfeTTCtTr+Z9+tIOmTeTrYw31R6lEco92
         nZvXD5uM17m/tjEtpra1VytsswZbpAQqOZpcdm8ueuzb96eUmloLtV4oF8sl/9jHT0Aw
         6lKg==
X-Forwarded-Encrypted: i=1; AJvYcCWfODmI3vB4+35oCyEMS4wdiSwDQN/3xGKXK1E66dWhVDOYRTn+YHmJaTdv+iJWZEVnKx+/bnt5hndl@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw/et0pMmYVV5XkK5hW78jVcNmzR8XobNPM0eyaQa2QSgQo9gEw
	KUip06U+BKbeBqADwzEXHiPntcpgkfqeiEmKB6htEB7i53Mn1tTB
X-Gm-Gg: ASbGncutqqPC19btINxncF00624VDzfVAqMkJ2SO+5tefSHZKWtiYTs2ZoF5sKyQ4B3
	o8Zg0Xe5QNHSGsOyqeHoGUIi4DsdcyXYygEjfOPIpndysGS1Ixb6d0OPUvODLnSDQSiKtKjrTqx
	KlZjLRcv9oj57JaHK+4wj04uwcISdlcaXfwEuuWJZVN/eU/jhhwOODMWhsPgpSPo9NDd7WOfOrX
	IWaisNYMzGjIC/o1WdiHv1D4OIArMBOVm0Exvxqt90BcL6PXcIDdoCX3H0Jdo49AZXXYJ0MmwDF
	j+Mnz3fV7o4xXpKNhjCllhqkHpG8E5WwtGzv8dU6aQwnRlIdQU4jHj4CZeZYfqLp3rGLc5MOKS2
	S72MIi/MWGVvwQ0QFF4Ckibyu
X-Google-Smtp-Source: AGHT+IHJUbDxjdCsNNj+OQxZXpiKoN2yODdzK86kuSDraz80IM/wj9UOVb/ft5Ok46q9atDDV1Hi/g==
X-Received: by 2002:ad4:5dea:0:b0:6e4:29f5:b8b3 with SMTP id 6a1803df08f44-6e44562d887mr219755746d6.20.1739211804219;
        Mon, 10 Feb 2025 10:23:24 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:cc94])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e440d902d3sm45436456d6.7.2025.02.10.10.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:23:23 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v3 0/2] printf: convert self-test to KUnit
Date: Mon, 10 Feb 2025 13:23:21 -0500
Message-Id: <20250210-printf-kunit-convert-v3-0-ee6ac5500f5e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABlEqmcC/3XNTQ6CMBCG4auQrq1pp+UnrryHcVHKABO1JQUbD
 eHuFtyw0OX7JfPMzEYMhCM7ZTMLGGkk71KoQ8Zsb1yHnJrUDATkQirJh0Buavnt6Wji1ruIYeJ
 to4UEYwBtwdLpELCl18Zerql7Gicf3tuXKNf1C4LQv8EoueBoW1lXujC6wXP3MHQ/Wv9gKxhhj
 5R/EEiIyMsaVFWICtQeWZblA0B3Ep79AAAA
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
Tamir Duberstein (2):
      printf: convert self-test to KUnit
      printf: break kunit into test cases

 Documentation/core-api/printk-formats.rst |   2 +-
 MAINTAINERS                               |   2 +-
 lib/Kconfig.debug                         |  12 +-
 lib/Makefile                              |   2 +-
 lib/{test_printf.c => printf_kunit.c}     | 429 +++++++++++++-----------------
 tools/testing/selftests/lib/config        |   1 -
 tools/testing/selftests/lib/printf.sh     |   4 -
 7 files changed, 192 insertions(+), 260 deletions(-)
---
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250131-printf-kunit-convert-fd4012aa2ec6

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

