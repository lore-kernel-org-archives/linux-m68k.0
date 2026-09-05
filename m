Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4963E1232
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 07:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591860; cv=none; b=XoIu/gBgUTRHpbOBFVsyOkwUQh7hclYL71FgpsI6GIo1Mf6dSF07vrZAXFGlxA3shJ8x1FwvETxEMP7yO0C3xyeWjJIeqYct3JHVbbu0pV2mThtlFnISdXXPp3etzX9eWHX6bN3gGxENFvn1h6Pw3F7v893fck2JCg7a1/971uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591860; c=relaxed/simple;
	bh=pPxPTNpM/nAKvWxY9H5AEsCMADngEkeEEOle128cyr0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KL1OACxq9bWUIfryqPMQN86EuSLJ6lobM7APVTLVO6BiUeXQNRU0+wXfvhp3J4VrSkYoy9CkwZ1b4DNF/ufAhuIzZbzAtysgKdRwcaWBOB4lYcUAfn/3V9IpKkg60AtHxcqfmvyWviECSP3c8agB5vWEXp0DRm3+Bts6/T9+v90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tu26p85j; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tu26p85j"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48589798dbbso1378207f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 00:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591851; x=1789196651; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r0TEPPXgHP97qr/cFTbi2WII06m9YnzLfHQVRRK4PYs=;
        b=Tu26p85ju9LSwPbYpmDwW4R7Eij94JaaGWW6tt1lrTB5JOJTAdPkNzyJryRb4mstF/
         w1xwtlBYiOVzIdOKlZL+CziYEKtBgFYAibe548SuYLlHgo1Tf0J+1bc3vUsvYD86djzd
         yYMm6IJFj44YybbvuDbhZnddybV4CJilD85Rr0ridTDpsmLGsQ0NC9LcFJ0RbTzeNvvJ
         5KGbzeoVDWrBecNT74D00OH/80ZWfCqIn2CXW2JGkIe9lSlQsCSUWytLx6hI0kDU3FXk
         nE096Qsqj19xOjLLz58bsz9acQItwBorRL17iWpfIvY/1HajRWzkFn/i+dtbq5SgBBZS
         Vx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591851; x=1789196651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r0TEPPXgHP97qr/cFTbi2WII06m9YnzLfHQVRRK4PYs=;
        b=fgn5gUOLC7hnnWE58Kupiidqv3+MFMIJP+u/eZVxRgPTSlz6QyqB+ISLWhuRhFyv8K
         n+/+zrGDQ3raOWPZnxDHFKKRgfyE9SgFB5Odugdm327dNYTKvY06KmDTcIKzLrXeGxn0
         wFMLCxlYI7FqBisYdWEvYC6stX5AJue1HtP7kZnSehFK1jF+3DmSiIkm6NfcicMRtbnd
         jdgbxLVNIspeYOSrtJQZ9LRe+XM7o4GTINufp4TtlxE7T9bHhFt/msBsOBUGlM8SRTVp
         3wvvNUzsnmBylMSmRGDd/o9Nlo7v9D22jyz2TSUF33yDN5Qnic0mRCSwpNWx/GPp0V8+
         jJQg==
X-Forwarded-Encrypted: i=1; AKwUvByJL5gfVNM0J81zXPiUG8XeXoWtHbJWP8blEmgw1eLcYVzdNr6hSHvccTgdbNED1D1VtQ8BYIEccXwP@lists.linux-m68k.org
X-Gm-Message-State: AFuF++mK1MJz+AwI0rzs7DPvIGtAX6IIP5dYrB4Um2I7WgJKGSbCg+ZD
	alAI8YTJYafzjMsO2d4u6+k4O5JEd5mFIUPLOXC5bpymDBxQer5KPDpo
X-Gm-Gg: AYBFou1aRZanmzvDWVp2iW+9YxYb2oaemX6zMXRROX9DYUmxaDjBrsZXV12SGBVMaK+
	hWjrDV/eVolkQQD6ZS+b1U47Xyt5zzvdWSnYwbMQ+DnrE7m5jMXGWivPv8mC7xHViVKSoS73AaV
	FkyCVrNKiQ/3GRP3CGXTW0/gpeY0+KJPxUk8HUBQFaGRI1wDqquLdM8jcXy8h/CJK3fR1yEwJ+L
	57bDIzY3C/vr2dJCEu9nbBlpQ9pHegEQaBcTYgmGaBDEChsTlF1gfvlgl4nkjDxlm/0PZMOSDvI
	tva/PuUtiFnEpa4C2R8vzlo6bhfiv+nlQXSO1HAlLO9tv6TouVVyXvDtkkBpjRmyhSNOmfPQkS3
	dBs9BCOFAWYVGURjnrckGTTIXSGhvJ2cT2LXrDzBmrUNRKIFZ6dBzKldhfj6BrphU3YykEqwi+I
	23a/ydI54AVgJmW6ugrDNp/J/YVEovvkRo5GW/y8aIOYtPIoT33SgUwO1qvLvEJMGCOOlOc/uWl
	oB1Rt+dWZ+9J4aALOw6pdGBktuGU9TGbSOl1wt7PdGn4SVeJ0NNc2Osqs84fNxpRIBTwMpB4l49
	i6x4aRrZ4AxWkv9IdyN2aJyUTa/elnIFWf9cancHraO2ITsOKAZeMc3WTcuIXpYWQB8TrOoe
X-Received: by 2002:a05:6000:24c4:b0:485:8a46:7053 with SMTP id ffacd0b85a97d-4858a467176mr9452131f8f.37.1788591850939;
        Sat, 05 Sep 2026 00:04:10 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:10 -0700 (PDT)
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
Subject: [PATCH 9/9] docs: kernel-parameters: Drop the pata_legacy.qdi and pata_legacy.winbond entries
Date: Sat,  5 Sep 2026 09:03:47 +0200
Message-Id: <20260905070347.25902-10-kmehltretter@gmail.com>
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

pata_legacy no longer has qdi or winbond module parameters. The QDI
support went away with commit 0dcd0a76370a ("libata: remove no longer
needed pata_qdi driver") and the Winbond VLB support with commit
3c4d783f6922 ("ata: pata_legacy: remove VLB support"). The entries also
refer to CONFIG_PATA_QDI_MODULE and CONFIG_PATA_WINBOND_VLB_MODULE,
which do not exist either.

Drop both entries.

Fixes: 0dcd0a76370a ("libata: remove no longer needed pata_qdi driver")
Fixes: 3c4d783f6922 ("ata: pata_legacy: remove VLB support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4864e37005be..33298da28b55 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4994,19 +4994,6 @@ Kernel parameters
 			the first port in the list above (0x1f0), and so on.
 			By default all supported ports are probed.
 
-	pata_legacy.qdi=	[HW,LIBATA]
-			Format: <int>
-			Set to non-zero to probe QDI controllers.  By default
-			set to 1 if CONFIG_PATA_QDI_MODULE, 0 otherwise.
-
-	pata_legacy.winbond=	[HW,LIBATA]
-			Format: <int>
-			Set to non-zero to probe Winbond controllers.  Use
-			the standard I/O port (0x130) if 1, otherwise the
-			value given is the I/O port to use (typically 0x1b0).
-			By default set to 1 if CONFIG_PATA_WINBOND_VLB_MODULE,
-			0 otherwise.
-
 	pata_platform.pio_mask=	[HW,LIBATA]
 			Format: <int>
 			Supported PIO mode mask.  Set individual bits to allow
-- 
2.53.0

