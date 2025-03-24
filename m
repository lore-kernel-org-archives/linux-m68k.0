Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D72418A6C1
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 12:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742818613; cv=none; b=aYXhdB2fosi/0CmopWBmwsPFCKdOTeqEv6cDuL/VGFOffEWCDDqEIGnCQPcGf68SltymVec/LvVVsFmXecwGJ86Q/lA+dbzbEV+GpRuVTiQyC7SPMBxyXEis6bgdFVQUubdovKNNx0AzOZpYaFZN0nYrvRBx+gcaDMsI6BXkCkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742818613; c=relaxed/simple;
	bh=kuvEtbfkl6Ezkk+GzK431w6+dJv4gwMnjWAsjS7JUro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T25AoGg1KSbkhHsmJDcUTGR0Q6T0gLXezPM7qpeJeBbnIabZvHSEnPpbyonfkZPM0+DnaEHeVFfGC4TsSWtxhnW1Blu+Z0yHFPJyCj0WFYtmZKU4uNEPyumAu4MyzY8yz+w167dYW6XdGkHGN6YIG12W/DzbP6PYqoshFGlNV6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kR+jeOpA; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kR+jeOpA"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39130ee05b0so4083568f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 05:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742818611; x=1743423411; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6YiPFHtVVCD1GlwrwHfTYc90+3I8KRnjgLcn6s+bxU=;
        b=kR+jeOpA97mTpATAZ1gYrYiT5efDEz/gMptKPAcxPkJg2zW7DEi2/37xY3zWPJrBtN
         n6801iua86CHaew/a8WMp2tG6WPrfNx8zcLd9U+G3QiuOebJ9TVmqb5uWtj44PCmxTKx
         KCWcmdEj8owegm55syN+i4Jwxx9QHy+li+b0ntF+PbMRuIPJCr+Bo6N6y6LzHn2QhOAu
         P8o8tP9/9siK28TOYuxHDBoR4KtAKrsA7DaBcfFV0i37dAI9VbfBy3LtPBYBDCBx5szE
         S+7SqkwDlglGPfK6NyIbwuzYa4EJNvS2jreODTYJ0UrMLaml7/0dMDgZJ03b/1MyvKF7
         f9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742818611; x=1743423411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6YiPFHtVVCD1GlwrwHfTYc90+3I8KRnjgLcn6s+bxU=;
        b=i/BAR3x4YuihnMezRLJuR878LPzo/UnU+w9uICDk1Qn5j83n7+rTDy6wuB6R28eN3i
         oLHBSUbCzHIhxhIGZP8tWnpkW9PeaDM6u2TTySVT3TFPLFVGdHzKJY8bQM0iRqwXKSu5
         eP0BIv6kDl8wmiuZ67sU8EnilKM3GdJmkPt5lz4CJIZCQ9FKRpZaFkaigLxkmtDliPEK
         Znl3zDM6aaYIjfGcYghAcM8aq51i9fnQ5HK5QiUdo8GtoGc2XBYwYtLWV+j4b4Xxgj8l
         Dx0y+kPC8GKtcmqb2mBlzu4DKu+5UWPI+IZA9KsUYAhYuEEb7nYJhRu9brU20AHS1kXc
         478w==
X-Forwarded-Encrypted: i=1; AJvYcCW2dvbDolsFoKiJenPIMt6mdNfExbC+ANXYJej6FWILHY8gV+8+ZVLEc1cp05bC7o0HUX+2vZ7jCZz1@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzLMGx0jg5LXgCO8FVujKDPeHPTWxK793VliqIFj1kClGu+U9jo
	lkGzn1k3wUsUWgLdcZTTNMN0R0oqcN6KxX/2Z4wGTmlLhnL0+zEu
X-Gm-Gg: ASbGncvXCY+jjyf3djZMtKll8h8rFB1zPtAoUUW1Xe4frXuBALicHeCUNrvhltvY+zQ
	kjagEvUBvKPWZti3PwRlFrnYtAzgMaTNVYYIAJFGZ1lMRcPBgyDx0aIeaBr26r5jMMG8stfdp82
	Y/JL6pUgzT4QY0YjJ9JYFjwutPRXVP1EkwzQXRwLwxL4YAMVnt+6x6+ctvk3e/pt+YvhZzeTm+c
	cqsBash7lbKpyjErXfSDXQrKkmShUseiMNUMU+tdk5pRhr/KKVk7f6Qml9Ljj41FyHzMzlGsfU7
	yBYvNq22R1nONx/Ysw1Nsr4nJ6JIuQOKnvFu1o35AFQ=
X-Google-Smtp-Source: AGHT+IFrbLF4MB7E5uF3pvUrcTFBxHW+1xGCe23DUKwj2zEx+ZxX9VyDqp731FjRRoxle/7Rv33lhg==
X-Received: by 2002:a05:6000:1ac7:b0:38d:d666:5448 with SMTP id ffacd0b85a97d-3997f93874cmr11994033f8f.40.1742818610454;
        Mon, 24 Mar 2025 05:16:50 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:fd58:9303:2c1b:4279])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b55cdsm10875824f8f.52.2025.03.24.05.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:16:49 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH v3 2/2] m68k: amiga_defconfig: enable PATA_CSWARP
Date: Mon, 24 Mar 2025 13:16:45 +0100
Message-Id: <20250324121645.208368-3-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250324121645.208368-1-p.pisati@gmail.com>
References: <20250324121645.208368-1-p.pisati@gmail.com>
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

