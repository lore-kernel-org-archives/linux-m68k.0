Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0448542A82
	for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Dec 2025 07:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765610493; cv=none; b=gI0rCHqhE+rfXgfyKWA4loObOo5QuTYP6mb/dsRxDzUjijpjVJ/XK0Lz/GCyQYbj9bldWxfp70SKFJMpklTWEx9yvUJXRyEdTPdsrljmasrDrccNU+5bE4UjVmie2/Njr4ixXScq6zTTW80x8r+aVZrbB/dtNNJivApxIhXDqZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765610493; c=relaxed/simple;
	bh=fUnHrRGmkR9DWnSKMyxB/FSD2YC4+vtIXWALNDbXb8I=;
	h=To:Cc:Message-ID:From:Subject:Date; b=lPav2dcEMmoEqDTBOE8+9p6HQDYfVwxKuXpJQR9ZWy7aAj3PtlCLkmtmwTjwA0LA49D2GLWmbLkYCqgeizQb3pIA55+kFBN3ZLJDFgCxF/iprlw5qpae5kLgftA4lsD82FoatziyRILwtqWA8Y6ywdhv1ZXjY8cwQ221dkGiAlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kr/uF0CY; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kr/uF0CY"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 09EB17A0099;
	Sat, 13 Dec 2025 02:21:30 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 13 Dec 2025 02:21:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1765610489; x=1765696889; bh=rZzIYAnvUxx5O5o2uz0JKMo1qYer
	zsDkeiYWT5O3O5Y=; b=kr/uF0CYNAaRdASEOtM027tiv4VZIZnT1w/pB257u5Vk
	OMB8B3kC96jZ2/iGiNn082fG7g9RpdIF4gH/X6WCuZDzb7X0pmbjS5lVOobT6pxm
	Pi3gWEM/k0D4u/IPaBq7iyd7HJIgJMvqG0XY74721roTKVThbUX/W4SA+olICr6h
	1N9XCGf0HbZDdpI2oBIAoUnLTubMKjxWfEyuxAgnz5hvb9P6zTHPL8zLZksCkTX3
	wasCBwsNnRg0+QJ5TrFEtzQ7tBd8MAIePDs++W1kCHUyJjeS+1EWF7XoXOOqWim8
	5cEfcWFY2YvK+QvCjivi7AJ3FS4FtM/yJ9lJfOjCFw==
X-ME-Sender: <xms:-BM9aWypd2s-gKqdipm0L-SUfB-9mGsH5KQtYHPeSYnc41h07D6Arw>
    <xme:-BM9aV9sKxNXwVWXuXVGQyhxWQjZN_zaBDmc-ss_87QaYqzYWhfhRtCRJ9HwkPdsq
    ERxJdHqMDO2C4of-gTOohoZ9IKTjJnJdfD6CWLZnSql4pKqvZ5gPog>
X-ME-Received: <xmr:-BM9aSLZMb-b2M-8Wjy8nIZSbEnslWKZgtJ-Fdc4uHP2QHgTKzcEsw1FIM4koc_AcgVPVDEcC-womSqiA-g7KyDm0lskwyqIu8c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefvvefkhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgrihhnuceo
    fhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvghrnhephe
    ffgfegfeevgeevtdeiffefveeutdeghfeuheeiteffjeefgfegveefuedvudelnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnse
    hlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtohephedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtg
    hpthhtoheplhhihhgrohigihgrnhhgsehishhrtgdrihhstggrshdrrggtrdgtnhdprhgt
    phhtthhopegurghnihgvlhestdigtdhfrdgtohhmpdhrtghpthhtoheplhhinhhugidqmh
    eikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-BM9aTdvk7yMpzjJKPhnX7-IWt9-Eyaysj91Puziw4RRggLY6NYxAQ>
    <xmx:-BM9aZ-T219AWFLS-qJMSuFnIkyXBxYwVHhhAe8UI7K0srm6nCamhg>
    <xmx:-BM9aYrT4p5oIuFPSS0Kyrh9l94RHUber6XDeZRoLBu5GAZspAXenQ>
    <xmx:-BM9aWCE4i0vSA2uLY4MlosIGi3XtKhxSLPzo7xBRZSgYoWbOjNKXw>
    <xmx:-RM9aTU62lNDE9upGMeJwzPy8ePgqQ3AbGurgc58nUkgVMukuffzOyBQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Dec 2025 02:21:27 -0500 (EST)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
    Daniel Palmer <daniel@0x0f.com>,
    linux-m68k@lists.linux-m68k.org,
    linux-kernel@vger.kernel.org
