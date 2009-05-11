From: Riccardo <riccardo@kaffe.org>
Subject: current 2.6 on Q950
Date: Mon, 11 May 2009 23:14:41 +0200
Message-ID: <BE30877A-3E70-11DE-B44C-00050249ADE1@kaffe.org>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cp-out12.libero.it ([212.52.84.112]:44507 "EHLO
	cp-out12.libero.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751889AbZEKVUh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 11 May 2009 17:20:37 -0400
Received: from kaffe.org (151.57.78.111) by cp-out12.libero.it (8.5.107)
        id 49F9A51200BBCB3D for linux-m68k@vger.kernel.org; Mon, 11 May 2009 23:14:45 +0200
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi all,


after several weeks/months I grabbed a kernel from here


http://people.debian.org/~smarenka/d-i/m68k/images/daily/kernels/

and slapped it on my quadra 950.

Some good news: it boots!

And it hasn't crashed the past 2 hours of moderate use.

Now what is new? Can I test that soemthign was added/fixed? I noticed 
that the clock is still wrong and that hard disk performance is still 
bad. I read there was some activity on the floppy driver, does it work 
on the Q950?


I read:
[42949381.240000] Driver 'sd' needs updating - please use bus_type 
methods
[42949381.330000] sd 0:0:0:0: [sda] 2055035 512-byte hardware sectors: 
(1.05 GB/1003 MiB)
[42949381.350000] sd 0:0:0:0: [sda] Write Protect is off
[42949381.360000] sd 0:0:0:0: [sda] Mode Sense: a3 00 10 08
[42949381.370000] sd 0:0:0:0: [sda] Write cache: enabled, read cache: 
enabled, supports DPO and FUA
[42949381.380000] sd 0:0:0:0: [sda] 2055035 512-byte hardware sectors: 
(1.05 GB/1003 MiB)
[42949381.400000] sd 0:0:0:0: [sda] Write Protect is off
[42949381.410000] sd 0:0:0:0: [sda] Mode Sense: a3 00 10 08
[42949381.420000] sd 0:0:0:0: [sda] Write cache: enabled, read cache: 
enabled, supports DPO and FUA
[42949381.430000]  sda: [mac] sda1 sda2 sda3 sda4 sda5 sda6

driver needs updating ?

bye,
   Riccardo

