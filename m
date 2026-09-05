Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ACD3DDAE9
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 07:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591853; cv=none; b=fP4aEAxlCvkiuKBwEvEJ4ui3u60epUZ9ptCGpBt4x3kxjrhGKnH9BD1dk8mzPsg8XIx00km5LEea0rLOaT/nzaLLt55XWZFLes8mcHQZau4cFVE091ooEdOSPi/Z4WNBhQGQpklt3AqZwVh/iJUTT2jlDpvwZYZ664dn3mPZDNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591853; c=relaxed/simple;
	bh=snUd49mCf7brp4BBjf0T9QYSF39uzje6kt3MIufRgeg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MaFzf2nkrwpeaw3zrBWCqlVBx7VoK60wi5wfXffh0HHfHTfROfhxEQt2DQJbJJNndqHMaGc0DgYcCsHJeOD9tEAEzAzItuS1r843uEoOkevkf6Fc4f8Az+FhpMGeIWgwSZhIlpYCAGUJawSqKk122OtgeFPQU2LaT86LYuCPfBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwqL0lx+; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwqL0lx+"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so1208114f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 00:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591844; x=1789196644; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5lgSAOpNjAXzpb467QfOiibQnaDkCl6BQceKsplpJE=;
        b=dwqL0lx+4VzNRS6Y9VVHErt6GklivJHjYj9TykWNetbGpdmP3u+KNY908u2RKJ/KHf
         ukC3ynM6+8Unukzex1dAbz0Vfv4iKaiKGQF/vtF/CQMsXK2cXRWaKRtjOauG4qMUnxS3
         CC5tgRdiLasKJLZDMNkViyalZFN53qWxD92DgyHD7Vdu+kThJ6W8fQY3lsHQGKGQI7L1
         Vdd6eo2OjCAPTNuzAjC6AfaKoYWAculS1v4eRKQul1IRMVgJiT5Z+ZumK85jsJvmhC4I
         z3ZabxEQzVnXLzIYvzcb2oqW+lz/wA5aRCPxhmLIyUsl/XgVxIDKMh4zKlfVX1hUwu80
         UHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591844; x=1789196644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j5lgSAOpNjAXzpb467QfOiibQnaDkCl6BQceKsplpJE=;
        b=fGateStUecOxuaWrOShDkvgkwzaaVSaT9Fpop5afjaLsajrQ7pNN/0eQjQrR23DdU8
         nwYeLAn1TIsV4PV5uG6SgmPGzWZKCb+bxJndCdj5s0XHE8PCP1AfsrB2QlC0Mg7mOxnJ
         5cqSRDitTH2Mwcabe1wrOF2ufE3g5MTmIA1zzSFNG3LHDfZKFYRBuk6DHD6EU7h12Rui
         XkQdz2V1Joj8vKZNkOT2yOLTI/WPDeBlmtELjiyyBeP3pX1ManTvy5X7TXMHKNtxbQoc
         7A7wtaRproEZ9SIl2z8d7QDwlEC/h1iR5tt6707J5oXkNCTXBVLWuONd+WYk9Y7sglFm
         FzGg==
X-Forwarded-Encrypted: i=1; AKwUvBwauCACb5KBJMPnKI1sIVq9vRmpudYdM6fg5JQuzhoRn5RgBh0oeQrkB6hsMcbEoHT1o+TqCePCycmH@lists.linux-m68k.org
X-Gm-Message-State: AFuF++nyJBqE8C3WckmiTp364iRWw6et68BjHMNWKdBTyIcXdyvaEhwr
	TVhtWLQyE7SKT2rDuHB3tCC3YXSXb5YSos/DXhfw9fWmcKBOKHKZjBQ7
X-Gm-Gg: AYBFou2UXxYpN4QjnoBtqj1tJCCXzd8p/4cUEBvEnehLm0bNSVVRnKbIafIBwT96mJ1
	bzYuLMh+T5kBfJjdF9RpFhMd4z48eq5/mqlMrReDdrYQ3FQ+tIF/W1MmYE7L16E/aRDZ2m4qdcr
	iyi+MG7NGo+ZazI2RvNzbY42JaKaCL4uf9pcf5rBu9408AlEcNN+dAHTYoyQfahoqxwH2AE9wxW
	uCq2NQkcn0BTRHePEJthhzbBTBsEo1cs4lBHmryPvDMvlHWVIS5V91+uUePKVcb9WKaoNaOAUhB
	rtHlimIRu+f+y2h3MbQYPZcQ0ssV73kNdqmFmt9cQdlnbg+E2ZtQbsvGU+sLogjDbeg6kMZ/h/j
	uUuqlmJ0wVOsTfu1mVC+jaZ14z+V1/0YELV2xme05s7KqTl46XwPS7+lM3+iPOeO/D4OI20TKyk
	tMX6z6L6qHM4+QgTi5vrwpSHozjmJsyZqzubh/yqJQQv/h1SB9oRC4L/KFlXb3rOpUh85yUujM8
	bw++qGlaU5O70IcyaMTkKivmCw/QbJq01/yjSP0UmnXOmv7CNVHSGy2yZNmD/JRvAa8X80FSzQa
	TRwE/AmXHOBFmDZ9EUxvUZ2r4W3FPEO1Mv/O23zt5UAggfAexWPmaNBJp+DHT0a3WeDTtkjN
X-Received: by 2002:a05:6000:1843:b0:485:8c17:9767 with SMTP id ffacd0b85a97d-4858c179a7emr8752866f8f.41.1788591844264;
        Sat, 05 Sep 2026 00:04:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:03 -0700 (PDT)
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
Subject: [PATCH 5/9] docs: kernel-parameters: Drop the mini2440= entry
Date: Sat,  5 Sep 2026 09:03:43 +0200
Message-Id: <20260905070347.25902-6-kmehltretter@gmail.com>
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

mini2440= went away with commit 61b7f8920b17 ("ARM: s3c: remove all
s3c24xx support"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f4314492953d..2ed1e2c03c61 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4052,27 +4052,6 @@ Kernel parameters
 			Enable or disable the microcode minimal revision
 			enforcement for the runtime microcode loader.
 
-	mini2440=	[ARM,HW,KNL]
-			Format:[0..2][b][c][t]
-			Default: "0tb"
-			MINI2440 configuration specification:
-			0 - The attached screen is the 3.5" TFT
-			1 - The attached screen is the 7" TFT
-			2 - The VGA Shield is attached (1024x768)
-			Leaving out the screen size parameter will not load
-			the TFT driver, and the framebuffer will be left
-			unconfigured.
-			b - Enable backlight. The TFT backlight pin will be
-			linked to the kernel VESA blanking code and a GPIO
-			LED. This parameter is not necessary when using the
-			VGA shield.
-			c - Enable the s3c camera interface.
-			t - Reserved for enabling touchscreen support. The
-			touchscreen support is not enabled in the mainstream
-			kernel as of 2.6.30, a preliminary port can be found
-			in the "bleeding edge" mini2440 support kernel at
-			https://repo.or.cz/w/linux-2.6/mini2440.git
-
 	mitigations=
 			[X86,PPC,S390,ARM64,EARLY] Control optional mitigations for
 			CPU vulnerabilities.  This is a set of curated,
-- 
2.53.0

