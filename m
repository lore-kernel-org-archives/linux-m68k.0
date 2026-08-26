Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F3131619C
	for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Aug 2026 16:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760556; cv=none; b=VNiL258s6tu+5Ev6IENhSZ4Fen35tvJ7JHndhTmc1JGwPeoyEh+JCzEYIEO/ivyxu+EJeRdm6OyZH0UWSe5k8j9655xlFt1YJgZRKPhl8+JybwWJCifI2HH7ISB1fJxJhJDPO3DNYZfLj8ad5IHpfusKbIalFp2ULvQduY36IzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760556; c=relaxed/simple;
	bh=VdYiVlAaEz21Hi+q/JsnUD7U1RNcR3aPRlDlKQ3I68g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D3Fc7pZRxTlhGlJxJ7MRCjT+irTLR7Syi+skFdhBnsTcUdDBxPBAOhdvO1ix7bAL9ceyNjB63D82P0pKNjFEaJK7xLDCF0pSuRdCIB0u3Ab8i5o9M3eOoS8qHfhwxnqaZ5CCkZ/Ef7DeOSxp+2/u8/V6ASPD1wxRry6IAJ4yeRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDv8ZRlr; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDv8ZRlr"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1c26d7e951so169530066b.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Aug 2026 09:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787760553; x=1788365353; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zVZDnx8w1K3i56E12CadQZF3S/QBfdgckzz9SPQi62o=;
        b=fDv8ZRlrTvTLycx+PeKddPTLug2S555IFIk/kDmBA5eZIGEUSi6zWh7Ih88fCoJURb
         3WhfaOMNzW8cjGc0IaRO0p+wQO/4DXl5fpBGP5KD7l0xXXTi6bY1V+SwXn3w5DGUOiup
         2OqVbBtJk+kQfFFN8/oKUwgCNuvxB3nl8GxCdHTQ4nP/pJ/D63nGBqZCSJY6zS3XTpUb
         F46J6fLQ3BQtua+Ic3VGq6jOMyOvjSE8DG548HGIVjgqvU9VI1l7cbQOJI4RRDJFlV1l
         /Sf7ZYtHjCDtyBX0wR4OVne3q6mnBw1cKqy/POyWcF4q4FlUezgBJrbPhwwIG2A+uEaI
         0NCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787760553; x=1788365353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVZDnx8w1K3i56E12CadQZF3S/QBfdgckzz9SPQi62o=;
        b=HD12V3OAIGpQZ48sRgWYITvyBv2A+m0OblB0NTHEFwqFP23J5HLKq2JBs7Vqh8bzXa
         KmI6mcmZ6TPl/dFlbZRF0FRLUPzJfRZLkE6H5hNFw+H9YWruA8joogfIso+9yFqkYn/s
         /+YDY3Y3f5Ljlq7kGrtyScIZFVLffRTFmg30rz4oAI1dUM2cZaTc8IBna1jHJVlR5nOD
         EtIqkDPJgcZZItjbPomJqPRVXXOUiQULH0Mm4n1EuYx0G9wLCVOG+C8HY8/k2WI84uSl
         kdXEh3TIlBZ5//m5w7KXLn2pGs8ljdSLKlJmjjNdMN8zMWiayDB7OrQ2Q87VI7QYlJzV
         Vi2g==
X-Forwarded-Encrypted: i=1; AHgh+RqtFNHiWNXXL4d6GuC99oVVvRwmolnOMoqHznEnVTRKIzEIvgvFEi6RJLFJp2sofJUnc9v6nSf0FCfl@lists.linux-m68k.org
X-Gm-Message-State: AFuF++n7KWltpmYG3bjgRrn5uYDnQA51RLdMkkroq7u8sW265Xzlc7Ln
	Cz9a9/IPtxmDZcJ9sd0do9xhJVHjaSOMMrwzxS1+I7J0O7oo+Rh0hD2q
X-Gm-Gg: AR+sD11Fytil2xlW4HFl4wOAaDZK6hdIv7D9PEgl18Guo1yRiv5vWIvSxSMIs/Ai0oG
	1geFg4OBS7IzJffpyYYfPhNDxbiHzKSPjhEGEs0a2OqrmQ6FMblElQyPVafmJhm5qETZQDQRHdZ
	c5qv7of80+35knmC+XuoqWNPjv/unOzNXCaargIjZFYUcMv3UqYoca4E794X1dXTD9dtffyEpfw
	FM6tJjUgz6dtqkvEp1Ks6ZPheXg/ICpBGwACXCrwMF2leCGpIgaz/52iVEx+EM7gdeBjmb6CGcm
	7Cc6d5Hab8LGCLwb+Gk9IwW+0badoB5m2yfejxg48kmNHhelkbVBRdL9wT3y73zIrAn5/BX5xgT
	VWWJeJPNwMP1fASDrREcaDB3mbey84J3Edl5jLtHYh8n6GcXdFJGCpclUR5CULj17wvJtPZcYSW
	KaCIptOP52Y9QWPPCEM2nlkmvUcAKven1xs7eVPKWBzB6GhmXDA+9z9xdQf+QiA4X1dCg+nWTIO
	feuqi+Zzk0OLpS7w4V21cqZifP7AmlqZJ/6o0s0WSw71GU=
X-Received: by 2002:a17:907:e1c4:20b0:c25:1b4f:6d95 with SMTP id a640c23a62f3a-c251b4f7a1fmr632539166b.6.1787760552958;
        Wed, 26 Aug 2026 09:09:12 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:78ce:12f6:160d:28db])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25271e4cbcsm386050366b.18.2026.08.26.09.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:09:12 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] m68k: pata_cswarp: Add Amiga cslab ata support
Date: Wed, 26 Aug 2026 18:09:09 +0200
Message-ID: <20260826160911.460165-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here is a driver (and the subsequent defconfig change) for the pata/CF socket in
the CS-Lab Warp series of Amiga boards.

This is a respin of v5 addressing Geert's and sashiko-bot's review.

Tested on real Warp hardware.

v5: https://lore.kernel.org/linux-ide/20260824153339.512487-1-p.pisati@gmail.com/

Changes in v6:
 - fix 7.3 FTBFS (include <linux/device-id/zorro.h>, and use named initializers in
   the zorro_device_id table)
 - use devm_ioremap()
 - print the register window with %pR in ata_port_desc()

Changes in v5:
 - return the number of bytes actually consumed on the bus
 - fix the trailing byte in pata_cswarp_data_xfer()
 - drop a blank line in Kconfig
 - fix the remaining checkpatch complaints

Changes in v4:
 - refactor pata_cswarp_data_xfer()
 - ioremap WARP_OFFSET_ATA region

Changes in v3:
 - suppress a comment
 - properly return ata_host_activate() error code

Change in v2:
 - fix style, remove duplicate swap macro, driver version, etc
 - rework the zorro attach mechanism
 - remove the unnecessary zorro ids refactor

Paolo Pisati (2):
  ata: pata_cswarp: Add Amiga cslab ata support
  m68k: defconfig: enable PATA_CSWARP

 arch/m68k/configs/amiga_defconfig |   1 +
 arch/m68k/configs/multi_defconfig |   1 +
 drivers/ata/Kconfig               |  10 ++
 drivers/ata/Makefile              |   1 +
 drivers/ata/pata_cswarp.c         | 183 ++++++++++++++++++++++++++++++
 5 files changed, 196 insertions(+)
 create mode 100644 drivers/ata/pata_cswarp.c


base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
-- 
2.43.0

