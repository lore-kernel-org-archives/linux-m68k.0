From: Greg Ungerer <gerg@uclinux.org>
Subject: [git pull] m68knommu/coldfire fixes for 4.5
Date: Tue, 12 Jan 2016 10:12:00 +1000
Message-ID: <569444D0.1030701@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out5.external.iinet.net.au ([203.59.1.221]:26676
	"EHLO icp-osb-irony-out5.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759851AbcALAMI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Mon, 11 Jan 2016 19:12:08 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Linus,

Can you please pull the m68knommu git tree, for-next branch.
Only a single change, limiting the return values for coldfire gpio
get function.

Regards
Greg



The following changes since commit 168309855a7d1e16db751e9c647119fe2d2dc878:

   Linux 4.4-rc8 (2016-01-03 15:15:37 -0800)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to 4693c2493a9b2d0c5d407496ea107676a690f1c0:

   m68k: coldfire/gpio: Be sure to clamp return value (2016-01-04 
13:25:12 +1000)

----------------------------------------------------------------
Linus Walleij (1):
       m68k: coldfire/gpio: Be sure to clamp return value

  arch/m68k/coldfire/gpio.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
