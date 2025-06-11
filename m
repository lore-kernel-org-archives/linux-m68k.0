Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5724248F40
	for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Jun 2025 22:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749681716; cv=none; b=H1GlZYsA9ub0JzAtHVM/a+Aic0lNqv9oY/I8tTecCrL19IS8OExzvpVt8mf9uRMz5fbGqFZurf2HbjUFq8T2nKCh2HZHa8MW05O3PR/xUbRDgd05f9K3VlG4RGkNGLHg6LeSQeSO/wgViaCeQHs84nJzDdWLgZpQUYsSyoM5QM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749681716; c=relaxed/simple;
	bh=fu/wzduywqUjv7qK+9a9+Tge6NSlg10omniKC5HKz5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fw/Ijtf7GP3ymcMS/cGsCkLu0jDhNRw4QneL7px7EF8sVmgDSE7A+HVvO9k8U8fHCFFNd3Znurga6WSmt/Pc66teQr105RunCqGW2yMfXlb4ZeN0T6Hrd+XNcw9SE5KMRte1F7vjI2VWr1nn4bP6loj52jXFM6QX77cp5KkpENM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=H4b4bsa8; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="H4b4bsa8"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so384801a91.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Jun 2025 15:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1749681714; x=1750286514; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fu/wzduywqUjv7qK+9a9+Tge6NSlg10omniKC5HKz5g=;
        b=H4b4bsa8HkkOKQphnvjqL2va4gqnR6GmtKkfYVWKfHUReO9w5LMIuc09RvYJgUFTkC
         v/5q6YzQ+ngHm70KvLGE532RpwrQt1UANw1qjutsBxv/bmrdzffDt7i/xac7SPuLzBSv
         8qAZTST+txSI6nKJz/miQkX2rp4Lx8vwoV2Ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681714; x=1750286514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fu/wzduywqUjv7qK+9a9+Tge6NSlg10omniKC5HKz5g=;
        b=wBt8Q4Kay1skUaCVMq1ckbKN55cQ4eFB9VeeeoSsgxDCSXzAFChLWZIKftpH2FEjHk
         x/N4S4MgP2YGRnJ4wLMfst3GNRzvfJNYIQDrwR/uSzpHmcb0KAS7P6j5OYDmPvbXgPDn
         K0BM08ovHnuV7zRNqPcgcWMW1FcjoW2QgwSOhx/FmvyJzCcfwV7jriOpftL91I+biiIz
         46nwHS6EXJ0SQPZq7uT/gECXXF4RmSFkxovyaLTVzmLvgT+NmBlTjoGQ4lFay2mn4ckh
         GCoBFDg+kLUGiuxYKDUNx2Hc36NDTL+TYdme0oABOjBi23I36nJECmCbG6VX78q+Kj13
         yQqg==
X-Forwarded-Encrypted: i=1; AJvYcCWzlFfKaww8I9E1hkxqU25WulFGGeu7Js86FzClfZyNBjSJVSM7LpOUQl3GzPv5A4Gsmp1yqTLdMKCO@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YykCZL5zWsHTkAYAg6qx6v4A6XENL+eWCDk90Y7LYk8CoFdkXtR
	2SzNOFc6Q5BvGzC/v5VCkn2UX40fGWR6kxZQ6E0Wwuwkxx/JEHBnDE5u6cYzfSrPuj03hZo61l6
	vA+EwLQogAy7P0uCDKGsvXK0/k2cz/9acXLxt4w7BOg==
X-Gm-Gg: ASbGncsKOkuj2Cdm136BOp1SzkX5wDPY8/4BmxsldmbIdM4zXwPqOpVGkz+Hy89s6Vx
	DEt+WHXCpiMsu47Sx30OcrHig2FBCxniGox/aZLv9wn6JbLS6Mjf1SdE/APsODtp2nhvysLxNfq
	kdcnR8tDbk/gB5UfivzaAmxnBM4JshDwRBwzMwuycZU+OY+KJSV/z4KFtyo9u9sz8w3tSa1XZJp
	TU6
X-Google-Smtp-Source: AGHT+IFhC43QIeC7wkyHuzw2/jvNdE4b1J8RqZ2geur45+BDRSf3SUhlcjsEY4+VyYLHY/fK59ouuP0ziLWh8/uY50Y=
X-Received: by 2002:a17:90b:288e:b0:311:f2bd:dc23 with SMTP id
 98e67ed59e1d1-313c079cb71mr1264145a91.15.1749681713851; Wed, 11 Jun 2025
 15:41:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416114240.2929832-1-daniel@0x0f.com> <ac188e54-7f23-4ecd-805c-c0437a53247a@linux-m68k.org>
 <CAFr9PXmrVUL1HubP04iHR1ObhaNo+mObg7FC+-HpTF7QR0og3g@mail.gmail.com>
 <42674c5a-42fe-4846-bf90-340310393fea@linux-m68k.org> <5bc4ad99-3432-c7e1-32a7-e9f9db86f94a@linux-m68k.org>
 <CAMuHMdXuuTnDk-snc4NipM1xYOom_uiDHtek1UkxuxhETJEeQA@mail.gmail.com>
In-Reply-To: <CAMuHMdXuuTnDk-snc4NipM1xYOom_uiDHtek1UkxuxhETJEeQA@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 12 Jun 2025 07:41:41 +0900
X-Gm-Features: AX0GCFsU20jj-mUNzuNWnqwZ4LjJW2e-m7rOArTf1GhOvf9tq8_2QR1xeEpHa6c
Message-ID: <CAFr9PXnhSrF=H1kq-1AKej=zMoR73+5pLrzBLgu8HrfgDOGqBw@mail.gmail.com>
Subject: Re: [PATCH] m68k: Enable dead code elimination
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Geert and Finn,

On Sun, 8 Jun 2025 at 18:36, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Finn,
>
> On Sun, 8 Jun 2025 at 10:32, Finn Thain <fthain@linux-m68k.org> wrote:
> > On Tue, 29 Apr 2025, Greg Ungerer wrote:
> > > On 29/4/25 10:04, Daniel Palmer wrote:
> > > > On Mon, 28 Apr 2025 at 08:37, Greg Ungerer <gerg@linux-m68k.org> wrote:
> > > >> I notice that some other architectures (arm and powerpc) have version
> > > >> checks on gcc or ld in the config. Do you know if there is any
> > > >> version limitations for m68k here?
> > > >
> > > > I'm not sure about that. I'll try to work out why they have the checks
> > > > and see if that affects m68k too. I'm using GCC13 so probably new
> > > > enough that most things work.
> > >
> > > FWIW, the oldest toolchain I had lying around was based on gcc 8.3.0 and
> > > binutils 2.32. This patch worked fine on that.
> > >
> >
> > I was going to try the patch with gcc-6.4.0 but apparently that's too old
> > to build stock linux-6.15 (see below). Documentation/admin-guide/README.rst
> > says I should have "at least gcc 5.1".
>
> Someone forgot to update that file...
> Anyway, it has just been increased again for v6.16-rc1 by Arnd in
> commit 118c40b7b50340bf ("kbuild: require gcc-8 and binutils-2.30").

I sort of lost track of this[0].. anyhow I looked at the other archs
that have HAVE_LD_DEAD_CODE_DATA_ELIMINATION they all have different
constraints.
I think we should add them if/when someone finds a toolchain that
fails to build. I don't want to add some constraint for an issue that
only happens on arm by mistake.

Cheers,

Daniel

0 - trying to get the Amiga m68k bootloader to build without a hacked
up amigaos gcc :)
