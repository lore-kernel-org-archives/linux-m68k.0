Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C910244C506
	for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Aug 2026 16:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760560; cv=none; b=rnEzcpfbOgQeYQCBp5DATGM9LwbibcAn+bPzXR/oJEXQpu8Ygnv0jR7L+wStp5HUWYq5jDY+avctnGyEQ+PoJI9g6otnG6o/oD6lAdFwxxz3UiIQ5OZf5UwdsKQ1ZJJLyApZ8xyjupe7/EQvll3s18fvxbHeAtg8t/SOeaaWlyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760560; c=relaxed/simple;
	bh=HQGlk2jl7ZC+13dfdxTEbZHJHqvV4i8jOzqjxsh4j6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XAFBqfILtPPOjicNgYHQf/rypCLvp6j1x43+hVLkzX7Wl9cR1b8Qt+C3jZv/Y37kAyMbHgBBXDrP73l0TdyR9WA+i1avHG7qIQVywKyOr/omshcmlvSEwxPfYp/iaP2OOi9Yg1KL6mo5pfYh4R4FQr/t4baT4jxypcpaUujI5R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGPsMvHJ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGPsMvHJ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c160420289bso151447366b.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Aug 2026 09:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787760557; x=1788365357; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3SfMexikYcT8YK2CbCbuAPa/0r9Mzj0fUEaGXF70ERg=;
        b=lGPsMvHJKkYHCd8uq8z+7oiaFuOEjJbnwcCsMlEQaUKF2/gBs0Ecqt/jfdncXpX/P0
         flHI/4jyJTPCtPMN5Si/KgzaPohEftntiSlC9d5Q9+O5r3GCXTBOHcDTOW/8xRhFkn+J
         LrzxgfXVc9J+mAgFIBiXl/WL33iaiP+Z+iPSsniYGwei8g+GWhGgCRQaQS1BxudQWYiA
         FF86W3AZcDLZVZyoMBivR24+q3Lvds2QwCt0WfTsWfCcnD3Cgbn01vJYr25Vcgmn16bI
         SwB+h8eC3kkZvJcKUdH/kfUNCatT/abwA+lAqRBYXaceIOx+ypWQhrsaz4Th88txG/zQ
         kkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787760557; x=1788365357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3SfMexikYcT8YK2CbCbuAPa/0r9Mzj0fUEaGXF70ERg=;
        b=TFZPNlePszNZPtdPq4tGjivKUjdZREMJfdPUbWKY+Z/zHECx++AIvtSXd3p/MzIDnZ
         0HBKkMI+ONVGrROWCCJNAF1ZDOLFVEZ5b+p0YJOBcqzMikzyZgq8Wv0sDd2LpT3o8VBY
         7EIbLD8uq+SeXaYwcCHw4Kacnx3NP0DWKqFJbHZ9O9Kvsbp5upFX0xEws3LLJPBKyglw
         2gaI6r3BunsGS817IWGzZzIMqIwvcoP1F7cNnlKjSxrTE3+qyt+pr+L1bTjMkWNscBVV
         WANuMX9T9qd+HioWPNcxAYZxCUL3A3HUNB1N/x0qqTW2ZO8H/XzAkmUitG34SbbtsBmF
         ipbQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzCIQIRHFl6fFTvr+eK/daMXka0fY0FjF8eCeYhd6cK8a0sUCFE2UCtg354eMZfh3c6X7k0co0jSJb@lists.linux-m68k.org
X-Gm-Message-State: AFuF++lRkyGzMF3s0ed5ZX2A1HFKZU7YMnrt/OvNcrTcABAIctkc3k8v
	coE0wYXAangtY0nZVKDp7BOuc0UooBPxicw/6Fj64ZXKpD3+ntfBmEQ1Ss08DnI2
X-Gm-Gg: AR+sD10JzaeR5wMMx7Alf1Qb8A5t5NLIKBfEkEvzoRAvQrl7DPghE/ZoOuel6Vh2rt+
	F+bgdJCwyFiM6vzX3+gxVnHyPWQp2WDCHFR60S0h9XZgQACpvX8FZcxA6IFuuY7nKobWQ58I4au
	mfCRlQAkz/2PuaxHLJsTfq80HvFk746s6uRWFIne7beszEU798Mh96UOkdOac5h+JRBItpPevo7
	ZY8VTfmFzhdamqF2w8PVbP6QS3e7ENxooMm8aBzz2ZjNZPGHYjC39eIFdZ3nyvKNMUst/+/RkfW
	5KxpSpiCOqenhkWd/Ajll5X0xc4EBeCHc5OMfW+AQQUirILKg4ZpJghNn/SM9ZT23WmH5HIQubE
	t1fdzQiAGB8miD7nZ1PLAz1K7+N1wxumAHzuS8aI6yMJEYoaHfazM7cNTw65GXntl847PhRsQJx
	uNGlNmS2FF/I9oYH+uJbx3DyF5eNFB3N3PxWn0JCKw9lUxH7ZgmuUCAp9/AHPF1edn74EVpmY80
	OTx1NO6jeskPO8gXDm65wvQXz7+PEjD0VdNzt+FwBpIWzZlzPVO/cMKbQ==
X-Received: by 2002:a17:907:e003:20b0:c25:2d27:5652 with SMTP id a640c23a62f3a-c252d276b10mr421093966b.11.1787760556808;
        Wed, 26 Aug 2026 09:09:16 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:78ce:12f6:160d:28db])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b43absm558705766b.51.2026.08.26.09.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:09:15 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] m68k: defconfig: enable PATA_CSWARP
Date: Wed, 26 Aug 2026 18:09:11 +0200
Message-ID: <20260826160911.460165-3-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826160911.460165-1-p.pisati@gmail.com>
References: <20260826160911.460165-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the new CS-Lab Warp PATA driver in the Amiga and multi defconfigs.

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Assisted-by: Claude_Code:claude-opus-5
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 arch/m68k/configs/amiga_defconfig | 1 +
 arch/m68k/configs/multi_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index 8b7efe20dd12..794bad30f5f0 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -284,6 +284,7 @@ CONFIG_ATA=y
 # CONFIG_ATA_VERBOSE_ERROR is not set
 # CONFIG_ATA_BMDMA is not set
 CONFIG_PATA_GAYLE=y
+CONFIG_PATA_CSWARP=y
 CONFIG_PATA_BUDDHA=y
 CONFIG_MD=y
 CONFIG_MD_LINEAR=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 2cbd6bf20a68..3a9aa52d00e4 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -310,6 +310,7 @@ CONFIG_ATA=y
 # CONFIG_ATA_BMDMA is not set
 CONFIG_PATA_FALCON=y
 CONFIG_PATA_GAYLE=y
+CONFIG_PATA_CSWARP=y
 CONFIG_PATA_BUDDHA=y
 CONFIG_PATA_PLATFORM=y
 CONFIG_MD=y
-- 
2.43.0

