From: Emmanouel Vasilakis <evas@agn.forthnet.gr>
Subject: cirrusfb not working?
Date: Fri, 16 Jan 2009 13:16:17 +0200
Message-ID: <49706C81.7000905@agn.forthnet.gr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-7; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx-out.forthnet.gr ([193.92.150.104]:58767 "EHLO
	mx-out.forthnet.gr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755805AbZAPRv2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Jan 2009 12:51:28 -0500
Received: from mx-av-05.forthnet.gr (mx-av.forthnet.gr [193.92.150.27])
	by mx-out-03.forthnet.gr (8.14.3/8.14.3) with ESMTP id n0GBHP8g030920
	for <linux-m68k@vger.kernel.org>; Fri, 16 Jan 2009 13:17:25 +0200
Received: from MX-IN-05.forthnet.gr (mx-in-05.forthnet.gr [193.92.150.30])
	by mx-av-05.forthnet.gr (8.14.3/8.14.3) with ESMTP id n0GBGNHK029873
	for <linux-m68k@vger.kernel.org>; Fri, 16 Jan 2009 13:16:23 +0200
Received: from [212.251.99.200] (sylvester.rd.forthnet.gr [212.251.99.200])
	by MX-IN-05.forthnet.gr (8.14.3/8.14.3) with ESMTP id n0GBGHXV015704
	for <linux-m68k@vger.kernel.org>; Fri, 16 Jan 2009 13:16:18 +0200
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi,

I was trying a few days ago to boot a recent 2.6 kernel on my Amiga 3000.

 From what I found online, in order to get a framebuffer display from my 
Picasso IV, I needed to use the cirrusfb driver to the kernel which 
replaced the older clgen driver (In latest 2.6 kernels).

I tried stuff like:

amiboot -k vmlinuz video=cirrusfb:

No matter what I append to the video parameter, I can never get a 
display from the graphics card, it always comes up from the native ECS. 
Kernel messages say that a cirrusfb supported card was found. I was then 
told that cirrusfb does not work as expected, so any information on that?

What eventually worked somehow, was: video=amifb:off, which produced a 
display from the Picasso, but was full of garbage.

Thanks,
Emmanuel
