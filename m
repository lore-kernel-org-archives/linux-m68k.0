Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9008B364EB6
	for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Sep 2026 01:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003981; cv=none; b=dk7RYb07kkV50I3ppu4VmAJt44L5oqM3EB6kQs8yo2PCMz6vobZTLZgu1vJUlWWE9fkj/2iSLcqCamAElHIMJj/6yfrrWnk1NsgA38o2vIi7LpZ2TPR4yF8ARRnH+ZAAlF8hy4ZjA2T4dAiAjVqBhJNw4Y03DiuYGvAZjbGCn8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003981; c=relaxed/simple;
	bh=5npIdaapraypBrumlWXF26qNLLXzmRV667k+YLJkaDI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WeJYEAeq3LgowPKGJhiSXlw3MeUnD1K+vL3z3P7L/0PlaFxinThWDGQldWLyVHBwAvc2OjTv/qzIL0zjI8mu8bpd7Z5+u9EesojpXfX4OSB2lMiO1n9pqYLa+Tx5dwbyI5cNmLjuKjdNVCy4xo7DxivSVPAnKwIaDD523qj6txA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAbeaiCA; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAbeaiCA"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso68933355e9.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 09 Sep 2026 18:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003975; x=1789608775; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYl7DgYw3pPECQ79mBvyISUl5xXzjI6JeiWJOfwAtIc=;
        b=AAbeaiCAo4wSHufC2V2/vdok/t0O4NQdIyQmQbyMBKP3cdNrbFWhGTnA4SdOriSgUN
         f99toHXjyEtMXRiu5v71ux7b9HZ5e+JSkIFptCUhs+7GDAR0KIkfFpBP4iA6FaLUaRqw
         TIQWT+mH3QxeICnjlnHcrcGKdYvM2QTuFeNeJgfZDAkU4CSITvJR2gm3aknTZQKSAazT
         inGjK/yRRMPM63ElftKqrm8ZCxLZu2vov9kL+2PR8t7yWpDiBZd8d3UmgxfqMjCE7yN9
         xDybf5DZIial5ZdF+kETRcB3Lo1WajOpmnOdsffPkeWgptvAGyd2ag+n5v7Z+U1c7O6J
         yr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003975; x=1789608775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MYl7DgYw3pPECQ79mBvyISUl5xXzjI6JeiWJOfwAtIc=;
        b=EXLKpOLcJZqY7EwN1Qz3Gcdlv6bcBJnuMtE82m8MCa/r31Rd9f7YYzUPThIjDOmgrL
         rQASKuwFcM1s6CTAP71IEgCqq36pj5zFwerkiLNJnDbo+VOkUF6idyZjEe5fMWUo4mbg
         h3ZHvJlYRF1GRHwDYvJ+zjkc9VNcQumm/DDBaOsTwovBlO0mWzoowkUvjnLFQRBYlKy8
         XNrynEn6b/+XPOgXEPo6PlSo3QK5D13sfV7M8tH0+3FzzjblrJUVLwJWIEk+m8rSnyOw
         WRtziVsbzRw7gnax8vNP9vx9IO+WGr3fT0HWaxpCY0pTPW3suklytkPByXwURAgZ+64H
         xIDw==
X-Forwarded-Encrypted: i=1; AKwUvBzXEIpixll46YQUVMrH1/8Bk00+CjWY2ThNT7cwW7L53SD5U7lGQDj9O0iznNv3aMNvTA/vH5dj1+LV@lists.linux-m68k.org
X-Gm-Message-State: AFuF++mg1UXtvQIauVt5t0jDQ9p8G22OtChwebH0aJr7oGwClrvXDa5H
	f0sFG5luPVavwKD1AQoNZVF/Vz5BhAZRt1s8c5HnJAkL5vOk7hs5BdrI
X-Gm-Gg: AYBFou2+1OyRnl+/IRDrcQGvUrMeG059CUdRy4hM7G2CbtnT2lhQhPPeDMXblLNHRyG
	t4T9kLgJd5jlToQyTRy5WWEw8bMZp884iCGDdW0PEcyBU5jXmH5PbXN0HaByMrRv2ayH+7/PiNx
	Hwys7oRDFKYXBW6EAw5kVhxLdMXP/45imnEaKKgw8tcidf4PK/Q3xkn0tLnw9TMd82dBdlYcjfE
	MvT3tlI9Cqqc5EHrM7ZauiYChyabgeAZvVXhbduEAGPnDkvhiL9lwY+fAPg+YnJbLjxV7LmDqMP
	qpKaudyP+LAdIv5SkICcF/4W5kHakv11akGKA9bpCHRTA7zFcbe/rNU3S2qRMVEjxxl6ZMpWiHJ
	DIAhcNWoPcKEa/wwNwkrX3Yf2BB7kcrmor/8Xt+vxgnGOgb637m+H7IedvIoREwFcrx3kauY0Rj
	piBTtyjD5/b+zL33ziZKoWA5rp1kHELPgknu+4OyfkGLXQv1UQk2qAtx7k5xNL5cl0V2z1lAory
	p4ToD8qUvonCwpvvnkCAVHfUO6US7/KguQriNzEzVVsjFa0uMT81xpoTzUF9raQgzsUgFklsy82
	TZQl27mG305cTPdtzda/J1U0y8/8QdPQxLWvfBm32vrMAfjSq6MiegvSvG1WQ9+joad55qJVW49
	Oow==
X-Received: by 2002:a05:600d:849c:20b0:49c:fe46:7219 with SMTP id 5b1f17b1804b1-49cfe467228mr261724915e9.20.1789003975492;
        Wed, 09 Sep 2026 18:32:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:32:54 -0700 (PDT)
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
Subject: [PATCH v3 2/8] docs: kernel-parameters: Drop the bau= entry
Date: Thu, 10 Sep 2026 03:32:39 +0200
Message-Id: <20260910013245.8619-3-kmehltretter@gmail.com>
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

bau= went away with commit 39297dde7390 ("x86/platform/uv: Remove UV
BAU TLB Shootdown Handler"); nothing parses it any more.

Drop the entry.

Fixes: 39297dde7390 ("x86/platform/uv: Remove UV BAU TLB Shootdown Handler")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Steve Wahl <steve.wahl@hpe.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c8d96de4c00d..99d5bb68968a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -624,13 +624,6 @@ Kernel parameters
 			Format: <int> (must be >=0)
 			Default: 64
 
-	bau=		[X86_UV] Enable the BAU on SGI UV.  The default
-			behavior is to disable the BAU (i.e. bau=0).
-			Format: { "0" | "1" }
-			0 - Disable the BAU.
-			1 - Enable the BAU.
-			unset - Disable the BAU.
-
 	bdev_allow_write_mounted=
 			Format: <bool>
 			Control the ability to open a mounted block device
-- 
2.53.0
