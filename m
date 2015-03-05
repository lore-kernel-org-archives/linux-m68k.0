From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] m68k: remove a superflous KERN_ERR
Date: Thu, 5 Mar 2015 14:27:00 +0300
Message-ID: <20150305112700.GC13378@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:20076 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755181AbbCEL1O (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 5 Mar 2015 06:27:14 -0500
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, kernel-janitors@vger.kernel.org

pr_err() has a KERN_ERR built in.  Smatch complains about these nowadays.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/m68k/kernel/pcibios.c b/arch/m68k/kernel/pcibios.c
index 931a31f..8520250 100644
--- a/arch/m68k/kernel/pcibios.c
+++ b/arch/m68k/kernel/pcibios.c
@@ -62,7 +62,7 @@ int pcibios_enable_device(struct pci_dev *dev, int mask)
 
 		r = dev->resource + idx;
 		if (!r->start && r->end) {
-			pr_err(KERN_ERR "PCI: Device %s not available because of resource collisions\n",
+			pr_err("PCI: Device %s not available because of resource collisions\n",
 				pci_name(dev));
 			return -EINVAL;
 		}
