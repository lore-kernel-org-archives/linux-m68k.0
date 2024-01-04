Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19842232E
	for <linux-m68k@lists.linux-m68k.org>; Thu,  4 Jan 2024 13:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2VlCCPon"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F28B5CE1A5A;
	Thu,  4 Jan 2024 13:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65571C433C7;
	Thu,  4 Jan 2024 13:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704375578;
	bh=X5mM0G3dsXWDeA035dm6R/r6Y3NeVnfJFjdE0fL194U=;
	h=Subject:To:From:Date:From;
	b=2VlCCPon17pN1KG0rjgaGVVNJd5KDE9Cm/dPsSisKMkktQeVNB6+0oR/AAqDYhv4r
	 OfxIfpcPTw/wby1ClOc4iFpi8Kw3nCx8GYj8C1c5DQ368npeooSz/89Ax6N0UoTEXm
	 N4ekw0HYQMedHJqrJDsxBYBnetDIStxW5YKv1EpU=
Subject: patch "nubus: make nubus_bus_type static and constant" added to char-misc-testing
To: gregkh@linuxfoundation.org,fthain@linux-m68k.org,geert@linux-m68k.org,linux-m68k@lists.linux-m68k.org
From: <gregkh@linuxfoundation.org>
Date: Thu, 04 Jan 2024 14:39:26 +0100
Message-ID: <2024010426-junkyard-overshot-5c16@gregkh>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit


This is a note to let you know that I've just added the patch titled

    nubus: make nubus_bus_type static and constant

to my char-misc git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
in the char-misc-testing branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will be merged to the char-misc-next branch sometime soon,
after it passes testing, and the merge window is open.

If you have any questions about this process, please let me know.


From 3faea80bd9ff02b655cb0c80a1c0bdca44c0f94d Mon Sep 17 00:00:00 2001
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 19 Dec 2023 16:47:41 +0100
Subject: nubus: make nubus_bus_type static and constant

Now that the driver core can properly handle constant struct bus_type,
move the nubus_bus_type variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

It's also never used outside of drivers/nubus/bus.c so make it static
and don't export it as no one is using it.

Cc: Finn Thain <fthain@linux-m68k.org>
Cc:  <linux-m68k@lists.linux-m68k.org>
Acked-by: Finn Thain <fthain@linux-m68k.org>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Link: https://lore.kernel.org/r/2023121940-enlarged-editor-c9a8@gregkh
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/nubus/bus.c   | 3 +--
 include/linux/nubus.h | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/nubus/bus.c b/drivers/nubus/bus.c
index 72921e4f35f6..12df4d88970c 100644
--- a/drivers/nubus/bus.c
+++ b/drivers/nubus/bus.c
@@ -32,12 +32,11 @@ static void nubus_device_remove(struct device *dev)
 		ndrv->remove(to_nubus_board(dev));
 }
 
-struct bus_type nubus_bus_type = {
+static const struct bus_type nubus_bus_type = {
 	.name		= "nubus",
 	.probe		= nubus_device_probe,
 	.remove		= nubus_device_remove,
 };
-EXPORT_SYMBOL(nubus_bus_type);
 
 int nubus_driver_register(struct nubus_driver *ndrv)
 {
diff --git a/include/linux/nubus.h b/include/linux/nubus.h
index bdcd85e622d8..4d103ac8f5c7 100644
--- a/include/linux/nubus.h
+++ b/include/linux/nubus.h
@@ -89,8 +89,6 @@ struct nubus_driver {
 	void (*remove)(struct nubus_board *board);
 };
 
-extern struct bus_type nubus_bus_type;
-
 /* Generic NuBus interface functions, modelled after the PCI interface */
 #ifdef CONFIG_PROC_FS
 extern bool nubus_populate_procfs;
-- 
2.43.0


