From: Mikael Pettersson <mikpelinux@gmail.com>
Subject: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Fri, 6 Jun 2014 13:38:33 +0200
Message-ID: <21393.43065.207399.530921@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:37564 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750740AbaFFLih (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 6 Jun 2014 07:38:37 -0400
Received: by mail-la0-f46.google.com with SMTP id hz20so1265720lab.5
        for <linux-m68k@vger.kernel.org>; Fri, 06 Jun 2014 04:38:36 -0700 (PDT)
Received: from cascade (h109n3-u-a31.ias.bredband.telia.com. [213.65.120.109])
        by mx.google.com with ESMTPSA id bj7sm8702605lbc.22.2014.06.06.04.38.34
        for <linux-m68k@vger.kernel.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Jun 2014 04:38:35 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Since updating my ARAnym VMs from 3.12.16 to 3.13.11 I see kswapd0
and ksoftirqd/0 consume inordinate amounts of CPU.  kswapd0 often
rises to about 30-50% CPU even though RAM shouldn't be anywhere near
depleted (768GB, a gcc bootstrap running in a screen session).
kswapd0 tends to stay this way until I drop caches, but doing that
doesn't always fix it.  I also sometimes see ksoftirqd/0 consume
5-30% CPU.

Reverting to 3.12.16 completely eliminates these problems.

I haven't tested 3.14 or 3.15-rc yet.

/Mikael
