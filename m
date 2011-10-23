From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 00/16] more mac68k fixes and cleanup
Date: Mon, 24 Oct 2011 01:11:08 +1100
Message-ID: <20111023141108.856998818@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:45958 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755560Ab1JWOLP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 23 Oct 2011 10:11:15 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Hi Geert,

It would be good if this whole series passes through the m68k tree.

I based this patch series on linux-3.1-rc5 + linux-m68k +
genirq conversion v6 + three patches* already sent.

The resulting build was tested on the following hardware.

PowerBook 520, 190, 180 and 150
Quadra 700, 660av, 650
LC 630, LC III
Mac IIfx

That covers VIA, RBV, OSS, PSC, Baboon, PMU V1 and PMU V2 code.
The workload exercised all drivers simultaneously and showed no regression.

I suppose that after all of the renaming recently this series will need
to be rebased (?)
I am sending it for review anyway.

Finn

*
http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git;a=commitdiff;h=e544d704f9bea6892808e453e219aa305bc0269a
http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git;a=commitdiff;h=ce43aa6c142d69820a267431ea342d1bd9f6d3ce
http://git.kernel.org/?p=linux/kernel/git/geert/linux-m68k.git;a=commitdiff;h=5679086ffdb93ec8168b8934d8197849d26f8fb6
