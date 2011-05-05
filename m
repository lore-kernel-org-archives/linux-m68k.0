From: Mikael Pettersson <mikpe@it.uu.se>
Subject: Re: [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Thu, 5 May 2011 22:39:16 +0200
Message-ID: <19907.2804.330120.193924@pilspetsen.it.uu.se>
References: <alpine.DEB.2.00.1105042033190.9040@ayla.of.borg>
	<201105050824.34056.arnd@arndb.de>
	<alpine.DEB.2.00.1105052042590.17077@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from fanny.its.uu.se ([130.238.4.241]:59936 "EHLO fanny.its.uu.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750925Ab1EEUjT (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 5 May 2011 16:39:19 -0400
In-Reply-To: <alpine.DEB.2.00.1105052042590.17077@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux/m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, uClinux list <uclinux-dev@uclinux.org>

Geert Uytterhoeven writes:
 > On Thu, 5 May 2011, Arnd Bergmann wrote:
 > > Did you check the macros in unistd to see if they match the
 > > actual table? I guess it would be a good time to comment out
 > > the ones that are not implemented in either of the two ABIs.
 > 
 > Like this?
 > 
 > warning: #warning syscall pselect6 not implemented
 > warning: #warning syscall ppoll not implemented
 > warning: #warning syscall recvmmsg not implemented
 > 
 > Do we need pselect6 and ppoll? I have vague memories not requiring it.

They close user-space race conditions, so you want them.
