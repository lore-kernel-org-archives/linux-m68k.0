Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEFC17ADE9
	for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Oct 2024 08:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729673239; cv=none; b=pjQKRH0D3AY7pYE9wHKVBLFjWGobGhNzXULokBEnn/fwaDiporVdGEIUxDsNB8dC8u7iIdXGn1LRtWF4dEJCX5dseXk+Aknv33NlqAOCdbbu6PqiRL6lyRDnWvU5Yro04udTR/FV6AKhUroSipJNyS8CB6cpu4w7uH5Q9aLV1Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729673239; c=relaxed/simple;
	bh=jE+psI9L5oywH/YvfvyfipOHf6eGhY0aBTmDvQ6Tfrc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SNsXMMQLzdzam8XDijQfoRaRjJVQdpjveTdou6pclo3jrpU2x8lgjsUYdzjG9Tmk0dtAOYEiimv/Ot2cEnD4KUvl4fi1/5uEmaAU58lOl3Dwmx25tgcrUcq8wEtIQCUm9LKRtzNYvF5vQNrS1ZdwOfYTB1Jhs2vtTC68MB4DI+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1123CA44BFA;
	Wed, 23 Oct 2024 08:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAA2C4CEC6;
	Wed, 23 Oct 2024 08:47:14 +0000 (UTC)
Date: Wed, 23 Oct 2024 04:47:11 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] m68k: Add tracirqs
Message-ID: <20241023044711.3eb838fe@rorschach.local.home>
In-Reply-To: <2c79be22-1157-41e4-9f3a-53443112ca9a@yoseli.org>
References: <20241021-add-m68k-tracing-support-v1-0-0883d704525b@yoseli.org>
	<20241021-add-m68k-tracing-support-v1-1-0883d704525b@yoseli.org>
	<20241022012809.1ef083cd@rorschach.local.home>
	<075d6720-a690-437c-a10f-e2746651e2a8@yoseli.org>
	<20241022043037.13efb239@rorschach.local.home>
	<2c79be22-1157-41e4-9f3a-53443112ca9a@yoseli.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Oct 2024 11:21:34 +0200
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org> wrote:

> 
> I was not really expecting you to review the m68k one no :-).
> I think I have other issues which might have impact on ftrace too.
> For instance, when I launch cyclictest I have a warning about HRTIMERS:
> # cyclictest -p 99
> WARN: stat /dev/cpu_dma_latency failed: No such file or directory
> WARN: High resolution timers not available
> policy: fifo: loadavg: 1.21 0.40 0.14 1/122 245
> 
> T: 0 (  245) P:99 I:1000 C:  11203 Min:     92 Act:  623 Avg:  775 Max: 
>    3516
> 
> The latencies are quite high...

Yes, if you don't have high resolution timers, the latency will be high.

> 
> But regarding ftrace it seems that the trace is not able to give me more 
> than a microsecond precision. I addded a few trace_printk() in a driver 
> of mine and I get:
>   irq/182-dspi-sl-112     [000] D....   277.160000: dspi_interrupt: 
> Received 2 bytes
>   irq/182-dspi-sl-112     [000] D....   277.160000: dspi_interrupt: 
> Received 2 bytes
>   irq/182-dspi-sl-112     [000] D....   277.163000: dspi_interrupt: 
> dspi_interrupt
>   irq/182-dspi-sl-112     [000] D....   277.163000: dspi_interrupt: TX 
> FIFO overflow
>   irq/182-dspi-sl-112     [000] D....   277.163000: dspi_interrupt: 
> Restart FIFO
> 
> Do you have any clue ?

Yes. The ring buffer clock is dependent on the architecture's clock. By
default, it uses whatever the scheduler clock uses. If the scheduler
clock is 1ms resolution, so will the tracing data be.

-- Steve

