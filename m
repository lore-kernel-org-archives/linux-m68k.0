Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9801925D559
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742808255; cv=none; b=LeJO5WZeOpXDeKlDEMUYJG6wwgEyhCWKmjDkSUmERy8eR0n2awJwh4ejB6ixWc4p2Hfyz/kGpgiG9cdp3eRhoPSNtpZaLKPwiCsuGoqdNACKYlLcbQiNXQdCBO9GjSwI5fCXFTRxERX5HuBGf0NWqo+S7CNbgpopRcqL9Z+GMq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742808255; c=relaxed/simple;
	bh=kuvEtbfkl6Ezkk+GzK431w6+dJv4gwMnjWAsjS7JUro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vBnxQrCdozabVEq6ggbcahq1Nob8Cduk2t8VogtOUsrawujCpWA5eMQCTkUFFu9VsEkIJXpkpx2OAStau7R//ZMwtApevhg10A8khdp/ZqN1rJ7HSqVdMb34l9xcvuG0NC7KWPgER3Y/Tin2Lh1fIptjAP6PKtRxTgWkxI221cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfcXouNP; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfcXouNP"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3913b539aabso2177054f8f.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 02:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742808252; x=1743413052; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6YiPFHtVVCD1GlwrwHfTYc90+3I8KRnjgLcn6s+bxU=;
        b=RfcXouNPi3sLqy9xHWjTQ+yQ8AyG7XOGzELE7BV+enPiJbcB0hFktbk6kIxeIeyoEv
         cP6mrYPPOjh4Aui14z1rQp9KlHphRmEU8x8sj9QRtpTss/A5PUgG9ZoAZJPnaOMCBk7h
         8+lhw89JLr2gjmL/IROjdeIMdqFz2hvHPTZoI4fjURn3+HXrJGwSp1INYOjWg8Cuae0Z
         PXALkkSxl1vwnh8OEJxt8AcYy9ePgab5vUWDFCjNtv1g+f9FwFp+VkvrZ7ikKNcLJc2F
         MZLOHpaajzGL/fypSjTp8mVg2Wek9jTHfhkkN1AfTIhVLYm4d3Q+hG+s71QN4hi/67Qp
         LYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742808252; x=1743413052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6YiPFHtVVCD1GlwrwHfTYc90+3I8KRnjgLcn6s+bxU=;
        b=iIWifO4z+JvWuVf4o13BOeJiIiNBV79DbiT3h3L16i9YXQ2hLPbdb2454rblte6vnj
         nFLuX0VNVB7QOTXRc9MZhY9DwimfgacOBk3NSi3EXDuSdK6ArD0qhyUSXedE3QGVjacT
         ydSdUCH6Y0wzFUJP6aUkRDScwJu6jJaVLOJhMsiUAlaifW6SWiNjwS9alx7tYxJ/Kyt6
         8FozBPNIWrDvvwoGExzbb7w6KV6DS77RoEOqzKCn8RyL5aLVRFmIVHcoepVXuydhO28E
         GXkDuAONulZBFIwGcdxyNnE4JIStsOQSZ/Dvuoxf4o0zU4T1+SHf9yTSBVLQ2GLHcNVO
         7SVA==
X-Forwarded-Encrypted: i=1; AJvYcCV1hctMdS2MoD/a3lqk2Ov5YFeip1sc/zPGpN/uE3vb28UQvyjxVU2xW20s+0qpRvTb9j0vVXamh7dp@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yyt9KFKq/QpEU4qQrvYo+rBlGbRYuJJFyQKUvtepOhzdYaS9v1q
	iJuojhTVbePGZV1SL/WFRHq5hw428KGN+DQjB2cIvLAhfBP/AzHZ
X-Gm-Gg: ASbGncvCJza3OOVB60GDPCIwglP/BxWKAzPfXF8yJtQIZFmedsDQ1XKuq1q+GAsMfPc
	OMUSjhJ52VQAKrZ0UJUv9lXFqB1E+IK/qWz69EvmvA6CrDcbD9hLklCOWxukqihbrZqHKTfvRtW
	32mJVujew7Zv1jF9A8apQ9vpuhqd/1mosfBO917RZH66uhapSPl70KTplHH0UY35CcAz9BAPBFM
	H82w/pRUqf7/2jV0ueZLviZwK1TPuBnmWEdxfMz2q1ZAYLmt0Y0qKhrVcNplubFgt4PWumbvbeB
	vMF7Wi+NTU6L4+XyeiGbkeSsldiWrVbenXtBn6FBFjM=
X-Google-Smtp-Source: AGHT+IEnHnLjtpk2tQptGx4Bn/5FhBHZ279C1361FsPtyRYL/JZ15vvFhHIo2x7sMTzraMgbSgXPyA==
X-Received: by 2002:a05:6000:1aca:b0:391:47a7:299c with SMTP id ffacd0b85a97d-3997f94de39mr11214561f8f.40.1742808251797;
        Mon, 24 Mar 2025 02:24:11 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:fd58:9303:2c1b:4279])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3c7fsm10537250f8f.34.2025.03.24.02.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 02:24:11 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH v2 1/2] m68k: amiga_defconfig: enable PATA_CSWARP
Date: Mon, 24 Mar 2025 10:24:08 +0100
Message-Id: <20250324092409.99430-2-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250324092409.99430-1-p.pisati@gmail.com>
References: <20250324092409.99430-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 arch/m68k/configs/amiga_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index c705247e7b5b..feed92c95394 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -334,6 +334,7 @@ CONFIG_ATA=y
 # CONFIG_ATA_VERBOSE_ERROR is not set
 # CONFIG_ATA_BMDMA is not set
 CONFIG_PATA_GAYLE=y
+CONFIG_PATA_CSWARP=y
 CONFIG_PATA_BUDDHA=y
 CONFIG_MD=y
 CONFIG_BLK_DEV_DM=m
-- 
2.34.1

