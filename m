From: "David Laight" <David.Laight@ACULAB.COM>
Subject: RE: [PATCH 01/16] pmac_zilog: fix unexpected irq
Date: Thu, 24 Nov 2011 15:28:38 -0000
Message-ID: <AE90C24D6B3A694183C094C60CF0A2F6D8AEE1@saturn3.aculab.com>
References: <alpine.LNX.2.00.1111250133321.6314@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx0.aculab.com ([213.249.233.131]:59571 "HELO mx0.aculab.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1754126Ab1KXPad convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Nov 2011 10:30:33 -0500
Received: from mx0.aculab.com ([127.0.0.1])
 by localhost (mx0.aculab.com [127.0.0.1]) (amavisd-new, port 10024) with SMTP
 id 27186-04 for <linux-m68k@vger.kernel.org>;
 Thu, 24 Nov 2011 15:30:30 +0000 (GMT)
Content-class: urn:content-classes:message
In-Reply-To: <alpine.LNX.2.00.1111250133321.6314@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org

 
> On most 68k Macs the SCC IRQ is an autovector interrupt and cannot be 
> masked. This can be a problem when pmac_zilog starts up.

Wouldn't this also happen if the interrupt were shared?
Hopefully nothing vaguely modern uses the borked Zilog 8530 SCC
(which I presume is the part in question - brings back
too many nightmares....)

	David
