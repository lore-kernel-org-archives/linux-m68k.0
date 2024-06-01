Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A9620332
	for <linux-m68k@lists.linux-m68k.org>; Sat,  1 Jun 2024 14:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717252342; cv=none; b=IvomxbLyf9DUkKEDFg+a9+PMjFhvUFgdoI5IqVjI31SgmOAhi7YMcg/o2IdVXkN75wDCnJKEUskho7UYDX5D/+Opq5E3xkdBkzlCjIGpjTBiwopGvm1cCbtqWxEiCGYrNQOCLFXm77sMzf3VNELrw1GufIq74+rQnuAkCnCwYLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717252342; c=relaxed/simple;
	bh=XO93vyf7mfc/fFrApUjcqWAjFZVENaXyHIZ3HOYshoQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=YoCpMDCJgL2E7bIEyCPkMNECU+JYRNAxV3hNIUflHrkA9ApiuK4B6zKc2HDoFpcF61JcWeNMW9wq7sbofoW3YlD9MYU2PGr7mhuyD/Yc3gRI5GSfnMBgL0HNfzmCwgh95+d3nnlS00oE19OqRI2CjA00lz7c2+8NqVuKqsodLls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlcARXmD; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlcARXmD"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-35dc984b3d2so2006524f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 01 Jun 2024 07:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717252338; x=1717857138; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AAzGQHHvQLZwmLK1tb/w8l1HPqGpf52A6X2KaKTc7M8=;
        b=TlcARXmD+u2rUvQwz6ovoKg9B9In4JrrrtUWf+FGPPFllwlf5vijiFvb4bRlO9C6ZA
         aB+Jm+Ng3Us83/OSGoA2WQGqmDh3M0qLlOxAANNNE8pGPp+aSPNYE6t87KWB35xfoLRW
         DSW9UbT/O738l7YekmBfMFIkpziEszoizegd4HXnQdAwKxVEt3ucWUYpay5obToKxB06
         dgwyY63xxjiH/TMPNbbKYNhMnj9gOUOhvoMlS/XfJzvaHD6NJe4ZZ1VVmG1MRKVJeqcT
         CZaorF+sflRpMk+bbuAcxG/eTGC0UaIog07osvU9jfOjxZ0laB3ywxgN/ruNnvejEFqA
         XCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717252338; x=1717857138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AAzGQHHvQLZwmLK1tb/w8l1HPqGpf52A6X2KaKTc7M8=;
        b=i1JUDdGOoY14yYdd/psj50qu9+jhOjV5Aj744T0O9bCyt4vmtHBseV3LSTcK3TZP+U
         /YlbFjTVs7hk9iPE3tPVKp1jpkC9X29unfa/9hdD8ai9ATTx6W/f7bitMyaQuChQFT5Z
         +oiqMOxEzZBKEx8vDPDRauagY2pWhUrDijCH2ZIy7WMR6AbNqtpBCG5JkfLEZ/LPk/08
         RV+z5MwGgYW8oAm8XPW3UuJq9ftxPfMO1S7fOotCgP5Sv48tPPMHcNA7BBGJgNfTnVyT
         83w8WkCkaI6apswnxXUVjj/OEyEPvLTRV7gpsAbRG31xYLkzzDys1NuIhDhobI8Q2cVY
         S2LA==
X-Gm-Message-State: AOJu0Yxv4J+EwzNYwgtWH4eJH9CRqyAOFD/V5YcnKn2e7yUqqIjdApzD
	Z7iEvh3H6gOLQKjEjqvDjozvRen0VtDvpHmPLO8WkzygOwMCLoE8rmAqOQ==
X-Google-Smtp-Source: AGHT+IGGDL40eA8eElEe0WsGqFAI67z9BXaWfidImPKId7sV+y6PyrG6Mjf5/hnMCpp/AiKTOU70WQ==
X-Received: by 2002:adf:e74a:0:b0:357:ac48:9676 with SMTP id ffacd0b85a97d-35e0f30ac54mr4332043f8f.51.1717252338082;
        Sat, 01 Jun 2024 07:32:18 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:d636:5f74:7543:f0d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd062ec39sm4198393f8f.89.2024.06.01.07.32.17
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 07:32:17 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: [PATCH v3] m68k: amiga: config: upon boot, turn off all incoming interrupts from the Warp1260
Date: Sat,  1 Jun 2024 16:32:16 +0200
Message-Id: <20240601143216.144220-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Amiga 1200 boot crashes in local_irq_enable() (or auto_irq_enable()) with an
interrupt storm (the Warp1260 board interrupts appear to still be active at boot
time): CS-Lab told me where to find the interrupt register (and its layout) so
here's patch that turns off all incoming interrupts during
config.c::amiga_parse_bootinfo().

Link: https://lore.kernel.org/r/ZkjwzVwYeQtyAPrL@amaterasu.local
Cc: stable <stable@kernel.org>
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
Changes since v2:
-moved changelog history below tags

Changes since v1:
-addressed all comments from Geert and Michael
---
 arch/m68k/amiga/config.c       | 9 +++++++++
 include/uapi/linux/zorro_ids.h | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
index 3137b45750df..fa74452600c1 100644
--- a/arch/m68k/amiga/config.c
+++ b/arch/m68k/amiga/config.c
@@ -180,6 +180,15 @@ int __init amiga_parse_bootinfo(const struct bi_record *record)
 			dev->slotsize = be16_to_cpu(cd->cd_SlotSize);
 			dev->boardaddr = be32_to_cpu(cd->cd_BoardAddr);
 			dev->boardsize = be32_to_cpu(cd->cd_BoardSize);
+
+			/* CS-LAB Warp 1260 workaround */
+			if (be16_to_cpu(dev->rom.er_Manufacturer) == ZORRO_MANUF(ZORRO_PROD_CSLAB_WARP_1260) &&
+			    dev->rom.er_Product == ZORRO_PROD(ZORRO_PROD_CSLAB_WARP_1260)) {
+
+				/* turn off all interrupts */
+				pr_info("Warp 1260 card detected: applying interrupt storm workaround");
+				*(uint32_t *)(dev->boardaddr + 0x1000) = 0x0FFF;
+			}
 		} else
 			pr_warn("amiga_parse_bootinfo: too many AutoConfig devices\n");
 #endif /* CONFIG_ZORRO */
diff --git a/include/uapi/linux/zorro_ids.h b/include/uapi/linux/zorro_ids.h
index 6e574d7b7d79..393f2ee9c042 100644
--- a/include/uapi/linux/zorro_ids.h
+++ b/include/uapi/linux/zorro_ids.h
@@ -449,6 +449,9 @@
 #define  ZORRO_PROD_VMC_ISDN_BLASTER_Z2				ZORRO_ID(VMC, 0x01, 0)
 #define  ZORRO_PROD_VMC_HYPERCOM_4				ZORRO_ID(VMC, 0x02, 0)
 
+#define ZORRO_MANUF_CSLAB					0x1400
+#define  ZORRO_PROD_CSLAB_WARP_1260				ZORRO_ID(CSLAB, 0x65, 0)
+
 #define ZORRO_MANUF_INFORMATION					0x157C
 #define  ZORRO_PROD_INFORMATION_ISDN_ENGINE_I			ZORRO_ID(INFORMATION, 0x64, 0)
 
-- 
2.34.1

