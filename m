Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A27134C6
	for <linux-m68k@lists.linux-m68k.org>; Fri,  5 Apr 2024 05:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712293590; cv=none; b=kW0nslZg5I8HgpFxPXCJX5K7mV+yUC82aQhHbtBBE5QRlTmfNB67kMG3CAekm2A0qz+hw0gHiHlxmiw8A7ef/D1PZcqGCCSBeQvLyW+bx3CSP6d2iCaDQyV4s6mNmuU/3MP1k30QyOUDm1Wiq1kGprqmzLapHeE3IB8X1iQh5T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712293590; c=relaxed/simple;
	bh=Sebt93aHymKxS1oWwauAtqnPitLNbEXG6RlgwpBarSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k7x6I0ROkYP3QWhXobxn4aBpGpTzo+6UTf/aSh0MdUMfbM2da8cw+4bSCpdS51goJ6K2wYxhkObqucXffxON6HIgk4I/blmLKsinsduFNSd1eylFS0V3kSP8sb+91estgqgOnkIMdf0p0LS/EGzVuXMO67etW71yE7U6lV6Lk6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARD0ZoPq; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARD0ZoPq"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a5193f56986so127888466b.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 04 Apr 2024 22:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712293587; x=1712898387; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sebt93aHymKxS1oWwauAtqnPitLNbEXG6RlgwpBarSs=;
        b=ARD0ZoPqYeutTtN3OedQujsD38icOxskTf+ZloaY0bSGtc6iZkDnNtj4Jq8SPwU8Nb
         /juRG+jf9aIWibOTkSXFU4jHcqEGtdi5/TeS/VsKo0P9QG8r+HXa+wsohx9yg5xFeK+p
         tQCYi5cIZDKw1BgAHd1Oh1cMomhFCmJMULImBWj944vX8s3Qwc+vTJCIcp/+EVx6hX7o
         TvLny2yxpCsAgBbxCdy9L0hPCIo9jcMjPAUc6ljuG09WXXtTWji/cMGqWqvWTFitPpcp
         2E95p3tU2g3JwNWHZ/OzAWvYQRzrjgkcBVXBswcl1eVdVcIjwnZwvQxTwFXXxwamQP5w
         ig5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712293587; x=1712898387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sebt93aHymKxS1oWwauAtqnPitLNbEXG6RlgwpBarSs=;
        b=EO8UPzjgcnw5old/qg+ibep1UxEi9waQVnrTuQmrfLtRg8LLN+NxqPc5QLt5BoFHaN
         NOz9DX+Ux899lUhg0Xd10KPI1nTAPDYG7Lo4w9dDRQENbBcapGCB61KKuPgMvEy4seS6
         X0b4Q0/M82aV/XVSCf8k3AVufbNogLJum0PD6cCjbpPiii7v2kOoMqJdr6VDd3GXJxbk
         acNFcb0xtYsdxkEvLOsqRb29OTxh5ne5bQB+s2fyDcRrui7j1s0ryO0uT6j7a9+xu2nc
         QGqBq1j9OwWDzs6ZvkIQRYuQgSFLEAABSJGS8YkWb1To2+hZT3Rdglv+oMrFurH8sKmI
         J0hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeFUEp8t4iAnH6zRfNNj+UQqC3Dprr15iPjS97HWjmIeN9tiaQ2BwhULWduwYhySLBbAaKS0rbhKuYPZgPN5HS3lA6GidKEGHI3SACteXU
X-Gm-Message-State: AOJu0YxEqJubMaLP/y/CVeIE2JnI4hE+LQ/Xrrlab9Ac7HXu4g2jDDlW
	2W+6ylW0RJLIiLO5Jhc4Gr5nCPIBbbpPYWdXdSPderMjYWAleYV76YhJORcMPiS2f+/PJphB9MA
	SCQHk3G2cj71Sz/JBwkOl9OfKjXE=
X-Google-Smtp-Source: AGHT+IH5UaoZ1lqiUtwAAZvTUwGnrAg/GCbjcl9oYf28LvmdvgmcJ9HrjMUzZXEnFiUjAjm989T6vTu1elJupyLaKig=
X-Received: by 2002:a17:906:5784:b0:a4e:6580:eec5 with SMTP id
 k4-20020a170906578400b00a4e6580eec5mr183356ejq.27.1712293587311; Thu, 04 Apr
 2024 22:06:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <dda2187e128bfaaf092351812e4538e2e41c17f6.1711599093.git.fthain@linux-m68k.org>
 <Zg3YZN-QupyVaTPm@surfacebook.localdomain> <8f234f26-d5e3-66ed-ab0c-86d3c9852b4a@linux-m68k.org>
 <CAHp75VcxLez_Nm0N8=gpWd7SKGd9JF2QXEOOB_gvX3ZtTzj6HQ@mail.gmail.com> <5dd285bd-b9a8-c85c-9bd9-a839c10e78fd@linux-m68k.org>
In-Reply-To: <5dd285bd-b9a8-c85c-9bd9-a839c10e78fd@linux-m68k.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Apr 2024 08:05:50 +0300
Message-ID: <CAHp75Vc75xFK_kq4AHmHqt-bC_dk+St9M-AgBa0XUEAc1fB7AQ@mail.gmail.com>
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

On Fri, Apr 5, 2024 at 1:15=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> w=
rote:
> On Thu, 4 Apr 2024, Andy Shevchenko wrote:
>
> > > > > ---
> > > > (here is a good location for Cc:)
> > >
> > > Documentation/process/submitting-patches.rst indicats that it should
> > > be above the "---" separator together with Acked-by etc. Has this
> > > convention changed recently?
> >
> > I see, I will prepare a patch to discuss this aspect.
>
> If you are going to veto patches on the basis of rules yet unwritten, I
> think you risk turning the kernel development process into a lottery.

It's already a lottery, if you haven't noticed, i.e. it highly relies
on the style preferences of the maintainers and is yet undocumented (a
few years ago it was a new section introduced for closing this gap).

> How many other patches presently under review will need to be dropped jus=
t
> in case they don't conform with possible future rules?

What you are saying is pure speculation.

I rely on at least two things (besides already explained):
- the fact that Submitting Patches refers to the commit message
reduction due to the unnecessariness of some lines
- my experience and common sense (why duplicate the data?).

--=20
With Best Regards,
Andy Shevchenko
