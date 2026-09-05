Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5728130146C
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 09:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601643; cv=none; b=U3/zI0RhsCZCo8cXttcPbzlvf0fKw9tAmiqfsHDfOcP2HS4hX1WMmWSulD7z9yZj7kyIwIR/QO49z/hDaVRy9Pvwq4mSpaPWab2ht1kn7+bS2xOhuZSQI1NhgGpwldk1fTy/Zvr433/ifTPnsjLzo8bAzhjUlItDEBZKGgVKxYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601643; c=relaxed/simple;
	bh=fApNG7pEOll5/tB3rqVahJ6bvMIxHk8hHb2CY3jSzQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GSxqBldsLMXIR3uTxlo/+il/vTDN73kO7zhFuRPL/v1x6exNUotw8/cxxIrYexT/l92G1hrorBPstW8+ncI0pw9hJsm32xpxdCM46LOzUdEbcfBx4fCQ16WkXVUvpBhMM425ReAqxfv0EqODGz6HTRnAnIsjXr6dMa0FclvNoeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCP4wTmW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCP4wTmW"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-485888b3c3dso1918787f8f.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 02:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601636; x=1789206436; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQmExMUpeIFcvU7MdenadgThwocm9EsyaVYoR2H42kg=;
        b=RCP4wTmWG0PPp5m/oleidyVtwdc73gAFZWg98mOiGEyD3tnPuPpLK4RUMD0vUL0own
         9qJ2T2YyCHPLxUJFXVX0drisnCUgv6CTv1/9LYSUmrj+dJYrG6aknr+WaY/AogshZN7g
         NZrqpnhX6Zid2hKpJv7WhP/oQOmjfX94O3vxbl7cmh19vx4p75DS6ir/nOI3T80gTJgc
         +Z/OCLHD+IOSrbH6pN22yk+HulQjHJY9p66/TcLphpmFlYv8/Mf6I0w/wQjaXMgKEuWl
         Ck035V0o/yJELWMTy451ZC8xuDM2Wse2MSyuWkQWGCe5/86pKKCMOiHqMcfYlXPA9tSN
         7wGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601636; x=1789206436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQmExMUpeIFcvU7MdenadgThwocm9EsyaVYoR2H42kg=;
        b=FnaggH/UliyeHZpKbqxf3diKGoWWvfjnZ/txoUSGf2jTTG9c8j8NPzkGgGWPPSrPfV
         Zl5KVQwxVfVvBGLUdy2ghD86ldg4HdjpH530ol6UlYA/JEcUzRQYzWrg0qcuyp59syT4
         2utgwKsKlfo4TRHtVg5u2n1w01a0oDJkA/Uy7srB/ztF8uHcY9CyXtPvp4IcZfGnOS+9
         ezug+VmO8RVPIXdV+oP5Dcj0MQCjvwq3FMBUPO6UiJ2VaV9hXZJkImTBjw+Th1M1tir/
         gTgyM56WuVfY8tPj4BRIdXo5GLYZJ6C5VV5rpovxjWRvCqBWaW0EZU4duM24L02RX7F9
         TWpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNuF3SQ9A3MOovnc0V0pWqwhbx5/jLbkV+0Dm0qQhbRbrjZADWfyB9oZTnyn/M2tj7+w+t03/XN/SU@lists.linux-m68k.org
X-Gm-Message-State: AFuF++k4vJPzLPOtpD7vS1o2UPkmsLVajcPPORMKDfga9+hpt8VRX4VQ
	peACpYNQWRpIn6OPwgjtmo6Vk3OZ8cCfUAwL+ybY0P2GuYIxZM/pZnIS
X-Gm-Gg: AYBFou2iN7u252IA3v5yyLLn1+UqNIaiGUXWAN8SDvKUUxhm+YdvvifTqYxf20f2fZr
	a3/b61VK+R3Bi2UrIdk4dKGQvH+c8LBOsmo4KeKzD0YW5nLo3Ubdhz+rsxDbKQMj+DrS9+Ym75F
	z4Cesj7G+s0J/Pocx48jQFB+ReSMP4+aMBmPknP54GK0BfJtGqdwI2DuMvZJozgUa+awwJ/Ksbv
	VxnUE2UW28sW4a8kRAg6EtaivGwoYHMko6yqm1qxQDMpMtMO7WYUj3BgZqf0n/UalPF+ME99s0+
	rW8iDxCI4Dg3qnn2Q/X2FfBFdIzGgtq7WFjOdsDFLlNK9bbOk9lmQ1PTzYVyhhRtx7qM+J5xRKm
	DJGqr2v1BRFvzJepQORSsvb3Mi9kAvaMEaxlK2vFdVmN4Le7yZeROEGjPEhOdCXBT1w9zlGFT28
	zJgUovogH7kBaD35yVkiF2AFY1FEwJ8kntwjPMTx5ffIVupsqEBGgAtJUL2tmIoVYrUGCwjA6gp
	BzrMcj4CKPYGbw+vdmmoYbjpHHGO7cc9bgZVth9xnQaX+5s9DaNExASCbl0FzsCV14MHcGLdTLj
	XIEKNavt8Z/B2mZinduvrn3a60f8NKVBXH0blm2HktYbzik9XQvKCvChSQzu14p8oqQJ7yR1s+U
	ANA==
X-Received: by 2002:a05:6000:2287:b0:485:8b5c:da39 with SMTP id ffacd0b85a97d-4858b5ce1bdmr9454058f8f.12.1788601636313;
        Sat, 05 Sep 2026 02:47:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:15 -0700 (PDT)
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
Subject: [PATCH v2 9/9] docs: kernel-parameters: Drop the pata_legacy.qdi and pata_legacy.winbond entries
Date: Sat,  5 Sep 2026 11:46:49 +0200
Message-Id: <20260905094649.41996-10-kmehltretter@gmail.com>
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

pata_legacy no longer has the qdi and winbond module parameters:
commit 3c4d783f6922 ("ata: pata_legacy: remove VLB support") removed
both together with the VLB controller support. The entries also refer
to CONFIG_PATA_QDI_MODULE and CONFIG_PATA_WINBOND_VLB_MODULE, which do
not exist either.

Drop both entries.

Fixes: 3c4d783f6922 ("ata: pata_legacy: remove VLB support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Damien Le Moal <dlemoal@kernel.org>
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

