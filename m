Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7123EBF00
	for <linux-m68k@lists.linux-m68k.org>; Wed, 22 Apr 2026 13:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776864439; cv=none; b=oqejT1Z6ZW21p0BqNTTCfoGtgw6jSU+/qpU57O2uv8ShllHvv7jA378OVLfHnj3dyp722nFKmLhuthTnYUcea816rDOQ/PxebMEtP14UwANEh8k6igDSfBcTkdljwmTlBhm9YvtrzsxaOzwHvYO6foPwxqUqZbsfzwVVP7iTLVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776864439; c=relaxed/simple;
	bh=CNmV50fwWM2qTb/hOpmr0ep4rnwuMTOUpDhQuUCzzaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CdGQ5jJR2EXdX3l7HBokIaWuz7jQFiIP2hZnrQuBRtluk3WIMcazVX5FhWBlfXCNwSHOrvbgtxK93RZgsdwteq+ow25opzrcVtq6669uzHe/vqQepQigR+nZLgA4ukxeV8ng3kUYtWhvFrKKwFRWN+WKcYMTMrde6w07fOTEp2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=TEg4KISg; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="TEg4KISg"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a9296b3926so31328085ad.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 22 Apr 2026 06:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1776864437; x=1777469237; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jDcTBG+hlhD51mSvRcMB9jaoIaf7As497aHU40CIgJU=;
        b=TEg4KISgutfNSNR6Ef0L99qtAErP3M7a85d0Y7c3VDAPbqONYM5tqKdIDfFbQHcvgI
         k2+tRKlBA97KNcduqCh5+N0jCP/BpxTe6s3nCrREKBO+guP3D2RaKvVbAy9iPqEAfX1Z
         npIxFuJjkNC9fIJNFotWCL0LO/5g41723Pc4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776864437; x=1777469237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDcTBG+hlhD51mSvRcMB9jaoIaf7As497aHU40CIgJU=;
        b=fan35vHDOlYx/oq+rKY4pUktGa46F+pJYhmL8NoHjzpqeyOln1AgsJ8kFhFcPcETwW
         4CDlaceebfuMyfb1lPsTx+ljIcSEumNI34fzYKV1DKAk0/V1v//x/RFmbVaTRsMIBJiF
         VJfd5OAv8fYl30Xq199nuJ3TWZTGeHkUPjAaXSgr7SW7YBZ8aOfickGr5SWPskWv26/B
         HxBdEO+FX/RyCn0IpZ7lvjzeewxO+sKIHrOXElzsDvdIF+2wFEBvZM61Jt9QRAxNQIGD
         fJPqcfTvM6xEmrR1cbkIcEzEpAg7UEoYTysJesGBQtD14922oIU9Flc+eqyx2MGQwu3p
         k+yg==
X-Forwarded-Encrypted: i=1; AFNElJ+5FZa6kvLhlZD4zBEtNYidDx7yr9hFRtT7/J2BtCMvt8eHpK0R4RpVF9O7wlsLWe8FolxFAorW+u0m@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwdloGm5XQoS95G5PckIKb/MmlydxOUv+yWwIGdC4q0Jn4JZMOs
	A7AUigkkii0waytLBOSgsbh91gRq1XHXhgnrnHXYbFgoiM8fx4a+I+jseEmrbCiBdyQ=
X-Gm-Gg: AeBDies3M2BaJZXLNxCag+IAZ3Xe+0Y1/91T4+eSL6DZQUhD3ZLqih+wz45GJpL1Wze
	X8ikHGKa0WOw38ldkOtbWHSqw0zbzlsZo9TiDqUDrhZ7zwJCNEblrtkvWLsG3RR+YJagtk3Xjyj
	DBzqTGlO+sKSkIkrrqsTFIEVh0EyHZWcBBCeNnrYklB8+x4FGj0eXHeo4Jnl6agWRTGYXJNjcYJ
	+UchYlx39g1To+r+ksot42J1xVivRG84m9G+NFnONwMs4EE+ptOam//wQq5x22YwyZ8Q7g8B4Qv
	mOp5XsfXzdcegTfkAkls8gwDfREAfwd5exHlDXhKKsxgH1j99OZFWPwv8BUYL9hfDFsm3GpeuCx
	eUmY3Vza7hVgp117ktoH+lXph1rd/3bC7PH9Qk940UD0p/f6bhn3cPCtdprKro48ToHFiMO4RPb
	/B5nA0lU5bWY3nHI78X8ojr2SKV2dmltJRkOb4P3IuQeXgt7YjZ7sU2VkCsu+TtDilvBno2nQO0
	9wrUGMgk0cWP8DvtS5kI4Kv
X-Received: by 2002:a17:902:7c0f:b0:2b0:663f:6b53 with SMTP id d9443c01a7336-2b5f9eb2b36mr169293385ad.13.1776864436549;
        Wed, 22 Apr 2026 06:27:16 -0700 (PDT)
Received: from kinako.work.home.arpa (p1329195-ipxg00a01sizuokaden.shizuoka.ocn.ne.jp. [114.145.5.195])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b5faa34ea7sm165756005ad.34.2026.04.22.06.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 06:27:16 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: andrew+netdev@lunn.ch
Cc: geert@linux-m68k.org,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-m68k@lists.linux-m68k.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH] m68k: mvme147: Make me the maintainer
Date: Wed, 22 Apr 2026 22:27:10 +0900
Message-ID: <20260422132710.2855826-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm actively using mainline + patches on this board as a bootloader
for another VME board and as a terminal server using a multiport
serial board in the same VME backplane. I even have mainline u-boot
on real EPROMs.

Make me the maintainer of its ethernet, scsi and arch code so I get
an email before one or more of them get deleted.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d25342ca8aa1..9949b5528bcf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15311,6 +15311,13 @@ S:	Maintained
 W:	http://www.tazenda.demon.co.uk/phil/linux-hp
 F:	arch/m68k/hp300/
 
+M68K ON MVME147
+M:	Daniel Palmer <daniel@thingy.jp>
+S:	Maintained
+F:	arch/m68k/mvme147/
+F:	drivers/net/ethernet/amd/mvme147.c
+F:	drivers/scsi/mvme147.*
+
 M88DS3103 MEDIA DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
-- 
2.53.0

