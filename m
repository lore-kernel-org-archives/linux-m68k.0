From: Finn Thain <fthain@telegraphics.com.au>
Subject: [RFC 0/2] mac68k: NuBus fixes
Date: Sat, 22 Apr 2017 21:24:16 -0400 (EDT)
Message-ID: <cover.1492910474.git.fthain@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:45226 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757048AbdDWBYR (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 22 Apr 2017 21:24:17 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Geert has agreed to merge these two patches if they receive a favorable
review. Is anyone willing to do a review?


David Huggins-Daines (1):
  nubus: Remove slot zero probe

Finn Thain (1):
  nubus: Fix pointer validation

 drivers/nubus/nubus.c | 125 +++++---------------------------------------------
 1 file changed, 11 insertions(+), 114 deletions(-)

-- 
2.10.2
