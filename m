Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8466D3D6472
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 12:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550838; cv=none; b=CY3OwatEl16NrG4WvBm6aHlYSYQbPM0e3UmBsrFUIuKtGKglYr8PMPWU+J/Mtx8FtBObNyKDKJ+9SK8qbBC5sGZFk6Wzj0NckJZe6wFicXjUJQh8NnRWdNxzs5gWrD58EgSitsTz0PsDixQAmn1IUJPBxXrwSJOnaT3lQefofr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550838; c=relaxed/simple;
	bh=7jlXsmJc4BF0VLC5LLPdZEyEcLFjpPpZnB2Q4QbS4A0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fkCmTtAvwEM+FCpYQymgPD9H8a1Yx2h9TK6LFJJ4fD0N0qM4aqeKasuE5yk7gs21sH3uO5v4Jn5hTvvtSXc/E4kYWWQJwDPtYcan0eJ3MRc8egMy06GW4QORCHul9MIldCuu0STUNC2evPpxzoXPXCYAa6lr9tiz7hTjz5sGJCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=s1HR+L6g; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="s1HR+L6g"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777550834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gaB0PzuLnEll2e8UzoUAA+smU2pZUE/uNIu/IG17Q3M=;
	b=s1HR+L6g3ysmEyy7UNqPzXsi38S87EJdQt/uHtLzG1mmVhG2eZ/4SIAswnixHIQtDL9hBr
	r9rhj1lkT6sk/KgeQ+QMSBrraPwHFC4gOJ7j0b2PtGUZfWdnBQxoC2zYhgR2tVHQ0VPEL+
	9eyn1TIIUNUx1eOIrFoZkgZ9hPIBnOM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Thorsten Blum <thorsten.blum@linux.dev>
Subject: [PATCH] drivers: dio: replace deprecated strcpy with strscpy in dio_init
Date: Thu, 30 Apr 2026 14:05:33 +0200
Message-ID: <20260430120532.305308-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1970; i=thorsten.blum@linux.dev; h=from:subject; bh=7jlXsmJc4BF0VLC5LLPdZEyEcLFjpPpZnB2Q4QbS4A0=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJmfXXvK2FRyVPzNBeoeR0WJBisHmRX0Ounciz92nWceV +VHo8iOUhYGMS4GWTFFlgezfszwLa2p3GQSsRNmDisTyBAGLk4BmMh/dYZfzHxLL38+feUF/5k9 H/zfL9rd9fb0OaHfSQoLz8TtPC6kLMrwP6lo69xlpWy3Ocq+RZy2ZhFbG+t/zdmh3CZAJTDES9a IDwA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() has been deprecated [1] because it performs no bounds checking
on the destination buffer, which can lead to buffer overflows. While the
current code works correctly, replace strcpy() with the safer strscpy()
to follow secure coding best practices.

Indent multiple lines using tabs instead of spaces, and use pr_info()
and avoid continuation logging while at it.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/dio/dio.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/dio/dio.c b/drivers/dio/dio.c
index 419b3c13d491..b39ae25d060e 100644
--- a/drivers/dio/dio.c
+++ b/drivers/dio/dio.c
@@ -178,7 +178,7 @@ static int __init dio_init(void)
 	if (!MACH_IS_HP300)
 		return 0;
 
-        printk(KERN_INFO "Scanning for DIO devices...\n");
+	pr_info("Scanning for DIO devices...\n");
 
 	/* Initialize the DIO bus */
 	INIT_LIST_HEAD(&dio_bus.devices);
@@ -247,18 +247,19 @@ static int __init dio_init(void)
 			dev->id = prid;
 
 		dev->ipl = DIO_IPL(va);
-		strcpy(dev->name, dio_getname(dev->id));
-                printk(KERN_INFO "select code %3d: ipl %d: ID %02X", dev->scode, dev->ipl, prid);
+		strscpy(dev->name, dio_getname(dev->id));
 		if (DIO_NEEDSSECID(prid))
-                        printk(":%02X", secid);
-                printk(": %s\n", dev->name);
+			pr_info("select code %3d: ipl %d: ID %02X:%02X: %s\n",
+				dev->scode, dev->ipl, prid, secid, dev->name);
+		else
+			pr_info("select code %3d: ipl %d: ID %02X: %s\n",
+				dev->scode, dev->ipl, prid, dev->name);
 
 		if (scode >= DIOII_SCBASE)
 			iounmap(va);
 		error = device_register(&dev->dev);
 		if (error) {
-			pr_err("DIO: Error registering device %s\n",
-			       dev->name);
+			pr_err("DIO: Error registering device %s\n", dev->name);
 			put_device(&dev->dev);
 			continue;
 		}
