Received: from mail-ed2-f29.google.com (mail-ed2-f29.google.com [74.125.228.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FAB4BE43A
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 19:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499360; cv=none; b=fMXkIGsQKM1LWQU6VOU9CFssfI+4snVG5QsX9sUTKyLlklDL/JBOWx8wq5YwNuj0BH7RTGArx3TC7v4IDuq+4NrJcCytzKyz74vX91gBmzoaSVOg16rfEG5UXHeHkAozGU2ddZ+mZRr0FGKwkiCYEruXgDFxwPGcp0YOSAoQvjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499360; c=relaxed/simple;
	bh=AGk4y8oFpNibhByHKIxcRS7KnQx6z20Q8VC6dFl1tNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnIAgyP1zJWwMh+oASX7eBNLG2/uXWWdbsJ3eWkPmftfkCcgZ2LdPrlJ+L63lYr/96dpt5Ap2H1iwqcqmox3XRJ2x17anLsmoaQadw2fIafBZ9aAdqAuedwbPFSqMa/FDibQka4yomUPIKUwHGnqbNivGhuHVozmesnQbGJsH7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QgMD/Z5L; arc=none smtp.client-ip=74.125.228.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QgMD/Z5L"
Received: by mail-ed2-f29.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso275803a12.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 12:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789499356; x=1790104156; darn=lists.linux-m68k.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=QgMD/Z5LqXDVMEOCBdLWnVdsPY+uLcUlXJg1Z189wdM5nOKvoaT+v1cIdm43bkZz97
         qOyv3AgTs+68bZHGibmrXXU7mE15I+0bYpW2I3cj9epHypJ21FsaJMpJ+nyuxSU90duB
         lt956J0wJXHFvpy2iVqgq/A3nnx29jvd4GbWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499356; x=1790104156;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=ODhO8QTRIj9YwRpBo7OPftHgeN4qxeqPN6/739zL2NhjRCmabdpV9ZGVvkzEYTfBBd
         I7ilFo2RfO7vGtOKV+QlDIwUyBIkcJMAqj+V6DfvFVUwEOA/3dGKjHOU/+xN9t9sOVY8
         6jHpRU03TOLUESO43mJ6DILRAhAgFeqEMHzoHnIN94JP5TCf3fYpcs6lomHT4U52n1jx
         Yt4G0YP8ymHVF1stH2o1sfGosAVbxzYXrztrlw7tCSw6uQAEEmooaQ60cn5QiD0x2n9V
         NQwuSLWA2X36Ra0RJeMpRNmBIsQ7ng2rv4/Lmk6d/avhWTSjcOiahisau5rfo3z81wi5
         oN0A==
X-Forwarded-Encrypted: i=1; AKwUvBzH7BWx12Kz9vDFDB0HfBuSlLfn6Z1wYTbUIpWSJ/wJrizo7Ly9aJliEDmshqBq6zh6z2nJT7KBvT8+@lists.linux-m68k.org
X-Gm-Message-State: AFuF++nhBaqqUagCXW/egVRi4VVTCrQSVGAt64BPziIencr9p+SGN8c3
	Fd+Pw5we3j9He9E3aOZL+lgN422JVKp1YYxmUXN1VjILzzemftmXI4PxdAWnWreAZKRAfzI0mnQ
	Bujmum6A=
X-Gm-Gg: AYBFou0x65ayIAM7/kepQuAhjIPVv1PJQNjjNspn1oYShF6RwXxgwUJ3YrJwv2DrbDD
	mXwR3+zFqKDOifkZdwJi+//HhEVWlyLCgS7pOKWr8OIp6aoeJpHPqqk5dfRZkBiwebhcXYIhu+H
	u6D+BFEsKPtCmBnPYd6doHc1+8NzJHjGNWvl1xlBFJTX8e/RKcGP64U7NOLFJJD32KC7QCeJ4Ks
	NozjArqOrbDxc6KqbcMfeMNmkn6VBOcKEkFVCk+UatOxmljaekDZw0jmo71FPLT3JLHvncEZRz3
	7Wb1n0s/V1+Gyx+11I+p7TPQecgLyLVpLswIEVxCEh7XRX1VHoo5/OoPidC7kZ+9qFM8lkNa37x
	3rtW+4884/0lWiXS4ztYqWVK94Nr4M4SmIsc+3La5Lgi1tiwkOCR2PMAmEgf8jUZ99h3BrFsBbv
	9KVvCUXrYBPJ80/IONkLCG1gFvtyL7J6+blrJQr6yZkobbI7y0g1fwRL4a+SK7hwZFnRjOEcoeh
	s8UJQdidx90T1KThWQHsetqwh8AgPNlLfGD5WoqSvTFqj+uapqeBlHPtYd6
X-Received: by 2002:a05:6402:378c:b0:6a8:6390:945f with SMTP id 4fb4d7f45d1cf-6a9f6256b79mr12564526a12.10.1789499356042;
        Tue, 15 Sep 2026 12:09:16 -0700 (PDT)
Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com. [74.125.228.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d269065sm146666a12.19.2026.09.15.12.09.15
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 12:09:16 -0700 (PDT)
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c254fa663bfso33743966b.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 12:09:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx9XuLUPqTFPZ6lwQ9Xo0MosExiFcHIedQ/f7HmNV+YHz+/MpoqJeJ+RYleiJLH2CyjJ8jhgvMQiWg0@lists.linux-m68k.org
X-Received: by 2002:a17:906:7309:b0:c25:47a4:fedc with SMTP id
 a640c23a62f3a-c29b839a057mr1176039766b.2.1789499355710; Tue, 15 Sep 2026
 12:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
In-Reply-To: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 12:08:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
X-Gm-Features: AcwNN1VCm0LMG7z3Jned014oJh6WBcf4uOx0OBk98_hrtHKbrhcQiMMJ_A-fmB0
Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Jann Horn <jannh@google.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
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

On Tue, 15 Sept 2026 at 10:52, Jann Horn <jannh@google.com> wrote:
>
> Is this mainly about stuff like "we installed a file descriptor and
> then the following put_user() failed"? Because if so, I think a nicer
> fix would be to have a policy of "if userspace provides unwritable
> memory to a syscall, just keep going and pretend the access worked",
> and maybe have a sysctl that kills the process when this happens to
> emphasize that userspace should not be doing this.

We've done that before, where we just ignore put_user() errors and the
user gets whatever the user gets.

It is maybe not optimal, but it's fine. You can find quite a lot of
unchecked put_user() calls with a pattern like

        git grep '^[[:space:]]*put_user(.*);'

and some of them are in core code - see the two in kernel/fork.c, for example.

One of them says "if userspace has not set up a proper pointer then
tough luck". The other one doesn't even bother with a comment.

The scheduler has two cases too, although one of them is admittedly
for another error case.

So yes, saying "if you pass bogus arguments, you get what you get" is
a valid model. It's perhaps not the *preferred* model, but it's not
wrong.

It *would* be wrong to take code that already has error handling and
remove the error handling, though.

                  Linus
