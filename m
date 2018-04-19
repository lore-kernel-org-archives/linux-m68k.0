From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v4 8/9] net-next: ax88796: release platform device drvdata on probe error and module remove
Date: Thu, 19 Apr 2018 14:05:25 +1200
Message-ID: <1524103526-12240-9-git-send-email-schmitzmic@gmail.com>
References: <1524025616-3722-1-git-send-email-schmitzmic@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1524025616-3722-1-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch, fthain@telegraphics.com.au, geert@linux-m68k.org, f.fainelli@gmail.com, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, Michael Schmitz <schmitzmic@gmail.com>
List-Id: linux-m68k@vger.kernel.org

The net device struct pointer is stored as platform device drvdata on
module probe - clear the drvdata entry on probe fail there, as well as
when unloading the module.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/ax88796.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index 229279f..2a0ddec 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -826,6 +826,7 @@ static int ax_remove(struct platform_device *pdev)
 		release_mem_region(mem->start, resource_size(mem));
 	}
 
+	platform_set_drvdata(pdev, NULL);
 	free_netdev(dev);
 
 	return 0;
@@ -959,6 +960,7 @@ static int ax_probe(struct platform_device *pdev)
 	release_mem_region(mem->start, mem_size);
 
  exit_mem:
+	platform_set_drvdata(pdev, NULL);
 	free_netdev(dev);
 
 	return ret;
-- 
1.7.0.4
