Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06BE13AA2F
	for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 15:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741881415; cv=none; b=s7qc5MevWIxqrwJlGAbG6Bvd6cvJxH5mFFtJbzV8inKNLW08TrtiCV1zwS3L/WA/0i7HOyFsrGAuQ3mMITNvupfHQWkCFN78/pgcN09JJ7KeZ1PorX37madbJ9PQa0TexkeemRUfsY5dP5L0zlsekQiH5CvkPge0DpeKXCrxH78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741881415; c=relaxed/simple;
	bh=E8XYUhrfGtVDrvfxSe5dS9+nc8Ke3lEW4vpwn1AE+4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qC48e3+5Hh+xMkUtqnT5S9Ya9ZYcqP3BAQDRV9DN8IR4UbM8C9GtV3oZT55tUUFsmiao8CiVrdSEF5XW1bxEkO6e2Y+pgxJaaED3R9209a1vqxP8pb6g5pytWYySE45u1/kBJ7ClxovWgmvqJC27sbNh9AMc6y3haKCX/Dc/Zro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-523de538206so446057e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 08:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741881412; x=1742486212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6DPXJYipU11+1sdPGZzjZ0R81HJVvHeGd2EpYkLAeY=;
        b=GHew5aIJ3YMXlGdeIn7rjS3chOdsglb0eArslqsk+YD83S+1eAgsjthabeOR5wPVjL
         1DB/1Muvegxsmba+49rvbdQAIqd9Sspzih0eUHLimEEpsRSsEfjdAaEVcgVUyRcU8r9c
         EfAvF3gIvGrGceJpnT92QN4nwbP5PUJO6W2vPeUB0UxlLiMlpKehQpuQ2EhAd31pP+ft
         wPbTySoqxFfnRvYBV3qRsuHrT9d4NXwjSCE5LSEY540cN8ktS84lKFHj67LBo9QFJkvj
         37ZEyJG3F8Wvoj8LURlbeU1/egxky7UBFxWaPwvvZeA1oi42mLSspRcHGX2g/fNV4lTL
         Ic6Q==
X-Gm-Message-State: AOJu0YxM+EG6NrfnKXL7y4zRLAhJ3qkZSiaMh5PF1bKw18DzwDh1SIoI
	u65Cygfkfl+Jp51EsuW+vrAIEkluOf+duniu1xvNX8sq1SySYwBXAfgGf5vtPQI=
X-Gm-Gg: ASbGncu+izK6zj7nU7rBTuWpjFBLPw+fJ6lJQ+MBbdb7hCjtb6xY2uRDZR9JN8GCvZj
	DGkxqouvKL64IBQ7oorxHUg/lbjqzaKTQSjwOyyzxQD5Tpzfxkpnfvb4Dnxg9xtg0bKMtAHbaUq
	49JAu8uvaa5/6syoJCfmROx6efTWeJ52z1E+ORaQBNhERIig+pw80AEYHALZ16xDYzNUTT+XDV/
	ekhFsPjKJwFDBbhONdv2qvvZFJh9xhynx9DDirhLAoCJOw5geN/TPef6VbNm9YCmTdAEU2U77IK
	L8ueRe9FRxDaeJ/PiMilUxKwZSz8sDsUFGqWLicz4CJc+ezc8boAd3zFv7iT5kBQyOis/sx0GUT
	d4y/opQTskjI=
X-Google-Smtp-Source: AGHT+IGvqc5jasHI0G5dDg1rcdgTAeP9+4kClt9d5hCOb7JxeEAeBpEtIlfVt6j3/1CuOT+JEPBtdA==
X-Received: by 2002:a05:6122:250f:b0:523:7316:7f31 with SMTP id 71dfb90a1353d-52446155946mr612444e0c.5.1741881412432;
        Thu, 13 Mar 2025 08:56:52 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5243a5817bfsm254499e0c.6.2025.03.13.08.56.52
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 08:56:52 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-51eb181331bso602887e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 08:56:52 -0700 (PDT)
X-Received: by 2002:a05:6122:6142:b0:517:4e40:6838 with SMTP id
 71dfb90a1353d-5244629df7cmr576934e0c.6.1741881412065; Thu, 13 Mar 2025
 08:56:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313135003.836600-1-rppt@kernel.org> <20250313135003.836600-14-rppt@kernel.org>
 <CAMuHMdWCBL_cg1NgbHCA3e9GTob_P9mTuN_Tepvigci6rxDmbg@mail.gmail.com>
 <Z9L7H2uugWRNCDVL@kernel.org> <CAMuHMdWtHqpPHQV+qnEpPe-7pE9uw9tD+qypRVeXYGiXNfhBjA@mail.gmail.com>
In-Reply-To: <CAMuHMdWtHqpPHQV+qnEpPe-7pE9uw9tD+qypRVeXYGiXNfhBjA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Mar 2025 16:56:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4HLxsurLaFu1EDFsYgyxQ=LQax2fOc6j-o42LbiU6Zw@mail.gmail.com>
X-Gm-Features: AQ5f1JrcOF2ae9hDR7RfVoyUuEVqwY2eu4IseuV_xouKIU7r8ApPcE_xaq2pWqs
Message-ID: <CAMuHMdX4HLxsurLaFu1EDFsYgyxQ=LQax2fOc6j-o42LbiU6Zw@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] arch, mm: make releasing of memory to page
 allocator more explicit
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Mike,

On Thu, 13 Mar 2025 at 16:51, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, 13 Mar 2025 at 16:35, Mike Rapoport <rppt@kernel.org> wrote:
> > On Thu, Mar 13, 2025 at 04:19:10PM +0100, Geert Uytterhoeven wrote:
> > > On Thu, 13 Mar 2025 at 14:53, Mike Rapoport <rppt@kernel.org> wrote:
> > > > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > While working on this I was wondering if init_pointer_tables() can be moved
> > from mem_init() to motorola::paging_init(). It seems to me that it can, but
> > I wasn't sure enough so I left it there for now.
>
> Oh, that would be nice, as it would allow us to get rid of the ugly
> #ifdef, and (in the context of this series) of our own mem_init().
> It looked promising at first, but crashed later (on ARAnyM):
>
> VFS: Mounted root (ext3 filesystem) readonly on device 8:1.
> devtmpfs: mounted
> Unable to handle kernel access at virtual address (ptrval)

As the backtrace is quite unusable, this is when it usually prints:

    Freeing unused kernel image (initmem) memory: 160K

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
