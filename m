Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C5E3DC4B1
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 07:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591850; cv=none; b=IEwfFhXdgdhGegQp7bbai9QJU6BDc4mt60xVUMgScj0e03/s466yAYc/foa/wogoa8wRsGgRE5aQR8Udj5H773MvqR4Xv75axNjjDEw/qK8E3Wpna/XEZU98RfBTCQM0zPD/WDHti5ioN1ohD1+rs7tRLmFJwV/LlpzNGvxAGGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591850; c=relaxed/simple;
	bh=YsfDHjDKsIWAkoUgaj1imFKWTfOFfJnvMXwuV6H0pgE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VmvfLX1mWv7LhTg+o8YoD+CPOLZ5ieEcrGGluZOLUc1aBNZ8hfvkfn6/K2TXH/3+6GGJ+tfzrSblM5x4mOduul5c1R79q1Ohklm09lCqwNDIhzLQ6r+DA3LpeeHtvnc9kTVxMCUPiZ+Aoilzq8kAfXzGaJXcWVCj9pIBbDGlm+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6NlAJmi; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6NlAJmi"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c255acff671so266301166b.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 00:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591843; x=1789196643; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=;
        b=H6NlAJmiL2NW5HPUJSfWjrPfevsjaaprMo4r1yANIzWvS217+l65yvl7UmuDxQ5dKV
         rF+OEmfdS0IvUxXrIaftzKjUJxjZV+Qp+clKq2R4UJoX9QgiZ+An7SbsayDSNgCtECJA
         DnJLfQBj1QpLgybDsVresAPteFv3+K3HQO1Ts6eWRUlWDb3MxIlFSWTFb9M0I00FZWzw
         mo5x0lN/gtreyH6dNkQaqruD2xsMPv0/4BmWgAydniKfANW3fWVZKKHiU1fshRAT7/Rk
         majAf5M7IFHhLY6fZT/Ej7ZPLSTxGVOYfR6ismYE2NPMD8R6ge1gdhhqcqRgXHxPn8Ku
         Xzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591843; x=1789196643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=;
        b=dNlK9dV1cGFi5fbl8+ooT23sxtpWTgpPcagaPV8Mu6YSXuet7hlHO4FCTeuoDT0AWJ
         SEE6OtwCI6pynEPYT8KMLNEccPJwAYhXhR041OTZ1+HzQ1zYaSy23Pe0A0W46IX8DLdm
         /uHyj2HLjKbk23mVVw+LejlDfhW0DMhUwh7M1QI/1QhQXe3zXCqJpQWuGi4tgKsjL4I8
         YTFnfv9EEsJg1vZKuMQIPejAP0AYD29BbksqVCWyBbba95RtOGt52AA2/dXABZKgLnqx
         aQaxFWwxTIu9FVION/wI/LjW8s3+rz+4eb4JbV4k7F4uW3NbV7Ybsw+81Vtant/2Q3d5
         HwyA==
X-Forwarded-Encrypted: i=1; AKwUvBzMv7gysEasWoXaPB59wP82kw7z6USdqAqw0YQJk2hBI/soyZLfJbeT1FHFiGbYiGk4u2cIyG6qagxd@lists.linux-m68k.org
X-Gm-Message-State: AFuF++ld0SDMnKkHVOJQhrynXg0+RW1IEQ4F4lIG6NV9NpzsXuv5V/ui
	sFagT4BXQEJBW5Yk5ORs9z9g69O94GiqQ1bpOqJov1VpISsTu+Sh72fb
X-Gm-Gg: AYBFou1l2reLZg1VgT9UtHaFazczIX6FU69mDXB4/F9zO6Iu03zzlroZomZc9OC78g/
	vdBCbArx+agP/n+/QUdZSNODaPX6x5XIEZOXg3IFTPkqwadf4/PVYiDdo8e8Y50Ztm7BHpvWVvu
	VntnutgnH8WliUbaRUZqU/dUk6CD5rL2YWUIyQADglxjtwwzMGYPmFKIPxmaFCmeqik95BewZUk
	HHSMV1TkJplaaIVV6yOnzzXPk92gvAuItWjLFOsHYZkocDH9kzJGZLKBqwY1I22nOqui656qcLD
	aD3zy6RWdMmvtViW9+9vQh1OrhkRc3qKXYLfKK9C9tVLUnBeIoBOBGb0gQmJ0dQeG6S1Zn8ipnx
	q3ViK9EiLDJv6Mp8tLLBwEDeXZEmBf1eSigxK2+Apzm+ktRQZweBLSeQXaVpHBDsmrO4hrUqM10
	PXM2jxFSly2Zg0sBX0vyvIOA2CAfW66nTq0/jC4M5A5NV280xTRmR9DONia2u2hd9cR1HpBDGRj
	7E5FeEJD2hcTT4Uk0mAplD/g3nVsXKj/tT6jqYqmfChcYK+DxycQFADxAIAnkYG6WOzv4Vz2W30
	BLNXNTo/3zDek1uutFIRCMTMcRe7k5bPa9fylbgrayZG5UjJbq4al7fRFhoaJ0xk4z8Yzg9dFw=
	=
X-Received: by 2002:a17:907:d94:b0:c16:4df6:176b with SMTP id a640c23a62f3a-c260ca47420mr442803966b.20.1788591842595;
        Sat, 05 Sep 2026 00:04:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:02 -0700 (PDT)
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
Subject: [PATCH 4/9] docs: kernel-parameters: Drop the enable_timer_pin_1 entry
Date: Sat,  5 Sep 2026 09:03:42 +0200
Message-Id: <20260905070347.25902-5-kmehltretter@gmail.com>
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

enable_timer_pin_1 lost its early_param() in commit efa2559f6516 ("x86:
order variables in io_apic_xx.c"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: efa2559f6516 ("x86: order variables in io_apic_xx.c")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2a8d862ef30f..f4314492953d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1647,12 +1647,6 @@ Kernel parameters
 			to discrete, to make X server driver able to add WB
 			entry later. This parameter enables that.
 
-	enable_timer_pin_1 [X86]
-			Enable PIN 1 of APIC timer
-			Can be useful to work around chipset bugs
-			(in particular on some ATI chipsets).
-			The kernel tries to set a reasonable default.
-
 	enforcing=	[SELINUX] Set initial enforcing status.
 			Format: {"0" | "1"}
 			See security/selinux/Kconfig help text.
-- 
2.53.0

