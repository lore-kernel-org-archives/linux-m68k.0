Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D50D357D17
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 21:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484879; cv=none; b=UcsyxrakYXJ1AK0QnJTpDsQ5XWAFTr7zEC/iBBk+wLfkAcb1hlz4RSVJRlDx4XvU5rUrRzv3xJxboaXdMRhn3p7d6mhyc/BNIjSXyqhEEnzwEXoaNjbAM8PZYZjVYeXaTk7WDRTtjRG/8Nh5X3NJsLzb2hkWeQJJFldCWJCoV70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484879; c=relaxed/simple;
	bh=607PZRxfa+d0wJhhAMLDIIXWE7/SzukS8j1t2iw47pE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N96M1asWFDirwzLDETxi6FIaZliRq1+RplSfkaVJciJvfmXOzmur9/D8QKPLS5BGkmsLgVbJRI/2B8vMQnHqgkqnX0OQNYSoTj4DaHuuJf3j5XjY00if2Bm8/v92op+BRWZK5Hi1u+XqRdshOJPHMmyYsIz7HHjDC0zp/c2dJHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=H4RC614l; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="H4RC614l"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4903fd19957so17751525e9.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 14:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484875; x=1780089675; darn=lists.linux-m68k.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3jZ2LpbUHZS3fbviqQINQwiQlZjuFtm/3mFTRxLA3Dk=;
        b=H4RC614ltl99zFYTcq5PIedtlKzHO6x/gWxwf3isAdU/OBEaVjo6Xw36th/8u/89h+
         4WUEPOkqWn+jWJwKUnYMFFBhBvkRwYI6nOGC5ogxt8F/aYJAZJ7wlO8IXtvanNPdOt+6
         T9x29AI+DrmDijCilBfVa2FYf2kIVnr/JRv8aDNDzAUft2DAC+UXflhwgj/LVYU0fV87
         yesxjYCxdKuuWu1yi9Oh+KcVD/UFYuA7BGrRvuR71DJSKdm/k103/0tJsAkZ4uVEUSYz
         Hog8PZZ/n5XLThdgBc96ZBkCJTVcwqQXRmziwtuCL0idHf1zYNnxzi2MezYDu57YGdnz
         DbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484875; x=1780089675;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jZ2LpbUHZS3fbviqQINQwiQlZjuFtm/3mFTRxLA3Dk=;
        b=BHu1N58LcVlH1YNPw8v+orbwjQBRruR2AdFiO/U6EtZ37dLsNDrKtSYUrQWtmlwGNK
         IM199Cxpx3bHbu3vxOyqtHxtcqA65xxgRAtJESCnzK4MxHXDlZj5LAfV6WfLc8S2J9tI
         Lw2KnH6ECUJybeTzccGmngeHH+N3FMKofLxK6rQ2KYxYJxRNzMr4Sh39XdPW9DPQfRQq
         1ESXVB89hAOPmymeeu2WCioachJTwwegV0qU51dX577RA1tIpBhD8mHanRf9BvNG93PV
         HgJkCKYPJhdVt+yc+ULth702GJiwVWMU0guevOdkTWcFVGKsDlh4xv/M+d0MzdfiixOe
         IePg==
X-Forwarded-Encrypted: i=1; AFNElJ+emK3O291ISPe+1Em+0qtB2Lc6keiisOXbroPqrvDzlbkRXv6SAjIGbbPazkGjie6b7jAyfvpDf5fb@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YySDFfLdonHBhytXsrw73UTXllL5bYCZHXoxZuljGkEqqD05QpP
	mSLTq8reFBxBvWEQwLlQ+1WjRTIi+KmSLAZah60B1vFW/JMkv8gsHXS7Lh/XAmp7rO8=
X-Gm-Gg: Acq92OEGR+xEZ1b42Tauqkr5sDTkM96zqhfUOlC1WTNDB+GCqJie6TOYBs9A5VeMOLY
	uFxGD/712eX2xPrqo67xwd6jjEazGgXydVaMIjuZv00wfZlkMaoWQA1u8rLlys3B7+qjC06RhMe
	A077Dj5eL2CvK1+uJvHSIb9ITjjae0rAioCBT5dtCzA1GkpjlUGmsKFZRGpmTVMGRqjQtqk0mIp
	QYZWiQFYIR0GTPp/j2I2HBI90AMffbsDqy9/Gm5z4aYJ8Ux5iqbVmemiPrP2tfQtl2ogy1FF5jh
	pxG+7Y022RoF4ZVXiFaLxy67jiNcRkggFNwdhUgeUmflqHJSMHTp14nGEcAcX32wFv50zXNisd5
	Ss/Dc0PTyBl6kv1mcYhSrXRIKa+ILuFnVtouK5x4uW2pavUxXS5RW91oG5Pe/bnryoHUeVyOawN
	K6wsXijpGKuRJULybPxO6RV6xasT+4O+k=
X-Received: by 2002:a05:600c:46cb:b0:489:1c1f:35f1 with SMTP id 5b1f17b1804b1-49042482762mr77587885e9.4.1779484875487;
        Fri, 22 May 2026 14:21:15 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:15 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v3 00/11] add mcf54415 DAC driver
Date: Fri, 22 May 2026 23:20:28 +0200
Message-Id: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOTU7DMBAF4KtUXmM0/kuTrnqPisVkPKYG2lR2C
 FRV7o6dLiqgiOWT5n1vLiJzipzFZnURiaeY43AswTysBO3x+Mwy+pKFBt2ANSA/4knm8YDpVUu
 PJNfQQLCd950NorROiUP8XMTd0zXn9/6FaaxMvdjHPA7pvExOut79rU9agmSDoW1asoBq2+P5L
 faJH2k4VG2pOmXuVwN5ZAcUnMLv1frbZG7rDuxvwhQCnLaoAiky6g6h/iFUIdq1JdOg7RT4H8Q
 8z1+hJ30XhAEAAA==
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
 arch/m68k/include/asm/m5441xsim.h   |  42 ++++++++
 drivers/iio/dac/Kconfig             |  11 ++
 drivers/iio/dac/Makefile            |   1 +
 drivers/iio/dac/mcf54415_dac.c      | 207 ++++++++++++++++++++++++++++++++++++
 7 files changed, 307 insertions(+), 24 deletions(-)
---
base-commit: 9edf4183f0d32146b708220d56ee2d35905ba516
change-id: 20260430-wip-stmark2-dac-7060f49dd94f

Best regards,
--  
Angelo Dureghello <adureghello@baylibre.com>

