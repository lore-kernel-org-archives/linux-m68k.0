Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37E63E274E
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 07:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591854; cv=none; b=JfW09Dvmf4ItI2LVF3hklGEblRsthHrTsdX0+HAG71/n7WhApF/QeA6cZiixwlFT4Ck+nSZbp7GcSiQbgTP6vR/3PQk/6fFLgUXlLAY9rugvOjjC5JFpzYynHvzEN5ya+Db6J6vozEp9kNuo3YPQDiA76cK8yDfC1Qxk5TXaAM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591854; c=relaxed/simple;
	bh=8GOJ1bBhkXnXFQ/xtc+4fZdZejRnue5u+K5BgJsvQus=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jir2OE4AiJs3mFDcmgb7t5Cf3KK0pfdgP8A1aZA5NrVbwE2qKnYXhwgMDbY/mUMRiSy9m17NdBZQV88mAtNoi4tDf2EI8RjDanRegNF2lWGI5PavVi7dtaL+S///EeLRmp3AwHm7sTaBns3/2HymvOmd+V0OVyFtuoqyDNvN2vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTALNrVR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTALNrVR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so16747905e9.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 00:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591846; x=1789196646; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVDepIdvewIAkDae/qknvPHnA6zOWa1HlsWKZdzZmcw=;
        b=sTALNrVRrdkbxRiRUB9X29n+h+kHP817QvyXMB+M+/n0Q9nbxLS1ydnAhgPyuYq0S5
         erZnM7rn/EcfKXUJ+MfNw+4NFcwF1QqA88O566a/lP99I9aN5ar0MJ0HSXvBFOmIcFse
         MRMyaINPaNA6kWQofuHg9Vs3i1c8GwFwhpDVm5qC9yss2OV2soOxcIhenXotIbHmJZdI
         zeSuiT78BGAsW3Qs8r8TKHJfboVYSb5PQTsb7e1AY3RO4z0ZGwTWA6GLXgXMvgFROqDk
         NoYYvVg23420TDX5g+EJy+lvqFlzmAOqmH8aeX2jyn8hPZKOaRcQb1AtraZ7XjCBIo8M
         /THA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591846; x=1789196646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OVDepIdvewIAkDae/qknvPHnA6zOWa1HlsWKZdzZmcw=;
        b=kBULCRb1wtk15FsLZDFLWwH1DT2dGGnMRzgOyB3/X+C33TWw+SI4q/WMtv+9whOg9Q
         J+AvH4HwN5X8iEHiyrE7vUTA79a9Q09495ZEOioDlPVWe3Hw9p7IyNruAjyxiVlcwPh0
         Hz+15nhS5/cYKE+ZtTwusqw8vN2bh0335knWqWtD3V3fGiKJ6jluyoCbfQydZBhi78lp
         WHAMXxjElvIzbWXqjOMW2VVPqtYR/i+gybCgSju3t11Ql3lPD5bKoVc8axxRaXcOzsa6
         tzRBMJyDvmRiALRB+yRyiJUSuLSahnTbogNe5ZVo4xrZ5/Viv3BNgGl39jDq0MmQ1Fkg
         Za1Q==
X-Forwarded-Encrypted: i=1; AKwUvBw5vDnkPfeMaqoad82e20VegG8jqy1uDIKePHHS3nOnlsLC9P6k8QTWMbqdY+SzS264nGTJdHNzR1Zl@lists.linux-m68k.org
X-Gm-Message-State: AFuF++nea/pKRaV+rmPI0T+CagITdAitNv3WqDYMBelnOhPYTtyujlb2
	aXhYHMdoVDYiefCexMy8+OOHu9jGrK563gOgebZtr9YOWEmF85YkjolP
X-Gm-Gg: AYBFou0l2JZuGXJCBPyQBlK6TGom6CEuFrHFMgPnI7Qm/YDI6SIXZUgyDeP7+2bvk01
	jqWE1AnpwtPi9Q/EClxIREN2zPJ5xlTRTNN0WP4VdtOFWO52mWav490K8LgpHuTVCcOY+9C7MFA
	2U9XodeQ0oXpYg0jHB76uYUH8Y7ZsWJBFqlQzTBFuOK2MQSRYkX2Agob8b9q4+n90E9r2vNazk1
	6e1NBhDFH47sZuxxWRXh2B7n9BBp0RUXyw5MHyTuNygbFoM1JBmx9u62vnvV2UNIGMUpVbfGjAs
	ZZKhiM/el/El/nAJjV9xZGGt6EnWvNqDqq9kFPqSFEa06OwSQRL1nPsl97bo5duQxshIijW+uQd
	aUV/IAFk41cJ8oDv8fvBkcDv88Jneymjguw0ZM/kh9Yze4s+evmK10zwqR4awChPQAW4wfaqD9F
	UC4JbEJdKlLrlVbuyfmBFaerWP6py0t+ULC8mBkWhxb5DrYFomTjED/dlqZp2mV2rNjIHQgtdDw
	isiBNzZ+iCuWfie/FnUI2gbl2ui+Rfzc053KLmEhB9aUmtKpde+W2t9ltWBGF2/86JEZPBFKjwj
	yt6oxGJIcPK//MfRRJC+W9Ozz7M+ZHhtTMWO98Gur8RHvSz5nYXEm91PJqbDkbavTNy2aJxV
X-Received: by 2002:a05:600c:46d5:b0:49c:fc6c:be06 with SMTP id 5b1f17b1804b1-49cfc6cc142mr76992175e9.29.1788591845868;
        Sat, 05 Sep 2026 00:04:05 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:05 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org
Subject: [PATCH 6/9] docs: kernel-parameters: Drop the nomfgpt entry
Date: Sat,  5 Sep 2026 09:03:44 +0200
Message-Id: <20260905070347.25902-7-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nomfgpt went away with commit c95d1e53ed89 ("cs5535: drop the
Geode-specific MFGPT/GPIO code"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: c95d1e53ed89 ("cs5535: drop the Geode-specific MFGPT/GPIO code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2ed1e2c03c61..d44728a45506 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4553,9 +4553,6 @@ Kernel parameters
 
 	nomce		[X86-32] Disable Machine Check Exception
 
-	nomfgpt		[X86-32] Disable Multi-Function General Purpose
-			Timer usage (for AMD Geode machines).
-
 	nomodeset	Disable kernel modesetting. Most systems' firmware
 			sets up a display mode and provides framebuffer memory
 			for output. With nomodeset, DRM and fbdev drivers will
-- 
2.53.0

