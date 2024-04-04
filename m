Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC6C1E86F
	for <linux-m68k@lists.linux-m68k.org>; Thu,  4 Apr 2024 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712222684; cv=none; b=nkV4wnVqRJutMZKZYMSK+DrHvGmLg7J7yLp5EM/PSjsMb/eL4qwn+p9gx9EP/iWJd1qlZRqHJ+EZzo3hHZMowZz9vxF8pJl8x5u+sD9BNfGSCrs3cFZroiyyMqUy9nEh5jLnr4shhKkmUBIVKGkGf2aE/sywDttkLMrg8Jmu2fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712222684; c=relaxed/simple;
	bh=RBVrbKnK3ovQO15P41mcUHM/iUWBDjuiISow2hRyoow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G1rva4fCRUhi2lDpP+jEcEWuKmeK8C57JKZZNaxlL0K3IJkF6OtAJ9NLKasB0e++fgKKEJIe+K/1ET5hrIQcaeRaSTp2woZPpV2cxKvdTeD8PEmg5H/1TF7A0NTYUscYonvGRMk8v/Z5UEMzzxAprNzJ7psq4iXRTRpmWRODzjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fM6Uz7ma; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fM6Uz7ma"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a4a387ff7acso91559066b.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 04 Apr 2024 02:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712222681; x=1712827481; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBVrbKnK3ovQO15P41mcUHM/iUWBDjuiISow2hRyoow=;
        b=fM6Uz7maIh1Wot7nUh66DgviC9IvsCErF+qmDGS05L1HbgMs/UuhWVww6hy74zvNCU
         3OEKylaPUE56cAsnwN6fA0QtgnV62kECZMSjTDS2CmzM14w4CLuFAUq8cTMxSC/xGRNH
         OAo4sqd+eC3ficxU5c2l6PZuhk3cMS40m75Xv5Jm7+wZWhAGfQ0S3edV3Hp+rYUFApuh
         m+DinKDrMjCpK3TlYEEptIoQ8ZNG3aR76epEzD8PX/LNMuKkQSq18O8aPbAxWAd/Qcwn
         MVCS9WBl4+QRiAZPEpP9Ch1BIa3utOSSMiNsxm2jZLGev4oHF6k66WtUUyZzGYQQZyQ3
         q/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712222681; x=1712827481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBVrbKnK3ovQO15P41mcUHM/iUWBDjuiISow2hRyoow=;
        b=NnP9vATaSQWNaYpQJrhtltzg/l7r4RPuUShc7Qr+83IUMqy+ENzillIoGAkb/BHSBL
         0Z48tSsApryg3k2bicydhrcZiSXe4PfzmrONARxLAa6nP6UJkygsvhfFHqLpeukW0adI
         XbNSqQdK6xQqG/tsZ2vrsabJO2X9tXzhqdoY7gxu/BzljnXiBsDgOnHvZSw5qdyo2/ow
         PP6ViNGSFC1qKPyD/xMZYuuUMBoxlMXuKCGxP1YKuThVuJ4ouerYyoljr5oqi6P7U9Vq
         cGncQeuHitreKU+Hv1Mvr1jkax2a5bPa4JMvqMoEoHOpc7ot64WaXnKD73m2TycexExb
         m49w==
X-Forwarded-Encrypted: i=1; AJvYcCUGrp6FbfDJbvSSiTCqfcRQkLg0J3HwjiZc+X1ui/I8BRbOhDyRIDMOR/fjqgizWp8XMJQl9Eku7kPe3E32diTSaGN6VrYTt1mL0e0qatwY
X-Gm-Message-State: AOJu0YylDq3kn72Vl4XVEhRqR1d/EmwlRaWUlrCT6VvgOJbGqLBHVWRj
	yswZ9Yd1qw+LrFw2cQ8/uFlQVVtSifbdo96KEuuv9WobGqwPgar8C+/LWQkoZLyCU6bCBd/7/Z9
	gYqGXYtwpTmyeXvV5EPUBd/F68WU=
X-Google-Smtp-Source: AGHT+IFFuzK/Tj73r6cElPFLHYS0K+qrK8YOabFg09GALNmzfEyOCxxfGhkrrxxnyxPeh7bUQ1le67F9/FyVLwJu/PI=
X-Received: by 2002:a17:906:6dd2:b0:a4e:1055:8602 with SMTP id
 j18-20020a1709066dd200b00a4e10558602mr1069503ejt.19.1712222680512; Thu, 04
 Apr 2024 02:24:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <dda2187e128bfaaf092351812e4538e2e41c17f6.1711599093.git.fthain@linux-m68k.org>
 <Zg3YZN-QupyVaTPm@surfacebook.localdomain> <8f234f26-d5e3-66ed-ab0c-86d3c9852b4a@linux-m68k.org>
In-Reply-To: <8f234f26-d5e3-66ed-ab0c-86d3c9852b4a@linux-m68k.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 4 Apr 2024 12:24:04 +0300
Message-ID: <CAHp75VcxLez_Nm0N8=gpWd7SKGd9JF2QXEOOB_gvX3ZtTzj6HQ@mail.gmail.com>
Subject: Re: [PATCH] serial/pmac_zilog: Remove flawed mitigation for rx irq flood
To: Finn Thain <fthain@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 2:57=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> w=
rote:
> On Thu, 4 Apr 2024, Andy Shevchenko wrote:

...

> > > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > Cc: Nicholas Piggin <npiggin@gmail.com>
> > > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> > > Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
> > > Cc: linux-m68k@lists.linux-m68k.org
> >
> > Second, please move these Cc to be after the '---' line
>
> I thought they were placed above the line for audit (and signing)
> purposes.

I didn't get this, sorry.

> There are thousands of Cc lines in the mainline commit messages
> since v6.8.

Having thousands of mistaken cases does not prove it's a good thing to
follow. I answered Jiri why it's better the way I suggested.

> > > Link: https://github.com/vivier/qemu-m68k/issues/44
> > > Link: https://lore.kernel.org/all/1078874617.9746.36.camel@gaston/
> >
> > Missed Fixes tag?
>
> Would this be ok: Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> I have to ask because some reviewers do not like to see a Fixes tag cite
> that commit.

Yes, or you even may dig into the history.git from history group (see
git.kernel.org) for the real first patch that brought it.

> > > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > > ---
> > (here is a good location for Cc:)
>
> Documentation/process/submitting-patches.rst indicats that it should be
> above the "---" separator together with Acked-by etc. Has this convention
> changed recently?

I see, I will prepare a patch to discuss this aspect.

--=20
With Best Regards,
Andy Shevchenko