Message-ID: <478d5f080d74b6688c9e3f9132e3fe251e997ad7.1765610469.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH] nubus: Call put_device() in bus initialization error path
Date: Sat, 13 Dec 2025 18:21:09 +1100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

The error path for bus initialization is missing a call to put_device().
Add that call. This error path will probably never actually execute, but
any kernel source code may be subject to static checking or re-use.

Cc: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: Daniel Palmer <daniel@0x0f.com>
Suggested-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
Tested on a Mac IIfx.
---
 drivers/nubus/bus.c   | 13 ++-----------
 drivers/nubus/nubus.c | 12 +++++++++---
 include/linux/nubus.h |  3 +--
 3 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/nubus/bus.c b/drivers/nubus/bus.c
index 12df4d88970c..b7d417385d98 100644
--- a/drivers/nubus/bus.c
+++ b/drivers/nubus/bus.c
@@ -51,21 +51,12 @@ void nubus_driver_unregister(struct nubus_driver *ndrv)
 }
 EXPORT_SYMBOL(nubus_driver_unregister);
 
-static struct device nubus_parent = {
-	.init_name	= "nubus",
-};
-
 static int __init nubus_bus_register(void)
 {
 	return bus_register(&nubus_bus_type);
 }
 postcore_initcall(nubus_bus_register);
 
-int __init nubus_parent_device_register(void)
-{
-	return device_register(&nubus_parent);
-}
-
 static void nubus_device_release(struct device *dev)
 {
 	struct nubus_board *board = to_nubus_board(dev);
@@ -79,9 +70,9 @@ static void nubus_device_release(struct device *dev)
 	kfree(board);
 }
 
-int nubus_device_register(struct nubus_board *board)
+int nubus_device_register(struct device *parent, struct nubus_board *board)
 {
-	board->dev.parent = &nubus_parent;
+	board->dev.parent = parent;
 	board->dev.release = nubus_device_release;
 	board->dev.bus = &nubus_bus_type;
 	dev_set_name(&board->dev, "slot.%X", board->slot);
diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index ab0f32b901c8..197c8c0de199 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -41,6 +41,10 @@ module_param_named(populate_procfs, nubus_populate_procfs, bool, 0);
 
 LIST_HEAD(nubus_func_rsrcs);
 
+static struct device nubus_parent = {
+	.init_name	= "nubus",
+};
+
 /* Meaning of "bytelanes":
 
    The card ROM may appear on any or all bytes of each long word in
@@ -829,7 +833,7 @@ static void __init nubus_add_board(int slot, int bytelanes)
 		list_add_tail(&fres->list, &nubus_func_rsrcs);
 	}
 
-	if (nubus_device_register(board))
+	if (nubus_device_register(&nubus_parent, board))
 		put_device(&board->dev);
 }
 
@@ -882,9 +886,11 @@ static int __init nubus_init(void)
 		return 0;
 
 	nubus_proc_init();
-	err = nubus_parent_device_register();
-	if (err)
+	err = device_register(&nubus_parent);
+	if (err) {
+		put_device(&nubus_parent);
 		return err;
+	}
 	nubus_scan_bus();
 	return 0;
 }
diff --git a/include/linux/nubus.h b/include/linux/nubus.h
index 4d103ac8f5c7..b8710c825d64 100644
--- a/include/linux/nubus.h
+++ b/include/linux/nubus.h
@@ -162,8 +162,7 @@ void nubus_seq_write_rsrc_mem(struct seq_file *m,
 unsigned char *nubus_dirptr(const struct nubus_dirent *nd);
 
 /* Declarations relating to driver model objects */
-int nubus_parent_device_register(void);
-int nubus_device_register(struct nubus_board *board);
+int nubus_device_register(struct device *parent, struct nubus_board *board);
 int nubus_driver_register(struct nubus_driver *ndrv);
 void nubus_driver_unregister(struct nubus_driver *ndrv);
 int nubus_proc_show(struct seq_file *m, void *data);
-- 
2.49.1

