Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A562F1DA62E
	for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Mar 2025 15:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742570067; cv=none; b=hC5gv2J968/RuwaaP7MGlOsqAy0tOK+qcpVzi4MvpdHRuHgSoh+VUKfRmgv+Df8zS91uJODBre2GdzQVEoXmUSZ9opyiPyzuQpDOpBe9u0P5UYLJ0Y0zPe1jHIGaaA7W7JZDO+wvo+9ZDbPX3Z7YoNdzzK3Uugb3Ij2Yq4AxgNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742570067; c=relaxed/simple;
	bh=kuvEtbfkl6Ezkk+GzK431w6+dJv4gwMnjWAsjS7JUro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D7mQ78kzeVQUfFwfZ3wHmsL1+RYBexf/SQz+J/u0aR14bniKcj7pLSq5pMwiAuuEuUNfHX3uTZ2dPxuYPKsqS9UTzgPoPseumD11GXQKdmceRyHO6pfpan1fiFLweiMN7I7Eym1L9Dnp6QCZq7k1CDHXcL8xL6d/oYUEKz0bfY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxS7QUL/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxS7QUL/"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso22186255e9.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Mar 2025 08:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742570064; x=1743174864; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6YiPFHtVVCD1GlwrwHfTYc90+3I8KRnjgLcn6s+bxU=;
        b=UxS7QUL/AAiWyGVhayqWmRuHabC5Gxr8tuSsOyj239v0x310GRx/h7z96RxwxzT7Z1
         82E5fZDBKgHT5wB3TV3hkl0mY7LfsayCvX9pgAMDd5Y6oIJJ6TvnyYy1kxzZ+n7/XKOn
         h3he7vA9zywOKC3DIMaBxzVsdUqDJ7lQcxsqgWiFfX6OirZeyoHCbVYkOdeZwQEIhiNs
         7J8NxmRdWxW+1cTD0f2k3LmLv0OEGkCISAh8aRr75qYC0siK9BGS3QT/CsO0kX9Ib9S5
         /2rj235imUgIH0wZ9l5ySF9bsGWsoPBPqJZbLbz72sY+yyveQ0vQqk9z+WCSSNww4gMG
         qZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570064; x=1743174864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6YiPFHtVVCD1GlwrwHfTYc90+3I8KRnjgLcn6s+bxU=;
        b=IItctHG0fk++F0j59BRY2rETNkCDdWsTbxKOMwiQii+H8j0fDfYcepRV+hjlBW6jmz
         Wmh++1AvCnymqu/AxWd+DTaShVm3bKWgfVdqx9vSW9tSlTLF3V3JdK3MmXKMp9qVAZus
         sxVO24Wfkedx2actwpvi2+0vkCteImVXFeCxhLf/n3i5z6GfJdSP2k1giMfmaN/kvlXd
         lca2sf40BW/pocMW/LI9eEqi1hZzbQw5l09sJb5tMg0aNNZXSrlO+SXWMuFW3RwsUOPU
         zVjJ3LMz1NOPoq9GzzUfrKt6D/8+cMvS9l6jUtydIoSIwFO7Dpo1Ldlrx/xhU7ScQTAP
         OL6g==
X-Forwarded-Encrypted: i=1; AJvYcCW3U4j0RWDbiIDXkzbjuDiN9UzjTmkoT+VRPC4h4AenyDZ5ZVgfqR0u7BooSoc5CrIypMoeHgTXxSdu@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzGb1TXfGCymUlmiTWV30IW4PtUj9oLmcWOWr2SXNRjfWdo7gjQ
	E+UOrICWjGHbaSe8UDysbuZXg9PriDiKeW9LK7cC+I9LGWZDDJbM
X-Gm-Gg: ASbGncvHJ13P3f9zdsya+Z/ulKHWxnccWvRZZajhSESskrW1uJjJjgbLGhhjFXySusl
	Zqm1vQkxnGY7lBMpe5Ln4nyFbmJcAimfH/RtBFK1Hz+n4/zqQvVEJqX8LQo6uKWvVqxtlArZfuQ
	kT+0rt2OvtknxMnt3seTqMe/9mQ7FWPSaTcOY47J61hcjiax3c2Fc5RmFQRvcpOMLhdxk2TTLwe
	lJwpNwFYlFRMcshtBCYB2H7TYkPgcZWApd99DWjd8B5BaRG4HwhAlgM0U6lx9eE2h4sd0E+Q5bt
	lc/yN6swbbLMiFocaS9AdqwyJq/QeCAhJL0PR2t9pbU=
X-Google-Smtp-Source: AGHT+IGOnA72EMWiLJnk3OI/h9+00m+QOLFr3tMyj9VDy/GHy/XYPkY/kMjfp+tQ9cibKqNnqfbKdA==
X-Received: by 2002:a05:600c:4512:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-43d509ed936mr38219125e9.12.1742570063653;
        Fri, 21 Mar 2025 08:14:23 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:91ef:3e94:acab:b42b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd9decbsm29300305e9.27.2025.03.21.08.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:14:22 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH 3/3] m68k: amiga_defconfig: enable PATA_CSWARP
Date: Fri, 21 Mar 2025 16:14:16 +0100
Message-Id: <20250321151416.338756-4-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250321151416.338756-1-p.pisati@gmail.com>
References: <20250321151416.338756-1-p.pisati@gmail.com>
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

