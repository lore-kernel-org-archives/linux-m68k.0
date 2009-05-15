From: Lance Tagliapietra <lancetag@Luminet.net>
Subject: m68k 2.6.29.1 performance (race in MSG_PEEK)
Date: Fri, 15 May 2009 16:06:51 -0500
Message-ID: <20090515210650.GD1529@luminet.net>
Reply-To: lancetag@luminet.net
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from spamtitan.hbci.com ([206.230.105.6]:59986 "EHLO
	spamtitan.hbci.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751740AbZEOU7Q (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 15 May 2009 16:59:16 -0400
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

All,

By freeing up memory and removing kernel features that I don't need I have managed
to get m68k 2.6.29.1 to throw the following kernel message (first observed in my dmesg):

TCP(fetchmail:5006): Application bug, race in MSG_PEEK

A bit of research showed that it is a known issue:

http://www.mail-archive.com/debian-bugs-dist@lists.debian.org/msg609407.html

I had never seen this race condition under m68k Linux (implying a performance 
improvement was gained)!

--Lance
