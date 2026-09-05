Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756DF42E43B
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 09:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601643; cv=none; b=qQzI69AGNcesc2E5phOZPpddwhy7cXnkIE0VevtaRe2OeGKiFNNmNojPdTwnpwV8o4vu9nUlbait7g7enuX+9P8rBJKO4ikl2oomeg2fPTvDqTmhdOPW4TQxruZc0s5czVpKmyvlWj8H1skvmFwIpN2xcOg1JBaQnHQNL4ScTEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601643; c=relaxed/simple;
	bh=tXKjfoKiXZ7V6wID0vROu3EjAKBYvGUXtlTaR3CzeO8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nqIF+AULM4azV6XV0QWirYTNW61Izhv+OeKvu9CK7ik+sy9bzvl6vcqVQnqM6r4h8q8T9+gBnNZxiAEp1Qt7nlkGB4VELiXhGaRiyGdkmXNqbyyAzKoTTgziiagHzwbFHG3e8uhOKJ0nt/dRPjnarIWm8DRpupQs9vG6oKj0vvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AI1V+/IK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AI1V+/IK"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so16713795e9.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 02:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601633; x=1789206433; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0boECcjjn/VFHFH6rk1vpO238PkXNlP4zHZKdanKNnE=;
        b=AI1V+/IKB4LwdFlZ6pxvNgte2a8h3gI+59gqvQTW+V4yqp2BBfcXA13tMVj6uHz+P8
         ovz0NOCZE91lYES5JJk4FcLMhfHUWzsg5BZ9xmPPxp5jZKXWNLMT1t6oBwycslFuvn0f
         CxSUoFHeQwq/x3WY2o3kuZSsIIlbUCcGFidbqYPgRprCkGeTVbGAylSIt2iBA3YQaAtv
         w65Zq2xB8en5ed6AbD6z0vNZHf0y+VKTCMKiS6Tq4pgnzU1RGN60mRjktWmUIQd1iNxL
         NhWLyb0o60EPZV129c9R3U6ouPBZfbeD35iQAeKqOYJnntNkIeCL4tadEs1f5/pKRIZR
         xiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601633; x=1789206433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0boECcjjn/VFHFH6rk1vpO238PkXNlP4zHZKdanKNnE=;
        b=RFpqiXnqO7LBvqHTNyYsy3tsV4lgDNeE3sAsARHSOy792SORoUQUqmxGuCvF6EA4xg
         UkUqZaHdvLncDQTyqdZkfV85S8b2tskJDy8fdEtGQxL0cuKPdbmnfbSNU9fy0Al+bkPa
         a+qnkc/ICs4f+tEprLoF1oLRRQXt78PlnkCuf0uOPNd3yemo6oCxBn37KbP+pbLk3Hiz
         07ltVeR6C4KiA0PkoECRBIBkkQUYC6NOWeur8WG9piFfi6SHkP2o+5i2GLPSf5rCLAWl
         UAqlDNwa+dZgPJWWc9V1hMyuCysOm0W0v+4EgKrtZ7pTJOkDL0ohvmwIRGT2pW5bnceL
         +hIg==
X-Forwarded-Encrypted: i=1; AKwUvBz27qjcQY9b2fEMpPFeLIAj18w54/fUOe68aC4RZcufC8DWWCY03rT+gFr+Kk8l/bsTrCiqFmojM5HE@lists.linux-m68k.org
X-Gm-Message-State: AFuF++mrrBEEe6GzlW3aq8MI60A8R/9sqccjqWBpysMCKqaMMK8uzQ/p
	5cyr5cqxeNELIglI6JLAH+QHOpKuwNa5en0PF4776PNKkvmizVhhSKxx
X-Gm-Gg: AYBFou3LCRjrXmiv2K0HWSTZ5zpMoK/FUvPjmke5DD33g7MBPMK0MTqSOLqwzwbG0of
	OprGvJuIlG4qVYNSpv68zRYJIwauq1oq72ZnalgbfEliA9By0pUzAtelB7QYwfaRuY5uKcg+E7T
	e4sL2YIeZw1hHEyi+zfFQh1nBT3rwMDvCKABOGc4B6i5CnlXPeFyfTA7zdP+1kuIOl2/IXX85om
	2q3Zb9Jf4FeeVoY0InOu1TCG3ZMtx3wJSt6TY41s2x/eigSTQN+PBvObs7XDv5zYc5Z1cBGXbiQ
	agW2VDGRpiyKBR88Bt+h/WccnBBQagP1em2kOuuxPUCZXg/eqVztbny+udq0IcERFRm927wKEUQ
	lIqTXBmUIwVnAv4rfN/I1zq3Jrm7L1h4kGpNUkB5uXt5Fj+5srZ9sqJ2AD//t3H7mDFc8XGAZVG
	VlpCTO4zQHn5uYs+YVQB5xciD20ozP0hl/vQnJnjoq61Hktmkl6hsiSxWCz2kMNZ7I5WS7Ht1Rt
	0r+JQawISucCWAldffp3l2aICcu/68xag5ublsJQxYYg2CJGcXw55Dm42QO/COctaXlYiUi97my
	FvMspbvxYpAgifKk2JSh6SNAqNzJem/j1h22c1Rbf72KXehtifQp8AHXhs7RYT47OSI=
X-Received: by 2002:a05:600c:8b11:b0:49c:edfe:d525 with SMTP id 5b1f17b1804b1-49cf82417f7mr260260105e9.10.1788601632697;
        Sat, 05 Sep 2026 02:47:12 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:12 -0700 (PDT)
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
Subject: [PATCH v2 7/9] docs: kernel-parameters: Drop the omap_mux= entry
Date: Sat,  5 Sep 2026 11:46:47 +0200
Message-Id: <20260905094649.41996-8-kmehltretter@gmail.com>
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

omap_mux= went away with commit e9f5f1e45608 ("ARM: OMAP2+: Remove
legacy mux code"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: e9f5f1e45608 ("ARM: OMAP2+: Remove legacy mux code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
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

