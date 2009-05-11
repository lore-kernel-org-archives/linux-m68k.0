From: Lance Tagliapietra <lancetag@Luminet.net>
Subject: eliminate -pipe from kernel compile
Date: Sun, 10 May 2009 20:58:33 -0500
Message-ID: <20090511015831.GB15777@luminet.net>
Reply-To: lancetag@luminet.net
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from spamtitan.hbci.com ([206.230.105.6]:56079 "EHLO
	spamtitan.hbci.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753237AbZEKCT0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 May 2009 22:19:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by spamtitan.hbci.com (Postfix) with ESMTP id 1341EA192EB
	for <linux-m68k@vger.kernel.org>; Sun, 10 May 2009 21:19:27 -0500 (CDT)
Received: from mail.hbci.com (ultra.hbci.com [206.230.105.5])
	by spamtitan.hbci.com (Postfix) with ESMTP id 90D7DA192B4
	for <linux-m68k@vger.kernel.org>; Sun, 10 May 2009 21:19:25 -0500 (CDT)
Received: from tag1amiga.luminet.net (unknown [64.213.220.3])
	by mail.hbci.com (Postfix) with ESMTP id 853982780C8
	for <linux-m68k@vger.kernel.org>; Sun, 10 May 2009 21:19:26 -0500 (CDT)
Received: from lancetag by tag1amiga.luminet.net with local (Exim 3.36 #1 (Debian))
	id 1M3Kmv-0004AS-00
	for <linux-m68k@vger.kernel.org>; Sun, 10 May 2009 20:58:41 -0500
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hello,

I was noticing that kernel compiling is set up to have gcc pipe data from one pass to another, instead of using 
temporary files.  On a memory constrained environment, this may not be the best idea (or at least I'd like to
explore that idea).  Instead of loading the assember, and having immediately being swapped out while the cc1 pass 
runs, it may make more sense to have the temp files being written, instead of the swap in and out, when compiling 
the various objects of the kernel.

So, simply pulling out the -pipe from the compiler flag list didn't see to have the desired effect.  I'm afraid I'm 
still missing something.  I'm still observing the assembler being loaded.

Thoughts?

Thanks,

--Lance




