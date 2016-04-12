From: Greg Ungerer <gerg@uclinux.org>
Subject: [git pull] m68knommu/coldfire fixes
Date: Wed, 13 Apr 2016 09:53:44 +1000
Message-ID: <570D8A88.7030900@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:51912
	"EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965006AbcDLXxZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 12 Apr 2016 19:53:25 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Linus,

Can you please pull the m68knommu git tree, for-linus branch.
Only a single change that removes a local arch specific gpio bus sysfs
device that now clashes with the generic gpio bus sysfs device interface.

Regards
Greg



The following changes since commit bf16200689118d19de1b8d2a3c314fc21f5dc7bb:

  Linux 4.6-rc3 (2016-04-10 17:58:30 -0700) 

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

for you to fetch changes up to 2763ee644809820fb1b741f1e7dd779038092324:

  m68k/gpio: remove arch specific sysfs bus device (2016-04-11 12:03:18 +1000)

----------------------------------------------------------------
Greg Ungerer (1):
      m68k/gpio: remove arch specific sysfs bus device

 arch/m68k/coldfire/gpio.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)
