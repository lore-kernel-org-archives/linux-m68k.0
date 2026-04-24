Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5E738B7B3
	for <linux-m68k@lists.linux-m68k.org>; Fri, 24 Apr 2026 10:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777027220; cv=none; b=Q7Yovg7VNdC3P0GHSmxx2qd/zxJiiPBnnWf5/I5+5aQCjbl+3v8WIbC5Sd02Xe2yxO/1kiGxhW0nbEiwII6RZof4ZsFKxxtbGKM3G9px5xP+MAeuXXlhB9wc/SSnbnn6KXZiXEyarb5fHEWc47P9KAsZ7qBGDwiKAqcn+HPsd2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777027220; c=relaxed/simple;
	bh=tRFCOp8K+Os7MGhS/7FOUla3fVKXkair78hjmNbyuXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c52dKvNHGADAlUH9KW3wHELaX+JeTBfOBuaYVC1Qx9+pYzEDgRHnxxDeUtGdTAa5Nhie8I1dI7ZOC3RZKXvZVinb5/VNAffuz5qAYRB9skOWi29E42LS1JxxmqOmotu+V0AC3R2gV9roqfWMicW6bzr9Y2kpsnEwHv/t1oO62Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2sO3NtP; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2sO3NtP"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C47A4600AE;
	Fri, 24 Apr 2026 10:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73077C19425;
	Fri, 24 Apr 2026 10:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777027217;
	bh=tRFCOp8K+Os7MGhS/7FOUla3fVKXkair78hjmNbyuXE=;
	h=From:To:Cc:Subject:Date:From;
	b=s2sO3NtPtYvbDQYuFqtlZLrD0LrO6cIqbXGJcK1R30rOh8KnrT7DkCw2kLqZwdVjw
	 9MF1LUTd9GZ/yDkOdJl38Ob9bZh1ueY6/lGXt1ayUoiZB9So5jBQ1jAcqdrebIbiND
	 W2re42ax0tIpSyq39YJDKsiL1pyEWbVP3+TVWj6hL5CtVjyxDOEaWfbhPmsjaeyTrS
	 OW2XHAgY6QvW7T/rDaoSPQs0WnuulF9p/XX3NcpRzqlYYpYeb3NOvv6dPlTnAJ+OwZ
	 15W7qz9sxz9BVrEDiGo/7ZDgyRn9zCX8P8lafJz6je5sZ4K9bX15qM/fePAIM7a0Gk
	 Qi9e6EmYSWENg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wGDxH-0000000AynO-1KUJ;
	Fri, 24 Apr 2026 12:40:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] nubus: switch to dynamic root device
Date: Fri, 24 Apr 2026 12:40:11 +0200
Message-ID: <20260424104011.2616970-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver core expects devices to be dynamically allocated and will, for
example, complain loudly if a device that lacks a release function is
ever freed.

Use root_device_register() to allocate and register the root device
instead of open coding using a static device.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/nubus/nubus.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index 559dce302d06..40ce4991c356 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -41,9 +41,7 @@ module_param_named(populate_procfs, nubus_populate_procfs, bool, 0);
 
 LIST_HEAD(nubus_func_rsrcs);
 
-static struct device nubus_parent = {
-	.init_name	= "nubus",
-};
+static struct device *nubus_parent;
 
 /* Meaning of "bytelanes":
 
@@ -833,7 +831,7 @@ static void __init nubus_add_board(int slot, int bytelanes)
 		list_add_tail(&fres->list, &nubus_func_rsrcs);
 	}
 
-	if (nubus_device_register(&nubus_parent, board))
+	if (nubus_device_register(nubus_parent, board))
 		put_device(&board->dev);
 }
 
@@ -880,18 +878,17 @@ static void __init nubus_scan_bus(void)
 
 static int __init nubus_init(void)
 {
-	int err;
-
 	if (!MACH_IS_MAC)
 		return 0;
 
 	nubus_proc_init();
-	err = device_register(&nubus_parent);
-	if (err) {
-		put_device(&nubus_parent);
-		return err;
-	}
+
+	nubus_parent = root_device_register("nubus");
+	if (IS_ERR(nubus_parent))
+		return PTR_ERR(nubus_parent);
+
 	nubus_scan_bus();
+
 	return 0;
 }
 
-- 
2.53.0

