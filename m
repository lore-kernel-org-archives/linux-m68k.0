Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EEE368964
	for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Sep 2026 01:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003989; cv=none; b=tPTMScI1eYNvoRXS+8OAHf5/fLei8HnWUOKu9hKIdHFWCxFFLd3Y1WlTIYT7ZlzOWDZh2pagncxWedY8xPNvpQx+KPAIluQ0YbiMBVLhD/RNj5OYa/5VPJXAX3rJSVDLyzBHuoyMWjdKDfSSZAYGmehcEgHEjtpf5ZZYv+YinbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003989; c=relaxed/simple;
	bh=wMHs/iq23jFT//QzJfBpBUbxOI7qz5njBBA7AJ564ek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mW9/UECw7WidjNFHUmqmywY9csRzuu3J8emWoTqeY/Bo87QOj5GZ71B414IKUbQysCbC41asG2QTwiTPpO8QqNerCf/QEGXaUhfyHewbng2+lz+yQ6XcPyeXUlzoL6ecs+44B24iFB317XyeUv0zAokXazZSMAhDO9B66QNlb0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPnSpbN1; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPnSpbN1"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so10128495e9.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 09 Sep 2026 18:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003983; x=1789608783; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mNvpcd2n4jxJTfGRiEyXYuLqoJRCII7SmcuheJPc0Qo=;
        b=nPnSpbN1T0TC2O7i+5hx0d2KUsNwClHKtSbuG/M0ELQ7v2XFUP3k4vYcKkCvxhvdpv
         kRPgHeGIRd+MubbdrvRfbTmNiO2T599faaOTC7z0cuhn3jt5vpX1/ObzIUuEzp6Qh6NT
         oJA6K+nG9T4TfORpnVpRpNqr3TzhsVmawvGvsbA8Y53+a8SR09gs1lBFbJxRpVa/DZs1
         899vJn9qcAUeYpxKsBh9FozD7c9Tm2Hi4Tl6Dc0nf9/sC/UiVUIUDGb/aP5ZQIEUmZSm
         qobBGw2peimd3nMam1o7GGGxtmufisKCkTxFso0ECwoYIK2k+T/6zu8cK+e2wkqYP51V
         pcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003983; x=1789608783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mNvpcd2n4jxJTfGRiEyXYuLqoJRCII7SmcuheJPc0Qo=;
        b=QU2bKFtqJr0LDLTVyjYqjiqjITuQ48z5T3R7SAELPqARWWcj9O8za2Mwdp4Uzey98Z
         O719ceCorXuyv6pDkDv4BTMeqbQrIMrD9pSWX04MOAhbaz2DXKGj1G7oTBFPs9wUFuA2
         wpB0efFki01D1CtZ6mGCAIXPCUcuqQhFz0VcqjJGofEGaSJTwKaOi7zVtYLVLKiwmdml
         daUb7p0hj5Gmw99v0oeudfZ2XdcMFnWMr1VZRboRXSbMnoghOkOaYUDcKnNyfLkRfki3
         iwbtQgDdccsK0B7YZ/wjwR2wSWZP9J8gsY3HtaemktTr/vLnjyOkFdM1wGVl0HO45V+i
         NDDQ==
X-Forwarded-Encrypted: i=1; AKwUvByd4FwtLgr8oCZqMs3HuGUiDMJGqk1OYQgyxJ4w+61A7AvMP12yK2ENg/9cd4ErISoK2nDbZFp6nk/S@lists.linux-m68k.org
X-Gm-Message-State: AFuF++mJIY2D4GAdSJVHhRy8jVH/1jEmYKIiKKJMnWg1c3q/konU5Lqy
	qnDTaw/bSIff9zTyginWtHKryroe+V7FHtVJcLlbjdvlaxnklvTN+i6D
X-Gm-Gg: AYBFou1eki1mC7QfVgPw1R8G7oVrE0UJSwcPxQ3wEtXuna3iovbhgacZJACAdFi6Yz8
	MA3uqy/hfHSkBxPbCw3Aa4psE7Ci7ApuQkRjcDgkMD6jxuT/LvTtS13FOfKseRzAeZOBuMco8Zg
	SJTpOYCqpEkQHYhFMnRaDg92/cLKpLu66JlROsBRkJfBQ2adhoNiQRS/+8nFyan8fZb1VWbxPu8
	PgX3rWwFjyS/dJSVZvxJPc2C0AIeqRQxkq3proJ5Ho6JMYHK2LfcX1LK9KVQgnJXEhnRVUl6wn+
	+tMqtDgak7hUksUP/ZcS3QrvYtyuCB8eYyb3QgOLd5EkF0rkVvD3734TLWt4PBwmRqaLGfxltzw
	/lp9iksY4qBkH7Bo+7h7eT9YVsFwaBMmsHmaPQrsXRpoP9DDh/2k3rVPJbY4awQ5jYDOUv0kKJR
	2BnRFo0/ovcFSifNb8FSot8Jl94pEUmSED7dRvVIf4HICiv4kxQiw+bg4PAw928MzJj4GuxvJBb
	JJ4l46ckd7imDZaxASiPBYakqVItJsmro65w7zawjIGY4BbJcO+85JDMauy7gDcwn5l7qcgHCPx
	RHA86JeupRBi3xFViFtmoMVn3uiGxcnwzv8Eq+stIX3S5fBq+7gf17C9/tEr3MCc1Oc/kpvEH5Q
	LjQ==
X-Received: by 2002:a05:600c:3786:b0:49c:f13e:e50 with SMTP id 5b1f17b1804b1-49d26dc1012mr14683375e9.13.1789003982600;
        Wed, 09 Sep 2026 18:33:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:33:01 -0700 (PDT)
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
	Andreas Kemnade <andreas@kemnade.info>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 5/8] docs: kernel-parameters: Drop the mini2440= entry
Date: Thu, 10 Sep 2026 03:32:42 +0200
Message-Id: <20260910013245.8619-6-kmehltretter@gmail.com>
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

mini2440= went away with commit 61b7f8920b17 ("ARM: s3c: remove all
s3c24xx support"); nothing parses it any more.

Drop the entry.

Fixes: 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
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
