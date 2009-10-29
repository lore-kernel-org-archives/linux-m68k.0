From: Finn Thain <fthain@telegraphics.com.au>
Subject: where to get XC68040FE33 chips? was, Re: sonic ethernet and powerbook
 520
Date: Thu, 29 Oct 2009 19:10:42 +1100 (EST)
Message-ID: <alpine.OSX.2.00.0910291726140.396@silk.local>
References: <alpine.OSX.2.00.0910281848300.523@silk.local> <20091029025006.GA32242@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:43306 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752892AbZJ2IKo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 29 Oct 2009 04:10:44 -0400
In-Reply-To: <20091029025006.GA32242@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: linux-m68k@vger.kernel.org



On Wed, 28 Oct 2009, Brad Boyer wrote:

> ...
> Does the driver work if you just skip that part and program in a fixed 
> value that you know is valid?

Yes, it works fine. I'll send a patch that makes the driver read the MAC 
from the chip when there's no PROM, like NetBSD.

Unfortunately, this CPU fails my LC040 test, meaning it has the page fault 
bug... which reminds me, does anyone know where to get XC68040FE33 chips 
(without paying an arm and a leg)? I have some spare CPU boards that I 
might upgrade.

Finn
