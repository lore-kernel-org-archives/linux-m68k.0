Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAA644062B
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 09:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601637; cv=none; b=bKiw39+Hg/kSwO/HV/HE5eLgn9tSmhyiw8bmssaAzrViiKGAT9PZ+3fVwq57BZb6HJDBic5dUdnWL9OpwSgaYMIC+N7Fu8Z46KcbEawYtLiv9+MfswezwvZaX2ItzSHXjajLUT7TS90oJv9GMpEc3XQHrShVEYgVie5TIAVr3u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601637; c=relaxed/simple;
	bh=YsfDHjDKsIWAkoUgaj1imFKWTfOFfJnvMXwuV6H0pgE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XeEdHuIVpHaZ5j2irjnyETmFgUmVmUie9mWcsJfwUs0FJFXGL5KqtY6UdktxWaLDD1KdptXD0EXeKP6d1CJFX5jtMFpGSzC0d5Rklpy/3rJH67NisXJltRx54zUy12Dlvr5kfngUmLEtvr+IwgRNRYSgKJSbv0pYRXBfRbwOtYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQXcUFHS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQXcUFHS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso16702255e9.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 02:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601628; x=1789206428; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=;
        b=UQXcUFHS8U2QcUQlgRM5GEM93gP/kEQhsoGwmbRrt0R7wRX5ovUc3USwA4qfTe60yu
         ND3lfozQnyWzr65hX5moMBM89OID0X6nCXTQUb3okwji84fF0qtf/PeuuiLS7sKTg643
         AaFMeeFW9wK26ltxtZrOZrEXefQQSj3SyxBDXonmvnjllgD9aKFLosAuKDfVfiMXnIee
         kolkVBGSIGQzO30gX3BVjXyx1zATUvl/FG13YLc3R0U/EVFZ5vY7++dqt5gnEcRJLbUF
         M1jBeKGgkp0D++Zf2VPS+MNtNkoNCvLonZmbnbxGF3sPTY/RM4TARdSyD6fWGqGmAq+j
         q92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601628; x=1789206428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=;
        b=NLre7w2hN5yS2jy4c8oGUoGuPmactOa5NbvNAQJkbBX+5RI2ZHYS6zNDoAZzjb60L9
         YtTi2aq9s1jZoZkzG/+5y0UK8PrTkcfkakDumPRErPF5pAD80hakzg1DDyXReEN9XJct
         dB0if1qdRDq2jg8HhwcKGnY5vA357PPcAXKQhNIaRRjfyKrjg/B9IQsj2QWk4eFJC+l5
         bVPFrfe3xKLRIJBPYxYHN/3twRBS5YZA0OAzJmc716rk76K4s5TISn50TtCxfJw07vjE
         SrKydgzGPkCHt5sVsZBGALS1GHPb+kXDquuW+env+5D9fKWre0MDQZRi9rybMHvEFSfj
         93Jw==
X-Forwarded-Encrypted: i=1; AKwUvBwHoxNrr2h8J5il7vNGARjk0+TPI7REwbB2fGcx6/sknRWp7a+XfuNLSvU5itDsyNzb8Agds6OymufT@lists.linux-m68k.org
X-Gm-Message-State: AFuF++lTCNPo6R87f31itFATk1B0t9KEA444ggpOY6/BoYdGbcPW3uEq
	gXnkH4mWQWehulO4iI833XWS2qm9N6vNHnnXHlYCtmodpGXXIX+xsoXE
X-Gm-Gg: AYBFou1sAuU8Cwd0jaiSG2nmfHFXQViySNeyhPr5LNS93Uvvhj0mqHXEkvXSsZbZKbw
	0cNbxYwmrPXY8KXGpgYXrL+qDZ2Ih/Bbfsa+ZzSA5zsOq7BA10w54DAZkknT6kRa86n9NefdYKW
	HoTkXYSWrweRH6D4g7nyHS8tE3ohCjoVmZWjx03t4VzEve8elNRRq68FqTHr32pU48Z7+HavpvF
	+nstaJmHj7pybFUEj2KDI38yub+gDX6zZB6HXs9mRM8FCvgHeIMvj9NdYXAS+5bfLNtR7zmu/Im
	dpnoVl7z9Z2DQ3rlveqgHTLFvaT6VyXBnEpAk6iRXuG+iak1DC6AC87MuKLFw0t3bRFdaI76K+y
	vvK01LazA9DuPY13Hk6pn3AVmEQ6lTWfpyr3PQNIV0l3rRFHC5CCypDlZtc5nlLTkquBuit04lZ
	4GghNhcb+AoqSujgd6RL51ZByrFsJ4zLN+13TKxGqc1BaNl41jLbIgmoDmdHiX0nbG+WRB7fEvx
	HzjavUBstMvLhwvNbT3w0EQISeIjJxYIdsLpEDY9nlV07+3mC34ImxuE1edilFdO7YlghMaKdhr
	3jny+bVTJDWAmI0N++5P1xAyvnvuGmVVWDlZX1EF+7rdsj1m0Y/o9li5YZAmpYAg+hiY3KKhjgz
	chA==
X-Received: by 2002:a05:600c:a307:b0:49c:f13d:ffea with SMTP id 5b1f17b1804b1-49cf13e05c2mr154976805e9.14.1788601627485;
        Sat, 05 Sep 2026 02:47:07 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:06 -0700 (PDT)
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
Subject: [PATCH v2 4/9] docs: kernel-parameters: Drop the enable_timer_pin_1 entry
Date: Sat,  5 Sep 2026 11:46:44 +0200
Message-Id: <20260905094649.41996-5-kmehltretter@gmail.com>
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

