Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8B98F40
	for <linux-m68k@lists.linux-m68k.org>; Fri, 31 Jan 2025 00:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738282955; cv=none; b=XDfXMiw8UgVLLWJDKmTuNFCd1OOhCfG7zanEbLYrB9D695M/W6RbR1VzRfRV3lFJwOoY85OTfeDdBWblBrID5KWn3tXzmcJp9mtRo9taSiA+hQP8qL80Spz9PIAMy6rGq9RtdmhbOJTeyDYZAkMk5XZFzLZlm8h0w7LzJkLHWGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738282955; c=relaxed/simple;
	bh=+0gqCmX3XNKCKW4rck9Ou6ozz0RJo/+ewAmbL7uc80A=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gRIj9V6VzgO2xFnx+jSBlMT02kXVqab516DCYdbFXT/aXzJm2qffzHHPY4Mopnjkrki1RbYzSsiQPlHfBuPbJ62Vr/AexsK5I8XpCWD9X/jyqAHyIuDhrKQEuvqpVclRmHLsSQ4cZB1KnST27er/d28RCbaTZIpeStQHM//iu6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linux-foundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=f7QIIv3I; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="f7QIIv3I"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9B0FAA425FB;
	Fri, 31 Jan 2025 00:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625B7C4CED2;
	Fri, 31 Jan 2025 00:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1738282951;
	bh=+0gqCmX3XNKCKW4rck9Ou6ozz0RJo/+ewAmbL7uc80A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f7QIIv3I+QHM9mGjQv6SP2ZPQdLBF2lqmZmTN5kKs/nxgKDJs4xmYxB1j41iQZdba
	 zHCjewXX8KWilpdW4QIm9x1P/vWpPbsodazYEXfjpk2gzen1OEK6LP4/70PIRDVhJ7
	 wLZr6P3WvvMBc+jWGfK6LSKfJxmVXrwhx7VezwRc=
Date: Thu, 30 Jan 2025 16:22:30 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Sidhartha Kumar
 <sidhartha.kumar@oracle.com>, christophe.leroy@csgroup.eu,
 geert@linux-m68k.org, justinstitt@google.com, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
 llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com,
 mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org,
 ndesaulniers@google.com, npiggin@gmail.com, Matthew Wilcox
 <willy@infradead.org>, linux-mm@kvack.org
Subject: Re: [PATCH] xarray: port tests to kunit
Message-Id: <20250130162230.168530a472df1e56ba987f75@linux-foundation.org>
In-Reply-To: <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
	<07cf896e-adf8-414f-a629-a808fc26014a@oracle.com>
	<qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
	<CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Jan 2025 16:28:32 -0500 Tamir Duberstein <tamird@gmail.com> wrote:

> > How are grammar corrections going to the right person (but not the
> > mailing list) while an entire conversion to kunit is not [1]?
> 
> Very simple: the tests are not properly included in MAINTAINERS. I
> sent https://lore.kernel.org/all/20250129-xarray-test-maintainer-v1-1-482e31f30f47@gmail.com/
> a few minutes ago for this reason.

I failed to notice that this patch didn't cc linux-mm.

MAINTAINERS doesn't ask people to cc linux-mm on xarray changes.

linux-mm averages 130 messages/day - I think it's reasonable to believe
that MM developers spend a few minutes a day scanning the Subject:s.

This:

From: Andrew Morton <akpm@linux-foundation.org>
Subject: MAINTAINERS: include linux-mm for xarray maintenance
Date: Thu Jan 30 04:16:20 PM PST 2025

MM developers have an interest in the xarray code.

Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 MAINTAINERS |    1 +
 1 file changed, 1 insertion(+)

--- a/MAINTAINERS~maintainers-include-linux-mm-for-xarray-maintenance
+++ a/MAINTAINERS
@@ -25676,6 +25676,7 @@ F:	arch/x86/entry/vdso/
 XARRAY
 M:	Matthew Wilcox <willy@infradead.org>
 L:	linux-fsdevel@vger.kernel.org
+L:	linux-mm@kvack.org
 S:	Supported
 F:	Documentation/core-api/xarray.rst
 F:	include/linux/idr.h
_

