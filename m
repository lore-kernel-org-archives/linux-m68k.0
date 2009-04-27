From: Christoph Hellwig <hch@lst.de>
Subject: m68k ptrace code
Date: Mon, 27 Apr 2009 21:14:41 +0200
Message-ID: <20090427191441.GC1657@lst.de>
References: <20090427191230.GA1657@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.210]:33614 "EHLO verein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759782AbZD0TPW (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 27 Apr 2009 15:15:22 -0400
Content-Disposition: inline
In-Reply-To: <20090427191230.GA1657@lst.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: roland@redhat.com


Hi Geert, Roman and other m68k hackers,

we're trying to get all architectures converted to the new ptrace world
order where a lot more code is in the common kernel/ptrace.c file
instead of in the architecture and the boundaries are much cleaner.
Can you take a look at

	http://sourceware.org/systemtap/wiki/utrace/arch/HowTo

and see how feasible it is to convert m68k?

Cheers,
	Christoph
