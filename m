From: <gerg@snapgear.com>
Subject: m68k: remove thread_info struct from thread struct
Date: Mon, 5 Sep 2011 14:41:48 +1000
Message-ID: <1315197709-21421-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:56269 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750864Ab1IEEk7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 5 Sep 2011 00:40:59 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org


The following patch cleans up the duplicated thread_info struct within
each task. m68knommu only used the stack based one, but m68k mostly
used the threaad_struct one. All other architectures only used the
stack based one.

Unfortunately it adds a couple of instructions into the exception
processing paths. This could be reduced a little, since the act of
calculating the current pointer (%a2) actually gets us the thread_info
pointer. I have not taken advantage of this just yet, though this patch
does take advantage of what the GET_CURRENT() macro does internally.

I have tested this on ARAnyM and it seems to work just fine. Of course
tested on ColdFire as well, no problems there.

Thoughts on this one?

Regards
Greg
