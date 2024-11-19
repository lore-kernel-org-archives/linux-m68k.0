Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6A41D0E0A
	for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Nov 2024 16:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732033701; cv=none; b=Q4sLLniiwShTL9G7vpDsXN2DMbGtdVf4yPjGPaykGPWL6nXMkB1ldSnEsK4EdWP2Ot6tCCH6SqNXEsv7ATOlu4o956bu1RPkPGiMDCQ6ZSje94+1ipFioNh5fcwS8BDiYk6s0+FHPB5hpYzxDBL8qe8ahHcAFuX2Kog7cJ992Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732033701; c=relaxed/simple;
	bh=7AiN7C9rSciZFzuI2C0MhdiS8jvBluuatf3HrOrbI8g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g0X4+Qa5Fxmlbd0aEXofwi6QHjeccM4cxw6v+lIVdYBsCFGMppVRa2V4J/tM1oHTJavIZxHF6mdI5ZZ/pWg+au/TVQQQ8Qcs8qoHc3CcmeUgp72CIs0dRzsvwxP7CkQ3s1vBXEF2gYHRqlDEwQPYnx9VtnE8i0KU9mEcsM5ncpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 98D03A41343;
	Tue, 19 Nov 2024 16:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10D9C4CECF;
	Tue, 19 Nov 2024 16:28:16 +0000 (UTC)
Date: Tue, 19 Nov 2024 11:28:50 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Geert Uytterhoeven
 <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, Tomas Glozar
 <tglozar@redhat.com>
Subject: Re: [PATCH RFC 0/2] Add basic tracing support for m68k
Message-ID: <20241119112850.219834f5@gandalf.local.home>
In-Reply-To: <20241119102631.76363f2a@gandalf.local.home>
References: <20241021-add-m68k-tracing-support-v1-0-0883d704525b@yoseli.org>
	<3a8f6faa-62c6-4d32-b544-3fb7c00730d7@yoseli.org>
	<20241115102554.29232d34@gandalf.local.home>
	<cbb67ee2-8b37-4a4d-b542-f89ddae90e94@yoseli.org>
	<20241115145502.631c9a2c@gandalf.local.home>
	<2c43288a-517d-4220-ad31-f84dda8c1805@yoseli.org>
	<20241118152057.13042840@gandalf.local.home>
	<22856ed6-b9d0-4206-b88d-4226534c8675@yoseli.org>
	<20241119102631.76363f2a@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 19 Nov 2024 10:26:31 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> Can you do me a favor and send me privately a tarball of:
> 
>  # cp -r /sys/kernel/tracing/events /tmp/events
>  # cd /tmp
>  # tar -cvjf events.tar.bz2 events
> 
> You can't call tar on the /sys/kernel/tracing files as those are pseudo
> files with size of zero, and tar will just record empty files :-p

It crashes on parsing this:

name: mm_vmscan_write_folio
ID: 198
format:
	field:unsigned short common_type;	offset:0;	size:2;	signed:0;
	field:unsigned char common_flags;	offset:2;	size:1;	signed:0;
	field:unsigned char common_preempt_count;	offset:3;	size:1;	signed:0;
	field:int common_pid;	offset:4;	size:4;	signed:1;

	field:unsigned long pfn;	offset:8;	size:4;	signed:0;
	field:int reclaim_flags;	offset:12;	size:4;	signed:1;

print fmt: "page=%p pfn=0x%lx flags=%s", (mem_map + ((REC->pfn) - (m68k_memory[0].addr >> 13))), REC->pfn, (REC->reclaim_flags) ? __print_flags(REC->reclaim_flags, "|", {0x0001u, "RECLAIM_WB_ANON"}, {0x0002u, "RECLAIM_WB_FILE"}, {0x0010u, "RECLAIM_WB_MIXED"}, {0x0004u, "RECLAIM_WB_SYNC"}, {0x0008u, "RECLAIM_WB_ASYNC"} ) : "RECLAIM_WB_NONE"


It shouldn't crash, but it also found a bug in your code ;-)

You reference two variables that are not part of the event:

 "mem_map" and "m68k_memory[0].addr"

Do these variables ever change? Because the TP_printk() part of the
TRACE_EVENT() macro is called a long time after the event is recorded. It
could be seconds, minutes, days or even months (and unlikely possibly
years) later.

The event takes place and runs the TP_fast_assign() to record the event in
the ring buffer. Then some time later, when you read the "trace" file, the
TP_printk() portion gets run. If you wait months before reading that, it is
executed months later.

Now you have "mem_map" and "m68k_memory[0].addr" in that output that gets
run months after the fact. Are they constant throughout the boot?

Now another issue is that user space has no idea what those values are. Now
user space can not print the values. Currently the code crashes because you
are the first one to reference a global value from a trace event print fmt.
That should probably be fixed to simply fail to parse the event and ignore
the print format logic (which defaults to just printing the raw fields).

-- Steve

