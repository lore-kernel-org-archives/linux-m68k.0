Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93D91F94C
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 May 2024 15:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717084645; cv=none; b=mUvjX+gzDwX0+Qk/fOZs7uixk3pLgyClWlfNahsDt+y0jGHK+Duo68Snzwqx88+GHJkGqzres/TgLNXwU2CHgUwOI9k8NjAHIx1VUQG4Sygr3cP2fAxi2mJGxhxjAOUDlkIvnVY5x9lGL9i/mZ9meilERBRDAoMPdZh3Bg3xuaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717084645; c=relaxed/simple;
	bh=JeMEfKNOQIbBcR1MICsM6xfizUeQG166cbco4SwZDdw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=IV24vMMR+GlcuMk60hwTbGaeOQrMBBz2/IxdZ5i8smsScn9yhQjPLm/GYn2oTc5/BlFN70ein+OBgUV/zKsnJ9Zp9n2v712bWcpJWNYLsmatGTpcNJKpZNn4TCFQAmYGssZPx4/aFMURurqwS4Q2enKhYBG9vRbCEj5Ce4u7yto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+Rl9uBX; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+Rl9uBX"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52b80e5688aso1075470e87.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 May 2024 08:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717084641; x=1717689441; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=d2yrUA2xg8J4SeVpWAReYKTbCfVQDq+Nrdt9nxSMpLo=;
        b=f+Rl9uBXlEobxEMlrqWuLA/OkVR44jXV/p1diY4I9qjianjiv5MqrA4GUizNn1N2Qd
         qL0qyI+WBgFphXqtK+MUV4NrU59R2MtyTkWv1aXTsADPPJge6cqgRVX6mrbKDYcEYBJl
         FNCt2yseFyCw8pp3+ydBT7WHGHrv2AE1wywrg96yoMfASv7S92nHIqoyMR+8U6hqKIwb
         1P3d5d3Hs81q/oM/yfkUTR2b4VNkn9Sf72k8vX1ssQ9egwJiul4rZXLEC6Sj4plPMHHM
         5fTldwln+3BcvmQHLduROol561WcJjrPGWR6UfG2TBRoiZRhz8D0+MEnaGq8vhWZbagY
         NkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717084641; x=1717689441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2yrUA2xg8J4SeVpWAReYKTbCfVQDq+Nrdt9nxSMpLo=;
        b=BVsTln5u8dAYvboNEVUSNzIgUdiGQE+/sqfIIMDbzgQrPMdz9AghJuXo95w+7hDxCA
         A/oQMUIH1tAPPO2v4lhDsEBctu0xFpSa23nfmFuByoO/a1xHk4pyN0LgirQ/+o24hopr
         xxe9AdbcXlTO0JXCD1Mw+j3xPGEmGAoxFiI59s57xXhxYmY/AccNTp14uLEiYr54ioIz
         UlHJgM6JmT+uVDVpPRnfrhFn6/C4K/hp1eSrC9bu8VW5l+yl2IulSfBttyXw47jnK2JU
         xgNk3LncHlWZ9AfzDmnq2rNig+sNmmmC37pE/FGy2gRzPsQqFV4m/Vfjy5ZLb3epIltH
         yzXQ==
X-Gm-Message-State: AOJu0YwrP3hSt9gWOsH2f0LFjJHhtdIsjZDlJp8fVazjHl496eBLKAP5
	IoTuN11vg2CGk5cG548pKgw6TkHC+uHMNd/0D4KwiP1VpjUFhVkA6WCB5Q==
X-Google-Smtp-Source: AGHT+IFjX9wiD308lFyKHBBPS0RWqW3ZylTCAwj/lMTVASrtjEXu+S3TWnVMyGhoJEccYyu0zHgZDA==
X-Received: by 2002:a19:ca5d:0:b0:52b:8417:fa94 with SMTP id 2adb3069b0e04-52b8417faf5mr321247e87.33.1717084640993;
        Thu, 30 May 2024 08:57:20 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:3a10:4261:4dbe:b866])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a637f135292sm213014366b.79.2024.05.30.08.57.20
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 08:57:20 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: [PATCH v2] m68k: amiga: config: upon boot, turn off all incoming interrupts from the Warp1260
Date: Thu, 30 May 2024 17:57:19 +0200
Message-Id: <20240530155719.680002-1-p.pisati@gmail.com>
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

Changes since v1:
-addressed all comments from Geert and Michael

Link: https://lore.kernel.org/r/ZkjwzVwYeQtyAPrL@amaterasu.local
Cc: stable <stable@kernel.org>
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
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

