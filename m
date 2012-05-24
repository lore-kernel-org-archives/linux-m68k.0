From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: [PATCH 0/11] Atari patches for 3.4
Date: Thu, 24 May 2012 02:43:08 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1205240232410.9728@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:54280 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755195Ab2EXBnM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 23 May 2012 21:43:12 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-11.01 (built Feb 12 2010; 32bit))
 id <0M4I00N004NX2800@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Thu, 24 May 2012 02:43:09 +0200 (MEST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

Hi Geert,

a number of patches have begun piling up on my system - all but the last four 
relate to ethernet drivers and have had enough testing to be considered stable. 

The last four are for USB support through the EtherNAT ISP1160 chip, and 
especially the final two of these should be considered experimental. Best to 
give others the opportunity to test and comment. 

Cheers,

	Michael

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
schmitz@biophys.uni-duesseldorf.de
schmitz@debian.org			(Debian stuff)
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
