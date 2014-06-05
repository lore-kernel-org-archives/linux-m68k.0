From: Amos Kong <akong@redhat.com>
Subject: [PATCH 0/2] trivial cleanup
Date: Thu,  5 Jun 2014 11:01:20 +0800
Message-ID: <1401937282-18345-1-git-send-email-akong@redhat.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:64949 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751139AbaFEDBb (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 4 Jun 2014 23:01:31 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, netdev@vger.kernel.org, davem@davemloft.net, schwab@linux-m68k.org

I found the RAM size in comments isn't correct,
fix it.

Amos Kong (2):
  mvme147: fix ram size in comment
  hplance: fix ram size in comment

 drivers/net/ethernet/amd/hplance.c | 4 ++--
 drivers/net/ethernet/amd/mvme147.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.9.3
