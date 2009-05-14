From: Riccardo <riccardo@kaffe.org>
Subject: vmlinuz-2.6.29-1-11May on IIfx
Date: Thu, 14 May 2009 19:35:03 +0200
Message-ID: <8EF8D4F2-40AD-11DE-9565-00050249ADE1@kaffe.org>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cp-out9.libero.it ([212.52.84.109]:60512 "EHLO
	cp-out9.libero.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751159AbZENRfJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 14 May 2009 13:35:09 -0400
Received: from kaffe.org (151.57.116.179) by cp-out9.libero.it (8.5.107)
        id 4A0C460200026C7E for linux-m68k@vger.kernel.org; Thu, 14 May 2009 19:35:08 +0200
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi,

since I was so happy of the reults on the Q950, I tried my luck with 
the current kernel on the IIfx .

The kernel completes boot. The keyboard works; I'm able to login.
But any activity on the ethernet (remlote login or just a Ping) gives 
me:

trigger_send() called  with the transmitter busy

and after a bit


eth0: mismatched read page pointers 45 vs  c.

booting into 2.6.26 I see the driver used is the mac8390. From dmesg of 
2.6.26

[42949395.010000] mac8390.c: v0.4 2001-05-15 David Huggins-Daines 
<dhd@debian.org> and others
[42949395.030000] eth0: Memory length resource for slot A not found, 
probing
[42949395.040000] eth0: EtherNet card in slot A (type apple)
[42949395.050000] MAC 00:80:ad:13:7c:d0 IRQ 57, 32 KB shared memory at 
0xfaad0000,  32-bit access.


I hope that helps a bit,

Riccardo

