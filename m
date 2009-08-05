From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: m68k ptrace code
Date: Wed, 05 Aug 2009 23:12:32 +0200
Message-ID: <m24osmhsn3.fsf@igel.home>
References: <20090427191230.GA1657@lst.de> <20090427191441.GC1657@lst.de>
	<m2zldk7nzm.fsf@igel.home>
	<20090510231826.930C5FC35D@magilla.sf.frob.com>
	<m263g8gf3e.fsf@igel.home> <20090805152749.GE6476@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:46855 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751896AbZHEVMf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 5 Aug 2009 17:12:35 -0400
In-Reply-To: <20090805152749.GE6476@lst.de> (Christoph Hellwig's message of
	"Wed, 5 Aug 2009 17:27:49 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Roland McGrath <roland@redhat.com>, linux-m68k@vger.kernel.org

Christoph Hellwig <hch@lst.de> writes:

> Hi Andreas,
>
> On Mon, May 11, 2009 at 11:32:05AM +0200, Andreas Schwab wrote:
>> > Looks good to me, except you also want to nix PTRACE_KILL from your switch
>> > so the generic code handles it.  Same goes for {PEEK,POKE}{DATA,TEXT} too.
>> > Also note that you have to define a PTRACE_SINGLEBLOCK value in
>> > asm/ptrace.h (new request code in your ptrace syscall ABI) to make
>> > user_enable_block_step() get used by anything.
>> 
>> Thanks for your comments.  I have made these changes and verified with
>> the ptrace testsuite that the singleblock request works correctly.
>> There are a few failures in the testsuite, which I haven't analyzed yet,
>> but none are regressions.
>
> Any reason why this has never been commited?

Looks like Geert has a big backlog.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
