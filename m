Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B7212C499
	for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Sep 2024 23:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727135782; cv=none; b=RqPHOCThUcYQZL37s55zBqaN2WdP7qtoE2jj4T6b5d6f5gGgHyc2KBy8QraUzO1JVf+6r2Zs+tZGzUhgfAO5bLR5HNgr1JIpo0oWo59MBWqESeYxjSwDygXYLWGr52q+sjoG/G7wafP1fThzUemDcfT+9/V1g4Fwvt1Lo/kRJbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727135782; c=relaxed/simple;
	bh=GubX7HNiNPGqZwTFgnbAHBHpyKU0GeQ7/76qRjIJnlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z7CCMXGnCT300DpgrBsrWi6ylcwGJ/p0MC3cQjLMwOaHe4IEQMh3/eW1Bza8UNjSSph5mq6TSjGsCiYT7EGOva0wXDYEe5Wf1vBNCTFSFMpjptdJ/2MFQgeWOcJilCvLzhTaYO6CYeUzLkTb/jZ5/Y3IEtd3l3R9yMS1SpuqOdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bby/8uvX; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bby/8uvX"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-719ba0654f9so1375305b3a.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Sep 2024 16:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727135780; x=1727740580; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Lsiix1AZouLwNVfdcdY6F4P4euU9juLa/FjJUtcM2Y0=;
        b=bby/8uvXlvBkVxiuUGgIHhIqyuE30Jyby7UILfKcZKtNTBpM1m66M7sOt6pIKhvuiO
         JZoIuBKxmMu5e75w1ZYq9bY/llQNF4wEjq+pW4gJRzw4DhX88lp16FmVZ77HAOasZxU3
         1t6q6C32PlotTodL+eCGfL7Mc/ZNyYkBXNW3LvAxmV43IDUh5zvDtK3/damL/yum46DO
         26N230eBpx/9DwCw0SS6b0RBq6PByknpL7Bt0JfrKlc3VulGX+7CeYm9c18kaEP/o3+V
         1fN39VskCbEyOg74wvxCiZFerN6Ze3vadmEr3EXkGgEQ7sxxQMhJWsyjU+HWLn5ZRTNO
         MVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727135780; x=1727740580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lsiix1AZouLwNVfdcdY6F4P4euU9juLa/FjJUtcM2Y0=;
        b=p9sEIr+uP1bbIc7kqkTnexl0rVYy2FDfNBzzzFUD01olDRRqqW4NQTurF8+EcPfOHs
         Ss9HseS+CCkSZ0OhTCD9KsCY3TuMp29JQSZR9xlI1krRWqz82RcOpqgOQ3aYa3Xizh0s
         ZmBkfx7LhU1oEbw4N4p+rta8UwxxPB3162quolNkUt7rVppt43D3egXF61NF1ZjcfAmm
         oK295+eYjKc5hlZePkzn473dN54dtjvySqfwt7hfVudMRJXagFaQsUapFMvMXo70tZez
         xi4oYFELaT0HMO6jqyLHLjptMbI6srVPJIKDAla4My2CsuIOJrAK/nVl8W6R34VfNUD0
         zRVw==
X-Gm-Message-State: AOJu0Yx5FsCv+AaZN8x8w7EAwGG/qxAY918o9+OneYTHDYoWv3La2r9X
	g1g8SXAsCMZzSxXTCyxC2pvsC1JUUe2nJVPWtWAlr8arHONTLqVjqTbrGA==
X-Google-Smtp-Source: AGHT+IHLfQ5xUTK61QHlkYP+KcDvKOKkE0Gu12DmjoUm7AROJH61aTOqurK/aSnyCwW/TSTdUl761w==
X-Received: by 2002:a05:6a00:c81:b0:70d:2cf6:5e6 with SMTP id d2e1a72fcca58-7199c9765bfmr16943619b3a.15.1727135780251;
        Mon, 23 Sep 2024 16:56:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc9390adsm156191b3a.134.2024.09.23.16.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 16:56:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2] m68k: Define NR_CPUS
Date: Mon, 23 Sep 2024 16:56:17 -0700
Message-ID: <20240923235617.1584056-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SPLIT_PTE_PTLOCKS depends on "NR_CPUS >= 4". Unfortunately, that evaluates
to true if there is no NR_CPUS configuration option. This results in
CONFIG_SPLIT_PTE_PTLOCKS=y for mac_defconfig. This in turn causes the m68k
"q800" and "virt" machines to crash in qemu if debugging options are
enabled.

Making CONFIG_SPLIT_PTE_PTLOCKS dependent on the existence of NR_CPUS
does not work since a dependency on the existence of a numeric Kconfig
entry always evaluates to false. Example:

config HAVE_NO_NR_CPUS
       def_bool y
       depends on !NR_CPUS

After adding this to a Kconfig file, "make defconfig" includes:
$ grep NR_CPUS .config
CONFIG_NR_CPUS=64
CONFIG_HAVE_NO_NR_CPUS=y

Define NR_CPUS for m68k instead to solve the problem.

Fixes: 394290cba966 ("mm: turn USE_SPLIT_PTE_PTLOCKS / USE_SPLIT_PTE_PTLOCKS into Kconfig options")
Cc: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Instead of trying to make SPLIT_PTE_PTLOCKS depend on the 
    existence of NR_CPUS, define NR_CPUS for m68k.

v1: https://lore.kernel.org/lkml/202409240546.SJwj9tUj-lkp@intel.com/T/#t

 arch/m68k/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index cc26df907bfe..53e4058d2e3c 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -76,6 +76,10 @@ config PGTABLE_LEVELS
 	default 2 if SUN3 || COLDFIRE
 	default 3
 
+config NR_CPUS
+	int
+	default "1"
+
 config MMU
 	bool "MMU-based Paged Memory Management Support"
 	default y
-- 
2.45.2

