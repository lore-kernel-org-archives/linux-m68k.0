Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E4284D3E
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jul 2024 07:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720596864; cv=none; b=ppVP+dh9+VmEs7L8YKxsKlDKBNFmPE7vh3LQGdpjxFL6ab6svU1ohzNB8Mr+3n4nv78DutIL1ChYLqCKd/PZzGE4OPFGMteKu1irNAkVYMDqESxCiPQyyIF3UEvD0fACG0Q2yK3CFaeiocTSxghAn/2Y3X1QiN74K7N0vGszmrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720596864; c=relaxed/simple;
	bh=y2RBXzpMCsokUrPr3LFtArnvH9uzbPQI9Q11ocJOi4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bBpEFhy3MY9UK/wXeQmw/fO1mYVXSsYIl3XNkdpsoGhwbvswI8fKpI0QZ6ErUhi6pCT6VOrFdQKlDZn5uK4saUF3oMcxLDH8cPaI9RvGJy+Bd3PmLigYO5+ox8f1bAlzINA+f2WYwtVEnke4EdiEdvXmnxMDUg8gIhN0gnD6jxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=De3peI2c; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="De3peI2c"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CDBD8CE12D4;
	Wed, 10 Jul 2024 07:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC801C32781;
	Wed, 10 Jul 2024 07:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720596860;
	bh=y2RBXzpMCsokUrPr3LFtArnvH9uzbPQI9Q11ocJOi4A=;
	h=From:To:Cc:Subject:Date:From;
	b=De3peI2cvXgBuiLY0oTROaIq4QMo/HqMXwE8UbpfHnOScuTDp2YoRrcHppuG42wXu
	 5VMtGHRQuNE6nZ70mpBYoEi048OnU802ecwejmUgyxp0xEWSlZ5Bv490Yr2tE7mjS8
	 e0WRuMlS8byVE4jxE9ft74K0tvV2SL2DZ0hUa9Bk=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] zorro: make match function take a const pointer
Date: Wed, 10 Jul 2024 09:34:14 +0200
Message-ID: <20240710073413.495541-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944; i=gregkh@linuxfoundation.org; h=from:subject; bh=y2RBXzpMCsokUrPr3LFtArnvH9uzbPQI9Q11ocJOi4A=; b=owGbwMvMwCRo6H6F97bub03G02pJDGl9lqW71t9LVPn0c/oX4aCfRxZe3H6NZ1PeOqH6/WzHU r71hS8N64hlYRBkYpAVU2T5so3n6P6KQ4pehranYeawMoEMYeDiFICJJK1jWNDT7Mv+x2L384Z9 cv4LpylqVgRnz2SYZzFde4K96KSWLTZcpRfZmRcsX1TBAAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

In commit d69d80484598 ("driver core: have match() callback in struct bus_type
take a const *"), the match callback for busses was changed to take a const
pointer to struct device_driver.  Unfortunatly I missed fixing up the zorro
code, and was only noticed after-the-fact by the kernel test robot.  Resolve
this issue by properly changing the zorro_bus_match() function.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: d69d80484598 ("driver core: have match() callback in struct bus_type take a const *")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/zorro/zorro-driver.c | 4 ++--
 include/linux/zorro.h        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/zorro/zorro-driver.c b/drivers/zorro/zorro-driver.c
index f49d19977e82..e7d3af1a223f 100644
--- a/drivers/zorro/zorro-driver.c
+++ b/drivers/zorro/zorro-driver.c
@@ -118,10 +118,10 @@ EXPORT_SYMBOL(zorro_unregister_driver);
      *  supported, and 0 if there is no match.
      */
 
-static int zorro_bus_match(struct device *dev, struct device_driver *drv)
+static int zorro_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct zorro_dev *z = to_zorro_dev(dev);
-	struct zorro_driver *zorro_drv = to_zorro_driver(drv);
+	const struct zorro_driver *zorro_drv = to_zorro_driver(drv);
 	const struct zorro_device_id *ids = zorro_drv->id_table;
 
 	if (!ids)
diff --git a/include/linux/zorro.h b/include/linux/zorro.h
index db7416ed6057..f36c8d39553d 100644
--- a/include/linux/zorro.h
+++ b/include/linux/zorro.h
@@ -52,7 +52,7 @@ struct zorro_driver {
     struct device_driver driver;
 };
 
-#define	to_zorro_driver(drv)	container_of(drv, struct zorro_driver, driver)
+#define	to_zorro_driver(drv)	container_of_const(drv, struct zorro_driver, driver)
 
 
 #define zorro_for_each_dev(dev)	\
-- 
2.45.2

