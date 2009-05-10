From: Roland McGrath <roland@redhat.com>
Subject: Re: m68k ptrace code
Date: Sun, 10 May 2009 16:18:26 -0700 (PDT)
Message-ID: <20090510231826.930C5FC35D@magilla.sf.frob.com>
References: <20090427191230.GA1657@lst.de>
	<20090427191441.GC1657@lst.de>
	<m2zldk7nzm.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:57328 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751452AbZEJXSr (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 10 May 2009 19:18:47 -0400
In-Reply-To: Andreas Schwab's message of  Sunday, 10 May 2009 21:32:29 +0200 <m2zldk7nzm.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Christoph Hellwig <hch@lst.de>, linux-m68k@vger.kernel.org

Looks good to me, except you also want to nix PTRACE_KILL from your switch
so the generic code handles it.  Same goes for {PEEK,POKE}{DATA,TEXT} too.
Also note that you have to define a PTRACE_SINGLEBLOCK value in
asm/ptrace.h (new request code in your ptrace syscall ABI) to make
user_enable_block_step() get used by anything.


Thanks,
Roland
