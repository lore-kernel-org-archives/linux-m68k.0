Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1844F442B1D
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601643; cv=none; b=Q1JDEMjeocRgzbhnYBD9cd3zmY6cDgS9cQMWaxovyoeFfLlQ1/JTEkMwaZCZPgOGARHLjGpM8jqLRMphSVQUhtrNy5Q+S3HMe0/qYKvL/ytGw3gxyHmY2tVTR0K+N9bwrpHZXXwHkiqmauBFa1DGLaSMZ3wclR5nEBtixXxYisk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601643; c=relaxed/simple;
	bh=8GOJ1bBhkXnXFQ/xtc+4fZdZejRnue5u+K5BgJsvQus=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mWPU1a8jM/LSwD+nDSKfeKhF1KzQV0W+I5ABj2d8XKZqmxJEbKQ1tnwYIfBJfBlYh8ecR+q94WspD27NXTt+OqHv+n+ayarEA/Ta5GrmirBa4LNKwTcbBgEX42pefx4ANJLt/sftbSsnP+FD/N8+8CpqjpEsXHyE+o2HzszLrJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oI2OT+aL; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oI2OT+aL"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so1268527f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 02:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601631; x=1789206431; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVDepIdvewIAkDae/qknvPHnA6zOWa1HlsWKZdzZmcw=;
        b=oI2OT+aL8y9OOozFKYhRwW8b571Luqvjin1wfhaeiEie/ylukitcw+4/HWOEuyT8zb
         18Mrt79S/Yw2iaQfUBtXopGsjEV/MnYTLkax9BhMrBWe3hRgvacP/ZM8+aSehU8C/R5h
         SwfvrMOeaGjaoL64o/+lgNjgHe2Yv1NNu5e82NDAP5RTEQqEKCaTdw8zFTSMqWp7T+no
         kFFW/GCFfgaj+/amZuwLlRIO/j50U4MAQKoY3DudXWS2Btmazr0BMCrwtDvaiy0h25xU
         NTbA8FmXFgmxOzDZs1rmxMmM7zFQ8Pisrs9Ke9wv7tNMSVLiYwpDk0bwqXFRz4ZEbjxx
         jNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601631; x=1789206431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OVDepIdvewIAkDae/qknvPHnA6zOWa1HlsWKZdzZmcw=;
        b=ZruFePReyODc9f8CM4nAGwvXDxitcTWcYZcs2AJVuV4FqXATxtKN0Jmf9NULJCae85
         o7dtzBefDo055BdMXjiPIjc8K2xoIVOtv2HHX/d/6j/CTqBFGijmF8yOvbAxptw3WvDz
         6Z+Jjbp6fSBwi8SVciOH1HpPi16qCVfNgEodixQQNl0qI2djzX3ujvxOW/78KlK04QYp
         V0otiPg+6rD4gXw2SIT/MVAfUVKpgoakL+ijJmj/2yutwsAtDvd9ymhKKOS53odGeyJa
         6cPv25pRkCaXl0G9h4PDnGrD0peszvSWxm0av45AZnmYeh/P6d8+KdcYJIbi3jddoTFs
         EMOw==
X-Forwarded-Encrypted: i=1; AKwUvBykOgFqQd6t9B6CN/GrnRxRM5taEoir6Cmqo3P5SARP38Ee2Xzzl8sD7I9Qp1VWVQN52B5DXKtVGdjg@lists.linux-m68k.org
X-Gm-Message-State: AFuF++n71uL5Eyu57VI4I/jxSOESvC3OX826RGxkhMxUIe51kuaeX5Ji
	ARJ9R63Yq5jL1ljCTQYAYjqaLDIUliKGspry/RwDDdNRi9Z2YyH+Sn6M
X-Gm-Gg: AYBFou1RPyXyRjR8uklVwHaDTJoAU88XFdrdhPrFosHzUi5FA2v6GX8qVNqhqQWNsGm
	6hn5IYme57ljQmojElrrep2a08zXg4bKhoPY9L9XDdbBQWc+HylpNbSjKrlD+Avpnk5VqtiMdte
	+ZDzsQ0g2pjhW0yFCl+u3JeLHKSZL00/qEsMkfdIb14x3Q+qaLx6rlno/C9WBDtPwTtHyZEJr/3
	jKlwSLI9Ee7QQDNYDYQqFgRDTC6uyCdCvkGbY9du+tSkMJl1dSOv5d191w+RY5bGi3mcnmutJkr
	CHRqLQujwyxDm1VypxExjK721xVMAykoilud2eLJ+hF094ByfFi/ciL1qMoRlNGi0nf2kwbRwnE
	6GQmYvmNRx/tB05ZsjZz5cCuIwk5+MoMcgDMWjwJDgHnqllga6cgpy/vR/+XMiprxPa0Cod0KnK
	NpJBN31JejpmyeIVnXpdzEGIQ8evIC+sJgKeQW9o8Y5x6z1mJUVuKAf7wrihhYqIOzkLX+X84sb
	vz8c3uk2r1/+8t66jM0XYrzaDJIiUYSix3VZJ77XMHXi/y3iuxF+4KcSMGDkuTN5HygAwsdtkem
	f6hGbjW6AkxzxqnsGR8vtE5340ejdtiJ/cH4NBBb8oPhiWVb+c7cAaEpsC0JJxEu5/e9
X-Received: by 2002:a05:6000:2584:b0:482:b813:8315 with SMTP id ffacd0b85a97d-485872ac3b1mr14547032f8f.21.1788601630963;
        Sat, 05 Sep 2026 02:47:10 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:10 -0700 (PDT)
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
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 6/9] docs: kernel-parameters: Drop the nomfgpt entry
Date: Sat,  5 Sep 2026 11:46:46 +0200
Message-Id: <20260905094649.41996-7-kmehltretter@gmail.com>
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

