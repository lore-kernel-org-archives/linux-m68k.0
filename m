Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6E833F8DC
	for <linux-m68k@lists.linux-m68k.org>; Wed,  1 Jul 2026 14:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915453; cv=none; b=DqILGu+gJ9BTx6PkM1Ky7X7gl3tuBqeLRVr5CWuGWTa+4qGwN5dCldK+FnYD870TovB1ftYOygqbdKLlWX72riOgB4ZCNa8UcRi672o9gWyP75Z5g8boOj1GCZikenO/td/DhTGc2grly9jxzq/GwbnadteL4cwKcdCQdNpHNP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915453; c=relaxed/simple;
	bh=uxpkze4mO0R/ciNnUW9aPg3o8zyZI3JR3YM28nP5gR4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ntW8hVCS+FochGzF8savFvWjibSeu6yVk3v61mO/A46Sz3xNHJK/Uu49ypborM0E7B66Pqyg2/QfHppeoHtUagJnbmIQFhkcmiroZ+nl0FmH/w7gshTXH2drSf2hFWdI4uIyqRghtZdy0xkL9zZsGpv9a1908BBUA/PBoj9e9EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RwSnm7IT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RwSnm7IT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493ba729dbdso3761555e9.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Jul 2026 07:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782915447; x=1783520247; darn=lists.linux-m68k.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZW8+spma2S67V6miLcBHdIf2ZY8X/GF3gl5p74l3kDU=;
        b=RwSnm7ITbR0XnSi/KBk7fGkCrq9ITZ0neyRflfiucy3RcTcsIjomMF0KAaU//GhwaG
         Fuvr4qHahOQVpFJxqP/+5f2frmLt2eEEEd5Cj0EQ5tCjojvlYX2952mynlKaS6OGXSeF
         X75KLn+RsUrGc4FFtSXTHTJdwdzcQ3FC7PERBcYOl9egUBlFmEe6e98I4rToSncHaAVQ
         2AJICFtDFok0sNooyVS0yQ17n1V7T+A6sID67GXoVf70boXGI+qEwercwEaBMNJgxpyD
         jWZJVspq/ntRFsyl3cHFDWlNp1bdhvzd+qUVear0u0ofpH3N5XeozFEk2LYAHRjmTcmF
         Iwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782915447; x=1783520247;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZW8+spma2S67V6miLcBHdIf2ZY8X/GF3gl5p74l3kDU=;
        b=j2PyIAgTcgLeXogQ3Ss3lV5rMEXT9c8iDFKOvrpSBaV8r3wWUyZamW/lnOgTqfptfH
         4/qaDbSbnR6Fd07HlKtIoUePPeyuHOY/bSt/c9Btxd/nu+z+jdoWuf2JJcNwUR+84Qse
         KboHTxKEbdD6jdPY63MHj+LQKPlwZgEIqnB2bBe0dEDcpqftQclXSyiSFjAKY3lux0TZ
         I2VUPU2lN2XXloZJ89PoJgM7XSpGpEr3Yrg5H7y3vcg9QPLFCXxUIlptko28W7u6O5y3
         wmrkFqQEcwm++YRHC1fABMvSO4wN3fPJsB0Xa4aumg7HrYOvMUictmCeB2ubFJkNYHQA
         THIg==
X-Forwarded-Encrypted: i=1; AFNElJ9aM1eT/H4LMx9iK4Kpbrtq/KJwCzbW6dOwpSZLcJqdKDRY6PZuC2ZBQznNXGSgKyaJbEB6g7H4QFoR@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwZewq0y32UC/2YWXO7ouMf2R0FeNWQPXOqxTEGoFnSZDGDIr9K
	zibJJ3syTt60I01NJukfeYU5T0wo5kVRqczG9XrEWyOTramVO1QpAEZobVm5h6fXl60=
X-Gm-Gg: AfdE7ckvp+ggUn3oOav+yroCoB6p52JxZ1qWUt2af6xB0NyMZV9jldAHgbosZVlF6C8
	bScMYAh02J4w2Q70zdrxp5ti/NO3Rzk7QZXICBC+vI0CuQYpgOiB3GTwrMtHv/ENo0XmdK6pi1u
	F/NQzXRyDnCBCpB10m5EJqO+spdyNq6RVSQFLBnchGXKWrIa75AnKxACBgfuOBJKKyGXPdYSzjB
	LBxh+kMVy/7vf2iK4s2L8EFEiAx0CDx0tqg8DqM+lOJ/TfA/uOovnWInWOanXRi8VB9cBwv4dny
	eILX0z9jaoV/d21AzSTRQ0whwgoeznD++MYOM/duVcka3wggvtKNJCr4XYsh5WdduZBMKipFlAN
	o6hmSrQuFK8dh/RPbP+VgoGdsSC7kHeMjmQqL7omqVNUrYfY9egoCFrr10duDqmU95ORX/Vrx0m
	WVV+YwEPb+JErGL9M8VwyMeitN+qH8OFpi0GUU/nhBSm7wvWOYRbL1
