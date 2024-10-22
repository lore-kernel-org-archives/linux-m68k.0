Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E750C188918
	for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Oct 2024 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729585845; cv=none; b=T1Tts9O4ryHyqTPDJZ1QbRJ6lbB2o8GhAnuPbh0TV6qNTsdylfgNo8OXZSAiNStPzpJjxgtD5MbzzO98kXHf1yT11aGi1gIrWVSIvMKoGcDPU9WFHTB/4+HwHFZPu4nDnV85j3LtcVgcWUOKh0nmudA9c96lHc2Rhs00wSXRW/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729585845; c=relaxed/simple;
	bh=5Njuhc8rhJkQU9CTHRevd6sR9bgN0vMxuEgrmVe3riY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=emfq8o6/1Tzddu2Ew3TGxIz9a6OMMVdoO1fPP8/n6L9D4D/FnSJ8+/a95zHwpjpsb4hcvLukeyvw/BalGfNgF3W6nFzfC+/18y4/I1qv6c8bySpk7/8Bh27MdBjdm2OazZ3df1qBQfOALwyHaEUJJ1dqfHgXYQzWc66JjDhg/7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 82FE35C5CA8;
	Tue, 22 Oct 2024 08:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144FCC4CEC3;
	Tue, 22 Oct 2024 08:30:40 +0000 (UTC)
Date: Tue, 22 Oct 2024 04:30:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] m68k: Add tracirqs
Message-ID: <20241022043037.13efb239@rorschach.local.home>
In-Reply-To: <075d6720-a690-437c-a10f-e2746651e2a8@yoseli.org>
References: <20241021-add-m68k-tracing-support-v1-0-0883d704525b@yoseli.org>
	<20241021-add-m68k-tracing-support-v1-1-0883d704525b@yoseli.org>
	<20241022012809.1ef083cd@rorschach.local.home>
	<075d6720-a690-437c-a10f-e2746651e2a8@yoseli.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Oct 2024 07:42:10 +0200
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org> wrote:

> > This part of the patch shouldn't be needed because those shoudl be
> > called by irq_enter() and irq_exit(). Does this not work if you don't
> > have these?  
> 
> Thanks for your quick review !

\o/

> Indeed, it works without those lines, so the patch is now a one-liner 
> :-). I will wait for the second part to be reviewed before sending v2.

I don't know enough about m68k to review that patch. Just incase you
were expecting me to review it.

-- Steve
