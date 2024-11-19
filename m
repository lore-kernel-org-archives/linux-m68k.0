Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60221CF5FF
	for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Nov 2024 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732029965; cv=none; b=QP163+0OtMlTSYei1zLK8JR9ly/bWzjhp1ShcCNZENFE4i6ILwBC1Nu/0rMlU2bjHMKc8phG8cNuAEOoBuXwA8jCFinjBIlrIKuKcYqM9F1A3kpfWWQ4fb4Bl3ldU9OtQbjPZPGAy4NYXmiy2csW/SuROnCC8F9Xfmx/aHEsMSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732029965; c=relaxed/simple;
	bh=rhuMipy5eUn7kq6F0Kj2GQrTkKVy0Juy1GFirjisNpw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zw/9X7dvhDH8dveZzpNJ1vyfEzM0tmSg6SxYqJYhY3Jhtp9tXKkGg7af4i5ne6rZr3xMYVMxQj7hDAP0Ml2sUoeYLqFj1O97RB7RHjbcq5vLUHHMH1I3QQjUKMX3mY9lwYS3MJ0MBfQ/PzcvY28mjmIXY6oLEpuW9O0EMi3QMPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 57A55A42B80;
	Tue, 19 Nov 2024 15:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93893C4CECF;
	Tue, 19 Nov 2024 15:26:00 +0000 (UTC)
Date: Tue, 19 Nov 2024 10:26:31 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Geert Uytterhoeven
 <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, Tomas Glozar
 <tglozar@redhat.com>
Subject: Re: [PATCH RFC 0/2] Add basic tracing support for m68k
Message-ID: <20241119102631.76363f2a@gandalf.local.home>
In-Reply-To: <22856ed6-b9d0-4206-b88d-4226534c8675@yoseli.org>
References: <20241021-add-m68k-tracing-support-v1-0-0883d704525b@yoseli.org>
	<3a8f6faa-62c6-4d32-b544-3fb7c00730d7@yoseli.org>
	<20241115102554.29232d34@gandalf.local.home>
	<cbb67ee2-8b37-4a4d-b542-f89ddae90e94@yoseli.org>
	<20241115145502.631c9a2c@gandalf.local.home>
	<2c43288a-517d-4220-ad31-f84dda8c1805@yoseli.org>
	<20241118152057.13042840@gandalf.local.home>
	<22856ed6-b9d0-4206-b88d-4226534c8675@yoseli.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 19 Nov 2024 15:24:00 +0100
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org> wrote:

> Indeed printf gave me clues !
> It appears to be a bug in libtracefs (v1.8.1). rtla segfaults when 
> calling tracefs_local_events() in trace_instance_init().
> 
> Debugging libtracefs pointed me to the load_events() function, and the 
> segfault happens after tep_parse_event() is called for 
> "/sys/kernel/debug/tracing/events/vmscan/mm_vmscan_write_folio/format".
> 
> Going through the calls I get to event_read_print_args().
> I changed libtraceevent log level to get the warnings, and it says:
> libtraceevent: Resource temporarily unavailable
>    unknown op '.'
> Segmentation fault

Can you do me a favor and send me privately a tarball of:

 # cp -r /sys/kernel/tracing/events /tmp/events
 # cd /tmp
 # tar -cvjf events.tar.bz2 events

You can't call tar on the /sys/kernel/tracing files as those are pseudo
files with size of zero, and tar will just record empty files :-p

-- Steve
