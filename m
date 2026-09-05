Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3CF41686D
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 09:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601645; cv=none; b=B/p3TcpROydu/HB0i5RWG36SgrrtCow83QscSSZigK8waXTS0bLRkgl53VsXeKgjM9osf7XzTml/FYEwFIGkWChZM1Skzb6L3I8ZCsceI+wIo1NAvXU5RqRRY7wBgwaBVbC2S0WL2wb3wX+o3wvHoIx5vAvtpUM8ew7vJjenQmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601645; c=relaxed/simple;
	bh=/cAOJWdBCi1HZBkEDQRQ71AKnd55wOx5U/6xyND51hI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fENXngzwFTY9E8Q3dXdE7k+uPrBf3iL9WaJc87BNJ6BmwuJS6G/HqDuNUTjy6ywkVAa92dvmm2NiRXZ+TzScmd2QrsYKTSv0dfHaJxNBlSUNCVE/nEUsat0mhW9eTp3Rr7JY1wQTURBNGZT/377WzQPV13kcm2dr8hLqbjztFj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SK0Fl/XN; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SK0Fl/XN"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48442ea8f59so2373663f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 02:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601629; x=1789206429; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UF/kDvW954cskV6VTtZlG+ZJZtMcv/59sgPBL3REqE=;
        b=SK0Fl/XNUDfUKxEY+SVEU6+TmOjgGrTt9ZthU7eAUUMroVHCMjsP4aXfgzDjkoVLsM
         ryRBAEODrWucUG/ARgqvdwrvcGlZgWQL1QWtxkI/zW+IUOaX5MCuZsmJF42Rt2rN1iFc
         tYAObktL41EIxXfxS0M+pRkaQAbni80WGHHDZtLzebJIjDYJLVVSZf8oyIWS+paywfRn
         p69Juu+Pm7g2Ci+srQW2TcYQ1xEfAvYtVr5GtjkkA+tAMPwNpMS3GY8DeXV0NUgdCmrB
         /ZSVSo3s4RG96SaBxPLVSE7O4wFj53mzhgZS9u96V0TzUndXJP00iSrYif6lHrHlljPv
         8gQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601629; x=1789206429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2UF/kDvW954cskV6VTtZlG+ZJZtMcv/59sgPBL3REqE=;
        b=ettb2vlutpLBbq6mFWxK/4l2FMfKmZIxtlXpQIb+LwJoIIZt/GHe/sR7rr2BXvd9dV
         1aVhqi8q+8XfWOSadzbccyQ/vGSp4yI/B7Ogeg5Tf60+LKqjaFhJsdZaSXgQEuWmlEWd
         cen0XDnNTZgdMXHpINUIihlANAj04xP/592sUASRrMikMxFNTO8lsnqAvuA/zFMHrub2
         FvAmV1iY4yklepbb02Qh1Nw0X8THDkQYs5nYFVBcZLR8mYukhapmSvyp6TSoOKDXzTFW
         gDrZyv2INfAtXUVPyH02PJy8qJ7iMLcai+js6CS3jbJz4YJDbwwahkZzAZyx2ivs6eDm
         Rg5w==
X-Forwarded-Encrypted: i=1; AKwUvBwsXxwit5LColyxoB+QElWEz0x3n4K8c+r25Z+ksSqdnIwe3o2QQKCUx3TXu7AeIxLkHLPeygZfCINr@lists.linux-m68k.org
X-Gm-Message-State: AFuF++l4BxEqBHFzxSPDzGl/djmvuI5CAltBU2jpV20UPkQxesiiMUMy
	OFwpAw1eg6X8GCatagzLT4f8wVP9GAmjC965eJ9brLRvkGviyGB5LZUb
X-Gm-Gg: AYBFou3GJqHWtKrO5hI+GPTNTAPfRurwY81+X931ETg4pDfqUjKC2p7WXYsHM8ZAtZL
	MVjMOy3Cx/FWMoYDzZLHIVKp5F2gJHjNcaLFY+cTI5yZqXHf83JBhPuGbfIdIsMvBxx8H2u8wP+
	GbGFOCauWVwleackhAtqi3fvpgHHrYPb3oD9+cv6MiIGIyJ/ezn8aHxHv5NWFEfJ/x9ZNmAIoyY
	LKPbMsb9seT8AvE4k/0kjlapxpVJ1Zp47S4DiUigtD8w6I86XdssFqT4Y/j8SYeoNwj6x4wfbWH
	UsYrLF5wOAtn885igUyhbMVYUUOy1EJspq/pvSSM+HiCN8ttEM5CShz26xl8tXdIsOOltXz6l4g
	9IOlApP+abE50/SmRtjCJ03ZjclOPE+TL/MnTCgCLa8T0RiQImksVGJiS2z3iJAWr8sUdEUzqzL
	61zTHVIUWh7b5qkHA8hJ4ZLgIPMOcyt4xXJFg+ra9MRV78S+gQoV6Ts7PHO+Il03lW3tAIWZ1V2
	6AJ5v8nX6kHpwjv6SSeIrHDu/ttmMPYjWyGM0zNINbw+aH1HdU0QiofnA+qsEDwnoF9W9E/nlyO
	+UxbwjeDBtOF+jmhNmS1r+/TCa4Ax+mxzldmJ87bkCl4RPf0cxcmN1+yhFtoD58zbVU=
X-Received: by 2002:a05:600c:3544:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49cf82bea0amr94305605e9.3.1788601629194;
        Sat, 05 Sep 2026 02:47:09 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:08 -0700 (PDT)
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
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 5/9] docs: kernel-parameters: Drop the mini2440= entry
Date: Sat,  5 Sep 2026 11:46:45 +0200
Message-Id: <20260905094649.41996-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

