Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488731CEAB2
	for <linux-m68k@vger.kernel.org>; Thu,  9 Oct 2025 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760023092; cv=none; b=BMqY0LjppoVNYqxO5BhEh1sVR9pleF9Q1PAb/QYIphBL3kU8copkDSf/mdSm1VvViGQIgR/XgAiznnhaaKGCkMYbld+LbrMzpgyon3VlM1LsmM9uWZjDyTWSeoSmNjEpBxq2QhTS+Cn0wBt69/gz4NiArD11rmAloo+G7maCTdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760023092; c=relaxed/simple;
	bh=2OdZCuvMPhyb/oX+g/qQuxgXRvbsQA7OE8rAsab4a9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=am3+8DrUsYygDlvtJDhBBjWpVmXXR8sRg2pGcgS8/JQ5+XuTeZBqM4WAttLQzFxtwwdIcd6LM08f3h8fPBfca2WJQtGDKNgaKbJ12eDaAQSpVyTQeYdqV413Bpk1jSuT9RSJVt/s0itJFH62DguIir2vhiP5RVn5D4IGGOYyCis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QchALc0U; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QchALc0U"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso680968f8f.0
        for <linux-m68k@vger.kernel.org>; Thu, 09 Oct 2025 08:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760023087; x=1760627887; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OdZCuvMPhyb/oX+g/qQuxgXRvbsQA7OE8rAsab4a9o=;
        b=QchALc0UupidtcvXks1cDQ0qMA/LiKjiUT1/XnC6sALCfjESIJNyJm+VYmDglFw1ML
         5ZG1GQZO6IdSlYLvHMaXhrgMnviyO9QtVI4mmaKx+JpqACwb55/EVudawSO20yIeiNan
         TUzv6lg70xxLGrVxI5EdmMGnzLdZfIMTn9N1KTRLF3lUamOJjrVPm143ob2Os/o8uyPe
         ty6V5HOlheh8P9S0BSvQqgHU3qDRJMxsj+OUhcXlAQYEJK2nh4q/0o30MUNoafmBpT9N
         2SxWCZYYffwv1kZ+QD/1znoghHUfr8ekUL1wJuMI4ptmkKiB7KwjYGGO+K2l96RDXN7L
         1aUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023087; x=1760627887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2OdZCuvMPhyb/oX+g/qQuxgXRvbsQA7OE8rAsab4a9o=;
        b=ZCdXSbeNgmxOMc8K5AVpdphz30CCn5Rzo2rHcLpb1Y310T1PmmYbDRS2Ndi+i6Pg7T
         ObpnLuAR/284vj1Be0oePiCCNZmf3n1UvA9Sj0zsMOIoW+FhO4qZWU6cfRoYLjHm6zh2
         ItsYoUCvReIcQUemMDa3NzqVv87ySmbrbjz9QyQzi8958hQ6PoJKI/RJ5oOkMXaXHm9w
         +zYBKYyE8lxQQdWDgdTQkqCojDAwSrzsKUiih3OLlT4pDEtnR0eOWCPzoS8U0KfVBqcj
         GbnHj+3TMoIHY5lAgcmrhzgHxryxinHbU/toXcW/wYAbV6e27DGC9hTIKdgcebjoiF28
         td5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7f+3FLNt6ywAYQJRc66wOzWaUbIlsMlamZmtv7N4wnrgOmPWt/x4q9MGTahZ7iIAPjNj8hLcMoley@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp8SJ/mnJlr+D+mm9jE+ra3FOvr4YQ/KDFT+7Bl1wq+qN6Trat
	s9x9jZJkSjwMBDhDOGNHqkOQwbfVgutqBdnF+xtICTF8atOXlbm+wDXFqH0MW0yxFmbu996lJ5a
	T5NUkIsSewvz/SdhRJ/mWXYdZpoKb/kM=
X-Gm-Gg: ASbGncvSzK4VmWEgsgUYS/2HxykpZ0CCy1U9fCfPFVoraILxzah/+SyuTLXgyGpUkoP
	jjs9ZHo6RpxG58fXkagYjznyLS8OWsANNhRUYeC+NOwpehTPo5gOpbEMOfGztaKZwtBTHtw4N+L
	x7pUT6rDBNWyKQZtNu5xmDZuvSpytMg45w0O59J9zxME17491WIGQye61zYwQXkb1I09mdhQmmw
	m7LxhN9eJGMdMHdDNNhTlrS1uzjPVcmdSyy8dqexkWXYZ29XwGq+j4a0tKRDajyfekBGipVA9o=
X-Google-Smtp-Source: AGHT+IHFIW2ZRuVj6JW+2Xc5kVTwqVxqOqN9ru2LkZbWzNc2F/DIEJsdL0gLuDd10vTbWFu9LcmuEXrfEs4ejeimT+E=
X-Received: by 2002:a05:6000:2c0c:b0:3f0:2ab8:710f with SMTP id
 ffacd0b85a97d-42666ac39afmr4150639f8f.8.1760023087351; Thu, 09 Oct 2025
 08:18:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1759875560.git.fthain@linux-m68k.org> <807cfee43bbcb34cdc6452b083ccdc754344d624.1759875560.git.fthain@linux-m68k.org>
 <CAADnVQLOQq5m3yN4hqqrx4n1hagY73rV03d7g5Wm9OwVwR_0fA@mail.gmail.com> <20251009070206.GA4067720@noisy.programming.kicks-ass.net>
In-Reply-To: <20251009070206.GA4067720@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 9 Oct 2025 08:17:55 -0700
X-Gm-Features: AS18NWCd-roHqFuBtFB_rLNuX70SLGKwer7HfRV2M50Son7-GOgDqpYYiOdZQVU
Message-ID: <CAADnVQK1GqQKxdoM9e1Z92QK68GEjqgMnC36ooVgS1uUNiP6eg@mail.gmail.com>
Subject: Re: [RFC v3 2/5] bpf: Explicitly align bpf_res_spin_lock
To: Peter Zijlstra <peterz@infradead.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Will Deacon <will@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	LKML <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 12:02=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Oct 08, 2025 at 07:10:13PM -0700, Alexei Starovoitov wrote:
>
> > Are you saying 'int' on m68k is not 4 byte aligned by default,
> > so you have to force 4 byte align?
>
> This; m68k has u16 alignment, just to keep life interesting I suppose
> :-)

It's not "interesting". It adds burden to the rest of the kernel
for this architectural quirk.
Linus put the foot down for big-endian on arm64 and riscv.
We should do the same here.
x86 uses -mcmodel=3Dkernel for 64-bit and -mregparm=3D3 for 32-bit.
m68k can do the same.
They can adjust the compiler to make 'int' 4 byte aligned under some
compiler flag. The kernel is built standalone, so it doesn't have
to conform to native calling convention or anything else.
