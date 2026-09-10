Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3A236729C
	for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Sep 2026 01:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003994; cv=none; b=CRhUD0T3SwKYLVPKkrhnGPjGYs7Arnr5aJax4alAMBWhas4pJ0nBSfs8DkqfChpnhqaAW4dhS+QEAb469qIYirJcAh6FBdt/MTP2IkxtmBgBWfJoIizEcDbXnhcM2RByb47CqyJfnYQm7u0/9Ynayp2kSpXYB/PXPSpQYzpR4Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003994; c=relaxed/simple;
	bh=5mxh/fyf7zMbDCUOMNH4gIL5QaZHVPfDcaf33gQ9HIQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EoOWci2HZ8OuehBw2c5vLln0FobqiFEN23aQOg6Sm2Vj+/9p4O2jiJ/q2GTI7wJPpbyk9eOo2SL93/Z7sL00IzAfiWhn6hk5/rDNEyea685vfvteNYM4PKWiDi5/e8Wv7nzF4U9ifex72n13tLQ7KiRx7RR4LqPJzkAdqJG/dvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpBIG84R; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpBIG84R"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso9628155e9.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 09 Sep 2026 18:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003987; x=1789608787; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQdyP9lzK8puPxCmvP9p22b7bgDtVaxFnQRwYj/u0p8=;
        b=UpBIG84RMiNckvHQN7bgxYK+WESevU2kaUFADZFBVMK+9wKuzsul/Eumxo8CRLaCuO
         NE612kWhSm91KmuT+1O7o0Vy5yfD/8ZujmU78zADmtWHVDfuNZwyrSK+VQnVJ5XAsgpE
         PR75xue+PUAqNstASSDIiUQHWRJZthZFDIvgyRbQBrC15Xal/uUmLe+XVfKUeu4GUe1j
         /kR48A5AOewT6TqbQaIdYDP50tYH5r5xbmMrHsr0HsIBE8PIT4ygt84uOYrDb6yYkl6+
         Op7ur8KD61ifBZdHwtQM5OlMYvI+rtR3sAtd+jEeHDasZtaDYzan/i2C5qrloxAmtV5B
         DPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003987; x=1789608787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PQdyP9lzK8puPxCmvP9p22b7bgDtVaxFnQRwYj/u0p8=;
        b=MKsh446/32t8BxCzVT7IfM54Kx7IoU1E3ruqog7TDkAc7Q+xxu22dH8B0o0YYj5aiH
         2/+55VM1TMbQNzymGvxNNaK7S81U6/7+A/vR8DAbD7DmMqeNikduo8jqJ8X4xi4wV/u0
         BYMwimv4wcb3b4GkSnRrGHZFZo9sNNoIAblQVMozbf5bYZnV9WFPuuBsEDPYvpBl8z2S
         PDXgtns1/5udng6o21N/TkfOrgcTQG2VtZre8ndx99sw8HGJ2BgVHVHJYNwVeuHacfMp
         e7w3avsjHEeh53q38xIsW9a+MUdAYfkj+FnBzfNekT12m7OGK7anZOYaeV7xqWiDUdBk
         07Jg==
X-Forwarded-Encrypted: i=1; AKwUvBzI2Sw8SAWTsHki/zdTNEYVrMURWuouKtbl+pjXvpsiQzoyUJnhcxoIUNElYF0sQ++r9AjsEsFV15Zb@lists.linux-m68k.org
X-Gm-Message-State: AFuF++mMx8Ap4kotF3GWpcAuOUeJ2fvuaoybBMGhJhO0jLPErzm+gK+4
	bk2evyLrcRVgcEwzipeLs0CVAdrpjGlB+WTgw03sC+btIJsstUQ1Wwb5
X-Gm-Gg: AYBFou2QkAuGnzWWN8lIqSFgLP+MnVTvGLGpNp3ma0Q3TQnK4ux669WF9NcKWqKL89T
	JxcOwAQ6cNkS7Upz7bADM6w5ecJE6ExhA3p7naRVLtS7fCrAjJYavcY0TSVx2K1e7Bo7DM/XSLF
	hdlmgUocUceW5rxHIedv8Pm6Sgg0CCV/StbONUWTd6X3mlfeq+18eVnTtE0C+x2aJDOFe2bFcCP
	6UubUf4WSwZU27TjA/vlprFiHksdR+w6SIUagTLalwehJYP+97Q9rUWid+5DUZNLUq99FG6rzH4
	M0Ki9YZWypMUHRW8K3toHAhdyS9Be085CIyEsJlFT0uoLiA9quK4zdswHBeFNnfvwV959xvP23Y
	HDgXa++cNL8wiZ3sIQGcu8mOtqtlv2iwGc5ogirxC7KzXILju5HXllPU6XkIw0LQkyAy+2vhQKB
	jnBFkrPEBurhb8k7R3Zd3e1QSM0onUMlf++aT4FYDnm4KyoegRExM7mkBjthOzHReoAiQTyPdZn
	B3tC2XOe+flFF8tDiqd8zOB3lUlVRaZQvqnrwgwWsbK78bmp1abY70EzxysKt1MCSZ9RhWNDxtr
	BqFdptYQfqwTPPpVL30H0NYZvJQsm163x/jvwi6sn/Q9xyuufGXj7MNl0HO0nfQI/PweD2auGy1
	efw==
X-Received: by 2002:a05:600c:1e24:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49d259502f1mr79893755e9.16.1789003986665;
        Wed, 09 Sep 2026 18:33:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.33.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:33:06 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
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
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 7/8] docs: kernel-parameters: Drop the omap_mux= entry
Date: Thu, 10 Sep 2026 03:32:44 +0200
Message-Id: <20260910013245.8619-8-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910013245.8619-1-kmehltretter@gmail.com>
References: <20260910013245.8619-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

omap_mux= went away with commit e9f5f1e45608 ("ARM: OMAP2+: Remove
legacy mux code"); nothing parses it any more.

Drop the entry.

Fixes: e9f5f1e45608 ("ARM: OMAP2+: Remove legacy mux code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d44728a45506..48dd273eaf6c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4765,11 +4765,6 @@ Kernel parameters
 			waiting for the ACK, so if this is set too high
 			interrupts *may* be lost!
 
-	omap_mux=	[OMAP] Override bootloader pin multiplexing.
-			Format: <mux_mode0.mode_name=value>...
-			For example, to override I2C bus2:
-			omap_mux=i2c2_scl.i2c2_scl=0x100,i2c2_sda.i2c2_sda=0x100
-
 	onenand.bdry=	[HW,MTD] Flex-OneNAND Boundary Configuration
 
 			Format: [die0_boundary][,die0_lock][,die1_boundary][,die1_lock]
-- 
2.53.0
