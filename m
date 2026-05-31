Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A87623AB9D
	for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780241162; cv=none; b=sb8Or6K4d5vdbCIN9UR3mo9YcBWtw7GZW3t7dbkbwIgk18iKH1GNw7EmnfLWWaymQ33lW0ZlnPoN6DgfX1c+dEfs9W3qOqkwVdDJwjTPeiQiVWgAyHBxe578BGBynvXiX0L6nMwlyydLr5dB1baNPhJ92wFVDiYWR/X01EK4VKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780241162; c=relaxed/simple;
	bh=OLRn0WPuowOpGkcllj26gGYuNaltNJ82CwrGWLvsHkc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ByiMfzziRRu+zqtqC8LnVSc+PkuCnoIKJXA1F9enLDEx0v1zmmMYBNk+njWc4hVOH2u7AzBCrz7vigX/cJh/b79goL5/xfC2ulJFaTXrveYtWkJf6ea/ISv71eIZReGC30tKoJbkSKo5OGkYT/31BFdYpLjUiipViQBcjhVwSRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pdTQ/6Qz; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pdTQ/6Qz"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so584642f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 08:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241158; x=1780845958; darn=lists.linux-m68k.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DG2xp1hSIJeTvHYY9toNTecy4Wvd4sNJMjvyyolvm+4=;
        b=pdTQ/6Qz15pgvLtJZv6ZoabZmh5eRcwwGqzPks1WtFDdO6Hdm3O17xPBgAPa++i3KO
         p5XtXbeKfnPuyeLuh2IaMP99Qydd5/q5X5LHZ/Am0U6Pn5y+gFOZVgKpVyhFIvSxxZpJ
         emTQriMMytVP3mxqHgoNeaTNJa5ZTekHeFQ6atkWGkF/BqvWDmxDAwmtEApL5oW0/xN2
         YizOiwcERrvPVe48b9MoEGDsI2z9jzYYjsOM5cLxxM65oKkfFHNPevH9Q5O5YW+TbonX
         +2ADK2BveIiTjv3gPIYiIf7+8ZNLdJSxepDfLkQ/aEZHMnPl5LEoZ6x9ADIuKboScyiU
         OEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241158; x=1780845958;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DG2xp1hSIJeTvHYY9toNTecy4Wvd4sNJMjvyyolvm+4=;
        b=kx7voAdPbZvfMPAAjVifQ42cfUyicDxjgOSMtyZmK+QiR1gWiDqUo7tFMpKZfmDHyE
         1Geuyr58HnTJOxHDDxBUly65/+DxONYIErkOvtIkj2LcOA+aEH/NgmvS+QYZ4GJXWTEE
         /KaaplpcAbNznCgg7DcT7PN+iSvqtdm2/PSmMaLhY2sN6Pjf3i8cTfUEGUFPkF7SSZvB
         mniyi4Q8dLq/Aw1G47Pm294e8zTMjaLI28d6+1y8oE784aX+FfRwq+USIYq7hV4+F7xj
         j9WupJM/KthRxqy2yyHmciIHhAE14oWJ5VK/1FQEfS/47dO1Qb9zMUjWNIcIi7vpIhCL
         Z/qg==
X-Forwarded-Encrypted: i=1; AFNElJ9R1n+eDP+fPGpjHBkLR8h+6cxOEWrP7O8TA077vm4JBl9TvlF6ZHQOalig6JEcQ6HOol5GGAgNuKJq@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxn5GdprGvAPJgxFbXjh4qjW932jyv2McZK1LhiBmmb8PE8oBmd
	mSLxopMsj1zehUj31G7fJ53eKmRi4f0kknyo11clYBD314LsPCzuPCNXeBwjXJVMdR4=
