From: Alan Hourihane <alanh@fairlite.co.uk>
Subject: Atari TT (next)
Date: Sat, 07 Jan 2012 01:27:07 +0000
Message-ID: <4F079F6B.8080502@fairlite.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from fairlite.demon.co.uk ([80.176.228.186]:58977 "EHLO
	fairlite.demon.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759061Ab2AGB1L (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 6 Jan 2012 20:27:11 -0500
Received: from localhost (unknown [127.0.0.1])
	by fairlite.demon.co.uk (Postfix) with ESMTP id 195FC222380
	for <linux-m68k@vger.kernel.org>; Sat,  7 Jan 2012 01:27:09 +0000 (UTC)
Received: from fairlite.demon.co.uk ([127.0.0.1])
	by localhost (server.demon.co.uk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WjK8WdnZv2Jb for <linux-m68k@vger.kernel.org>;
	Sat,  7 Jan 2012 01:27:08 +0000 (GMT)
Received: from [192.168.0.50] (jetpack.demon.co.uk [192.168.0.50])
	by fairlite.demon.co.uk (Postfix) with ESMTP id 0029A22221B
	for <linux-m68k@vger.kernel.org>; Sat,  7 Jan 2012 01:27:07 +0000 (GMT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

Hi all,

O.k. I'm passed the unexpected interrupt problem.

Now the next problem is that the console is all corrupted because atafb
initializes and shows this...

atafb_init: start
atafb_init: initializing TT hw
atafb: screen_base 0046e000 real_screen_base 0046e000 screen_len 311296
Determined 640x480, depth 4
  virtual 640x972

Now, that screen_base is above 4MB, and I've only got 4MB STRAM.

But there's also this further up the boot log.

Ignoring memory chunk at 0x0:0x400000 before the first chunk
Fix your bootloader or use a memfile to make use of this area!

I tried a memfile, but that just produces the same message.

I've read in some old threads about stram_swap=0 helping, but I don't
see that implemented anymore.

Alan.
