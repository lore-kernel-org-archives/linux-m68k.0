From: David Rientjes <rientjes@google.com>
Subject: [patch] m68k, mm: set all online nodes in N_NORMAL_MEMORY
Date: Thu, 21 Apr 2011 15:02:49 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1104211501470.20201@chino.kir.corp.google.com>
References: <1303317178.2587.30.camel@mulgrave.site> <alpine.DEB.2.00.1104201410350.31768@chino.kir.corp.google.com> <20110421220351.9180.A69D9226@jp.fujitsu.com> <alpine.DEB.2.00.1104211237250.5829@chino.kir.corp.google.com> <alpine.DEB.2.00.1104211500170.5741@router.home>
 <alpine.DEB.2.00.1104211411540.20201@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp-out.google.com ([74.125.121.67]:34147 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754564Ab1DUWCz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 21 Apr 2011 18:02:55 -0400
Received: from kpbe14.cbf.corp.google.com (kpbe14.cbf.corp.google.com [172.25.105.78])
	by smtp-out.google.com with ESMTP id p3LM2r2c026109
	for <linux-m68k@vger.kernel.org>; Thu, 21 Apr 2011 15:02:53 -0700
In-Reply-To: <alpine.DEB.2.00.1104211411540.20201@chino.kir.corp.google.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Roman Zippel <zippel@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

For m68k, N_NORMAL_MEMORY represents all nodes that have present memory 
since it does not support HIGHMEM.  This patch sets the bit at the time 
the node is brought online.

If N_NORMAL_MEMORY is not accurate, slub may encounter errors since it 
uses this nodemask to setup per-cache kmem_cache_node data structures.

Signed-off-by: David Rientjes <rientjes@google.com>
---
 arch/m68k/mm/init_mm.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/mm/init_mm.c b/arch/m68k/mm/init_mm.c
--- a/arch/m68k/mm/init_mm.c
+++ b/arch/m68k/mm/init_mm.c
@@ -59,6 +59,8 @@ void __init m68k_setup_node(int node)
 	}
 #endif
 	pg_data_map[node].bdata = bootmem_node_data + node;
+	if (node_present_pages(node))
+		node_set_state(node, N_NORMAL_MEMORY);
 	node_set_online(node);
 }
 
