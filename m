Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95D619E98B
	for <linux-m68k@lists.linux-m68k.org>; Fri,  7 Feb 2025 20:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738959252; cv=none; b=qMEyNWQArlw8a/i2Dy9S12Q+kuWvP5js+ZbD+zckM5+9JXuyk5/ZZVRLaRsKNtjENSK81ylR8cvz9pjT0igJ+3+i7A6VsfUeN6AG0rzi5ZdboFcmuZx/knlLQ2dLSo+rhsbu9A7ZW35EpgMbecrBNaq8u9SfegpELRC3IZwH+gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738959252; c=relaxed/simple;
	bh=OIee8Zv7FJW8dLrmsyqrHqhnUwTu0qSp/jU2rKhNy7E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OrL0C84Ibx1oN/4IzLAbvCghJKIzSWR0iaOJafKxPZaQSludzSqWoKCHYqsSmLmI9obWrX8gNQ6q0TRMjDZc2uYyFmgtZwGLGtuh60I1y38GKxsOd01XlC3PyYSbiNpVMvgIywMlJ+N7a55YJ7NabOjut+twJUDdDxvtvp9A+9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THl9d69w; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THl9d69w"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6e9586b82so225297685a.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Feb 2025 12:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738959248; x=1739564048; darn=lists.linux-m68k.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=InMP3iob4ePV8GF0GnOu+F67bMQE3/48J3tUdjgvoYQ=;
        b=THl9d69wR2+UzsPGcx2kT3Lxj2aeL9xZ6nW9QDTu/9NfgOIjZ9LM4//fZorqnozhQq
         uI3USomTP3DnTjWyOs6GuzSBYzBuWxnlKw0RnC+5wcDSlL4De4gvk+4fbxO2Gr2qL9Sw
         AjVOLN1nb5AJTPV4h/Z6HcgZDRoJ25vDlWXdgVNx7CWslyFNLAUAsq99UEM8SworK8TQ
         1DXnXSBQY5WOyzzZYcwLK0or/isTj2dQtsBnS2rVAOnt8sn2SaF2SKGY8e9IAEcBNA7Z
         owfsy3vb4GGckIH/+wZJV5uRpglBP39BZIbNGvpr1+RfskxautVWpGcKTenChnUSiUQK
         Mnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738959248; x=1739564048;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InMP3iob4ePV8GF0GnOu+F67bMQE3/48J3tUdjgvoYQ=;
        b=ELvg1UAtG9fS7bqOQ9+fvGeOvCC1XFEIFcRLb1tSeifnqwShlurVxQk0Esgwdz2JLC
         1ppnJRPkU7uMwgFOlqDrqsh9Ak8oJFE5BT2s0z/mIotW7KS29plwcO1cHkM5gyxyMl1Z
         ctr7BAJawb+FAByMT/1+JeUsyAX0lqs6Mp/rRn1ntSr0D/CsAscnSUdK2nCEo6vz925P
         kwC/qgMbtxJzujnPmvyVvOEVjjS3oog6zZRMo/mxS2mJcR3p6DG/LuyRqyllb7aI5Rrf
         LUTBNiptyMJ4YBJc8f/LhsgDxu1OEq+L62qmqiAvOaU0UJzFRd26RUd62zvb3QJe99GI
         FUog==
X-Forwarded-Encrypted: i=1; AJvYcCXEgCtb5tLxWr2QawCO3sQtQ2cPA9v9fJxpE6Olk1wOv6SyNic+9IAg3g63y7g2HaJKAwhYhN02qw3C@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Ywa7uo+8iZjEKSV/k502gZOIM4MIcMx4MF32dDtfEbEHqXfTogy
	jplfGi8yKHw9trIda6634cfV/svIrq1YijdCdVj2GFR/9ZG5C/Sd
X-Gm-Gg: ASbGncvlWJojw0WBJVGYQ9S8zu23GOJjJYxoFSvzoFjn1y+6s3RlcNH7i1Cx245jBiP
	UGIisplsQXA1NdOKAnvrH2eQGS6HazAWN2lI8chnvJKxdiao24NdM7Cv8OWUhxS3HETWERltSMd
	bAjUuZWQajCKlbHU/Q1x5O1KFAMpHnqtCrR4BUpuahr4EqUGn4LMrV3TuMWFWF+E9VskOJJvnjb
	e3pLIdHstshWaba9KPq5yaHoQUpsFzS9rPvanXK88Uu/oebr2BtTpfv01OMo7FUFgKKnBAMd3bx
	0Z5S+FHq21mw54++yDFBtqsa7pOG1ZqP0xIaAVx+HyEfIZ9iCTn4/rSkfpl5zxl2U0wM3kCRVGp
	0bcbhzli5XMr8Nf/vJRrxWMlDomoftZcVbzJ6cA==
X-Google-Smtp-Source: AGHT+IF9/EZlG7CYstG/RAX4Cebsc2v6V7/CwkGisOAz02Bj/HKRkvBl3RnAIQYOfaIOw465jlPEvA==
X-Received: by 2002:a05:620a:40cc:b0:7b6:e9db:3b21 with SMTP id af79cd13be357-7c047bba9afmr576565385a.14.1738959248476;
        Fri, 07 Feb 2025 12:14:08 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4041:5be7:7c00:c58e:ed03:1b60:c56d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041e13895sm228851285a.58.2025.02.07.12.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:14:08 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH 0/3] bitmap: convert self-test to KUnit
Date: Fri, 07 Feb 2025 15:14:01 -0500
Message-Id: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIlppmcC/x3MQQqEMBAF0atIr6chtoo4VxlmEfWrjRgliSKId
 ze4fIuqiwK8ItA3u8jj0KCrS8g/GXWTdSNY+2QSI5URU3OrcbEbz7vTyN3qDvjIjfRFXtatAKC
 Ubh6Dnu/297/vByCSwpNmAAAA
