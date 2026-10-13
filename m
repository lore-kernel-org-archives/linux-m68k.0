Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542724F7CA5
	for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Oct 2026 12:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893377; cv=none; b=s/VzdXsUv8nod4Fqi2U7as26ZcoemZyKXRKrxmlR8hTUccYIVh0kgb+UOY94+ktwX8/n2KqQIy1vOuWMWUMpsQxHt/jEOceEU75tdaYXqLPGolI8gWeqTZFmKqHRqh0JBq5pDumnsypCUekyTM6lijjuVuRdoTNlsRzF1O2XH0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893377; c=relaxed/simple;
	bh=sBKxL+LsB9mlw/2ZknNw2G+0edtvEoNsD32wJ+E+9S8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NkzLgrntJunEWVru3rFw2IPhEpmoQ96HupBUyGk4BW6bPOHsWHkVdyy+7rNRDOhOq7c7knDbeFhIcueCKw07jeDvQxEFH9c3DI5O4Xmz/BcBzU9fPZjtUdKds6f2mrvI3yekjU+PpdDHulgemhQgRhT4GP1CbLYPhUQwN4ZmtCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A95541A55;
	Tue, 13 Oct 2026 12:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167A11F000FF;
	Tue, 13 Oct 2026 12:09:34 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org,
	linux-serial@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 1/5] serial: mcf: update author email address
Date: Tue, 13 Oct 2026 22:06:59 +1000
Message-ID: <20261013120831.1046590-2-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013120831.1046590-1-gerg@linux-m68k.org>
References: <20261013120831.1046590-1-gerg@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The copyright and author email address of gerg@uclinux.org is no longer
valid. Change to a current valid email address, gerg@linux-m68k.org.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 drivers/tty/serial/mcf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/mcf.c b/drivers/tty/serial/mcf.c
index 93e7dda4d39a..2b862dfe39ab 100644
--- a/drivers/tty/serial/mcf.c
+++ b/drivers/tty/serial/mcf.c
@@ -4,7 +4,7 @@
 /*
  *	mcf.c -- Freescale ColdFire UART driver
  *
- *	(C) Copyright 2003-2007, Greg Ungerer <gerg@uclinux.org>
+ *	(C) Copyright 2003-2007, Greg Ungerer <gerg@linux-m68k.org>
  */
 
 /****************************************************************************/
@@ -654,7 +654,7 @@ static void __exit mcf_exit(void)
 module_init(mcf_init);
 module_exit(mcf_exit);
 
-MODULE_AUTHOR("Greg Ungerer <gerg@uclinux.org>");
+MODULE_AUTHOR("Greg Ungerer <gerg@linux-m68k.org>");
 MODULE_DESCRIPTION("Freescale ColdFire UART driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:mcfuart");
-- 
2.55.0

