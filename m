Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2C229D264
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 May 2026 08:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882722; cv=none; b=Dvu35XdRSnZvPNaxbY29wh76fMx0pnhviQsNsvOXEfj9DCyzRNEJZNfMPlC6gFg01f/Qs8rO77vjjEMlqJ0EXTOhDNsTdj+ryhxCHyK8v4rwaZ1wGF5rWD7x1BvoPoEjOHrNhMU0hBA9hX1Z/k5SrDnFxSwHJJl8bHvGRqjmiLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882722; c=relaxed/simple;
	bh=I5SoRnRUuF0pXijnClkOqsxVX1XLeY7vJznUXS0/Fuc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WfW7oa0dE4J7KGBz1TlluZ4vrYAtAfn0zo0vw2bbXv1PI2UCFt/bCPa1BIib21e/feImpnqwnjY0IiMl/a1A4Qc7Gqvvlr37gEdcsf+UQHsIseC/yajGutGFUp5VwIBL/x3Nfl5vLjUZLbVaWFOOniKBx1UTC9oHx07cylkySoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mqmW72dK; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mqmW72dK"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777882708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FsdDbjL/I/GfR4PgeKsq5RsMwq2Lrat0fGV9Z1xVEws=;
	b=mqmW72dKf6NT0ISyS0YGGaCiJq2Ba71Dg4HN7qUiykVpOc4N2pM+HJLAJkJB2QB0SW+Sr3
	jV2l0xSboavxusa9Hm3EJobjGbiEs3ZUEG6Mz47mCfji3a+u7EC8k6d4MIjlqstwKTewj5
	xH8Vre8hJLJ149SX67WxQdCpsEglVP0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Thorsten Blum <thorsten.blum@linux.dev>
Subject: [PATCH v2 1/2] drivers: dio: replace deprecated strcpy with strscpy in dio_init
Date: Mon,  4 May 2026 10:18:05 +0200
Message-ID: <20260504081804.3260-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=998; i=thorsten.blum@linux.dev; h=from:subject; bh=I5SoRnRUuF0pXijnClkOqsxVX1XLeY7vJznUXS0/Fuc=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJk/wmx2xgns+ury/aPEkiOHAl7Nf5JkmnBpQsQ6HvFiw 3qDVZ2vO0pZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAiT5MYGU4KnjWO/1M3US9Y Ze/kOXV2RjI7W9ZdZLinNPHCqXkpokEM/wxmVM3xMFti3H/oRvimb1LM7vVxbA+WtEk03JX/fdt Nhx8A
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() has been deprecated [1] because it performs no bounds checking
on the destination buffer, which can lead to buffer overflows. While the
current code works correctly, replace strcpy() with the safer strscpy()
to follow secure coding best practices.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/dio/dio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dio/dio.c b/drivers/dio/dio.c
index 419b3c13d491..4a3ddda97d7c 100644
--- a/drivers/dio/dio.c
+++ b/drivers/dio/dio.c
@@ -247,7 +247,7 @@ static int __init dio_init(void)
 			dev->id = prid;
 
 		dev->ipl = DIO_IPL(va);
-		strcpy(dev->name, dio_getname(dev->id));
+		strscpy(dev->name, dio_getname(dev->id));
                 printk(KERN_INFO "select code %3d: ipl %d: ID %02X", dev->scode, dev->ipl, prid);
 		if (DIO_NEEDSSECID(prid))
                         printk(":%02X", secid);
