From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH RESEND 0/4] m68k: earlyprintk and debug console improvements
Date: Fri, 11 Apr 2014 15:27:57 +1000
Message-ID: <20140411052757.888960081@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:54453 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751084AbaDKFcb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 11 Apr 2014 01:32:31 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@debian.org>, linux-m68k@vger.kernel.org


I'm re-sending this series with signed-off-by and tested-by attribution.

The SCC initialization patch does need testing on Atari. It can't easily
be applied without the first patch in this series, so perhaps the whole
series could be tested on Atari?

-- 
