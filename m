From: Petr Stehlik <pstehlik@sophics.cz>
Subject: new ARAnyM with better FPU
Date: Tue, 20 Mar 2012 23:24:02 +0100
Message-ID: <1332282242.3352.7.camel@aspire>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx.zln.cz ([188.246.101.4]:59560 "EHLO mx.zln.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759266Ab2CTW6D (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 20 Mar 2012 18:58:03 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: debian-68k@lists.debian.org
Cc: linux-m68k@vger.kernel.org

Hello there,

I think you might be interested in the new ARAnyM release. The version
0.9.12 comes with a brand new FPU emulation core that should be precise
because it's using the libmpfr, thanks to Andreas.

Andreas also fixed CAS and CAS2 instructions that were behaving
incorrectly in some cases.

Both these fixes could help running the Linux-m68k kernel and the
Debian-68k system more stable on the ARAnyM.

I have prepared some binary packages (available for download now) and
ARAnyM Debian maintainer is working on updating the package in Debian
sid as well.

Enjoy,

Petr
