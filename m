From: <gerg@snapgear.com>
Subject: [PATCH] m68k: add support for DMA_BIDIRECTIONAL in dma support functions
Date: Tue, 10 Jul 2012 16:42:53 +1000
Message-ID: <1341902573-8430-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:22038 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752621Ab2GJGmG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 10 Jul 2012 02:42:06 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The dma cache support functions do not currently support the direction flag
DMA_BIDIRECTIONAL. If a driver passes this direction to dma_map_single or
friends you will get console output like this:

  dma_sync_single_for_device: unsupported dir 0

For example when using the Intel e100 ethernet driver on a ColdFire platform
with PCI bus. You will get a stream of these messages coming out.

Modify the dma cache support code adding support for DMA_BIDIRECTIONAL. It is
actioned by doing a cache push operation.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/dma.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
index 27b5821..e546a55 100644
--- a/arch/m68k/kernel/dma.c
+++ b/arch/m68k/kernel/dma.c
@@ -105,6 +105,7 @@ void dma_sync_single_for_device(struct device *dev, dma_addr_t handle,
 				size_t size, enum dma_data_direction dir)
 {
 	switch (dir) {
+	case DMA_BIDIRECTIONAL:
 	case DMA_TO_DEVICE:
 		cache_push(handle, size);
 		break;
-- 
1.7.0.4