X-Gm-Gg: Acq92OELR/no9y8olIPelOuO3Garpn/iYdotKSWH6b9z2u909en58p0bSfBOQEq82Od
	91MlYBQ6eSpRbJN06xlNq8hnS1UYLNEKAyYWl8wZKflZF5BCBh9B6nKn+IEC5shOcXdDiJqWOnn
	5DGEgDrxForjpIObAWNzAsZMzc9gv2Z60sWCPLf/3psvvnE2JBPKtUpEDIZ9VeSi2oq98f08hqJ
	L7k3ZLJ/kOTjpRh2flyDepUd56OGkka1UXq0wNn3CKs76Z272UeXN9DszI3TNYKL008+i1CF/c3
	8e0BQxahSXW4vUm3d0MfQb98UEemcYlLSRN10EIGqNfnQvA34dmueDMmHGlRqXKBPcqj0ufJDRC
	9mGalkU0Y7XPLiDgZ74HJqoB8TuTPXHwqjMeLzDP2+gke3eus0N/NfbCcHSfhru3KwuGfVmccIC
	waa8gcl6QrSs2Qv7UUAscmc2Blf+y6cwszDh1oXb4Fcw==
X-Received: by 2002:a05:6000:2581:b0:45e:f8d0:d22c with SMTP id ffacd0b85a97d-45ef8d0d485mr12474042f8f.25.1780241157769;
        Sun, 31 May 2026 08:25:57 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:25:57 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v4 00/11] add mcf54415 DAC driver
Date: Sun, 31 May 2026 17:25:53 +0200
Message-Id: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOzU7DMBAGX6XyGaP1bxJOvAfisFmvqYE2lR0CV
 ZV3xwkHBKTi+Ek7M3sRhXPiIu52F5F5SiUNxzrszU7QHo9PLFOoW2jQHqwB+Z5OsowHzC9aBiT
 ZgIdouxA6G0WlTplj+liND49fu7z1z0zjolku9qmMQz6vyUkvd9ftk5Yg2WBsfUsWUN33eH5Nf
 eZbGg6LbUWdMttopIDsgKJT+BNdfpvMd92B/aswVQFOW1SRFJlrda23UeV7BgzGoW826uqfuqq
 KtrFkPNpOQfilmOf5E18HIxq/AQAA
X-Change-ID: 20260430-wip-stmark2-dac-7060f49dd94f
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2

This patchset adds a minimalistic DAC driver for the NXP mcf54415/6/7/8
ibuiltin DACs.

Currently the driver enables the raw write only. Feature as dma, sync, or
format are not supoprted for this version.

Additional options suppoerted by the DAC module will be added to the driver
later on, as needed.

The same patchset prepares the m68k/coldfire architecture to support
the driver.

Below soem basic tests done on stmark2 mcf54415-based board, voltage check
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
Changes in v4:
- keeping changelog in each single patch, where any
- Link to v3: https://patch.msgid.link/20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com

Changes in v3:
- keeping changelog in each single patch, where any
- Link to v2: https://patch.msgid.link/20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com

Changes in v2:
- keeping changelog in each single patch, where any
- Link to v1: https://patch.msgid.link/20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com

To: Greg Ungerer <gerg@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
To: Steven King <sfking@fdwdc.com>
To: Arnd Bergmann <arnd@arndb.de>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
To: Nuno Sá <nuno.sa@analog.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-iio@vger.kernel.org

---
Angelo Dureghello (11):
      m68k: mcf5441x: fix clocks numbering
      m68k: mcf5441x: add clock for DAC channel 1
      m68k: mcf5441x: initialize DAC clocks by iio DAC driver name
      m68k: defconfig: update stmark2 defconfig
      m68k: add DAC modules base addresses
      m68k: mcf5441x: add CCM registers
      m68k: mcf5441x: add CCR MISCCR2 bitfields
      m68k: stmark2: use ioport.h macros for resources
      m68k: stmark2: add mcf5441x DAC platform devices
      m68k: stmark2: enable DACs outputs
      iio: dac: add mcf54415 DAC

 arch/m68k/coldfire/m5441x.c         |  21 ++--
 arch/m68k/coldfire/stmark2.c        |  47 +++++---
 arch/m68k/configs/stmark2_defconfig |   2 +
 arch/m68k/include/asm/m5441xsim.h   |  42 +++++++
 drivers/iio/dac/Kconfig             |  11 ++
 drivers/iio/dac/Makefile            |   1 +
 drivers/iio/dac/mcf54415_dac.c      | 211 ++++++++++++++++++++++++++++++++++++
 7 files changed, 311 insertions(+), 24 deletions(-)
---
base-commit: 9edf4183f0d32146b708220d56ee2d35905ba516
change-id: 20260430-wip-stmark2-dac-7060f49dd94f

Best regards,
--  
Angelo Dureghello <adureghello@baylibre.com>

