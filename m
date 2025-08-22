Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00571230272
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Aug 2025 14:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755874700; cv=none; b=uFlpaR8EBvP8C0U05WJ/eSQ5o7F0wwOVChit6DplM0i1DqvYk81jp9d/pqdDEivnlSriWeB0fiXkCv2+rNuUzFXDfg9vtSjnglIImzPAfda2JmkX2K1ksQYXlC45KHfbbuoq+GM4J4HKYWPk7N/8rFFqUkiP7ZVDM7I+L8JWoRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755874700; c=relaxed/simple;
	bh=9B/2/rkIoDBIm4IVMedT6yw/8fy5XFXgmUft891BmJg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DPQDKbnD8aF0g80SSc0AQepbTYdz5S812iAt89Gp/ZJRtVbgWK5s8T2OWVzsTQ33QRSy/ZRKIiY2XbBB2s3q9d6tL0VaFQGsn1HFMK6WkWZMJ5ZuLFYdjdM0oShAezQYaU9N+hqYwXmwJsXtgQ3YaCNjLTd/JZbKnwFIgQyVB8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WIDwR4pS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIDwR4pS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874700; x=1787410700;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9B/2/rkIoDBIm4IVMedT6yw/8fy5XFXgmUft891BmJg=;
  b=WIDwR4pSxyiihxBnWUKpTy3OZF3Xc+rK69QEPUe1ShNZJt9D+4Q6sChJ
   PMjHVn4J3PBTZkrexB7uQudEgZM5/0C1ZiXq2CgjfBki0BUNNiFy/ugKZ
   It5tfEP47rjXnWhDnmUVrE0D6CDSPdyX7Bd2GVrvvpnBmlt4HweBlvpAu
   xXt7aGWoqjkFr34cPunBDtCHWzKmoy/u24cnpScU3BW+Nr8zsM3+nbCm4
   Zi4ed9IFVTwPzawIsVp5GYtKaSDYMGSwj9PAir9daN1Zz386bL5GPhyb4
   +IHJtnWc7b4oYGgHMnZI49aJskiFzJMN/uoM8fbQHireHH06UcRTvQ0ZB
   w==;
X-CSE-ConnectionGUID: sTmR+rlOTGOPOO2ADg+HVA==
X-CSE-MsgGUID: +l3tf2F7RFGcfmV2uZ4scA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80780549"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="80780549"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:58:19 -0700
X-CSE-ConnectionGUID: wIvH4dl9SZ6yJbAG3Hjt8Q==
X-CSE-MsgGUID: w6Fs+Ad5RZ62WfjHUtvaog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168232369"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:58:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andreas Larsson <andreas@gaisler.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-pci@vger.kernel.org,
	sparclinux@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Yinghai Lu <yinghai@kernel.org>,
	Igor Mammedov <imammedo@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 13/24] PCI: Fix finding bridge window in pci_reassign_bridge_resources()
Date: Fri, 22 Aug 2025 17:55:54 +0300
Message-Id: <20250822145605.18172-14-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250822145605.18172-1-ilpo.jarvinen@linux.intel.com>
References: <20250822145605.18172-1-ilpo.jarvinen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pci_reassign_bridge_resources() walks upwards in the PCI bus hierarchy,
locates the relevant bridge window on each level using flags check, and
attempts to release the bridge window. The flags-based check is fragile
due to various fallbacks bridge window selection logic might use. As
such, the algorithm might not locate the correct bridge window.

Refactor pci_reassign_bridge_resources() to determine the correct
bridge window using pbus_select_window() that contains logic to handle
all fallback cases correctly. Change function prefix to pbus as it now
inputs struct bus and resource for which to locate the bridge window.

