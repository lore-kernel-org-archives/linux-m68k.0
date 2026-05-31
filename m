Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3138A3914E4
	for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 15:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780241173; cv=none; b=DRKXDnN5hOX0vuy+WGBNwkCRNTmSlAx8hQh6ftUKlgZHlMU5wjHKWLIMuvanZLo95maAI/KQCmYOl16U2rYB5frzm+ib+k0tm7nrLNjJjL6o1VBDvVsOWWcAuDFuROW5MgfyGhmTHwQmeCpDJ3+dY0bcH4FPcvfAaLgkUB9jqB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780241173; c=relaxed/simple;
	bh=48aemOcrWCaMuI9OaLb1kPeXmDDnY3b+T5yp/gEBE7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F70MX4USBjhqgxGWcs4KP8ZFvjWilU3qKvytANUkuV+c9mJSLBlJlthbaMxyvw36ta3vi9dZSdG/kL3D1E+MEkxiLMiqXTZ3WBY7GI1ZI+gRUhTT2njsLf80rlK2cKjeBLjc7xNpFnt/3DlX2zEJYNW8tWSN/L06urG5rCphj0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dKwi+Nk+; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dKwi+Nk+"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef1198766so1192247f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 08:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241168; x=1780845968; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PT9tXjqszedmkm8utnuW3FRNsoSqZ3umHWBcRjh1WUU=;
        b=dKwi+Nk+28bPUYrhZ5yJcUSM846p2KCf7q6ZUyMSZPik8MqTP6mH1Dme2KI02BVHb/
         5hZ9LyAZ32gfreZ969hHd3meVs1JM9wALr3ws8R1NFWfDzt7l6KKS3/SfPZZWyBaaK4W
         3lv0/YqHPm6zHW97nC1JVTZwpzKE1y45v7xC5Eu0k/1v0Km8OobWjqW/Wg1RFFsO/ux0
         4AdE0CtSGsVL0b8RN/O7wDpEyZcdn0m0y87ltUdVoLsCrbjV7NIzjcNrVQP3gymllPHu
         qp5/GIedth0dETsHu5Rj9ngWkBEQZzCdeZiBRk0NRaIRitIXGGmkoDlAbT0Q2oXyC0c6
         Z4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241168; x=1780845968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PT9tXjqszedmkm8utnuW3FRNsoSqZ3umHWBcRjh1WUU=;
        b=ZGXRYDz293Qilty+qU+t2PXh6AKqlNIVmBLc1fMfVGeBV/zuO8lB8v1Tf1Z9INtHOQ
         bf/aU/R7hMPE0UcFQvosILRAwtQ0VfXYjyFNYqRPS8guFgrlidpUJRWVBKxo39Y7teTN
         DieAqFH+Zbp/ukcdnT00l7zlyxx1Axus1bxvUWiuVqlCUuenihLNJclVEshlPOeqHwvH
         Q4ITEog04KasQmgtWkappYYqjM2g+ojNgmSrGCBCXheBDDkFsKsMlZLfK0AS+9QvAii4
         GBdLrr5m6CL9m8Tg190Ki26ezuTPjf4yL/ueuQGPLk6aukvfScr2yeOdhri5F+5pV2wQ
         jXEA==
X-Forwarded-Encrypted: i=1; AFNElJ+Ayptn2cwRp1eAAQSOc/RBsnnWTTlfoQHWdqm9MpQPQFCChBG4oCQ/oSE7OJE1czj30lHUg1gLNw71@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YygFeDB+D5NcXiiyVDo+TuOYJRO+E/icFk75bpTGn9kE83LEQ9H
	OBYc5qlzmtev4oqzDW6Dibv2E3mDge3E4oQjy/qRNaSEBxN3rAi2xl1Tvsf/uqSLCHw=
X-Gm-Gg: Acq92OEpUtVTsNOY1DQl4dqjS+3MrTB74Wk2iCtULmsTubQcB6YVLLni8FywyuagYAH
	90CqivsGRun0+D5zOSs7waAqVxz10WHH3ptcynIMHHCxHUCRK5IY6a0FnauzQrxLMv+eVk6LNjT
	zejI7XQn+h5HpO/PQv2+jjVofHclblEXPdnsDiucyVnJauEx7NFomEJZhpUab+cYbbWocDCAUFV
	0wDk7TwC5H9f6YYgbJPaUV5pTtlTSfVNOeflNX69XuFIpnnrcxlvCKsePEOv4pRrwEaE84nxQSc
	9OUCLF9zS4xhI2fj7o9MxigBKWcpVj9JmY72dTNJaL6jqiszE9TALQYz3mWDVzYHnTd+f7zmAdL
	ZeMfbcRLRxVjRKPBuYV9ix5ymFlclxIZ6adzfWOxYrBsWRQQUYJVq1PTchOAAtaDxlHzOqSYHUc
	JqplrGvzHVGuo5vCIeHX1GJyFs95VXqkp9d8gi7HbqfQ==
X-Received: by 2002:adf:eacc:0:b0:45e:dc0a:bcb with SMTP id ffacd0b85a97d-45ef1385deamr11155719f8f.22.1780241167790;
        Sun, 31 May 2026 08:26:07 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:26:07 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:26:02 +0200
Subject: [PATCH v4 09/11] m68k: stmark2: add mcf5441x DAC platform devices
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-wip-stmark2-dac-v4-9-7e65ab4215dd@baylibre.com>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
In-Reply-To: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
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

From: Angelo Dureghello <adureghello@baylibre.com>

Add mcf5441x DAC platform devices.

Reviewed-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- fix copy-paste error on naming
- use DEFINE_RES()
Changes in v3:
- simplified DACs as single resource entries in place of an array
---
 arch/m68k/coldfire/stmark2.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index 536252ccb87e..d3be4b2953fd 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -8,6 +8,7 @@
  * for more details.
  */
 
+#include <linux/ioport.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/partitions.h>
 #include <linux/spi/spi.h>
@@ -83,8 +84,28 @@ static struct platform_device dspi_spi0_device = {
 	},
 };
 
+static struct resource dac0_resource = DEFINE_RES_MEM(MCFDAC_BASE0, 0x100);
+
+static struct platform_device dac0_device = {
+	.name = "mcf54415_dac",
+	.id = 0,
+	.num_resources = 1,
+	.resource = &dac0_resource,
+};
+
+static struct resource dac1_resource = DEFINE_RES_MEM(MCFDAC_BASE1, 0x100);
+
+static struct platform_device dac1_device = {
+	.name = "mcf54415_dac",
+	.id = 1,
+	.num_resources = 1,
+	.resource = &dac1_resource,
+};
+
 static struct platform_device *stmark2_devices[] __initdata = {
 	&dspi_spi0_device,
+	&dac0_device,
+	&dac1_device,
 };
 
 /*

-- 
2.54.0

