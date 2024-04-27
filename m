Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EEC8BFC
	for <linux-m68k@vger.kernel.org>; Sat, 27 Apr 2024 08:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714207704; cv=none; b=aMoYB6ick2yIR/ZTzwyCJ6gHv4GuD/IHCVqf4UZgot/hdpYQg/D60+/CwadQxxpgtWXbUl61YF7jgiW6vyBPWCoR/sRP+xJlOF93IMldDC1Lg1LTH3BWJVpTHDT5exOoaAYnn7ERX1JtiAXuCpPtN6Cfdk+Mfd/VpG4DM+QqIrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714207704; c=relaxed/simple;
	bh=8KMvepF+aBNtdtuLigcCl5QoEmcLgmie18JcSEXyZM8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=R2pU14qATAdCRDIMcv+1mS3pKe+Lv1EUiDpnJaDVCkY4YnCmN6Oa2BQtVGU/R9AMxVfEjHghsR++OY53s1WaRfeJ2UPEBxIUiRrPDMm180CPod9UMrUnYn/KEZXABDePPRpNnWXwecIWW009v0X9iPWZFYrrFJOmvd0oIWqGYEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f41cEzI9; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f41cEzI9"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e3f17c6491so24196955ad.2
        for <linux-m68k@vger.kernel.org>; Sat, 27 Apr 2024 01:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714207702; x=1714812502; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10lHPpeHO2Li3Yua6ROu7kxe6FyJhN7/1Y8rA+KJBjQ=;
        b=f41cEzI9XPCKGWyyz/sl/exmWRopIzazPxi4u/IYJPFUwOtvGBi2/Q2u9JKu35qhu4
         T/WjpQGR8Ihajx6FZkZ2pXdWX7q/GwqMZyj9P5hzZqWPX/VURY5tGnTH2vHZaL/kcau2
         bnWVCIyLVLF38hVKrErL20J4x1W4PxNRAeNexhFpTzrw/gb0GqJ0l01SNrt4AVL79R3M
         Kw/SlaSpjsVXKOm9CqYuDGxvefmy6Etezq8v0R7eJIWiL3iy1k7PqYlh7o7Fv3lizkgd
         w5k44lSywe6ZNRdt/X+Dxy6eB/UdfKdBRQaLUCNkzvuZhBbvWbNOlj1lG6WnOlsTH1c8
         lLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714207702; x=1714812502;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10lHPpeHO2Li3Yua6ROu7kxe6FyJhN7/1Y8rA+KJBjQ=;
        b=obSqASSp2pEbEBW6fPk+Kj1bIT5D1SLSzupU8sY8KiMHO97f1BTJyJOvAYrBmy8WBG
         +ZgRNxMcsvFCkKs8ti4KTW5q7P8ml/pkJ7pHhzL13sqvZlql0mnNl3VzVGMJNIK8atlm
         cglNDZZgcx/ySVDWapj9OZ/bbjyymIvZL2gwtTNfwivJOa/K5iTYWMKNy8nfSrLAKsUb
         hFX4rQPMylgocX7LlqpkgAQAcu96GE9D9dHVryjeyspsl463ie79spwJBpFpQBLmrA0D
         fO5516o3H9iETobjAKL1PNElIZK7SfnkWzKItXQYE3tfaqchQHK9qwcrHkMzSIEzqDot
         9iww==
X-Gm-Message-State: AOJu0Yz3owGDwlZjmO7JSfQlpT9XlHGlZcHX2uR9NYZaW82UZgsF28Vr
	roTBPQvhMlhFD7PPh17rqsoCBcpa8T5TlwQhwZvJcLWerG/UUpE0lKqrxA==
X-Google-Smtp-Source: AGHT+IHrVWWt8zKtGq7bDiwQ70L9ZE7PK2NfIJ50bhUpLVMtYEGE5VeG+e8GhPe6JwYyxiH7XK9MMg==
X-Received: by 2002:a17:902:e94d:b0:1e4:17e4:3a30 with SMTP id b13-20020a170902e94d00b001e417e43a30mr6418546pll.31.1714207702393;
        Sat, 27 Apr 2024 01:48:22 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id kf5-20020a17090305c500b001eb0daff646sm2351452plb.109.2024.04.27.01.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 01:48:21 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 1B4FC36031A; Sat, 27 Apr 2024 20:48:18 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: gerg@linux-m68k.org
Subject: [PATCH v3 0/2] m68k uaccess fault handling fixes
Date: Sat, 27 Apr 2024 20:48:13 +1200
Message-Id: <20240427084815.1449-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

Version 4 of fixes for uaccess fault handling on 68030,
tested on 68030 and 68040.

Patch 1 has additional exception table entries as well as
a final NOP added - evidently, in some cases the fault PC
points more than a single instruction past the moves that
caused the fault. 

Patch 2 is unchanged from RFC v2.

These patches would still benefit from testing on 68060
and Coldfire. Looking at access_error060, I would not expect
the 68060 to behave much different from the 68040 and in
particular, addition of exception table entries to not cause
any regression. Less confident for Coldfire.

Cheers,

   Michael


