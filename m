Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4515A204096
	for <linux-m68k@vger.kernel.org>; Thu,  9 Oct 2025 16:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760026353; cv=none; b=cdh/28buGJ6Be8ZMFHvvnAhzPn4GZ5N4ty6qaCI+uGa9rqUyn9Zv1DNPQB2YDMeZ1nC1JjHW0+Nr1enNkHGu+IPvPxfs5ZpHo9iFUXDC4EiPSsnlleKQGG2H0ASPoyRnRBu3Md+IdOClZ5GBymxE5HYlj7UYCNc5r+rv0vTcw4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760026353; c=relaxed/simple;
	bh=vt4Xr6majFlHqQzO6UU/LJul2QasGvXgAd+DJc28JMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Es3mi7Zpg3U8mm1DaC07MYROJNglrJMZNGbNE4qdI7mMLR3/lWIYvSCfYZaOFSl4+7HpPRkUaTJo3U0m3PESclaSmA7AOTmuETPcNp67cQ30mnGj+TtFJbOL1osALtLtfJZCUoA3jY3wLO9PHm9Vas016dqumsTmBUmMYzpyfeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9qbG4Vz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9qbG4Vz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e37d10f3eso8485955e9.0
        for <linux-m68k@vger.kernel.org>; Thu, 09 Oct 2025 09:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760026348; x=1760631148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vt4Xr6majFlHqQzO6UU/LJul2QasGvXgAd+DJc28JMo=;
        b=J9qbG4Vz6uAkx2+Unz5KNMI4Ycv/n9Gv+EX8ZVjOP945xoEv5nJt1zCGp+nyvBgs/P
         4YXNXPgTTbofdtaf6B457UaYZie7+bcRA3uREZZ1XdHQVtiFtBshjVJVzerbqtvfz3Q3
         rJEzOIvhNqK0qZXNtTy3zbTmBcUumNLM3gSyCKlLswjm770TMXte2GkTXBOfTJO+CObk
         Cd29ODmlLyma7Hs2Psby/9htyOFJxsn5U6YE/kuTMzvmYAcNXAtHpUSetDNpAYMCsApi
         P58q5NBhNnOhJC6emL/ifjr37PvIVIRH3tADHqaaqD6nWHxsxiIGpgj4xB4bbw+dQW7/
         bF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760026348; x=1760631148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vt4Xr6majFlHqQzO6UU/LJul2QasGvXgAd+DJc28JMo=;
        b=E9wRNf479QImlPMvphOsQxgOze1TsaiTTbnQzUDkmfI8iUpeCo0sqFX8kJsBNgxZZM
         8+GVUkhOmPjUIKPdsMlfy9BrgWXiMZBbrDpXldFV9F8H154EN1wkzH4EbW/VVk/IlMSa
         mkbNMm2LloHN5Fs4bZXPR9xE+Pf7WaaHRoabIdtHb9e2mDOFA0pSr8LJBbAta6yMUqKO
         8tQr7FYFEg6NKxB7cdVaRIU+FcDG/QDkDi94Mr6dUNUrPqUx/5Qwy7J2x3LKbtuQuVv/
         AvXNygD9PHQ+evH6E/3nEJy750V3Q0OV4jiFOF3TIdaCA2b6nNzA+xMNJ6mglEcXsbCc
         ZNeg==
X-Forwarded-Encrypted: i=1; AJvYcCVsfPPbjOH6bUNksWh0q/cAYhLoi7vpWm97Ba3IvdS3tjv9Mtb4XrvNmtHHPADjrPC6wmhL+hFDHt9l@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcc2H/el0JTxTNbiF0g3z9QpW0CbT5YYMXTmx9WwLJuVL5kdm2
	4LG7+jZGY0Mro7wv6bFsGmYpoKUx0oGne1ib2veMnGNHymtWvGyDO1EBosSFFfQGVQun9gbMd1p
	7hxcHELkSQthqHRuhElV/oE6lw/Q+uLQ=
