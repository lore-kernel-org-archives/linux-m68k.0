Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7938C34041D
	for <linux-m68k@lists.linux-m68k.org>; Wed,  1 Jul 2026 14:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915455; cv=none; b=byjSYK2A2qHxjdIWoa0D+KAujdjVq7m75hUxFW8LAM+AgrqFs972+trfB3HAXPFk4oC1V6AED/irg+5P+VtuiJlSn8MdxZmkKVy0HwqwuwlRhlexQzzSprBNpYAwkRlNzsl5YvSs98dK7OS4hVk05XDQbH6qkQ+quYGPXueTY4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915455; c=relaxed/simple;
	bh=JjQuJ+WAC4HyNOpJNX50DDwFBWBZkz8SWnUBsgssTIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jnRKPiAcvnvL2r6u70YoohjuMwQtMUp6HHVPFu+njApV1yXF5M6DpM8i3b/yYnLjBci1VQK5QiA/jjtnyREwkWN1kDYv9hnkSjEqoKQKuq6XfM78x9NyiqXalF9nvTWNPCPDxrkROd4ZijM4410HiNDGv5XCBtXqNwUwBy3tuSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UQ/mZmp6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UQ/mZmp6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493bab44440so4295875e9.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Jul 2026 07:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782915450; x=1783520250; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=;
        b=UQ/mZmp63FPfyrFRXV+zNLlqOyXnLic4wZDDfM9faLinphzNtblErdlgL/ARmo9D+3
         xxXq1gvLHB8G7WthQ5tvMsJT8jKVx09FjjTWl+Z8WP8BUCJo7gWgTQ0DCfaZXaCVzCS5
         TaMOLW2F9b88qO1an6INMilXn1XPA4k53sTglUyDvWmmJZ9+IAAbY0JytsS0ntKhZcuq
         BWHJega+0hSHpc9Nv4UEDHh48sS0cL49eqIkagztvVafodlo5dC2MhYkPYnnaz1Xf9CA
         GjHDFO35O+ONXnG2DVFgIELACkcBIzizkgAFWwLCDWH0BR4t1arf+rO8FDWH/t3y0+vl
         jnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782915450; x=1783520250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=;
        b=P6TupmJYmwQxaCZrdEU/dcBv43mzds9XNJ1L4hHNHousqZZGxpcThbQdAmYw6h1XI7
         qVQNkt8nGevXtwdgRTktWVEUfezVrJcwb9qNZYSdm9tLFP0LYF7Nbo3hHooXaLGYsgLt
         OuZyQq6VQegiaIDLYdFZ/WCbiXRC/1zSg70xy/Ts/uVKzmH1R9VXYucABuVSorbFp1QM
         46gz4c8Yoi8kqcAVQKY5Xbg6atPK318e+LHbN09ZzsliDfXX8XfifRrjZ0FGFYPlZvu/
         gYy8sPPLes8AULJAOUaKNbSfTd6JsZUDCs/NqQg/W1Cx+Y/wTMICOhYNmjzzBJMuk9pO
         bKPg==
X-Forwarded-Encrypted: i=1; AFNElJ8rl0sAMig5dGEf8CgSEVPPu/jnoVQoGT9BUzjgkKwqSqtMeKswaXBU61ziW0VKFBNbqBU2g5bFbjKD@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxQuCziYAn1zIskOt18ABIRJlsCwYezWJjb0PwHIuo5wphNEQ6r
	akPtDidA8+c9kHg5Se8szigEI3StaApzRlx9L6gQcTKxHPPh7sU/gNWjewRrurLWwDA=
X-Gm-Gg: AfdE7clDgn6geaK+G/XUvALfIJoS7GlzRy8G9VXQoUHsq9835/QU20z66q+XrWX8wLc
	AXumg6dP503lrYEyY0ZcsJMoFt8P882mwWe8iq4k6NXm5Or6GRhkC5iTP8R3e3AQ5NLQnLoR0Y2
	KHjygpQ7F8ydbTSaKrWBLv6YjUqBqWWDd4Bwj3aUppWZFgeJ61tr7ODIubs2LhqWy/XTYzD/R23
	mlgEWWX66fauhNcj8RoyqRUqXdqSt8E4ATuRCDD2hNnlxl11n7T1n+hhPrjDxnzrvGPapjRuCwW
	mrTRUZl0BCxXKWyB5WYZezeCDmba+AaEzhmJm9VtvPLCsGP2H9DdVP3InJ9AKSAEoJAl66EcRpp
	bIrcAdK7Ufmbew5QcIKzaikdwhofw/Vv6IEnCGuCgprETPE3uWAMyjBZKRhKx/EPQw1mMZH2mW2
	ALVmigWiY5p/jNbhWpUTnX0HkjXOs65GWaAtdW7rRJn8yLoiGEJACt
X-Received: by 2002:a05:600c:4f83:b0:493:c064:316f with SMTP id 5b1f17b1804b1-493c230bb07mr25432565e9.3.1782915450355;
        Wed, 01 Jul 2026 07:17:30 -0700 (PDT)
Received: from [192.168.0.2] (host93-7-32-195.dimensionesrl.eu. [195.32.7.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be81df2asm152552155e9.12.2026.07.01.07.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:17:29 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 01 Jul 2026 16:17:24 +0200
Subject: [PATCH v7 2/2] m68k: defconfig: update stmark2 defconfig
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-wip-stmark2-dac-v7-2-ff8fdcc8010a@baylibre.com>
References: <20260701-wip-stmark2-dac-v7-0-ff8fdcc8010a@baylibre.com>
In-Reply-To: <20260701-wip-stmark2-dac-v7-0-ff8fdcc8010a@baylibre.com>
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
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2

From: Angelo Dureghello <adureghello@baylibre.com>

Update stmark2 defconfig enabling MCF5441X DACs.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes for v5:
- move this patch after new Kconfig symbols are added
---
 arch/m68k/configs/stmark2_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
index b3fb95f73a95..3941113bc60b 100644
--- a/arch/m68k/configs/stmark2_defconfig
+++ b/arch/m68k/configs/stmark2_defconfig
@@ -76,6 +76,8 @@ CONFIG_DMADEVICES=y
 CONFIG_MCF_EDMA=y
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_VHOST_MENU is not set
+CONFIG_IIO=y
+CONFIG_MCF54415_DAC=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y

-- 
2.54.0

