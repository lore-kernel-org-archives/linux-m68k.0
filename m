Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474F62D8764
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Oct 2025 09:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759829021; cv=none; b=BmX+5D0QZp7E4UN8C++Jo5myOZJuMtq0tGN4j92hauW+CkXYvSQrO1V0MoqF+zqPlDueyJKmTazguumeVdVWKmkzZTf8R9EtgKUBNxY1falzIC/NSbWD1jg8z1ACpGOfeCBxk50siVktsH2LwRAwCyAW0fZfY75RPEVtsqtHF6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759829021; c=relaxed/simple;
	bh=vOEMENaovdm9ccCHM/8VsN0k/NdulbFSwwEhhfsljgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=igo4rsdLhVQnF8k60h74zjnyS4zx5gs+3gUe3ChmbDeUVLgCAapCu8COff5o+C9vEGvCn9J8RWcrpSnyW84BJdGyro37sCv8ddXcptKH7ym8WdzFqatO8GrKrpsAvdRxI4jbn9yidyCbfbByPBKHMiiXOh9+CIgqrx7ZtS4TOTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=HBIZ5FyA; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="HBIZ5FyA"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-77f68fae1a8so7712880b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Oct 2025 02:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1759829019; x=1760433819; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkgHB/Rx6YD5mkkjItctKin/3uCiIG1rZ2SooPNG71I=;
        b=HBIZ5FyAuVfixcygnM1lHnl5Q/9ujklJxRFLiMfEhi0maWE0ea7NkDcFB6K7fDPPqN
         Jvt/Hm333COZ59iTJoH1KF6rI+B0/WNgqfS6WIHkbePYxCr8jEtF+lLu8udUPSC4bj2r
         eBsoYwBgwngJzf122HsK3BNrclZ9D5pZGkrSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759829019; x=1760433819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkgHB/Rx6YD5mkkjItctKin/3uCiIG1rZ2SooPNG71I=;
        b=NqaNvdcqLSpXySjUs62PmjF50EVhNjuRyLVF3PSR9KIk7T9RwFlluuqboy+CEcIwSL
         UfywJUhM421osCixfLp0K2/i/cG2fYldv2+UEPkvi6VEaDGdz1p1JaWS7988MIAeuvJR
         RyTVzWlixHuD4zqX5LFF7SnHg/y8uF98GnHRYGDogtfsbhCaKPCDZaF40Vp/J1dsWibr
         S8c0kHS1Hm4nKznx6+J7nYmL7Hes4uGsAa9Q9/Im0VUD7jd+WsJ/McNZcRg+JNzyKxWF
         sxVjLCih+p0zANwfTWiLp+PmQqxfbvsabbFQqx+vnoVx7aYmf7jDKS0dnEBglLBHBibR
         hjfA==
X-Gm-Message-State: AOJu0YwxE9z66FeaXebWGhIjZJGL9DbR/yNcoX//8KUff9+1OTWlcPNQ
	Mr3oqINyvoo+TRC2aMYYrnaoy/iv84Q3zOgOyXkW4Dmih/TYFrRoyGxg9zR+6fSgiQRXh0lpBWc
	qZqQyfjA=
X-Gm-Gg: ASbGncvZJWqiHPOvZe/13/YFRMo0agfvehYhb4n1D6Pq5pBpb4OBfALnT7+EDToEe+f
	zYLSeherPD79CPABXLafqaJRLgePJeOexVdLdy2I+NV3Q1T7+6v9DDjCaS7PL3wT4fDTjwmNN65
	7FsDIhjswWmQV0qmN4DrJrzTvGsCi8r+gJhvthKqnGmRqgWlu3r6/eK/ZPt8bg30IUoE6HafVIy
	3bLpgJusxOP3+uuL45W6qfs9WnQEk49oSPvi6TSnqrbdozFLI2GvWWnXpS+Y86uspG+2NNntTlZ
	4xvuIgBgJR1mU/Dpd8fAD32wr5zrhwb3tG9aQh88RoDikOBmwJHb+ZAJZhPzu//KHOF68UVsk7I
	esGwjVEKQ/mcD4La8nu9Bwp15KLVrgYm/E7xUzoL14TxxUkfjgGKqrG5dcDmkYTRF6bBxxh0F9v
	02f7xHdd++J88M8ooSDiN9KKmNgqf003EQ5dI=
X-Google-Smtp-Source: AGHT+IEkoZ49NHDSFtXnBk2cm2DDRooGytgcNKyAOw5DMVDLSoZWdRSYe50TuAE1idLzf3WVMAfdyQ==
X-Received: by 2002:a05:6a20:958f:b0:24e:e270:2f64 with SMTP id adf61e73a8af0-32b61b30302mr20565633637.0.1759829019271;
        Tue, 07 Oct 2025 02:23:39 -0700 (PDT)
Received: from kinako.work.home.arpa (p1522181-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.198.181])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-78b01f99acesm15123273b3a.5.2025.10.07.02.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:23:38 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-m68k@lists.linux-m68k.org,
	linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [RFC PATCH 3/5] m68k: amiga: Allow PCI
Date: Tue,  7 Oct 2025 18:23:11 +0900
Message-ID: <20251007092313.755856-4-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007092313.755856-1-daniel@thingy.jp>
References: <20251007092313.755856-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Amiga has various options for adding a PCI bus so select HAVE_PCI.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 arch/m68k/Kconfig.machine | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index de39f23b180e..b170ebf39273 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -7,6 +7,7 @@ config AMIGA
 	bool "Amiga support"
 	depends on MMU
 	select LEGACY_TIMER_TICK
+	select HAVE_PCI
 	help
 	  This option enables support for the Amiga series of computers. If
 	  you plan to use this kernel on an Amiga, say Y here and browse the
-- 
2.51.0

