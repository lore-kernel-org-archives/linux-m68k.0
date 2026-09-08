Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A1951D526
	for <linux-m68k@lists.linux-m68k.org>; Tue,  8 Sep 2026 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860455; cv=none; b=DOMkzvnr/rSzrcvQIEhTt9tMnECvsqW/vX3zdDFqwgnqRGw1BMrF/w0Xu1CkSguP3ZTnSQLBpNOx8HaIECc32taKv6LvdYErs3n02qaDso8h4KW9sPDh5tvJM0o/z4W65FTkK9kq0p46+3mfA7lAQPBxc8a5QcfWSC+LQgL/nG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860455; c=relaxed/simple;
	bh=yV7fthqeihMaFTza7JqJdIeblZJsWjLB3f4+8mC5yxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JndtVFNaUcjLl61jayylfpB5+I3Ca3L+Q8XSzUujlrMzNynHBzw567XtXBLE8dHpn1mxV2wPDqIq65G8YXIOi7/k3IfEBJGuQMN2YavgiKJmgQOM+0aI6JLtlkEttNwHsEIrfGyw1SxiN/yU2EJdMLdY3AVW0Wqu3kwWsBX50hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjN+bcP1; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjN+bcP1"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so2874556a12.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 08 Sep 2026 02:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860453; x=1789465253; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bqYy1ey2qQ44WsfCEFpPhp0ddQp9qQBHXmGlUorARUU=;
        b=XjN+bcP1Wt96z9aWqRtgAStfoU54L+HN3ohM8zhsXUWP5X6NRlHPaMUNdDZo3gSdoW
         7/fAJn0/R7qpJEY7BxeUU0t/Ijun93rRMUWMCSWdMcskKDKAAhJcPpTQbRrHKFqV1Gy+
         ShCP+oENj7rw9jJNZk5rg18g//KuIK+7K8NAlCdtN5CHx0DeemD4ike+W+i871VQ9aAD
         jAQQ4wT278+VsdlF+X4RtCa8XA5VJuwY2inXfDl6uog5mlt8O63Eq9+kxeNiT21TjOzy
         lWc6Wen/5oFoF9ag9QtvOEfPz3H7vEVDmJ/G+gra8TfPd3XP9Td07q8UEe1YIzKc6AxO
         eroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860453; x=1789465253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bqYy1ey2qQ44WsfCEFpPhp0ddQp9qQBHXmGlUorARUU=;
        b=E/99bkAmZ00TOheCYMlXlxDohY4Nqyl66qFDnBcwPZqJmtXnqgaVtcMWTTKtMLGjp6
         Nchnx/NhoxTpVWyIEqtT8H9Gge3OCK29m/aoG85xcALCN9GDNFCPI6tGuJ+sz5p4uMEm
         pF/3DJWhLhUnvKsrIRolKw+Mb/26xoB3xly0Rkhe1w/6ZxZr29cXirmjBpw8bcExEDxu
         62cu+C/UGG9KPcb+fbp+k71B3P1KJtp3VpK2C6cNiAnAXl9WRUqjBMItIMqEcFLk4cOz
         WjWM6z9h28Jyb235uHeGJl/ztayRrQxwzFKZH95OqrdmOH+LGwk8+hTqSzsySJiPoO/7
         fFIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwz3prAwKLR2pDFvVtRwCyvpmy9svCwq7/7nXGF9MYttYI8nTV1qyVd0NxI5IzRqKYAZ+8kfQNBCev@lists.linux-m68k.org
X-Gm-Message-State: AFuF++n4B2pKrohhnpiFCaewKoSLeUiTvvuKtwrejeIwlmKvIH/lb800
	LPyijxVoIvdEP45ndGu6KrSG9hxE0tmHNGOx7g6wbqp273iSY/f0+Ito
X-Gm-Gg: AYBFou0rnhrLSNcTFDB2ZRxchDO7AhINO4E4ItcqQ8VMIBoHMr37jHDyPNjPf/1CwrV
	usfzK7bPIK1yrclc3/XEEK7gG2WcFmOvg3Ldw0zY30CGcvRV1w62bGNZCHUGZcgT0/OLLdIJkRz
	pzKEDEei+5+saCUX1r+pY+nchH6A87JeydSZ82js25SiVLDqSBntuDf5J6l7DUdGsqIrdZkCwCp
	wYL56ekegb1baYOjTlxAHBT3oXqrvhTjMcjjz84MF3eNguzdsY/m8EO4edkM5kh6k6oSIPBfHQN
	1l88VZfqTOBBpkXGZ6HSij112Cu0rQvD66vj2F6tpHMQCKc+/hVImM9DeL8E+8a67Qy9xFv3mUr
	u60rYk6tK2/3h8AmfOP0zmFWVpCIx1lL1kimC3oZUJzzuMFd8qfzVpH5LYJt31lZrBrWmD3jlun
	AeQFfq88FHzwETED0Sk/K69lePri2cHbcSmxY5YrztDejYmNsgdXpM9TVGJeMCBBI1hgITsH0nr
	aeOerHrv1lLi85IGAm0wd3KC28zw+sXx8i5WMXfA3u/4U+NIESLCBptSbwRbBLSiw==
X-Received: by 2002:a17:90b:264e:b0:398:9bd1:3215 with SMTP id 98e67ed59e1d1-39b262e28cdmr44675483a91.22.1788860453113;
        Tue, 08 Sep 2026 02:40:53 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm31999240a91.13.2026.09.08.02.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:40:52 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org,
	miodrag.dinic@mips.com
Cc: radu@rendec.net,
	zewenchen@google.com,
	jamiechen@google.com,
	edwardwchen@google.com,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 3/6] irqchip/goldfish-pic: Allow selecting CONFIG_GOLDFISH_PIC on other architectures
Date: Tue,  8 Sep 2026 09:40:13 +0000
Message-ID: <20260908094016.1997918-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260908094016.1997918-1-visitorckw@gmail.com>
References: <20260908094016.1997918-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the MIPS dependency from CONFIG_GOLDFISH_PIC so that other
architectures can use this driver. Also update the file header comment
to remove the MIPS reference.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/irqchip/Kconfig            | 2 +-
 drivers/irqchip/irq-goldfish-pic.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fbc51ee..a0f0f3a0e8ea 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -513,7 +513,7 @@ config MESON_IRQ_GPIO
 
 config GOLDFISH_PIC
        bool "Goldfish programmable interrupt controller"
-       depends on MIPS && (GOLDFISH || COMPILE_TEST)
+       depends on GOLDFISH || COMPILE_TEST
        select GENERIC_IRQ_CHIP
        select IRQ_DOMAIN
        help
diff --git a/drivers/irqchip/irq-goldfish-pic.c b/drivers/irqchip/irq-goldfish-pic.c
index 12113ca90872..8d40df0e3a88 100644
--- a/drivers/irqchip/irq-goldfish-pic.c
+++ b/drivers/irqchip/irq-goldfish-pic.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Driver for MIPS Goldfish Programmable Interrupt Controller.
+ * Driver for Goldfish Programmable Interrupt Controller.
  *
  * Author: Miodrag Dinic <miodrag.dinic@mips.com>
  */
-- 
2.55.0.979.g7e5102b832-goog

