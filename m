Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11E42FE1D
	for <linux-m68k@lists.linux-m68k.org>; Fri, 19 Jan 2024 19:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705691314; cv=none; b=kjnPBwvUiBjGCGYQEdhTWy0JRqgXbmD80JXkXkixAbt54rSBJLX8KQy23WlVlCKKSq/WzxplIcGrR4qnm3deHD3aShBhK+12aMVnqQtO+7l+f8ycL1MXtHh6B+53BIatqw3G6M8hXFVdVaMgGvRtcH/RsiBZnv2X4zCsIJPm9+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705691314; c=relaxed/simple;
	bh=qYmUwZXCEwwHxrejcnynTHJSvDAkBFIcibt439a8Vro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dJZMLqbDxiJS23PA1niz8vuauy4cP9R/FOmg9RD15uwXQboe/BJZUHDE+UjH+XBniTl/BrzSl4/LLriNbEL6kRw1NsgT2cYymUI8n8+a06BuFO90jbJS+H8882K7vseCI6/lCl+O1i9cjLrwwruzvjFGQeUR85PqTni3i2yYmq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5ebca94cf74so11155137b3.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 19 Jan 2024 11:08:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705691311; x=1706296111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Los1bUQR+nrchlfUsUNrM4jlMLqPsXp3+vKyRRoEhFE=;
        b=Jg73KlAY+lHVt64Hw9XUTZkyRb6NtyUKUcGfBqsJreT1Ibiybgs/woGkNjvw8GE0G/
         pHHLeDvPXvco1erSIFNywcmbUeIPTGp2NkRRCJ1xaIQGgKCXgWaeRE9eRnMS4RpuoNvK
         Tdg7xiSaFj/Pt6HXROHv/f7L1yp6UPenG9ocFTqgu+r+HENR2YzALsBK595ESRZIaooR
         dO+JzrjTVQ+VmAuCI7FjnU4zqvncCbSlK2r39X5F9V8jj6UGIgMsMNOTLGGwPbW7yfts
         bth9xBv17aqdmhxeJgRMjI59SPPYkksgmBJ6FsGrI5F+asjx2fUVQBbKtEB2g2GIXLmq
         2dyw==
X-Gm-Message-State: AOJu0Yyb1NnBOMrC7ASlUwr/QmxBKx9BLuv/WzIvWLLN1gwxWR4oZKVU
	5gFsIlTy7RHOibYhv30Z+lkbNA6RuEoppg9vBJu6hScWucCDsp6TwIomQYUMFmU=
X-Google-Smtp-Source: AGHT+IHbWJqInSFPjRvBIqajznq+gDEofQFZNzifptLVcCLmUGsrT7XWcU7UwiNdbWRQEWjmsogGSg==
X-Received: by 2002:a81:7782:0:b0:5ff:933c:1971 with SMTP id s124-20020a817782000000b005ff933c1971mr375737ywc.69.1705691311433;
        Fri, 19 Jan 2024 11:08:31 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id x81-20020a0dd554000000b005ff9b52f5ccsm683091ywd.0.2024.01.19.11.08.30
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 11:08:30 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc261316b0dso967011276.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 19 Jan 2024 11:08:30 -0800 (PST)
X-Received: by 2002:a05:6902:1611:b0:dbe:a537:58cd with SMTP id
 bw17-20020a056902161100b00dbea53758cdmr355239ybb.52.1705691310589; Fri, 19
 Jan 2024 11:08:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240111192329.449189-1-urezki@gmail.com> <ZaDSmY5oObFqWCfs@infradead.org>
 <ZaD0L7nkFeTwv_g5@pc636>
In-Reply-To: <ZaD0L7nkFeTwv_g5@pc636>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jan 2024 20:08:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVoweOFJ8_QG-kxTmHKmpPcVQWki+Dc+wDWmBM3hFKfiQ@mail.gmail.com>
Message-ID: <CAMuHMdVoweOFJ8_QG-kxTmHKmpPcVQWki+Dc+wDWmBM3hFKfiQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm: vmalloc: Fix a warning in the crash_save_vmcoreinfo_init()
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, 
	Baoquan He <bhe@redhat.com>, Lorenzo Stoakes <lstoakes@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Dave Chinner <david@fromorbit.com>, Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>, 
	kernel test robot <lkp@intel.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC linux-m68k

On Fri, Jan 12, 2024 at 9:11=E2=80=AFAM Uladzislau Rezki <urezki@gmail.com>=
 wrote:
> > On Thu, Jan 11, 2024 at 08:23:29PM +0100, Uladzislau Rezki (Sony) wrote=
:
> > >  #endif
> > >     VMCOREINFO_SYMBOL(_stext);
> > > -   vmcoreinfo_append_str("NUMBER(VMALLOC_START)=3D0x%lx\n", VMALLOC_=
START);
> > > +   vmcoreinfo_append_str("NUMBER(VMALLOC_START)=3D0x%lx\n", (unsigne=
d long) VMALLOC_START);
> >
> > Well, the right fix is of course to make sure VMALLOC_START has a
> > consistent type, else we need to plaster this crud all over.
> > unsigned long seems like the right type for it, so at least m68k should
> > be fixed to confirm to that by adding a UL postfix to the definition.
> >
> I agree with you. I wanted to focus on fixing that particular place
> because i wanted to avoid other(on this step), possible side effects
> or drawbacks if i went with patching the arch/m68k/* files.
>
> But, in general arch/m68k/* has to be fixed.

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