X-Change-ID: 20250207-bitmap-kunit-convert-92d3147b2eee
To: David Gow <davidgow@google.com>, John Hubbard <jhubbard@nvidia.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Shuah Khan <shuah@kernel.org>, 
 Kees Cook <kees@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

This is one of just 3 remaining "Test Module" kselftests (the others
being printf and scanf), the rest having been converted to KUnit.

I tested this using:

$ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 bitmap.

I've already sent out a conversion series for each of printf[0] and scanf[1].

There was a previous attempt[2] to do this in July 2024. Please bear
with me as I try to understand and address the objections from that
time. I've spoken with Muhammad Usama Anjum, the author of that series,
and received their approval to "take over" this work. Here we go...

On 7/26/24 11:45 PM, John Hubbard wrote:
> 
> This changes the situation from "works for Linus' tab completion
> case", to "causes a tab completion problem"! :)
> 
> I think a tests/ subdir is how we eventually decided to do this [1],
> right?
> 
> So:
> 
>     lib/tests/bitmap_kunit.c
> 
> [1] https://lore.kernel.org/20240724201354.make.730-kees@kernel.org

This is true and unfortunate, but not trivial to fix because new
kallsyms tests were placed in lib/tests in commit 84b4a51fce4c
("selftests: add new kallsyms selftests")  *after* the KUnit filename
best practices were adopted.

I propose that the KUnit maintainers blaze this trail using
`string_kunit.c` which currently still lives in lib/ despite the KUnit
docs giving it as an example at lib/tests/.

On 7/27/24 12:24 AM, Shuah Khan wrote:
> 
> This change will take away the ability to run bitmap tests during
> boot on a non-kunit kernel.
> 
> Nack on this change. I wan to see all tests that are being removed
> from lib because they have been converted - also it doesn't make
> sense to convert some tests like this one that add the ability test
> during boot.

This point was also discussed in another thread[3] in which:

On 7/27/24 12:35 AM, Shuah Khan wrote:
> 
> Please make sure you aren't taking away the ability to run these tests during
> boot. 
>
> It doesn't make sense to convert every single test especially when it
> is intended to be run during boot without dependencies - not as a kunit test
> but a regression test during boot.
> 
> bitmap is one example - pay attention to the config help test - bitmap
> one clearly states it runs regression testing during boot. Any test that
> says that isn't a candidate for conversion.
> 
> I am going to nack any such conversions.

The crux of the argument seems to be that the config help text is taken
to describe the author's intent with the fragment "at boot". I think
this may be a case of confirmation bias: I see at least the following
KUnit tests with "at boot" in their help text:
- CPUMASK_KUNIT_TEST
- BITFIELD_KUNIT
- CHECKSUM_KUNIT
- UTIL_MACROS_KUNIT

It seems to me that the inference being made is that any test that runs
"at boot" is intended to be run by both developers and users, but I find
no evidence that bitmap in particular would ever provide additional
value when run by users.

There's further discussion about KUnit not being "ideal for cases where
people would want to check a subsystem on a running kernel", but I find
no evidence that bitmap in particular is actually testing the running
kernel; it is a unit test of the bitmap functions, which is also stated
in the config help text.

David Gow made many of the same points in his final reply[4], which was
never replied to.

Link: https://lore.kernel.org/all/20250207-printf-kunit-convert-v2-0-057b23860823@gmail.com/T/#u [0]
Link: https://lore.kernel.org/all/20250207-scanf-kunit-convert-v4-0-a23e2afaede8@gmail.com/T/#u [1]
Link: https://lore.kernel.org/all/20240726110658.2281070-1-usama.anjum@collabora.com/T/#u [2]
Link: https://lore.kernel.org/all/327831fb-47ab-4555-8f0b-19a8dbcaacd7@collabora.com/T/#u [3]
Link: https://lore.kernel.org/all/CABVgOSmMoPD3JfzVd4VTkzGL2fZCo8LfwzaVSzeFimPrhgLa5w@mail.gmail.com/ [4]

Thanks for your attention.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Tamir Duberstein (3):
      bitmap: remove _check_eq_u32_array
      bitmap: convert self-test to KUnit
      bitmap: break kunit into test cases

 MAINTAINERS                           |   2 +-
 arch/m68k/configs/amiga_defconfig     |   1 -
 arch/m68k/configs/apollo_defconfig    |   1 -
 arch/m68k/configs/atari_defconfig     |   1 -
 arch/m68k/configs/bvme6000_defconfig  |   1 -
 arch/m68k/configs/hp300_defconfig     |   1 -
 arch/m68k/configs/mac_defconfig       |   1 -
 arch/m68k/configs/multi_defconfig     |   1 -
 arch/m68k/configs/mvme147_defconfig   |   1 -
 arch/m68k/configs/mvme16x_defconfig   |   1 -
 arch/m68k/configs/q40_defconfig       |   1 -
 arch/m68k/configs/sun3_defconfig      |   1 -
 arch/m68k/configs/sun3x_defconfig     |   1 -
 arch/powerpc/configs/ppc64_defconfig  |   1 -
 lib/Kconfig.debug                     |  24 +-
 lib/Makefile                          |   2 +-
 lib/{test_bitmap.c => bitmap_kunit.c} | 454 +++++++++++++---------------------
 tools/testing/selftests/lib/bitmap.sh |   3 -
 tools/testing/selftests/lib/config    |   1 -
 19 files changed, 195 insertions(+), 304 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250207-bitmap-kunit-convert-92d3147b2eee

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

