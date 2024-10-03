Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC202208A0
	for <linux-m68k@lists.linux-m68k.org>; Thu,  3 Oct 2024 03:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727926329; cv=none; b=HGlPS3DC1/OBOoNmuvYAoulXot9iRqn8tYLJFtXyqz0OgaCFGzVmFwqcx4ZGPgWFmDvDY81c7nrGuimziNdPcia8td5sGlc4lo/wKBV+HWQ+B4V61h9FB4ZB5gEc/mdjunFHZThUZYdlWcYtOJUeOh8Yy1tedPSBw9Bv1pZWGew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727926329; c=relaxed/simple;
	bh=sPqYsxGw4UKWZVGhmn3EmQz2XgH0EJItdTfQ4iscmkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bb7ULWMcdQcNNE08iFemk9CjkM+aCuYB7yMiCkRKiTnoQygfoAXS/6wQm8+Jr7i4113XIk2F7epCNzrs+bX0KPHmdsAStSXuSTvQXG8mcgDi3IgS5lHK1aZ3qqeYkq7uq1l1cTOFBdylSiCx44sshyknPWs1pCS7GQv1VLtQsnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FeDmjy0t; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FeDmjy0t"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71971d2099cso451285b3a.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 02 Oct 2024 20:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727926327; x=1728531127; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGpCecy1PgHkxzgOvGnovEBjk6UmIsmI1Dv+w1TXrew=;
        b=FeDmjy0trDA49hmOp5TpcJszmsBo1iczDPRk0d/Aj3bqzBBdlgwdQRRoTEA9SH/eHQ
         /m2k9xsMp55SGFMtAOZHs8iSG5/oWAxciEq31njUzelY7W5KTlucdQwarNG/4xwaOCof
         vydCzwZuNpeBAKPQbu29K+rtZxXeV6mGTTtQYqsjqlDBZryu3BAjZUvuZOMx0rMGDEWX
         OrWdcNZNBstCXOP9++JeyfEMV00IQSIPUoLMj0w34MnLmHSaUzm6qHRltBmMo2r+M6Q1
         BxBddKCifSR2JGbKGl6bLIFq5zzwyS2OF2nUkuqnZ4BnCe7zypjfzIEuEPaxPGo/IM+d
         z4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727926327; x=1728531127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGpCecy1PgHkxzgOvGnovEBjk6UmIsmI1Dv+w1TXrew=;
        b=rqp5ZUMhJ4OP9hiP1irVZaRgf0EcMea16JTWQR9CRH1ATynGwK1S93oZXmaNQKvsn6
         CG1gexPE4y2Sn8ntd4yeooeKehlX+XOYh4xYqQEvWodW8qvobW54uIZEnQ2TuCzZ3zP5
         FZJCiKJc8ob5E/du6GLfifR3XWu4vBSBfp7bsLFa2bJx68Hws6GXSVIZ/I/gWhrm3P37
         ynXA9pChqSqaLLuZHCzJb1tWAj0tSaGU+fSg0yy2E5rLsaH094jeyvxGMYGU32HCrBpV
         QGpknihOk6JXdvFiHMJzj0J8UAn8NEH/5Qo6555x9/iDQ9FqJjWzljpQZ4FQpZcWo87e
         cnjA==
X-Gm-Message-State: AOJu0YxIEGp4xUyG68183taisQ8otJb7yn+276wDEUTantqFsdmeVYA0
	MW0P/4m2SI/RF1+yfn2KVzNQzrn9zfGBZnPSjEeGL5fu6kU5aQimsvHiCVUrbYm5KAgOPyHyZFJ
	eK8onjuqoaUvhv7qWHsmSqkOffAU=
X-Google-Smtp-Source: AGHT+IGxU23MVhIzmikqUZ1ChMRkDvxsLqd3I0IYnv2mo71SHn/bUXBPNSL0ZoDwXDXOZ0TQSVxxghjWoD2jNK+gVmI=
X-Received: by 2002:a05:6a00:cc2:b0:70d:2796:bce8 with SMTP id
 d2e1a72fcca58-71dc5d5bf5fmr6871110b3a.20.1727926326883; Wed, 02 Oct 2024
 20:32:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002132820.402583-1-sayyad.abid16@gmail.com> <06ffa5a2-f73d-198c-3e7b-178e4fcec1ed@linux-m68k.org>
In-Reply-To: <06ffa5a2-f73d-198c-3e7b-178e4fcec1ed@linux-m68k.org>
From: Sayyad Abid <sayyad.abid16@gmail.com>
Date: Thu, 3 Oct 2024 09:01:32 +0530
Message-ID: <CACVUEBnohcsyiPpCF3QNdQeXXaU6pvVOY-5X8CHmRSvEJxXoyA@mail.gmail.com>
Subject: Re: [PATCH 0/3] drivers: nubus: Fix coding style issues in nubus.c
To: Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 4:25=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> w=
rote:
>
>
> Hello sayyad.abid16@gmail.com
>
> Thanks for taking the trouble to send e-mail messages to so many people b=
y
> use of a free e-mail account.
>
> With regards to kernel patches, can I request that you --
>
> 1. Don't run checkpatch on existing code
> 2. Don't send patches that break the build
> 3. Don't claim to be improving code style by sending patches that violate
>    code style rules
> 4. Read the mailing lists and study the development process before trying
>    to contribute
>
> Thanks for your consideration.
>
> Regards
> Finn
>
> On Wed, 2 Oct 2024, Sayyad Abid wrote:
>
> > This patch series addresses coding style improvements in
> > the Nubus subsystem, specifically in `nubus.c`. These changes
> > aim to enhance readability and maintainability of the code.
> >
> > These coding style inconsistencies were found using checkpatch.pl
> >
> > Changes include:
> >  1. Improved comment block formatting by aligning `*` in
> >     multi-line comments.
> >  2. Fixing assignments inside conditional statements to improve clarity=
.
> >  3. Correcting the use of tabs for indentation in specific functions.
> >
> > Each commit focuses on a specific aspect, as detailed below.
> >
> >
> > Sayyad Abid (3):
> >   Fix use of tabs in nubus_get_vendorinfo and nubus_add_board
> >   Fix use of assignment in if condition in nubus_add_board()
> >   Fix use of * in comment block in nubus.c
> >
> >  drivers/nubus/nubus.c | 94 ++++++++++++++++++++++++-------------------
> >  1 file changed, 53 insertions(+), 41 deletions(-)
> >
> > --
> > 2.39.5
> >
> >
My sincere apologies for causing the trouble,
I overlooked a few things there,
I will keep a note of your points and make sure
that it is not repeated again.

Thank You!

--=20
Abid
