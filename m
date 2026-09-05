Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5736233ADB1
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 09:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601644; cv=none; b=V2f/L65RF8npGsp+pW9OLqG5PBQx6jOJT/ilrDQ9TG/6mRHKBrYqu611oThENBKsN7IqnCtDjSDLqz41IF7nH0smzi3FnXmSZWk3XzclfcwrGbPH+vz5xDOCi0cLQFbR5dBCHlZOZEraLxfGiUoOEzZsOxQhGz3azQDw1n2M7NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601644; c=relaxed/simple;
	bh=iIEWAYVGI2FzX5iZTyH81lDATptMQacAG0wTPy+abXo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MTQ1vaOSm0SlLJxdpbkJPX+SWn1D5vzG1NPY+P10ogzuK2YO71Gu407nRzj+3P7s3CdtcbfDZyHwQuPZL1arFFOp4beEDITHAf5CTh0N6g1JdsCMT2B/iOrj5xb5uFdB9p1/CB58uWTFsG1jHImdKwYBurR+/gU+cB+EKV2yrqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0a6NY4T; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0a6NY4T"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4843e397f74so2283220f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 02:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601635; x=1789206435; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=P0a6NY4TfUdn4BjXFncEf+4u43vw37WKRgwBn/+8HS2O1RRJ+OqqOlqPiNfNK/b3hY
         QiUzn0ujbBIRfvb0VfTPUbE5hFFv7AYKk/J0TKbwakpUoS02JVzR2uAXuYkZtjTtQVkI
         gyW/sAFh7wQ8IBIADZ4al5IzbiFcRqWicJJV5Ty98EihElm8Pl09PXT4OUjYTmOGmE8R
         897T71Cp9rgqWEfq8mc670qFldLT3yx38DK55CK4wm/iG8/aRuiZMlh38SBhoIc22Ay9
         xpZpj4kVuMZzXasSTDMBijHMIs2eF5Qbrttg2aBJF94T9vrffijRDEvjik8LjkwxMpz8
         pqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601635; x=1789206435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=CI5YDVKwc5M21TODydV6TZpIZpw7MgO//IWqquf9CIrQBmkBrDWtAl+LYNKAzAdeE3
         wEeyTjAg+8cZCiQ/6usURA+D0R5Uw4ILc780EsBAAyI7wumFuw+ynMzLA3xGQFIU9fP+
         KBz/12eCBY0gOjro0um1yoSAibrBv7JVWmuSQpFPQtSXepvnbPWocFr4fv4iWCSkoD7R
         m0krXYxpKe1Wo94TpJoi0lf9GbcJoyg4YFxq3YiJpO/x+l7u/pXsQITG12O7cwbKqTOR
         RbvyJ/US6vOJ6gy17WxMDmrLgVh47g0BrumTuKA/m+4tsGbbPy7I3/nY0cFaMJ8Vs1/v
         Sj8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzuD/a/Z79yiigWyPVhRq51udjAIQQSAg18r0xVinSZPmgdhSu373GCo3ycP72hZoOZfPNmQTl14TPV@lists.linux-m68k.org
X-Gm-Message-State: AFuF++nebd9KEEcZvplgPVKQBVTh4MIyfQAb1mRa+YoGn7qTS/ZQCYyR
	Ie90qxmPqkPAhPK1kb4VZKynKs1XLl1XgPiLVS7MFNkiBe3V6C4tpLQNCgMprhF/
X-Gm-Gg: AYBFou2co3UEkWY+e3SJTOXweoFT4dyTZN8sLHozZF2UWrZqqW05CA0ccVcGBTF/txg
	M2QwXMlZu5dDT03YxIyU6tIF8m3MbLRzq5uID+q0kedycUqg512SQQd17J6I1GTZEQSeV0ckDeH
	rm3xu19LivgBBPzqXkNH/OnKGTag5gIyw6sSuLC6NFB21bVTZmM2DkWFUPvx1Vt6T4xaV7Kxg/8
	9eLhPVMTJgc/4WkGd4cL0hWJGlqgjt3cPPox+4UObSHwFvdK2bxv9231Ji5U8R0W7Sweqyp2JlG
	nn/lHVQ4B4UK3BmpLzCGRgzuQCMp+P37PlQFoFKOiSMuYsYUYQ5FURBm7JPfmZ46qSw4muVpO17
	btTFrxnPRqmCQ5Gl9+WvMeg8r46Y12WYm0LgVJAaR8Y6fBBrlmDAUcgttfY88ejeykYoGcxAm2E
	coELfzh8QEMVJ8juVKrYL07hf9y7o3phAG4MpTuGuU8sjwwpnDdwSEy2ukieXs5xTfUbT/V2K9U
	qcpUYNyMB5tfE5EKDu/i6luTre52XVY18XPElqRtXMwQiKr7fvqTLyPTQfeHMsT5M5yF4bR/zL1
	oZim6EG7ddRNfUe23jn9Gms6TIqXkPa/EN1U+fNcabspmR+rWa/eRW9H1wikFJSmGrA=
X-Received: by 2002:adf:ecc6:0:b0:484:49f8:b56a with SMTP id ffacd0b85a97d-4857e4f4adamr18253955f8f.8.1788601634554;
        Sat, 05 Sep 2026 02:47:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:14 -0700 (PDT)
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
Subject: [PATCH v2 8/9] docs: kernel-parameters: Drop the pcmv= entry
Date: Sat,  5 Sep 2026 11:46:48 +0200
Message-Id: <20260905094649.41996-9-kmehltretter@gmail.com>
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

pcmv= went away with commit 7aeffbf2ddec ("pcmcia: remove unused
pxa/sa1100 drivers"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 7aeffbf2ddec ("pcmcia: remove unused pxa/sa1100 drivers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 48dd273eaf6c..4864e37005be 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5311,8 +5311,6 @@ Kernel parameters
 		nomsi	Do not use MSI for native PCIe PME signaling (this makes
 			all PCIe root ports use INTx for all services).
 
-	pcmv=		[HW,PCMCIA] BadgePAD 4
-
 	pd_ignore_unused
 			[PM]
 			Keep all power-domains already enabled by bootloader on,
-- 
2.53.0

