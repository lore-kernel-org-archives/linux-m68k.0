Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09901FAC34
	for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Mar 2025 15:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742918181; cv=none; b=pzpHn2SoDwi3Aqg5Am+iiMkeipTFM4XIh7KzT/q+nUgYLWx1XPmowmcob9xwYlNzaQ8IgphT/qHETEHP+R+LcI/5WJrX3vpZD+3q7MbASlGqnw5sd4XmxvOL56JKXmafTUSoaiU+Nbk2fD0GISxVKBElsO6mukaISQOy2Y9IaeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742918181; c=relaxed/simple;
	bh=6rVGej4LxNS/yfWXL6HmJKas1GTVNHtXRW1FGzezZ1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hUPW6FgpXFFwxjbyhFk02/p9JubiuYHElGYj9dQzsPayBau1QXcK3SQUYjAwsNorPO4NIVyM9uFzcesekmylabaMgDMo910SGSz7i6aMuOuwkGASBmgX83E9c/cR1XKKjfexAQ+J6DUDPezZ+E+KDaDo79bhDA7sxkNZUl7hS6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWnvRr6X; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWnvRr6X"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3913d45a148so4707342f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Mar 2025 08:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742918178; x=1743522978; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eBOveDld9JNqK6025AQg+gjIAfid8wA7UWw7y3u2J0=;
        b=AWnvRr6XYFBekYgNziz1Z0cow8240Usar/P6mQ6Z3kTfS2FHKx4X4KXLHYBS/J6UNi
         x8kaDxgp08Uj4K+5G0Sh2UkKP2iu520erPwZQI3bzjPQHvawxjlxe27ZkZwrphdipz81
         pju3SRz2/E4NuQiIKjFBG7+nkWz7drSlsMDQmfWGgubYvZOjRMx4R8lzeQBWjhI0hEFW
         bHr9QqKfjQO7sPiwunZ6LT++YKKK/GBXe0D0hyprUPs/yGKsO/PP9zY3p8My98vslW82
         oO9BcXgvXDyFxn5lV+fKdyifWnxSsCMw51bbcaPvEPdsJsQt4l7WMB2ObDQjdxr40VUj
         y3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742918178; x=1743522978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3eBOveDld9JNqK6025AQg+gjIAfid8wA7UWw7y3u2J0=;
        b=wXVZ9YXbh3YYqXxHYYxXvLZuwupej9/w4Ycsi1wy8O6pUGQg2PbDU8yQs/Ncv9Wtvk
         XyGnzuxXbqux9Io/5l92FK3GTGCSPA6EDb5rlIPcHSdaNgmP8tiTXfq5XFnVk05xEvac
         uL7w88SaSpuKdrqkpkTbumh0sYfzuQTjEWvHAHNQCJqwuJq9lZZ1edGQl1Eg2k9ytORn
         D3VI+Fyu8SEeeNITMTZvqpL/WXMToZOJYf9NHdww+2oBMxD3xdibIAzn5v4Q3LGJd0Uu
         Z9RX9o81fUv8DwVTY7cAe84J5VBtpi0vNYzAAEhQeYFAj2EK3fcOn/0BCvAg5CvxueV/
         1pbw==
X-Forwarded-Encrypted: i=1; AJvYcCVmcSkMgo6Aer8ubP0pa0dZgJT04y/G0eeGk4LWIOK5HSy/NLF0COK6vf2IbOoNc/9JuZnWcSNYHK+k@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzccTVnm/FYZrynUYx57zQSJ/SniJx6nl84q3acGNBo2WuxXXle
	aPzlEXt9nVtAJK+lOWwAwkvZk77L9CO45WHBumeg//YjHYwFBeJg
X-Gm-Gg: ASbGncvRpAuNNudhZiIgPR2Thxfi0w6nhL6UerzydGeHrk2C0OKUU0aeJUVAC/NfodW
	8z8Lbum0V0t9ci6YDoUzeX8y7kvD78PUMtGFOPhI+SvUzbMnqyVzJO10A8Dt98BnOG6Ut5ZMukH
	fsjaulnigbRcMI4yZdapaBAxVDUBHbqwYTZRExyjFulFxs5iE6jaEIoqaOznABmbBhje971ONoV
	BGWLXysHSZJhC46TPeP5uJiusFvA7ma90v3Q6D1p0fNlkuE0oBiej6X5fLabmBXqMSQkD/c8t7m
	hSD1OAYpKRW6uZT4+qP7Tb49cRUt6ZzbqP2Bh5P9Ae8=
X-Google-Smtp-Source: AGHT+IF5I+gvLifGV0FcJbSatrsUL75o+hnhRe7sO1S1ohKZGdbuTeWHd5XvUHVCV1DnFgTml5KpCg==
X-Received: by 2002:a05:6000:2cd:b0:391:3406:b4e1 with SMTP id ffacd0b85a97d-3997f900ef6mr17182393f8f.15.1742918177906;
        Tue, 25 Mar 2025 08:56:17 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:eead:4845:67bf:e110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9efc9bsm13842075f8f.87.2025.03.25.08.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 08:56:17 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH v4 2/2] m68k: defconfig: enable PATA_CSWARP
Date: Tue, 25 Mar 2025 16:56:13 +0100
Message-Id: <20250325155613.352680-3-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250325155613.352680-1-p.pisati@gmail.com>
References: <20250325155613.352680-1-p.pisati@gmail.com>
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
 arch/m68k/configs/multi_defconfig | 1 +
 2 files changed, 2 insertions(+)

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
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 20d877cb4e30..111900456d04 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -360,6 +360,7 @@ CONFIG_ATA=y
 # CONFIG_ATA_BMDMA is not set
 CONFIG_PATA_FALCON=y
 CONFIG_PATA_GAYLE=y
+CONFIG_PATA_CSWARP=y
 CONFIG_PATA_BUDDHA=y
 CONFIG_PATA_PLATFORM=y
 CONFIG_MD=y
-- 
2.34.1