The main purpose of this change is to make bridge window selection
logic consistent across the entire PCI core (one step at a time). While
this technically also fixes the commit 8bb705e3e79d ("PCI: Add
pci_resize_resource() for resizing BARs") making the bridge window walk
algorithm more robust, The normal setup having a 64-bit resizable BAR
underneath bridge(s) with 64-bit prefetchable windows does not need to
use any fallbacks. As such, the practical impact is low (requiring BAR
resize use case and a non-typical bridge device).

The way to detect if unrelated resource failed again is left to use the
type based approximation which should not behave worse than before.

Fixes: 8bb705e3e79d ("PCI: Add pci_resize_resource() for resizing BARs")
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pci.h       |  2 +-
 drivers/pci/setup-bus.c | 40 ++++++++++++++++++++--------------------
 drivers/pci/setup-res.c |  2 +-
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index cbd40f05c39c..0d96a9141227 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -334,7 +334,7 @@ struct device *pci_get_host_bridge_device(struct pci_dev *dev);
 void pci_put_host_bridge_device(struct device *dev);
 
 unsigned int pci_rescan_bus_bridge_resize(struct pci_dev *bridge);
-int pci_reassign_bridge_resources(struct pci_dev *bridge, unsigned long type);
+int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource *res);
 int __must_check pci_reassign_resource(struct pci_dev *dev, int i, resource_size_t add_size, resource_size_t align);
 
 int pci_configure_extended_tags(struct pci_dev *dev, void *ign);
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 0c0872b85762..5ef6362b5166 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -2521,10 +2521,17 @@ void pci_assign_unassigned_bridge_resources(struct pci_dev *bridge)
 }
 EXPORT_SYMBOL_GPL(pci_assign_unassigned_bridge_resources);
 
-int pci_reassign_bridge_resources(struct pci_dev *bridge, unsigned long type)
+/*
+ * Walk to the root hub, find the bridge window relevant for @res and
+ * releasing it when possible. If the bridge window contains assigned
+ * resources, it cannot be released.
+ */
+int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource *res)
 {
+	unsigned long type = res->flags;
 	struct pci_dev_resource *dev_res;
-	struct pci_dev *next;
+	struct pci_dev *bridge;
+	const char *res_name;
 	LIST_HEAD(saved);
 	LIST_HEAD(added);
 	LIST_HEAD(failed);
@@ -2533,33 +2540,26 @@ int pci_reassign_bridge_resources(struct pci_dev *bridge, unsigned long type)
 
 	down_read(&pci_bus_sem);
 
-	/* Walk to the root hub, releasing bridge BARs when possible */
-	next = bridge;
-	do {
-		bridge = next;
-		for (i = PCI_BRIDGE_RESOURCES; i < PCI_BRIDGE_RESOURCE_END;
-		     i++) {
-			struct resource *res = &bridge->resource[i];
-
-			if ((res->flags ^ type) & PCI_RES_TYPE_MASK)
-				continue;
+	while (!pci_is_root_bus(bus)) {
+		bridge = bus->self;
+		res = pbus_select_window(bus, res);
+		if (!res)
+			break;
 
-			/* Ignore BARs which are still in use */
-			if (res->child)
-				continue;
+		i = pci_resource_num(bridge, res);
+		res_name = pci_resource_name(bridge, i);
 
+		/* Ignore BARs which are still in use */
+		if (!res->child) {
 			ret = add_to_list(&saved, bridge, res, 0, 0);
 			if (ret)
 				goto cleanup;
 
 			pci_release_resource(bridge, i);
-			break;
 		}
-		if (i == PCI_BRIDGE_RESOURCE_END)
-			break;
 
-		next = bridge->bus ? bridge->bus->self : NULL;
-	} while (next);
+		bus = bus->parent;
+	}
 
 	if (list_empty(&saved)) {
 		up_read(&pci_bus_sem);
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index 21f77e5c647c..c3ba4ccecd43 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -496,7 +496,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 
 	/* Check if the new config works by trying to assign everything. */
 	if (dev->bus->self) {
-		ret = pci_reassign_bridge_resources(dev->bus->self, res->flags);
+		ret = pbus_reassign_bridge_resources(dev->bus, res);
 		if (ret)
 			goto error_resize;
 	}
-- 
2.39.5

