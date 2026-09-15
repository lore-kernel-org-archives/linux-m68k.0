Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AE63FA5F0
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 17:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494729; cv=pass; b=GhkCPITWRW95xBQH1NvtHWOIsE0Mpj8mv/DYbhj0EjonWBTDUhhAZ98P/q8nG3FpzQ4fcTyOa9dWZQptRY8bOGwScfS6qTQWRPYZKNu2OA2ZYddxeCiZSOmetWhI/+NAKJPKVRhIIh8Tm6ofNQ2EE6yS5Gq28PUWqs8cN+1eZBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494729; c=relaxed/simple;
	bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wl7TMPFlJ8PPi2roC3Rx87K2x2ULHTKuVTh1/2F7eAdtQzKN91MOYGVEI6+ciWfY0qSMV8zPH0LB0SGf6FJYrCdCa7br8g10LF84WSzG6QajOQtxLtyLvezMXiU+F1buEcQWd+wXEhJH8Yu1FsOGMxTywxYniILVDPZDD1kY7LY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bkLdb4Oq; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bkLdb4Oq"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db425c9050so12105ad.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 10:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494727; cv=none;
        d=google.com; s=arc-20260327;
        b=sPAxxv2cdYw2flsM8w2d+0vqaPEqWonB3gN1ZleQPLKFe9KrNs5RjJHv/TJf7OVMtz
         rlGLNija6WDeFNd8E0fWhbRCrGc7Ye1jhGWO3BrQaoUwMqgOid/TxKy/QmEQfbb/GANb
         0nadqP0k/dwXLJhY9mtmkA8tWJX5apPY47cfKWYfocvnHTqBX7TksQr6vek5XtIdL/c3
         gny/pp6nIG6vqFbH7AUrdU0c9o0fBqBrfqYHbpW3zpfbcoP3C1uEFPktcSzT/+fDWSKa
         RExhML3E6MQky3VrxDEqidTgk7l00jnfOOwk5tj3G/ntm8oNWIZCeEecocmQRr2XZ/3u
         jr5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        fh=0UeQRA6eR1uy7e52HKTFR9QNzIZ7roXVytB5aUl1XhY=;
        b=J5POXtMX7HqMkeI/ySagQmbX82LYEwA+fN0pado4o22sZvfb/slnI0nNlKTA1iGBSm
         sCE8HgAYCrpyBv2o1+16e7QNy1fScTL21nXf6lk6jTSRHkaqRv5Y45sde+NyaOk/bEVV
         415YxN3lez6EGXhQjad5YhEu605gz1wIK5s4APlSgJlsVCy7Ym4dImsZEubT0ZieCZDX
         rKNHUOV3NB5eeMThALSO5mRydHpgAzrlLrbkbSTWIBWt7mnbbp/GrLP2Yzqw3W8VJDuv
         Dh2JrmyajZHLHI8uIDVhjx3lJJIHO9QUW3RdCdF2AAWTHvEs8l8uIKtVYNZHr7aZtMBu
         CRuA==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494727; x=1790099527; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=bkLdb4Oqfs5WU/caAzELykCrxOufoTBf0ZQ7vsY4693uvJY3DDeAwc1pSlLq7OQu/Y
         uP7lAIZ2Y328fpSG+Zn8EQlNjmaUHVJBckmEXuD5YaAGSR+I2OPAZRoXjnZxEByLQfvk
         LtAVuC37uv93iSKOF/1CvfKQFe+o27z2Fdtkb+PsL6Qlkh7AYJK4I7jSSkYJlxKJWfZp
         lX3vLp9MqlhTEDXeou4Lh2xRNWek0fdihoedlClSQ89KsQ23HNOe40QnBVUZRu5Z7dUW
         9S56NxE+LOTkVMZnd01PJt0+RudzOLtRDwNgyFpv/+qSTW2MovoKyLoMHmxolIqlBi2B
         ofhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494727; x=1790099527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=dkgxaT6qyjwbOibYO6lZK+NFpOzpjojMrO/MvONhJ6vA89NdtWOe3lzezYsW2WP29x
         aDIAl1jc578pRXcqFLbo/642Vsc7I99Z4nMbhBHqt60U8/91//zyodPRmhoKPQANDRMn
         0eX/z2a93H8j2b12g2+KvtgWzBsjQDXgBKJniu4fgkpxn5cLp1qdCAHGeR6+BouEwJJ7
         J2yOT3ccwQJY0D2W76Yhuh9Ank7Kg9TKejEZQUY/2QCF1/tC2sras5tRd/snnwtlK3o9
         DqNNccKSYX50nbNChTt1FF0Ied/vnfvQPbwIE+ccY4L3OhdJJRdEs+wjLBVTkXqGpEXP
         Ncdw==
