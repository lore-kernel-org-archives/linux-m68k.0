Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F5B1534EB
	for <linux-m68k@lists.linux-m68k.org>; Sat,  1 Jun 2024 15:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717255980; cv=none; b=hzzsNwktM95kXN4V+LSErhDGDEYuI/jUTGkpWBVvbp2cDf3QMAEenkFx5awrrEea9wx/MWfItdR6aKfnqwvv6CgJ1WOtVuBLmy7Riaa0K3Fo63PNgnPfI/IJEX5HMT8ern5/m94op9gHiHaKjruCayOSlUcDWGtyh0GELwkLYRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717255980; c=relaxed/simple;
	bh=+J9/kyEnvHNY64xngWu6M0tYlAQMeY7DKzTkKax54Ag=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=rh2VBQKWiA6K1MQ49zfbF8IDLvQEjoFpbqQp7+prvuNO3ZMoVXfZ8atLB8c3bRYYn0d2Gpf8ZXU0OHmJ+ukKuX81k1uVX/mybSS4Sw5ourJuwXe6OvVczMT3rCxYdVoapX1XsrOkxCsBK83/xFGBdRvXRKXjq4qlqKgM3hFOyJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyXr6UKb; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyXr6UKb"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a683868f463so201207366b.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 01 Jun 2024 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717255977; x=1717860777; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7vUcksm1z/1a2OnqD7oPiXp4L4GNKLH04V1IqCygLpc=;
        b=SyXr6UKbvppoNLxJBq96JqB+Yy5qv22kcbeFEsUUGFLRxmzy2moD9z2drK3whiFz1x
         EoKvDPpmYh10eWPOOFu5Z6T3Ahue5fbzyd/CrzslHE1l+ZmobWzISqNyPePtFCpcs1WV
         GxqogK7qy7kHiuuPFDMl0wxZRINT0c+MJNPkl16z4P6KHYbaUMNm/Gk3aYau+ZptPPu4
         Enqvm2iUXVHa7Ui5h1aDLeWtqdNEfQ31aivhzn/ElzLr+rccFg3yFbsn7uzSNnwSZFK3
         fEdT+gYByF4ufodKmhN8YX7qGdJ5HlmdxGsnSJIGMoDpWn8jbChvdwTsgnzdESiYWt8r
         H08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717255977; x=1717860777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7vUcksm1z/1a2OnqD7oPiXp4L4GNKLH04V1IqCygLpc=;
        b=SSMBJ6A7pqFPBFSzXwwKUszABc6g+362iIBmirT7F1Kq+jYe+2Hf0kztI9x37MBceg
         a9ywpE4FyRDyChnYFyqN+FllURpz534ZT3BhuoAqsCd14g00/Zr66DzQbo/HcTnG8CPe
         UgQSUyOeEdIp4IS0vmvqlxTZENZAZAv+Gha3GzZPCbXyb5lu/XzshuxtwWhsghun5EEL
         ns1LcGMpJTQF3DMSEN2MvxRQB8K5HWL/Oml69924Qj2FrCwhD1VrMAz1m8nwHLGMjeIi
         2yZ9hjjktHnk2kdCyap9MbjkffC2NkOFL15rG/eczPtzbqunhwpTHktUIUmY2PEog6PF
         3ovQ==
X-Gm-Message-State: AOJu0Yyi37mYS84lYAOkhZavopYOqzdt+fwkG4oyQrYndqzWqQ8wRZxD
	M/TgRH1TMSWzOFxx1h2a6tSFd/q8PZwn6l7UEvfemckdZtGYtFyQzt4RxQ==
X-Google-Smtp-Source: AGHT+IFkrWzExk2PmiBzbBYfJXd87+iwBoaDEZUKpHGZQp34JQaq7G0ZQmI7LognvqKRZdGRAtTkgA==
X-Received: by 2002:a17:906:7046:b0:a59:ba2b:5921 with SMTP id a640c23a62f3a-a6822157e75mr328753966b.72.1717255976366;
        Sat, 01 Jun 2024 08:32:56 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:d636:5f74:7543:f0d1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68437921e5sm189811466b.84.2024.06.01.08.32.55
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 08:32:55 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: [PATCH v4] m68k: amiga: turn off all incoming interrupts from the Warp1260 during boot
Date: Sat,  1 Jun 2024 17:32:54 +0200
Message-Id: <20240601153254.186225-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On an Amiga 1200 equipped with a Warp1260 accelerator, an interrupt storm coming
from the accelerator board causes the machine to crash in local_irq_enable() or
auto_irq_enable(). Disabling interrupts for the Warp1260 in
amiga_parse_bootinfo() fixes the problem.

Link: https://lore.kernel.org/r/ZkjwzVwYeQtyAPrL@amaterasu.local
Cc: stable <stable@kernel.org>
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
Changes since v3:
-simplify commit body and subject

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

