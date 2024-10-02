Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1251D0425
	for <linux-m68k@lists.linux-m68k.org>; Wed,  2 Oct 2024 13:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875713; cv=none; b=Ya86RJIs2+YfxRsfpe8ofM/1IJlPhUpEOJPc96gamABuH3e6l1A3r6qpUxICofO3tZL/4h3wBvdN/ehVyzPLRzxsvdRGbtmTIyxc9Owp8qrohI6ysZRxbXyyXR/SX2cx6wQGkZZAZ5daTFaZnKjg1cUt7nx42AnvKTOKX0yOMs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875713; c=relaxed/simple;
	bh=jT055+MFltjtTxzItHRvNrTX2GMARXmC7A3pvndse3M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dc1qxOGAaHG5gf1aKzR6P/HWWPu7TdHna/p33dbaW/SwDwWhc4PwW7+4X2CFne61lzvunTQRFlY/JxHqd+oZ6ThebSyO0rwO5l1P3gvwYHxfOlInNaFQm0EklFR3/lvCWQQ6XTndQgDENvH1qomPoVG/it9JtMqsmEBsWKCM5uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXxdm78+; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXxdm78+"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e137183587so2603380a91.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 02 Oct 2024 06:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727875712; x=1728480512; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QUdM77Xpa2KVFNEptPxhIDNx7G4UEev4geS+PHi3oYY=;
        b=mXxdm78+qsDztTYAsrPXCRD8HQfpj4tiw2fZdyDf7fNCV7McYISwEFqOzqhwHxJanJ
         7xJ/NjoHNHTb94SAKTruPRcVOhYL6+tXdyGxt1bGfgQB2U0Do3HKwdFx7G+7aLfwXWZW
         xBi2eqXP2RmAFZgYE7OZDY2Oiyb/7z71F85c9d2AiTwt3dx+WvdWZG5fTbcH/uqUZcvx
         gKQf1bAq6ru5VNSGn/3ItU/gHf6GN24kCegI/cAqHp9DioyTpZdinhQiTJ54KNTFSrk7
         Fb7UlcSeLCkMfEqiu5/34Z6VwSlDXCXOdVkN4hXNOIaFoEIEQD0gdEX/K/3J0tVVXRvl
         g7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727875712; x=1728480512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUdM77Xpa2KVFNEptPxhIDNx7G4UEev4geS+PHi3oYY=;
        b=SOtyVdhaiITNyOJ/TGlMYcvKxLlElEAA+UHHwZBi1pp0h4tJmHKnadGrX+PIx4Gzt1
         UcEZZ8NXIUZEHO4bHRo+JUP7zZpZ5Jai9/WMSdIb44Pg3E56xCJ2KwJpD1aJOGWxdOFB
         Scv4MPtAKDTi35HFJ3oiEHsWq4dmR22JnuE/SwL/Ab9jKt4rfCiTEFM/1A1E1mNYeZtT
         Pg8X0BQ4/yVInSMZf19bCTfWOk99WeEJEeyAdZCqkF6d0uPlu57gUdGuhi4GAJCoJpv4
         iwbSeMqRu2uOrZqKSALwsruEtHznp+fpkBDkge/BNo1ugE2eJmWAqOOZ/WFKTZKk7nHb
         GKlQ==
X-Gm-Message-State: AOJu0YzOIf3JApYw6xK+fSXtkUD9MlgTTCG+v4i4vvwkmwGV3GpyO/LB
	vWfCApnEuu/9EqtZszutNOQHY/X/pvl8HEYrou+FzmZy3VUoVPnJ/w9qFAcw
X-Google-Smtp-Source: AGHT+IF6zkvy6+eQJNc3Tih+OJqmD5b+H5QGpVA61mwNsdipu5U9oGYiQdmnB+iyPMEh3Ga54cZLqA==
X-Received: by 2002:a17:90a:bf15:b0:2e0:9d3e:bc2a with SMTP id 98e67ed59e1d1-2e18496a9f9mr3903265a91.32.1727875711591;
        Wed, 02 Oct 2024 06:28:31 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([103.57.173.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e18f7734basm1528740a91.19.2024.10.02.06.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:28:31 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-m68k@lists.linux-m68k.org
Cc: fthain@linux-m68k.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	sayyad.abid16@gmail.com
Subject: [PATCH 0/3] drivers: nubus: Fix coding style issues in nubus.c
Date: Wed,  2 Oct 2024 18:58:17 +0530
Message-Id: <20241002132820.402583-1-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses coding style improvements in
the Nubus subsystem, specifically in `nubus.c`. These changes
aim to enhance readability and maintainability of the code.

These coding style inconsistencies were found using checkpatch.pl

Changes include:
 1. Improved comment block formatting by aligning `*` in
    multi-line comments.
 2. Fixing assignments inside conditional statements to improve clarity.
 3. Correcting the use of tabs for indentation in specific functions.

Each commit focuses on a specific aspect, as detailed below.


Sayyad Abid (3):
  Fix use of tabs in nubus_get_vendorinfo and nubus_add_board
  Fix use of assignment in if condition in nubus_add_board()
  Fix use of * in comment block in nubus.c

 drivers/nubus/nubus.c | 94 ++++++++++++++++++++++++-------------------
 1 file changed, 53 insertions(+), 41 deletions(-)

--
2.39.5