X-Forwarded-Encrypted: i=1; AKwUvBxA70Byh6WWdXZK7FEJsHWGv6qBLPzBw4ssF5Ne/60r26L7qHAtRtNmA4d4sSOCwRdmvn2xGf7ErNgz@lists.linux-m68k.org
X-Gm-Message-State: AFuF++mnHJ5QXtGkV0fWJuuobsIqc+ZeUZTgu9e0AS0IzpAU8vlAd94v
	xl5WEtwyPKiNJZVZyA/c7qaFdUla6NtXOZfiSAnQo/RvlmTEA6hC8nTd+diDBST/c8W53vT5NOg
	XN9G7EaOh2ZxYqt4Nx87SwKjoU9B6wCEVQIR1ERXs
X-Gm-Gg: AYBFou1DaVLtVi7zk/LKHhxuv+dqbK7FZa6sKHsMXfaXc/CRFjwMMzumI4Ms1t9W5Ns
	p0yqEQjA3RSG8hx1IeQf/CojPSI5wHGQzK7a+M2NkflV32y65GDDKae+TghSQnIikQAGdQ5vFgQ
	lwMkA3O2fBQShrq//7oZGjF+VmPShOc5wT7d8zS2uRh8ht2+jRPUkLVC1XbYs4sfdf+H9XvaOZg
	s73QhkZEN1MFCNRJ3UUcogHek4nmfdauxmkhGFHTfzs5+EuGyZzHd+25+C++QcMkkgWa83L8TLJ
	qDS/9lrF3YV/o8jpAZCWrcOHM1GEsLQg+b23uvZznLtc31jYfSbEgC0g7FIq2lqGokehFTTJqQv
	dSaTsUhhlm011/24cGCag5vHkg4y8E9FdYRF8iN+PNsb+OV2myp4=
X-Received: by 2002:a17:902:f612:b0:2dd:5363:31ec with SMTP id
 d9443c01a7336-2dd89c0c38amr177395ad.14.1789494726332; Tue, 15 Sep 2026
 10:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 15 Sep 2026 19:51:27 +0200
X-Gm-Features: AcwNN1Vhgv53PI2-XyXtJBbVzCNkGiiWjtvOE2b-8zHim7-UybJ3H2xniPj1VUE
Message-ID: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
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
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 1:31=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
> TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> allocates a descriptor like get_unused_fd_flags() does and records it in
> a slot on the task. fd_stage() attaches the file to that slot and
> returns the number.

I'm not really a fan but I feel like if you want to do this, you
should be using task_work so you don't have to touch the entry/exit
paths directly? (And if task_work is too inefficient somehow, you
could tinker with the task_work implementation.)

> When the syscall returns success the exit path installs every staged
> file. When it returns an error it drops the descriptors and the files.

Is this mainly about stuff like "we installed a file descriptor and
then the following put_user() failed"? Because if so, I think a nicer
fix would be to have a policy of "if userspace provides unwritable
memory to a syscall, just keep going and pretend the access worked",
and maybe have a sysctl that kills the process when this happens to
emphasize that userspace should not be doing this.
