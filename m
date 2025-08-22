Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFACB21256A
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Aug 2025 14:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755874625; cv=none; b=iJlZe5wh1+0DF52HGZKbZLECrA2qMvVn5Skspju5RZEhAF5LYgU6LJHyIWnvBRLJTPeHOSF7oSTm2FZhoARcODpaM7HnvoJPTOemcLrtfIE1PFjkbpEnNPYbUjt7xe3Gu7I6TwAE2c2Rp64seN+pgJjVeOAbPErxnlg5sJxLY3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755874625; c=relaxed/simple;
	bh=wPDvnWZ5n/ZzruRde5Pq3zT/XPnm5sbjNx2qOymBYfE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dQZvdhYWkISadjJUnluFa/yIE8pTWuSHL41zGNpHwCdgNFYw+2438XUMYZ3wceyv8GVQo5gOy9ycZFu51vAhRNzVCksfrvH6NgvIK53xdCi7bIKBdKk7gQyMdgW/7E1qTOS/kvnDS7OG0Kjo+HukDboFQX6tyJh35ZhiTGYt1nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGdjWsSB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGdjWsSB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874624; x=1787410624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wPDvnWZ5n/ZzruRde5Pq3zT/XPnm5sbjNx2qOymBYfE=;
  b=UGdjWsSB1llhuhHGat+g/JxlSqGJUvu3dhwR2QYIqDdc1lc5VXWbxW1x
   BhoFSA9QyWbAYlMIgFZWSmTIQObR80oO/n2qhTk6lCZYy6NZRRD9hellh
   pDUgTPFw2k6STDjZZt21RTynlzyyoWWKZft9IvaJllz1ICmyyBuA8iNCL
   XV2ArU3VtDoHOrKLJwpkW9Rxj4i2NejGSdYM4dblN3REv0qnK6ZBoWYvo
   Kd6szdMT23dE4WtxxsHHzsOWv4RiQxI1/FJUzNy0ZNm+Y2MJ2sMzjjX1U
   WwonmuNDqD9oc1Ttt4lBCNc08CpnvHcQFzSJbhFbkstXJZj76+T+LAPsW
   Q==;
X-CSE-ConnectionGUID: x8Ig8qv1QYa6ip1MK8rTUA==
X-CSE-MsgGUID: f7g/hTrdQOOdsQtAqoZG7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69283122"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="69283122"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:57:03 -0700
X-CSE-ConnectionGUID: qiJ59XlaQtqa4e+Z9uM3dw==
X-CSE-MsgGUID: tW3R/pfDT4eAbXWbFFh3og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="169547004"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:56:58 -0700
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
Subject: [PATCH 05/24] PCI: Refactor find_bus_resource_of_type() logic checks
Date: Fri, 22 Aug 2025 17:55:46 +0300
Message-Id: <20250822145605.18172-6-ilpo.jarvinen@linux.intel.com>
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

The logic checks can be simplified in find_bus_resource_of_type() by
reordering them.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 4097d8703b8f..c5fc4e2825be 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -158,11 +158,15 @@ static struct resource *find_bus_resource_of_type(struct pci_bus *bus,
 	struct resource *r, *r_assigned = NULL;
 
 	pci_bus_for_each_resource(bus, r) {
-		if (r == &ioport_resource || r == &iomem_resource)
+		if (!r || r == &ioport_resource || r == &iomem_resource)
 			continue;
-		if (r && (r->flags & type_mask) == type && !r->parent)
+
+		if ((r->flags & type_mask) != type)
+			continue;
+
+		if (!r->parent)
 			return r;
-		if (r && (r->flags & type_mask) == type && !r_assigned)
+		if (!r_assigned)
 			r_assigned = r;
 	}
 	return r_assigned;
-- 
2.39.5

