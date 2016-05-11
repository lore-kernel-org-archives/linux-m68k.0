From: "George Spelvin" <linux@horizon.com>
Subject: [RFC PATCH 0/2] Improve m68k __mulsi3
Date: 11 May 2016 06:22:48 -0400
Message-ID: <20160511102248.1447.qmail@ns.horizon.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ns.horizon.com ([71.41.210.147]:27901 "HELO ns.horizon.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751136AbcEKKc7 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 11 May 2016 06:32:59 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Cc: linux@horizon.com

As part of some other work I was doing looking at constant multiplies
on various platforms, and that led to looking a the em68k __mulsi3 code.

Which in turn led to the following microoptimizations.  Note that this
is desk-checked but UNTESTED, thus the RFC nature of the patches.

A bit of cleverness uses the available A0 and A1 registers to
save three instruction words one memory fetch, shaving 16 cycles
off the code.
