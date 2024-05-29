Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283D8181BA9
	for <linux-m68k@lists.linux-m68k.org>; Wed, 29 May 2024 16:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000285; cv=none; b=KgrNYjfXtx9SqEVYOe95L17Mn3OYMeDjpME8tip2gDGASe0b5/04Y5i8GhayEQYb/R/vkVZyVrnEKiUD/z+S2Am7d4beH0/BjJVOIjVooxg9x6le0LjI7Y+boKpm4xy8UciXXz3bmTOzsXY9VTiEiu11EHQFJi5+nxJHbd/mCE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000285; c=relaxed/simple;
	bh=Ckyhd4ZXwwP5c3wuWJUNfEpVY0ueSVxU9JjWJR1VEaQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pn2vPv1jnhy1afehicUnA/dR3hxXVMveON2yYSglXJp4KLwywwdDEx0iWNsi9nTaNBHD4pDpzzQXppyTUSGBb8MSbQuPG9RSMInGascccMfcdrf6YSTnAmv8s3olkQUDbvwB0+OcVQLyB3sqZPtD3b5IYbUhyDfTalyOc8rL/NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFK6B7P+; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFK6B7P+"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a653972487fso79759566b.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 29 May 2024 09:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717000281; x=1717605081; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sINUD2kiLGoKHcnoAaOtkwqxJnSXWoSQhZpRT8BPVXI=;
        b=ZFK6B7P+2FvJ/gIV1nagWX/F8WL/5yXaXKu6EDvnv6SuYWnyED/zYmSXDpU3j5wyFH
         K+azZJWeDV9UUEsN87oXh9UTQVpeS9weRg2lwT3uPUC0sYZqWIvVm5cEiWfBbsu+kmzq
         yBjrZwt9n0A7fSOSxRCQaVZ2+04GrRoFvwXf5Q8XMtrKavrCmuqIqQ2DzcTaKfBbu4v3
         ExVhGwxGCxgP8Zk3Wf9K0iB2P/Bs01aU6mkwk1tnHoC8Guagx8UB1y7eAu3ewIZc8dgW
         Ze3pVciiAbSl8YR1wUrtlZLdvdVZzy09f9HNAijltid2eOQbaniuqZUrlQfyM6DJbHkc
         lbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717000281; x=1717605081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sINUD2kiLGoKHcnoAaOtkwqxJnSXWoSQhZpRT8BPVXI=;
        b=XpCg6GwO4lYmRdbLvqR/+PS4O7h7ynn4THdv/llzCEWMMNG4zUpIvLztC8gQNfFFrL
         522UVamgZTpqc0Gd5LrT++5thiZGSF2DCcML55YBLmoss1wTC/39zI+fw89DaCiPa09O
         F4EQNSnQBoeRrzGoUmdZRou81NYGWGjin+nYVml5krNHVkfghXWRlvC3A5m6C/3L1yDf
         fiZM5mLxAdlua0ZXLMq+dWle8WwrogtE/mgcd4vqtOZgpxuM1k3QWculnaR8D0P9U9wb
         Ou11nUXqj/QyX/oLZbNKO5pk8BovIjzrT1kBJhEDOX1rndRNHMO5gp73w88ullGB1hgO
         fVQQ==
X-Gm-Message-State: AOJu0YzIQwzBs7H9d3LknQpb4vsmL78r0jLScPWVysk4gpqyCzDhVgVi
	/LE7nFVbm+fQAXi9iqM37BHgLGGQMG4T9E0Hk+cIRbhDyCR3teN+K3BbHA==
X-Google-Smtp-Source: AGHT+IHMbwgxcQ+TfMavZLKV2k/h2xqxBQ599J5LIeyr7dTilq8Da7pOWvSd142bXrjFwmsIM93Rmw==
X-Received: by 2002:a17:906:3c4b:b0:a59:c52b:9933 with SMTP id a640c23a62f3a-a62643e0792mr962147066b.30.1717000280900;
        Wed, 29 May 2024 09:31:20 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:3728:94ac:9c82:c663])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c9377e5sm730957166b.77.2024.05.29.09.31.20
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 09:31:20 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: [PATCH 1/1] m68k: amiga: config: upon boot, turn off all incoming interrupts from the Warp1260
Date: Wed, 29 May 2024 18:31:18 +0200
Message-Id: <20240529163118.867333-2-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529163118.867333-1-p.pisati@gmail.com>
References: <20240529163118.867333-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 arch/m68k/amiga/config.c       | 9 +++++++++
 include/uapi/linux/zorro_ids.h | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
index 3137b45750df..8bbf7372a5fe 100644
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
+				uint32_t *int_reg = (uint32_t *)(dev->boardaddr + 0x1000);
+				*int_reg = 0x0FFF;
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

