Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37001D47C7
	for <linux-m68k@lists.linux-m68k.org>; Fri, 15 Nov 2024 15:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731684335; cv=none; b=hpfXK9bzTvHqHm9Gta74H8bWVJ9YPwT4nkkQ714BSgBcNu9ctm4xK4Hg1XQWpwN66DhPT38oqdIHkRuk5/z5l6EgpeZt5u9pu3FUCEeE2q0uLWEW0gInfbB73lJh9cg39zrCr0nzYAtcUcsEW9uH66M+QhuGubLqEaAVmpx6fbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731684335; c=relaxed/simple;
	bh=5rYKUaf2nEsuTaZGCRM6dgfAzuTpMATrxoffoQ/cwMA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eKV09F1U7rcv6HWmIcbeubJwBMyiY8UULE+5pBL/E1IW8xKjuYgX6Dq53/Z95Mw7Y80qlmd5utuZc3Hxwz697zOmzQKejfUmAHbs5vPw9CkIMI4mDNMDQPtNcWl3HVi/52utEy1uRR7LUtPM6GskbioCkG7/QVMZPY94T3KxIpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 85F575C62A0;
	Fri, 15 Nov 2024 15:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3692C4CECF;
	Fri, 15 Nov 2024 15:25:30 +0000 (UTC)
Date: Fri, 15 Nov 2024 10:25:54 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Geert Uytterhoeven
 <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH RFC 0/2] Add basic tracing support for m68k
Message-ID: <20241115102554.29232d34@gandalf.local.home>
In-Reply-To: <3a8f6faa-62c6-4d32-b544-3fb7c00730d7@yoseli.org>
References: <20241021-add-m68k-tracing-support-v1-0-0883d704525b@yoseli.org>
	<3a8f6faa-62c6-4d32-b544-3fb7c00730d7@yoseli.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 15 Nov 2024 09:26:07 +0100
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org> wrote:

> Nevertheless it sounds like a really high latency for wake_up().
> 
> I have a custom driver which basically gets an IRQ, and calls wake_up on 
> a read() call. This wake_up() on a high cpu usage can be more than 1ms ! 
> Even with a fifo/99 priority for my kernel thread !
> 
> I don't know if it rings any bell ?
> I can obviously do more tests if it can help getting down to the issue :-).

Try running timerlat.

-- Steve