X-Received: by 2002:a05:600c:524a:b0:493:af0d:484c with SMTP id 5b1f17b1804b1-493c3df2fb5mr12527785e9.34.1782915447358;
        Wed, 01 Jul 2026 07:17:27 -0700 (PDT)
Received: from [192.168.0.2] (host93-7-32-195.dimensionesrl.eu. [195.32.7.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be81df2asm152552155e9.12.2026.07.01.07.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:17:26 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v7 0/2] add mcf54415 DAC driver
Date: Wed, 01 Jul 2026 16:17:22 +0200
Message-Id: <20260701-wip-stmark2-dac-v7-0-ff8fdcc8010a@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XRy07DMBAF0F+pssbI48c4YcV/IBbjFzXQpnJCo
 Kry7zhh0UJdsRxp7rmW59QMIacwNA+bU5PDlIbU78tg7jaN29L+JbDky9wILpArydlnOrBh3FF
 +E8yTY4Yjj6rzvlOxKalDDjF9reLT8888fNjX4MaFWTa2aRj7fFwrJ7Hs3dYnwTgLkmKLrVOc4
 NHS8T3ZHO5dv1u0NapB1qPReQqau6iBfkeXt03y3K65uiZkIbgWiiA6cPJWuxD1KKANnLzUhKb
 SDv+0QyFao5xEUh1wXyHUBSHhmlCFMAE1WSVA+xqhzwRC5QK6ENagbaVE9NpVCLwk2msCC6Fag
 +Ct7dD//Yt5nr8Bqq48OogCAAA=
X-Change-ID: 20260430-wip-stmark2-dac-7060f49dd94f
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Angelo Dureghello <adureghello@baylibre.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2

This patchset adds a minimalistic DAC driver for the NXP mcf54415/6/7/8
builtin DACs.

Currently the driver enables the raw write only. Feature as dma, sync, or
format are not supoprted for this version.

Additional options suppoerted by the DAC module will be added to the driver
later on, as needed.

The same patchset prepares the m68k/coldfire architecture to support
the driver.

Below some basic tests done on stmark2 mcf54415-based board, voltage check
on DAC0 and DAC1:

~ # cd /sys/bus/iio/devices/iio:device0/
/sys/bus/iio/devices/iio:device0 # ls
name               out_voltage_scale  uevent
out_voltage_raw    subsystem
/sys/bus/iio/devices/iio:device0 # cat name
mcf54415
/sys/bus/iio/devices/iio:device0 # echo 4095 > out_voltage_raw 
/sys/bus/iio/devices/iio:device0 # echo 2048 > out_voltage_raw 
/sys/bus/iio/devices/iio:device0 # echo 4096 > out_voltage_raw 
sh: write error: Invalid argument
/sys/bus/iio/devices/iio:device0 # cat out_voltage_raw 
2048
/sys/bus/iio/devices/iio:device0 # 

Same behavior for /sys/bus/iio/devices/iio:device1.

Generated a sine wave by shell script, sine shape is good.

is actually in progress:

Note: this patchset depends on mew mcf_read/mcf_write implementation that
Link: https://lore.kernel.org/linux-m68k/209d0653-6386-4b64-9e15-e358f84453ab@app.fastmail.com/T/#t
Link: https://lore.kernel.org/linux-m68k/20260506142644.3234270-2-gerg@kernel.org/
---
Changes in v7:
- keeping changelog in each single patch, where any
- Link to v6: https://patch.msgid.link/20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com

Changes in v6:
- Removed patches 1 to 8, already pushed in m68knommu for-next by
  Greg Ungerer <gerg@linux-m68k.org>
- keeping changelog in each single patch, where any
- Link to v5: https://patch.msgid.link/20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com

Changes in v5:
- keeping changelog in each single patch, where any
- Link to v4: https://patch.msgid.link/20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com

Changes in v4:
- keeping changelog in each single patch, where any
- Link to v3: https://patch.msgid.link/20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com

Changes in v3:
- keeping changelog in each single patch, where any
- Link to v2: https://patch.msgid.link/20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com

Changes in v2:
- keeping changelog in each single patch, where any
- Link to v1: https://patch.msgid.link/20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com

To: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
To: Nuno Sá <nuno.sa@analog.com>
To: Andy Shevchenko <andy@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-iio@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org

---
Angelo Dureghello (2):
      iio: dac: add mcf54415 DAC
      m68k: defconfig: update stmark2 defconfig

 arch/m68k/configs/stmark2_defconfig |   2 +
 drivers/iio/dac/Kconfig             |  11 +++
 drivers/iio/dac/Makefile            |   1 +
 drivers/iio/dac/mcf54415_dac.c      | 180 ++++++++++++++++++++++++++++++++++++
 4 files changed, 194 insertions(+)
---
base-commit: bc5a85a5441632f4bd7acd38620fdcbe4852a44f
change-id: 20260430-wip-stmark2-dac-7060f49dd94f

Best regards,
--  
Angelo Dureghello <adureghello@baylibre.com>

