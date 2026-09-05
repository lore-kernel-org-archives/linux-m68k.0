Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6533DB31D
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591856; cv=none; b=XX1gtJjdfrAN9PUZcreO9SDgxlmZyCglN2PalKsMS9vJDoj+FESJ1giETKQ0B5V/SuQRWrVFoKL/nf5b5th3FFzZ1MsHv1a/IBMjcr/sqoOKOJnrgn56BqfFQvjYCWxnkpzoZEtxNCL8nr3zFON+9E7lC/L3iDML/8sCAjkprRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591856; c=relaxed/simple;
	bh=ItZT5GNunHVnueIdaFQjAOk/BPjP1n6HkFAdihTWgYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VDteWkOveLS0sJwzf5pWv5MImf8N7uqigH7jw8gvH0mOLKPtuDuCcJG18JZUhp2e9mJ2WSdliN/Xx0v+16ewiSxw0SPgKATGRm4Afu/TcEmbqALTTnUSHgnnjVs8PkmxOHxJlPzF4J5vXMVkb4QV4AuRGU1q5rqEDzUWMrgjklI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEYFud9m; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEYFud9m"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4858303de5dso2174008f8f.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 00:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591848; x=1789196648; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFzQQFmCjPVcuR+l7FGQ0u8MffPmow8qd7a6fWjai5g=;
        b=lEYFud9mxnI0MMP6rCW75OEfygWdkAoMIwZJAStEnXKfMbw8e+IgLaq0j4RezSGEs8
         PhlC53p0WyG/QGld4tPfVsrQaQcra24EyDL2bNUPOxnz7DSABJcdXq1bpG2GuoyvuN7B
         GWwtXc+3dJIUPJw2GqCPDW45ZckvGc/dA81OWqFGRtGjrdvsjoGcWFY9O8haFIc2Pzt5
         wVvbNK8EJP8xxwTHH3J1wzFgeiYPgwK5VyIFXjUrhMrkfrRRDE9f8hi0bpE0qZexs7S6
         aIr5ucpqyKRBLcoeRCZkuiBjtQ7X5SAqXyxsMd27aJFxDzAotJsZFTSpwkoYAkBgMnYY
         DBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591848; x=1789196648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kFzQQFmCjPVcuR+l7FGQ0u8MffPmow8qd7a6fWjai5g=;
        b=jsR9rdQQvuEPzmQ3aowf9okFq3Rp6DXoPc/DqiaHFNtvV7MN4PFAOwWOs/ejPYNZPP
         XrGKC2yyZvx72w3yc5DMWM9QqyziGcM1nD3xmJI5L71X54DYC7tfR/v8wrf/+YU0CkTK
         jmHobOsfsvvdJshMDIqW7O119v1o6JyY4dOgpd7QxxgAFQpsNPgC/4yQzKgpCQzWFnD9
         S1Isg3D3SkOmMetPCAWGBgfJuDGjGehVuWOm0NZRLJXr3SvWeZXB64xq+BtFHBJ4wGL4
         UVl6yKEcNyfpFhe5QGRg/DrraEHBRVQ58jHvZwXv0h+sDhJMql1omwaK6uEGGrWFaaai
         pHkw==
X-Forwarded-Encrypted: i=1; AKwUvBwITJ//Peo32SgUmiE7ukUZSRUE5LUXeUs9xH64z7//PW7BJCOPeq1j4k1lX3K4psvuFun9OtDpcc3F@lists.linux-m68k.org
X-Gm-Message-State: AFuF++nUapB/qlVQhxlMzmvnHtwh49BJOVebcDU4v67ebnefngULAwqR
	DXrLWUKW5T5Pjkr1WBjSNNfrVGRVledwyljVrsTmy5YXQojIXTLUiMlR
X-Gm-Gg: AYBFou28wQYrCv2CVp0WNxgLM3HVvKvgjAzuxt2069TxDNbtqs7PTEdrJN8Rkc4BfaM
	R6Tk+9aAUqLh7+KpDqKNf5Khf+n5Dj23Ndnd+Mw8IgW3Ea7ja3vpSO0xHUlaKj/ZdP1S+iDkEM0
	oDJb/Puxs8Ztw5MvTnPOozuUEVZGFikz1kkgpRKWTYA3NfPczotNbNbss9YLP2p2zxWKoqtrFok
	nRPAsJgE6cb89I+7F+oSOzIQMLeNPNQJ7Tl1eVFV076g9BczWGWoG+RzdF4S7AipWG23dFd8SYT
	rkjw9hq74j/tPe6CzmCGtnzfKwxnoVqGIjuFQrrEda3q+qz2tANLM3nnoNCZ9d/ytdV5XHJr83g
	7IftBZCr3hvl6DaTGWNdUhNv/riDowJzyD42+eUGLHCPdg+V8+eWUdGove+KcoeDxjx+7uMkMZH
	85Z4GYGyeLBWbBqUh9wQjTNHXGz8cRyWXc8k3DkHgQR3opOJHao1hsndHKumUECnxtxzr3HMcvt
	SbOQSY9xfngnMyBxKywgpAvfaiDhcKGrvT6JzBKYcX3ASX+s1DK31PR5A3qy8vqT9fI7SUj4/EQ
	Iyi6Cnja8do+dNGzfiPcp+CpSXMPG8iHeXjxrOvEvkApieip9Q3hzr6r+Lw+wI2IWv2rPGyhH8Z
	EwSCjKT4=
X-Received: by 2002:a5d:5f55:0:b0:481:503b:b663 with SMTP id ffacd0b85a97d-48587091856mr13328658f8f.18.1788591847580;
        Sat, 05 Sep 2026 00:04:07 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:07 -0700 (PDT)
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
Subject: [PATCH 7/9] docs: kernel-parameters: Drop the omap_mux= entry
Date: Sat,  5 Sep 2026 09:03:45 +0200
Message-Id: <20260905070347.25902-8-kmehltretter@gmail.com>
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

omap_mux= went away with commit e9f5f1e45608 ("ARM: OMAP2+: Remove
legacy mux code"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: e9f5f1e45608 ("ARM: OMAP2+: Remove legacy mux code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
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

