Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D08936680E
	for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Sep 2026 01:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003994; cv=none; b=JWVxff5CXIT5BrrHp33yEyZRryDvaWPuBGqbrfKI8OJj96NxW7czr/FgKFKLTFid8Cj3DimYZMAb6a3KKrjIDqT238zzhTFQKg2oOFe9elEbob36JIp6q6krMb9gsjsJcxxVXJHaKttNn4AvQ/eL5bZOtUhbp4mqbizhPJAzi+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003994; c=relaxed/simple;
	bh=qYH6DW3OX6UAw4/JqAXW8T1nZ5UkGcJ820hwItfbiXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T/4F9CM1j2AJkjh2V+xweHfGm3wsuKk5m9Zy5mXXZBiftYlMEqXRPV/I7t/TtucbpYt7q/PpbV8ogsvD3lq9UKP/g6o5i+1VZOTMUgMhS8z5/9GpMILtPRh2T3feg/OvX8ncbdE6nfo8jW5cr6JX6uEi/8AJWJvXhNYVhUFmgZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyXBNUtH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyXBNUtH"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so51846475e9.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 09 Sep 2026 18:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003985; x=1789608785; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+FNgBRdn5SuYqzApc8cKDhkrkv42DWP10C8olavTwg=;
        b=XyXBNUtH+F0HNGerWISXOD5pETvQZDhiIR3aBvUuR59JlRTCr1pRDzCe4uCcYvWOmV
         AMLZ+kM/OQJh0EBox2eKhqDKbhXOU3PSAkZPr+0VnWIcxxV3+Xnd7KQRPuGfZA+fBzwx
         DipAV6czVnekzxVDWpvnM7PwT75vJ6UY6inyGsPB1Ud3rYht+R116gog7oGGujbaoDRD
         SeRD0JigWp1sDU6zLx10UqDU5Bp/8yVQj3G+tRJTAZ+1+6lBdYEUGOpBN2wPwS8nBZk4
         v3VlSP8SfOZk2FfgI2DU8RRJtCK2Ih2eKZvI6+Dj5dlzBauXYwE1R3rAX+hnAaLP7SFt
         bKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003985; x=1789608785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+FNgBRdn5SuYqzApc8cKDhkrkv42DWP10C8olavTwg=;
        b=LcfNVpAdSMzOC2q4stMCQM6gyV5SduOdjqu5OKOk/jnBEriIF9Iqrwd7JFeFTy4fXZ
         Gu+prexxJqmrJf3G88InCBq1SMT6ayFHczO9gk05OGwuCTPZgwGTE6sSzenfdE8OtPIC
         tV3GGeWBsTzvU5UWKtHKW6NnxBZhiIjHbPb0eWmG23joSZpL6aKFVwORXgFRX3ZGHldw
         BG0BkO9ZQWhCezBbQDEDXPEIVUqy5Q1u0/ewAPMjGqnhvkDvwdbJ3RixDxgDTSzmKzEh
         qEjJ1I3BTHZyHtGoH7sKA9Cqf7iuQuRE2nrPXUShPGqtoY0J+U+6N63sA+TTUjSh/P+9
         bwaA==
X-Forwarded-Encrypted: i=1; AKwUvBy+zja6j+9majZ93o0p7UxlWw6RNq7EQIWG15+02MMO8lPTJS89rxowUP7TmmqSPbJDlYLtPDZAL0Hi@lists.linux-m68k.org
X-Gm-Message-State: AFuF++mq7Yjk47D4y03csjTWY1ct0iuDND7GUWrchROlGZhLu2ly+NY8
	K27IKcfoEZUZgJu2QzzKUQjsMR0od4+iiyVP5doxv7w+F+id3N4YIsE+
X-Gm-Gg: AYBFou0h5a9BY1E4QvCk6W4ZeIwo8CgdPWACQq5fgvKB0YnNOpxZiXj3Ayje/0o8+kp
	S0NwZ/3Mg5saN/x43n3hQRL6sHSSI0TkYAtZZARkBK5OoQpaWB9oMd0P4gIAIEwP7VeiPeWvA9y
	Vyk2F5Fmh6XaHC92X+JlTPVKLBL00U6qEX/XAIyMi3plsHm2fzK7+QQgzCL+laHnbsg7cocVlcj
	s94JfX8yUFk9xstTgcNvrw5Jq2lIt9XzXFIKw1e14xcEgmIit1EibgflmGGONkSVedlXpOd6Z/P
	pka5XSVSMYTirV4CChKcEIPu+c04O7Y2CC0bJTfPOQjS7rYEyYS7DxCRwWlsym3+BKeeRSdJnKc
	kp9VvwkCTax9IUJgu90vAfmyryANVfejQ71Eq3M3aYeuRwPGHIpb+1CifCrG9khRfeS2RW3RpDf
	TmLK3OpxXgTTghZU+1uNiC/WVfzA6f3ray+zvs2dn/r7ovx2I2qZ2RKpr4LH7Q/dRe7YJl9hskh
	2xxc+GprfjCNo1Pcwbtt2Dwc/bJc4qxpfKaYXgDT1obqQZFbtq04NUaMYdg+Ynob/l+2PVYo31m
	2iwqsjRfz5nzZ628zuy2HZP35eBQ2t1MNLqSLvNIe2Z+prfB1FgQusS0nzlcjyG1lrADClpPYrq
	d+g==
X-Received: by 2002:a05:600c:628b:b0:49d:2856:fcf6 with SMTP id 5b1f17b1804b1-49d2856fe91mr11506445e9.15.1789003985034;
        Wed, 09 Sep 2026 18:33:05 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.33.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:33:03 -0700 (PDT)
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
Subject: [PATCH v3 6/8] docs: kernel-parameters: Drop the nomfgpt entry
Date: Thu, 10 Sep 2026 03:32:43 +0200
Message-Id: <20260910013245.8619-7-kmehltretter@gmail.com>
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

nomfgpt went away with commit c95d1e53ed89 ("cs5535: drop the
Geode-specific MFGPT/GPIO code"); nothing parses it any more.

Drop the entry.

Fixes: c95d1e53ed89 ("cs5535: drop the Geode-specific MFGPT/GPIO code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
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
