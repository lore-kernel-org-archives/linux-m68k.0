Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D58242A175
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 09:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601638; cv=none; b=gUXTVctaGBqrkW60X4YM+dbftl8ZcDSqzCYgU/ypydVb67EKSvfUcsZs73MolLBVjMJcqc6IediVoqztCGUzCwRPWbrt5ZU9EPpkNwl/cQ6xo1ZMkObFmjKRhJj/GXB442lgc88CVirXA2C8z41nRv+bk/vbSDkMRxU5+LryDx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601638; c=relaxed/simple;
	bh=BaEoG/6SLaF+j+PN5tp7+Wdp37OedR46Vcq2/qxVkD4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GvUDOQznS+pUoZazd5I1TFimBQ8Bd5I6++NAJaTwrCs5GnCvdKZ6mAnZ2/oD/8x0nuxYGiW/CRUiQGkrCGjlnve0y3rtPu5EkHbc7BJA7zdQ5phvQIr6XomuBRk3r6dXsJev1gFBjGbyA1OF7ViiJ2CRW1mHq5y1KFSZQuyYcDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIbhM9Gl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIbhM9Gl"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482e4998d28so1386636f8f.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 02:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601624; x=1789206424; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8I1Jlm5MucKkfjFwaOiA/wi4L8q8pr7cNwUH5XJFU8M=;
        b=SIbhM9GljcgFouTId8+d3wTqdGaqKxQWHDY/UVRv/fTiCW1cMWy24ZidtcQz/gD9de
         Um6nm4kP8CmhhEVZLmTViNOZaM3w7V7xzZdeZrcJ6+yUt9+sGnEheXP9jvhXh1nEuB/v
         3nv1s808FJRpdfCy4CnjfocG6Uxa0gPV2Mg6m11EhBaGNqjiCK5H6fVmpC8cn06heG3w
         CUKEo8Ene0/ZuGPAJWbBBgt8fRYEcXlx+hFLIKuqO/bT+u1zEMFRZK8lGZ7LTDRNiZip
         zSQM/jtMLLZo/xdk4zQSOG/L8aR+qF+zO1vN8JwG4khqX94TAqJOYBRIi6PPvyl7LrPE
         z39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601624; x=1789206424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8I1Jlm5MucKkfjFwaOiA/wi4L8q8pr7cNwUH5XJFU8M=;
        b=IFbhlR+lazINH4Sf22IFL3sk0NgRB6dBJWwUDsvntEiaMK4WfeSHpik3zGqMF+6LEs
         2/kUEM0AZLWJVi83/0jKrK1AZzAWc+PiYgxZxNPHN00c7Tqj3KzvVQn9ZDID52bpSSKR
         +HSlWpvR1e6dBjlFQ9Cw6JWmfXnhhjBRsALb4uZOxhUeRMp1VdwGfLwzfwOpVIsBQjdP
         8at6PJJQNI28PE+juALXCC5vJq4gmFcO1c21WC8xxOZ7ZRZ2bvKQnDbbEl8/X+joc2yO
         Bzx31Sgpmu3RSSc4KYEosWWFwDZoQgz/8HjMS4h9Q6diOkEO44miB2YD9IWLjokQGG/b
         wGOA==
X-Forwarded-Encrypted: i=1; AKwUvByumVzFatW6UZ7Twsk/P+ish/BPCqtmBOFUUsQ759ElBkbc8/YZbJ+ty0w8apIvNQpuZaDRU89VNbFp@lists.linux-m68k.org
X-Gm-Message-State: AFuF++n9baY0OOcVkZwpFrt7P6m72vyi7jMXqdbceY59KCPkieyaYWqv
	lweuRzkEWzqyxQBq4BWjyYPmVe8d/SAsC5AADVO5TE/nC6NEKDlDGYJ7
X-Gm-Gg: AYBFou0jNlzjLagP6Ytm6xJZk2MkzsvWp3r5GFjIehxrKonosALBYlhU+JdPN2tVw/I
	y/g9niVXgL+qFixeHPAJaccic7Rrjh7qN+TowNVS0PbzUa14BQ7fmrLVjGkX9GXN2pnHkinZjnh
	Kn5FCosOzJ4wxBgIaivquRYU8sp5SVM/fmAMvcN+hpsEEbgPEtwj6LxGNmDscgYG0dvUCew9T9x
	AvdMIJpf0ph2FPjEZgE5RdLLlPc+l3kvrHOaQmxmfINHCmKJExAeSjeqBU9WPkj+kokKpl6/vMn
	4Bj4Cy2YHdDoTJ1zBFTmSVguYWnde4usXvh31WvXMRlKbuB7ESrDIWiinuCRZrQE+h8sEFGIoaA
	O5Fo4V49SukgyAdtjPcfGY3MP9ahXQowqiSaDQOc5beN0kFLsDltjTcBWiaMmYLqycg9tsXdi+s
	F2oc+5ztE+d4bvEv6ihASnjp2ju5MNEPPYKLhgyW7o5tHCPWYyLv5eDEHxPH5YCLzRKZY7V/5Pf
	YbA4Od0NXMdA9B895qYKC4bs/2+/AkCJ+Q9KoRmM3JUSSyzimSxmDqlLLvpoXs0i1Kcb+mVlXhF
	E2ChdGmJYodGOSsSZAHYddw5C0eCyyRwMRCX+k/Oqiu9gQN600uAOWPBjztiJGYCfJhs46ts3B0
	Duw==
X-Received: by 2002:a05:6000:18a9:b0:485:9211:6560 with SMTP id ffacd0b85a97d-485921165d7mr3155784f8f.25.1788601623937;
        Sat, 05 Sep 2026 02:47:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:03 -0700 (PDT)
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
Subject: [PATCH v2 2/9] docs: kernel-parameters: Drop the bau= entry
Date: Sat,  5 Sep 2026 11:46:42 +0200
Message-Id: <20260905094649.41996-3-kmehltretter@gmail.com>
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

bau= went away with commit 39297dde7390 ("x86/platform/uv: Remove UV
BAU TLB Shootdown Handler"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 39297dde7390 ("x86/platform/uv: Remove UV BAU TLB Shootdown Handler")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
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

