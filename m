Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C0E4C4F7D
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 16:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488173; cv=none; b=ajTyf/BIUtz2t+3JHIJMeSqZNn7BTg8fxoBbe21GFlatlDcq2rv/yZnJUEQOYM/iqeTMfudkyBDg6V5zXFeMjs7kQgHciR5oJScqQPps+fTyaQnW49ZPt0rDu2DH6UKMQuMuDFgBA1Ebfw5au6xh8Sqmv1DcQI6r5Dgt90Tv7F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488173; c=relaxed/simple;
	bh=TaD3IKHcoZf0PQ+wUUh3mHvOgYZf6uXYuUZRFHNcE+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQ8TgDXGal2I/32dEWR4T4Nua0yI1MhcYsqUelFSQuBo63IVDRp6rXZ182yuDwXs1r9ZAV1PNTHTwr+PtnckffOctOXUKwIirV/TNq83v5m1VQTYA4W5ycKtqx4zh4ajcMr6emjSDUW5JjrhvWleZXM5R86zteoSxsIbS0u9LXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LKxFFruc; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LKxFFruc"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99cd5115bso5799088a12.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 09:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789488168; x=1790092968; darn=lists.linux-m68k.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=LKxFFrucg2wOC3rfOqHSJLhHifoiGVsx6woXoLYl31aVLlUxAzi4lwNACQA5BaFgpF
         xkqvWz6THx+DZnU+tFR7jON/mOcminTnexaquC3yorTpZAHlBhmaNr1Lo8P09RNSg2Au
         ggLkMwJztydM1EZCNPJ7Ql7XG2U0BwD33U+zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488168; x=1790092968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=mUng/B3gYG8Ecp0WSLC1RoZqZTvOm4shWiYWYACUTSCFDua6T/0hK/IB4k642Wd/jU
         hWokhQjDKG42X5qjKaOI2yg6N1789LtsSaZNAbIocKRuEbo8Bu764rNkrfGofgyc9jCC
         PY2FtvYXD9j2PAqva2qunGB+k9spywBdsUxZfSk4mBZl5Rf6PliXIJg0NQSIHgzNNcKu
         brLjLRnGWMGuNXdSEkE1fCZcczaH3AdZqHb4FFHabcePTzx8bABh1uEcGc57SrMEue5l
         /Aq3p+rFWzyb1l/4goYAkpO4WhMhxoKK1+slvrEW3oY/VSqq4xhlOJwJYWEvbVfGVM9T
         +bVQ==
X-Forwarded-Encrypted: i=1; AKwUvBybzDtmMycC0f03zWQdfqQXdYppYcdYpHj6WbWCZG7VMRevobLpemcsJp30xWliXHQSq5tuGDoLBoLn@lists.linux-m68k.org
X-Gm-Message-State: AFuF++m0se68K9o5hYBsvCE//oAnMMEAyDZPq4ljkB2jRmoRKDRCOH9m
	m2fCOuM+qE24oIk4N01m9OuiaFcjRGBO9CFckSLBkv1qsTOiEQ1DQHXGPOGQBOVOQSECfKz0XX8
	FLgJXDi4=
X-Gm-Gg: AYBFou0yKvbo3jWicmx5yhKM3pBebGc7/HmoS6yjz2r8vLncfMiC+Ex5GNrSth94szb
	QGNJW69IAUEb5czPI0buRBek6AABvh6NxjYnDz2jHF6djamayZXeZ02hg6UDz0vCFvwPWpYWPnt
	AbLEC08fqLViqc+ISy77XrQiOoZcF0UNFaH9XOi1/sn92kvX7JqGp041uuPwWwPSJxTxMuLJ3sj
	BrX5r+90W1jmyfgYNnErlPALM+VzY3Lml/B0tlz/Y4QD7gHsS4/3LQGOIqKBCQ+Nr4oD+RIDiUF
	UaoMEhUWRnWJOyRRVAoY88N0TU3i+edNBrsQ8N3p9gHK+yAUdCvdj/oKbOh0VWB3diqVSPHSeOj
	yYflp6KhYV6Lw4draypUlZMK8a5xz+kEht1PuUcgX8kSwDDii7aRkeQ8Q5gwSucZh42Db2ddL6J
	iE1ZRDlLjcYe7jy7IIT2T78KgwXXq+vtmZCd1MjaNU410P9amg5S4MU8Y8nrQLFTXeH+h/VmVhF
	SIstagIlHIVQCQLJhuZ6aXURVAQpKo8JJEqS+L1rLOmVlEg/To=
X-Received: by 2002:a05:6402:4609:b0:6a7:ee55:dccd with SMTP id 4fb4d7f45d1cf-6a9f63d3ff7mr4687955a12.28.1789488168338;
        Tue, 15 Sep 2026 09:02:48 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9bc808adfsm5879295a12.4.2026.09.15.09.02.48
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:02:48 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2953a01240so573092266b.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 09:02:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzSpKmLBxnwNolD1SN0Jwprl3Pkq4q4sCo5GGWqZe91ZbyIxXUAKom54eoxegII2hTyOwtMSoWDfmd0@lists.linux-m68k.org
X-Received: by 2002:a17:907:cd0d:b0:c29:439b:d5c1 with SMTP id
 a640c23a62f3a-c29b86141b9mr553591866b.16.1789488168046; Tue, 15 Sep 2026
 09:02:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 09:02:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
X-Gm-Features: AcwNN1WK06t9f9BcKFBIanysXcyUXK4eRICuH4x14s60AdlpF6ijCATIYaYAAvQ
Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 04:31, Christian Brauner <brauner@kernel.org> wrote:
>
> TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> allocates a descriptor like get_unused_fd_flags() does and records it in
> a slot on the task. fd_stage() attaches the file to that slot and
> returns the number.

Honestly, I am *not* a fan. At all.

I think this adds complexity rather than removing it.

The diffstat tells a story:

>  106 files changed, 962 insertions(+), 861 deletions(-)

in how this adds a hundred lines more than it deletes.

But to make things worse, it adds them in bad places: low-level
architecture assembly code.

Those extra lines are *not* making complicated code simpler. Quite the
reverse. They are taking fairly straightforward "just deal with errors
with normal cleanup in the place where it makes sense" and makes the
*straightforward* case simpler, while making the big picture more
complicated and subtle, and adding new code to places that are not
simple and just blindly do somethign that makes no sense in that
context.

IOW: it's more code, and it's more abstraction, and it DOES NOT HELP.

And yes, most of the well-maintained modern platforms (read: x86 and
arm64) use the generic infrastructure and they don't show that
low-level asm effect. So for those cases, it's mainly just  that added
conceptual complexity and a new odd rule - and makes a *successful*
system call go through that "extra work" and indirection phase that it
didn't use to go through.

So it just spreads out the work, and moves it to a less obvious place.

All for the very questionable advantage that you can now randomly add
a file descriptor without the few lines of fairly straightforward
rollback.

IOW, I do not see a single real upside to this, and I see immediate
downsides to it, and a more abstract complicated machinery.

I do *not* see why we woudl want to make this be a "every system call
exit" kind of thing. If there are places that think it's complicated
to do, they could have *their* local little stack of fd's pending. Why
force it onto the low-level system call entry for every system call
when there are only a small handful of actual real cases (the vfs
itself, and random ioctl's by odd driver subsystems).

              Linus
