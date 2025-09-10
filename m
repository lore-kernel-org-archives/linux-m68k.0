Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D58E30BF6C
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Sep 2025 07:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757490269; cv=none; b=pJyYHAmJuaM2Ghh5NvJaWSY/NVaWD9M1Jl27PXQ6kURkJVqsAnQR13yFRRHHSZ9TUyjBvSs084XBTXabQ9vL60rk12FrpKkjXYxgy8d+nbB3DyNivNrcVtslMpLgfHfeUKzfNabtKqN5pbIxyuUnaOoBsM7eAWEFkzBB5/fep6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757490269; c=relaxed/simple;
	bh=TmOayCIKSed+U3pftMVxB4RfTilR+32vHekUHfTlPq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TYeICzT3czw5YvNjHI4Q6gSGIOnq60ihp4CX+LdSqtq/Q/dptggOi33E+qw5uWMQxNSbN4kHD78vnEPzQmEqirfWItF3d4pZ82wPxGZMZfZLvLqNqWZSY0ISkgEXRc9E3znTUtRgdYceCMu05v+R1azI0kZCXA0iXVTsKtCRKAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-80aaf37b0e5so822221385a.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Sep 2025 00:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757490267; x=1758095067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4ZPB9cLoxkxbaM7F/g702qjjiFbhLGJdP74V/VQO3M=;
        b=Wqq48UoW+Ry2PBjVjNJNQ1r8L8dJcdRlmvV8b0LkkS7KpIIvzy5eMmON4aqk7B7Dz4
         uMfByOPD831cFZwxkowIrgktwmA2AHVzVUuaehou2btOye0bzA2q+zmvb5bN+S1WhICY
         PhjLBCHawJ0F0MOeIsgh5Chaz1aqewX+6z2WaiZm7g+ydMg+ydrCkUxoW9GzlMA+kuzl
         gkUpyhlC4KL8/FY0Ww9Tr5r0ztId7tmeC65GI85Biw+XDyjKfMzb13vb7ynXGr14MDsP
         861kOxAC6G/dSpSHVXFwMwh77C9iAtFnkUz/5/iYdf1TpP0ojhG6e3C8fMcdz4LiLOHw
         ZF+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkr+1X9iBkLJ3OhtbiOmKtHLuYKExQNq+A2lmWWwxE5YIdABTqep+00QFxpwEn7zUHbtgNaocZHIrL@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzIpQ8zqWQcjjMQuW5Q3tVcd0XsRA2yDpn+Z4aX4uBmY9ptsAel
	buv1ri3XyO5jgBEIFvw8bTTrnZ86kR1dIfRB5gxgXdqMCPn8fB49gxtIi4bPdXO6
X-Gm-Gg: ASbGnctCpsRY6GczO/DVML8UxZ8iv1nTL+lMOuv8rmxVV0pFcYFU6wKJZHxVzvSJrtY
	7TWJi8UB6wGA8FdgfBoCYrW1VAxlFM2cdTALsQEsyf2m/0CTMLMu25jQ7w61jsWl5byEEAwDVaA
	55IXIaaJubEVg/ef8AwGBGovTjGFhqtm72nvkErhJ2PjsB2oGWLUg7xlvbCJqasV6QVghcMoX8K
	OMpJPFgpidbc3SMFR6/biuXjOwPLNVZiqZQ2y9hXtzKvxxNIulMb6Q1m7yHcfwjIaoofZZgOrnv
	4xlLh24NYf0+pOBQpI2kvXWDq4AQI4GGTKLjqqUp/r7OB1/PcyAhVRQm0zx6yoqAKFD6kARw5ij
	6vWva8Esve7rJ1np1ktdxZDRrxyO3IApb+r9A17pq8bs28ivv+ZC7jElNdky4QtZw6/6lRswJ/x
	0=
