Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D744937F733
	for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Apr 2026 09:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369453; cv=none; b=Dv/iMz9OE+i1vtTQM6wRDPm32uOau3pf07xVOUIjbkLD5IlY9UADQWscUvxiFtg/iq0UAwddY5wmH/GteySPnVs4JgIVqB5p6KTol2H9WGaVGf+7lBd6YkGYzXKrC+7vZlnmDsWeM5aS1U1OS3Z1TJN0KW+WQx0VscqGvnj+cUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369453; c=relaxed/simple;
	bh=5p8/l8hxy6UGncfbmqpvMFhiayusbzRLWCQfCfD++YY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCGo1DxxjjTInH+kABjhWb1+ETSqdEqPao2Rt8LLY3fgcLVuw9bL2UD+uLb4wfTwIVem90bE+hdw8wOHuDnAai7eWOuW7pFgfl2trCLaTsMa82UZC9RTGq+b01XOiSw/uJwQVdqXN+ch0B1he5x5AKTta5hMO0z4qXNl496SkHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ba5b107eaa2so1203106966b.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Apr 2026 02:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369450; x=1777974250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nWrICmexI+A6dB2ZQxQugwwArdZmj01ZZbEQAQDplTY=;
        b=FELy8xsTqNWzHJpEDvs/vqVIME8Wh7V17VyQ0QBd+h6rrafN82qvDml8VPgTzBQkX2
         6OLIubEyUaejenRblwbP7q5iTezbiJ+kIwL3JhddtnVi3pT79Ru5Pao7J+LcyCqzcMve
         FASS0ewuG7BUajNcjaKbCGzoI4K8HsyjXpcP8AorBbN1wkzLIY4lFaJzWUnhPwHAJP2/
         Uw9J7vARHFJcU4e/WlyhC673Jzo/un621pvgMx8bwXNJR2BijNLbcDJOJ7809B85CyLn
         UWXOm0+okU3xbNtSNXHSMkFsewwaCy4hWRXJGOw/BaewmdIfJsC5n3h0mA5OXt89tfwi
         wCUg==
X-Forwarded-Encrypted: i=1; AFNElJ/3Nhex1e4Erl4nfPSJyDvP2TbdDGGxPglqPI2qf1SliXJXgzFdPstXRulman9XdZR5o+Nk7Mtb/ehE@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxnZW6iUdi55TrtHtkBgZepVmixRSI7kg4UCO4ysdLpBFDtcXdo
	UzEKhIGxWDYvKowswo6YTQjJ+kh35qHuP4VwgJ12uWDU6Xp6MPFESoVZWzD88Hrv13M=
X-Gm-Gg: AeBDievLM7nyVH6bVUwJ90Hfpq137b2a5KgFLsRbVWrXfEj7Ecjap7QIQ+4/l1//ji7
	x5p/98bfTpUT5cDzvB6PXGuMbSjASeJXqJiVECTS0Y2LPrCksGcPfuXQpBagZQuiEZmX0hfeoLf
	mWo7IRhRHDXsPj1iALTiQBziYkx/iwA/8zQ0Q1juLbNRaHFLv7x5hK46xMtSeU26xLEMleh0gSZ
	/uQL86Uu/jmZm94An0ZkeH56yEDJn4ovEOFiBYQWUjnskIwxyhd4AF4HYQB+nhU4a4cSAMu1F+m
	XeEuApBBtnQzQQ3KJTwBvr605/kScaPodWGMX6ZzCzNtg5sphKeo0IB7Wyur9n57O5exu8I2W9g
	0mzHxbhm2kHEpfQ0aftnZ7TGPvY3J6UZH+aGkY6fmS9nzpGLkSHVfmH8BO06JD4R18PGJfYy67a
	EE7bue9XrYzywXWtnUFm2Zu94XaSt6V1ZcuuocBBuXOjONBWGoSYB2azofPL0k22gUmr06IV9EG
	6sO0laiPQ==
X-Received: by 2002:a17:907:7295:b0:ba8:ca25:e6ab with SMTP id a640c23a62f3a-bb801ad6b78mr158507866b.11.1777369450008;
        Tue, 28 Apr 2026 02:44:10 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80c58200bsm73109166b.62.2026.04.28.02.44.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:44:09 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ba8472c1613so1600452266b.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Apr 2026 02:44:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8e/GChmEje/eE9gSCP4yqeLR/ze9kIL+xRnIG2u6lnyu01agHkC+1ZtgD/D7Bjpq1eq0UMimjGhYCy@lists.linux-m68k.org
X-Received: by 2002:a17:907:c80d:b0:ba7:9857:2fa9 with SMTP id
 a640c23a62f3a-bb801ad7348mr148812966b.14.1777369449228; Tue, 28 Apr 2026
 02:44:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427105810.23761-1-pbonzini@redhat.com> <CAMuHMdUvehWeTwdN1czjvv7OjGsu_XaaYS1R6Tg557mDqP+fSg@mail.gmail.com>
 <CABgObfa+2ERN1TmVeeWxCQKzra_OThkgkVkBGgDfu5yOsjOH1A@mail.gmail.com>
In-Reply-To: <CABgObfa+2ERN1TmVeeWxCQKzra_OThkgkVkBGgDfu5yOsjOH1A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 11:43:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrt4khjgV41Qt2kDWR3RfMXvOgghi83ovyMnEqJFNU6w@mail.gmail.com>
X-Gm-Features: AVHnY4J_GAQdlnmtDpgrREfPjFiZlxFdEnKGHr11C0hlHFvtBM-VdB5gtX4hf-E
Message-ID: <CAMuHMdXrt4khjgV41Qt2kDWR3RfMXvOgghi83ovyMnEqJFNU6w@mail.gmail.com>
Subject: Re: [PATCH] mm_types: remove references to s390 gmap
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-m68k@lists.linux-m68k.org, "David Hildenbrand (Arm)" <david@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

On Tue, 28 Apr 2026 at 11:40, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On Tue, Apr 28, 2026 at 8:58=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Mon, 27 Apr 2026 at 12:58, Paolo Bonzini <pbonzini@redhat.com> wrote=
:
> > > s390 does not anymore use special struct page for its shadow page tab=
les.
> > > The honor of giving a special meaning to pt_index is now m68k's, so
> > > rename the fields and adjust them for the desired type.
> > >
> > > Cc: linux-mm@kvack.org
> > > Cc: linux-m68k@lists.linux-m68k.org
> > > Cc: David Hildenbrand (Arm) <david@kernel.org>
> > > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >
> > >  arch/m68k/mm/motorola.c  |  2 +-
> >
> > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
>
> Thanks, do you expect it to go through the mm tree or are you taking
> it yourself?

I assumed the mm tree.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
