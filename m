Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A988729D264
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 May 2026 08:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882727; cv=none; b=VxtPZ68Eg6BSz1NehA0dqZZjR7kvgrap1+5dQtK2LPkssfBPRP7pjpMvUag11mE+dVOWm5cqsA/B7zyUqptCqBQPGr3zbeB8/5kipYCfFC58NzMptQzPPYWbwP1Ipu1+W3otIXLmTWvuOgbHMsTF1AXtLetVjApbGFjL0AcWWng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882727; c=relaxed/simple;
	bh=/UH6Dy4SLe9hJnBSeR/hyTqWP19jbLJY2e4TdrhaRTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBz5wMwT53muSxbwd/XXSdk7z+WPyq50GW8kRR2x879ImozUs/dFsc+Lp3IfqUsVhDny1qX8O2z3ewZTojRNBVuk+t4ZUqP+jlhFZWe1jDhwJiYvoDaXei0COxiYlz2Px4aU3YxFTJLT67zkst1VW4rzJA2Bnoz5551FaszGAa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DEMRqpyG; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DEMRqpyG"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777882723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=foYN5hxyFcmh50r/Q2YMIa96sccXknUqVj5VavLyUIc=;
	b=DEMRqpyGzWo+VWFtAt1EIcJdimohTzWW5UQ4f/JzSnUnxN8xeY/gMdBNNA7Dx1+L2peJ46
	Tf7VmZ82TP32pH3bMU3wHq2P9CblLxdsT0P9WPpc2pCzVQNBmW8EAxDNad2khPtQfWdEB8
	mBoWRzy+Gp268MS8z5fPKvyhSwfoc4s=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Thorsten Blum <thorsten.blum@linux.dev>
Subject: [PATCH v2 2/2] drivers: dio: use tabs and avoid continuation logging in dio_init
Date: Mon,  4 May 2026 10:18:07 +0200
Message-ID: <20260504081804.3260-5-thorsten.blum@linux.dev>
In-Reply-To: <20260504081804.3260-3-thorsten.blum@linux.dev>
References: <20260504081804.3260-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546; i=thorsten.blum@linux.dev; h=from:subject; bh=/UH6Dy4SLe9hJnBSeR/hyTqWP19jbLJY2e4TdrhaRTA=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJk/wmxEuGKeTWtrrNRhMKpVbX0a+j04uPRbWdtmjdIAO wbnFYIdpSwMYlwMsmKKLA9m/ZjhW1pTuckkYifMHFYmkCEMXJwCMJHDdxj+eyo2ZqkcnTtZUFk2 8vqiS4c3/5XYJfDZpeDstIQHkZGpvxgZ/rgsm7On1WS5in29rtjSwCNzObnLyx+KXrrr+dHWalc wOwA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Indent multiple lines using tabs instead of spaces. Use pr_info() and
avoid continuation logging.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/dio/dio.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/dio/dio.c b/drivers/dio/dio.c
index 4a3ddda97d7c..b39ae25d060e 100644
--- a/drivers/dio/dio.c
+++ b/drivers/dio/dio.c
@@ -178,7 +178,7 @@ static int __init dio_init(void)
 	if (!MACH_IS_HP300)
 		return 0;
 
-        printk(KERN_INFO "Scanning for DIO devices...\n");
+	pr_info("Scanning for DIO devices...\n");
 
 	/* Initialize the DIO bus */
 	INIT_LIST_HEAD(&dio_bus.devices);
@@ -248,17 +248,18 @@ static int __init dio_init(void)
 
 		dev->ipl = DIO_IPL(va);
 		strscpy(dev->name, dio_getname(dev->id));
-                printk(KERN_INFO "select code %3d: ipl %d: ID %02X", dev->scode, dev->ipl, prid);
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
