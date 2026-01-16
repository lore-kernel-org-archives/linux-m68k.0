Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B8C2F90C5
	for <linux-m68k@lists.linux-m68k.org>; Fri, 16 Jan 2026 00:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768523287; cv=none; b=V+0iqTYb4iW3FlRPYNqiVscM6M0tK/0tA7oMnjVDs8VXN6tQelu2CAz57KSh3UR+XXY1ZmvwnSDSbph6wS5+L9QGdwkRNAjz2Mgen2amL/2VjB11bEE/mHnpyDrdsbYdcTCsxPamb0JdqGnNSEFVQkZd9vrwO86AD4R0xjSb3GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768523287; c=relaxed/simple;
	bh=YV6ChD24v87T0e1S9B6uWgobgiLdIGOUGGt8/uzGG/s=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Ho7+Y4agVQCUMNaBlCuRZkwm/vHiMhr5u4sMxX1df2xM1+BBB0LPHGYC+dUMvC/7oPoNTo1zzEsv0GLuGt8fFvEyAJ3eYZ2aEzOyq5mN7A75AoMtGUBYM1GrTf0MA9fSItSLt8/i4pYz9fZ68rOMdPsIKUPyYmPv/qrPcilADJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linux-foundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=vEKoIAY6; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="vEKoIAY6"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B295644438;
	Fri, 16 Jan 2026 00:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E71C116D0;
	Fri, 16 Jan 2026 00:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768523279;
	bh=YV6ChD24v87T0e1S9B6uWgobgiLdIGOUGGt8/uzGG/s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vEKoIAY6eL4hRGcdCttIzUgXRzV5Iiurh95nHkTsQfRUJJGyvrPt17mGFK+MrgLYM
	 sKRJtzIq7qmrO1LIXaBocTkhWOusYT5KQWowJuXVqVkCdY6rjXakEfL6boM4W/7wZb
	 nEva7fgF42qfT7z+KryQ9vp9kpLzKo8pGQStcm00=
Date: Thu, 15 Jan 2026 16:27:58 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Peter Zijlstra
 <peterz@infradead.org>, Will Deacon <will@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, Mark Rutland <mark.rutland@arm.com>,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Sasha Levin <sashal@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Ard
 Biesheuvel <ardb@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v7 3/4] atomic: Add alignment check to instrumented
 atomic operations
Message-Id: <20260115162758.4d29875e8b75d8bdbb04d170@linux-foundation.org>
In-Reply-To: <740c3d41-42d8-efa8-3ff0-a2f9cc7a2c49@linux-m68k.org>
References: <cover.1768281748.git.fthain@linux-m68k.org>
	<51ebf844e006ca0de408f5d3a831e7b39d7fc31c.1768281748.git.fthain@linux-m68k.org>
	<CAMuHMdXSXcxzhgfFyc3sBdyoJ4vq9sMpzLBLcZskqtZXdAjH+g@mail.gmail.com>
	<740c3d41-42d8-efa8-3ff0-a2f9cc7a2c49@linux-m68k.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Jan 2026 14:53:33 +1100 (AEDT) Finn Thain <fthain@linux-m68k.org> wrote:

> 
> On Tue, 13 Jan 2026, Geert Uytterhoeven wrote:
> 
> > >
> > > ---
> > > Checkpatch.pl says...
> > > ERROR: Missing Signed-off-by: line by nominal patch author 'Peter Ziljstra <peterz@infradead.org>'
> > 
> > Alternatively, you can credit Peter using
> > 
> >     Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > 
> > just before the Link-header pointing to his suggestion.
> > 
> 
> I'll leave that up to Peter as he's both author and maintainer.

We have his signoff.

> If there was to be another revision, perhaps I can add --
> 
>     Suggested-by-suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>

edited and added, thanks.
