Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA713148B9
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Sep 2025 11:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757505443; cv=none; b=CDXJ/Tq5zx4RoAN/1j4YtTNy3omlf1O1yNJnkpfHy9pfsWdCpdyS5aA0uJCFN+u+8i8ORXo9QNSTIeGtwZODJYAmQ/bKTZMYAoKjMhJo3aY4i/UvksBzlahC09mXT08xqJHSBxM1/VIVnKAIwhDaL5gGHambAxa55UYh5W+QRmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757505443; c=relaxed/simple;
	bh=qpiVJjWEyw0flVEUf2pEXKX4Ry0xXatYYHCE5Flni1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTpX+IlkdRf+ZfencjGlCCj2YWnovd9mwKaKUwJpT6/V2wdEnImSnV62tCklo0cHR/jD71cYkmhiGJC2bQ0orhsR/ocPezgOX1otrFC3QY0FN6DFZj4xaMjKclKOKbgTwMWiyAEJ//OKvkPfltoY+c9lKu7oFBBNrx9qDYQRfYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NxH5+lKL; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NxH5+lKL"
Date: Wed, 10 Sep 2025 07:57:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757505429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uA3jzP0gvgqj8vfQCUNaxIEfEE9Vd+4Ci6oFMhsFfFI=;
	b=NxH5+lKL7ChnYpL8vxoi0rJPUz6nTSQFO3OTIBCYeiUuuJR1NWN/zTS8pF4hqP5ZnlalOr
	f78Z+8Mh7l6f7JhQwZVjrpAQp3RlRBZXmFMtlnMQbvcCL9AWxe5qfuwlL7FkAWWFa08m8O
	jUpIofExq0THR8tHQ7Lxnr8s0F87e34=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Lance Yang <lance.yang@linux.dev>, 
	akpm@linux-foundation.org, amaindex@outlook.com, anna.schumaker@oracle.com, 
	boqun.feng@gmail.com, ioworker0@gmail.com, joel.granados@kernel.org, 
	jstultz@google.com, leonylgao@tencent.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, longman@redhat.com, mhiramat@kernel.org, mingo@redhat.com, 
	mingzhe.yang@ly.com, oak@helsinkinet.fi, peterz@infradead.org, rostedt@goodmis.org, 
	senozhatsky@chromium.org, tfiga@chromium.org, will@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/1] hung_task: fix warnings caused by unaligned lock
 pointers
Message-ID: <inscijwnnydibdwwrkggvgxjtimajr5haixff77dbd7cxvvwc7@2t7l7oegsxcp>
References: <20250909145243.17119-1-lance.yang@linux.dev>
 <yqjkjxg25gh4bdtftsdngj5suturft2b4hjbfxwe6hehbg4ctq@6i55py3jaiov>
 <99410857-0e72-23e4-c60f-dea96427b85a@linux-m68k.org>
 <CAMuHMdVYiSLOk-zVopXV8i7OZdO7PAK7stZSJNJDMw=ZEqtktA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVYiSLOk-zVopXV8i7OZdO7PAK7stZSJNJDMw=ZEqtktA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Sep 10, 2025 at 09:36:34AM +0200, Geert Uytterhoeven wrote:
> On Wed, 10 Sept 2025 at 02:07, Finn Thain <fthain@linux-m68k.org> wrote:
> > On Tue, 9 Sep 2025, Kent Overstreet wrote:
> > > On Tue, Sep 09, 2025 at 10:52:43PM +0800, Lance Yang wrote:
> > > > From: Lance Yang <lance.yang@linux.dev>
> > > >
> > > > The blocker tracking mechanism assumes that lock pointers are at least
> > > > 4-byte aligned to use their lower bits for type encoding.
> > > >
> > > > However, as reported by Eero Tamminen, some architectures like m68k
> > > > only guarantee 2-byte alignment of 32-bit values. This breaks the
> > > > assumption and causes two related WARN_ON_ONCE checks to trigger.
> > >
> > > Isn't m68k the only architecture that's weird like this?
> >
> > No. Historically, Linux/CRIS did not naturally align integer types either.
> > AFAIK, there's no standard that demands natural alignment of integer
> > types. Linux ABIs differ significantly.
> >
> > For example, Linux/i386 does not naturally align long longs. Therefore,
> > x86 may be expected to become the next m68k (or CRIS) unless such
> > assumptions are avoided and alignment requirements are made explicit.
> >
> > The real problem here is the algorithm. Some under-resourced distros
> > choose to blame the ABI instead of the algorithm, because in doing so,
> > they are freed from having to work to improve upstream code bases.
> >
> > IMHO, good C doesn't make alignment assumptions, because that hinders
> > source code portability and reuse, as well as algorithm extensibility.
> > We've seen it before. The issue here [1] is no different from the pointer
> > abuse which we fixed in Cpython [2].
> >
> > Linux is probably the only non-trivial program that could be feasibly
> > rebuilt with -malign-int without ill effect (i.e. without breaking
> > userland) but that sort of workaround would not address the root cause
> > (i.e. algorithms with bad assumptions).
> 
> The first step to preserve compatibility with userland would be to
> properly annotate the few uapi definitions that would change with
> -malign-int otherwise.  I am still waiting for these patches...

I think it'd need a new gcc attribute to do it sanely...