X-Gm-Gg: ASbGncsnSCaUHlK09+OR68kyPY5aJZxeTG0TXqcMo9Nr/lYQLrvHl7T5ngiEa3b23MO
	APmZXLJU9meUc7sUdaa0LIuuHVYxF7oZayW7sTmQVrPlwUz1TfUOHFzMrORySuaHYb1feEwfQwW
	oy5F51ZDjM3/w8VBV9dbXdwbCHjah2j8i/tEFiHvTTwJpEXJqYV1/JAJ68+UD5Ch634HJKxfHDZ
	9CRDHtVmfjf7sGUWE6/NECCx9yLDqmRhifWrQpGkm033u+rSZXq30QAfdITtPjh
X-Google-Smtp-Source: AGHT+IFI12A7o4l5UIWszOSSqVwW7+IdmNEVBD602Qs920M96fLWTNMVF9DKFjQfLowasrstk8O4FuoK3byvRdyjw34=
X-Received: by 2002:a05:600c:19c6:b0:46e:3d17:b614 with SMTP id
 5b1f17b1804b1-46fa9a9440emr67530035e9.6.1760026348350; Thu, 09 Oct 2025
 09:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1759875560.git.fthain@linux-m68k.org> <807cfee43bbcb34cdc6452b083ccdc754344d624.1759875560.git.fthain@linux-m68k.org>
 <CAADnVQLOQq5m3yN4hqqrx4n1hagY73rV03d7g5Wm9OwVwR_0fA@mail.gmail.com>
 <20251009070206.GA4067720@noisy.programming.kicks-ass.net>
 <CAADnVQK1GqQKxdoM9e1Z92QK68GEjqgMnC36ooVgS1uUNiP6eg@mail.gmail.com> <b9ab4c28-52c8-4fa7-85cb-109ef4c0d7f4@app.fastmail.com>
In-Reply-To: <b9ab4c28-52c8-4fa7-85cb-109ef4c0d7f4@app.fastmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 9 Oct 2025 09:12:17 -0700
X-Gm-Features: AS18NWAh8o7ul2E7KaW4Pi6pgz_IUWTKFALZRPApDvY8RHlwRKBhNejOgDh2MHw
Message-ID: <CAADnVQL9PRCVEJBJ++TCRBWqshQLn7dz0SiJ6KWDYPeWLSK22w@mail.gmail.com>
Subject: Re: [RFC v3 2/5] bpf: Explicitly align bpf_res_spin_lock
To: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Finn Thain <fthain@linux-m68k.org>, 
	Will Deacon <will@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Rutland <mark.rutland@arm.com>, LKML <linux-kernel@vger.kernel.org>, 
	Linux-Arch <linux-arch@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 9:02=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Oct 9, 2025, at 17:17, Alexei Starovoitov wrote:
> > On Thu, Oct 9, 2025 at 12:02=E2=80=AFAM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> >>
> >> On Wed, Oct 08, 2025 at 07:10:13PM -0700, Alexei Starovoitov wrote:
> >>
> >> > Are you saying 'int' on m68k is not 4 byte aligned by default,
> >> > so you have to force 4 byte align?
> >>
> >> This; m68k has u16 alignment, just to keep life interesting I suppose
> >> :-)
> >
> > It's not "interesting". It adds burden to the rest of the kernel
> > for this architectural quirk.
> > Linus put the foot down for big-endian on arm64 and riscv.
> > We should do the same here.
> > x86 uses -mcmodel=3Dkernel for 64-bit and -mregparm=3D3 for 32-bit.
> > m68k can do the same.
> > They can adjust the compiler to make 'int' 4 byte aligned under some
> > compiler flag. The kernel is built standalone, so it doesn't have
> > to conform to native calling convention or anything else.
>
> I agree that building the kernel with -malign-int makes a lot
> of sense here, there is even a project to rebuild the entire
> user space with the same flag.
>
> However, changing either the kernel or userspace to build with
> -malign-int also has its cost, since for ABI compatibility
> reasons any include/uapi/*/*.h header that defines a structure
> with a misaligned word needs a custom annotation in order to
> still define the layout to be the same as before, and the
> annotations do complicate the common headers.
>
> See
> https://lore.kernel.org/all/534e8ff8-70cb-4b78-b0b4-f88645bd180a@app.fast=
mail.com/
> for a list of structures that likely need to be annotated,
> and the thread around it for more of the nasty details that
> make this nontrivial.

I see. So this is a lesser evil.

Acked-by: Alexei Starovoitov <ast@kernel.org>

for the patch then.