X-Google-Smtp-Source: AGHT+IEjFr8ON1+GSY0TBVZ4QnArf/7LzhFEIpf00dBc3oejBqQpSO8OrpuD81e4qHJ/cycaPpSFSA==
X-Received: by 2002:a05:620a:c4b:b0:80a:cd77:be3f with SMTP id af79cd13be357-813c235fa5cmr1470973685a.48.1757490266804;
        Wed, 10 Sep 2025 00:44:26 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b58d4957fsm250499685a.3.2025.09.10.00.44.26
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 00:44:26 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4b490287648so105455161cf.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Sep 2025 00:44:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAcQONqZKY8TSkXpF9If5CRCS/+SWzn2KBp2FuBeLeZ2BNNKtLrfaaS7EkdLXZexm+EB5ZTz9T/gsi@lists.linux-m68k.org
X-Received: by 2002:a05:6102:1612:b0:524:2917:61aa with SMTP id
 ada2fe7eead31-53d2490d7a8mr5170926137.32.1757489804939; Wed, 10 Sep 2025
 00:36:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909145243.17119-1-lance.yang@linux.dev> <yqjkjxg25gh4bdtftsdngj5suturft2b4hjbfxwe6hehbg4ctq@6i55py3jaiov>
 <99410857-0e72-23e4-c60f-dea96427b85a@linux-m68k.org>
In-Reply-To: <99410857-0e72-23e4-c60f-dea96427b85a@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Sep 2025 09:36:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVYiSLOk-zVopXV8i7OZdO7PAK7stZSJNJDMw=ZEqtktA@mail.gmail.com>
X-Gm-Features: AS18NWBjsCg0nVfXhXD258JRfHuut4V1EOs3ikA4pxJOAq5hXrzJ1s5v9rh0wsw
Message-ID: <CAMuHMdVYiSLOk-zVopXV8i7OZdO7PAK7stZSJNJDMw=ZEqtktA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] hung_task: fix warnings caused by unaligned lock pointers
To: Finn Thain <fthain@linux-m68k.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
	akpm@linux-foundation.org, amaindex@outlook.com, anna.schumaker@oracle.com, 
	boqun.feng@gmail.com, ioworker0@gmail.com, joel.granados@kernel.org, 
	jstultz@google.com, leonylgao@tencent.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, longman@redhat.com, mhiramat@kernel.org, 
	mingo@redhat.com, mingzhe.yang@ly.com, oak@helsinkinet.fi, 
	peterz@infradead.org, rostedt@goodmis.org, senozhatsky@chromium.org, 
	tfiga@chromium.org, will@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Sept 2025 at 02:07, Finn Thain <fthain@linux-m68k.org> wrote:
> On Tue, 9 Sep 2025, Kent Overstreet wrote:
> > On Tue, Sep 09, 2025 at 10:52:43PM +0800, Lance Yang wrote:
> > > From: Lance Yang <lance.yang@linux.dev>
> > >
> > > The blocker tracking mechanism assumes that lock pointers are at least
> > > 4-byte aligned to use their lower bits for type encoding.
> > >
> > > However, as reported by Eero Tamminen, some architectures like m68k
> > > only guarantee 2-byte alignment of 32-bit values. This breaks the
> > > assumption and causes two related WARN_ON_ONCE checks to trigger.
> >
> > Isn't m68k the only architecture that's weird like this?
>
> No. Historically, Linux/CRIS did not naturally align integer types either.
> AFAIK, there's no standard that demands natural alignment of integer
> types. Linux ABIs differ significantly.
>
> For example, Linux/i386 does not naturally align long longs. Therefore,
> x86 may be expected to become the next m68k (or CRIS) unless such
> assumptions are avoided and alignment requirements are made explicit.
>
> The real problem here is the algorithm. Some under-resourced distros
> choose to blame the ABI instead of the algorithm, because in doing so,
> they are freed from having to work to improve upstream code bases.
>
> IMHO, good C doesn't make alignment assumptions, because that hinders
> source code portability and reuse, as well as algorithm extensibility.
> We've seen it before. The issue here [1] is no different from the pointer
> abuse which we fixed in Cpython [2].
>
> Linux is probably the only non-trivial program that could be feasibly
> rebuilt with -malign-int without ill effect (i.e. without breaking
> userland) but that sort of workaround would not address the root cause
> (i.e. algorithms with bad assumptions).

The first step to preserve compatibility with userland would be to
properly annotate the few uapi definitions that would change with
-malign-int otherwise.  I am still waiting for these patches...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
